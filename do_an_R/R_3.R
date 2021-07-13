library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(reshape2)

corona_deaths <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
data_deaths <- corona_deaths %>%
  filter(`Country/Region` == "Germany" | `Country/Region` == "Italy" |  `Country/Region` == "China"  |  `Country/Region` == "US" | `Country/Region` == "France" | `Country/Region` == "New Zealand") %>%
  filter(`Province/State` !="Diamond Princess" | is.na(`Province/State`)) %>%
  select(-`Province/State`) %>%
  select(-Lat,-Long) %>%
  group_by(`Country/Region`) %>%
  summarise_each(list(sum))

n <- data_deaths$`Country/Region`
data_deaths <- as.data.frame(t(data_deaths[,-1]))
colnames(data_deaths) <- n
data_deaths <- tibble::rownames_to_column(data_deaths, "Day")
data_deaths <- data_deaths %>%
  mutate(Day = as.Date(Day,"%m/%d/%y"))

d_deaths <- melt(data_deaths, id.vars="Day")

# plot
ggplot(d_deaths, aes(Day,value, col=variable)) + 
  geom_line() +
  ggtitle("Death toll of countries") + 
  xlab("Date") + 
  ylab("Deaths")



