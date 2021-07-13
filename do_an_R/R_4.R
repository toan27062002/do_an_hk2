library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)


theme_set(theme_minimal())
Deaths_url<-'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv'
Deaths <- read_csv(Deaths_url)
Deaths <- Deaths %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "Deaths_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(Deaths_n = sum(Deaths_n)) %>%
  ungroup()
Deaths <- Deaths %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_cases_n = Deaths_n - lag(Deaths_n, default = 0)) %>%
  ungroup()
Deaths <- Deaths %>%
  arrange(date) %>%
  group_by(country_region) %>%
  ungroup()

Brazil<-Deaths %>% filter(country_region == "Brazil")
Brazil <-Brazil[c('date','new_cases_n')]
colnames(Brazil)[2]<-'Brazil'
boxplot<-Brazil

India <-Deaths %>% filter(country_region == "India")
India <-India[c('date','new_cases_n')]
colnames(India)[2]<-'India'
boxplot <- merge(boxplot,India,by="date")

US <- Deaths %>% filter(country_region == "US")
US <- US[c('date','new_cases_n')]
colnames(US)[2]<-'US'
boxplot <- merge(boxplot,us,by="date")

UK<-Deaths %>% filter(country_region == "United Kingdom")
UK <-UK[c('date','new_cases_n')]
colnames(UK)[2]<-'UK'
timeseries <- merge(boxplot,uk,by="date")


fig <- plot_ly(timeseries, x = ~date)
fig <- fig %>% add_lines(y = ~US, name = "US")
fig <- fig %>% add_lines(y = ~India, name = "India")
fig <- fig %>% add_lines(y = ~Brazil, name = "Brazil")
fig <- fig %>% layout(
  title = "Number of deaths by Timeseries",
  xaxis = list(
    rangeselector = list(
      buttons = list(
        list(
          count = 3,
          label = "3 mo",
          step = "month",
          stepmode = "backward"),
        list(
          count = 6,
          label = "6 mo",
          step = "month",
          stepmode = "backward"),
        list(
          count = 1,
          label = "1 yr",
          step = "year",
          stepmode = "backward"),
        list(
          count = 1,
          label = "YTD",
          step = "year",
          stepmode = "todate"),
        list(step = "all"))),
    
    rangeslider = list(type = "date")),
  
  yaxis = list(title = "cases"))

fig

