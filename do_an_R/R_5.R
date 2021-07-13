library(tidyr)
library(dplyr)
library(ggplot2)
library(tidyverse)


Deaths_link <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
data_raw <- read_csv(Deaths_link, col_types = cols()) %>%
  select(-Lat, -Long)
selection <- c("Japan", "Laos",  "Ukraine", "Vietnam", "France", "Germany", "Austria", "US", "United Kingdom")
data <-
  data_raw %>%
  
  rename(province = `Province/State`, country = `Country/Region`) %>%
  pivot_longer(c(-province, -country), "time") %>%
  mutate(time = as.Date(time, "%m/%d/%y")) %>%
  
  filter(country %in% !! selection) %>%
  
  group_by(country, time) %>%
  summarize(value = sum(value)) %>%
  ungroup() %>%
  
  arrange(time) %>%
  group_by(country) %>%
  mutate(diff = value - lag(value)) %>%
  ungroup() %>%
  filter(!is.na(diff)) %>%
  arrange(country, time)

data %>%
  filter(diff > 0) %>%
  ggplot(aes(x = time, y = diff, fill = country %in% c("China", "Korea, South"))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(vars(country), scales = "free_y") +
  ggtitle("Number of deaths", "Corona (COVID-19)")+
  theme_minimal()

