library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
theme_set(theme_minimal())
#ConfirmDataset
confirm_url<-'https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv'
confirm <- read_csv(confirm_url)
confirm <- confirm %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "confirmed_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(confirmed_n = sum(confirmed_n)) %>%
  ungroup()
confirm <- confirm %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_cases_n = confirmed_n - lag(confirmed_n, default = 0)) %>%
  ungroup()
confirm <- confirm %>%
  arrange(date) %>%
  group_by(country_region) %>%
  ungroup()
vie<-confirm %>% filter(country_region == "Vietnam")
vie <-vie[c('date','new_cases_n')]
colnames(vie)[2]<-'NewCases'
boxplot<-vie
india <-confirm %>% filter(country_region == "India")
india <-india[c('date','new_cases_n')]
colnames(india)[2]<-'India'
boxplot <- merge(boxplot,india,by="date")
us <- confirm %>% filter(country_region == "US")
us <- us[c('date','new_cases_n')]
colnames(us)[2]<-'US'
boxplot <- merge(boxplot,us,by="date")
fig <- plot_ly(boxplot, y = ~NewCases, type = "box",name = 'Vietnam')
fig<- fig%>% add_trace(y = ~India, type='box', name='India',boxpoints = FALSE)
fig<- fig%>% add_trace(y = ~US, type='box', name='US',boxpoints = FALSE)
fig <- fig %>% layout(title = "Covid statistics in 3 countries")
fig

