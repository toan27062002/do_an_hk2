library(dplyr)
library(ggplot2)
library(ggcharts)


link = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2021.csv"
df <- read.csv(link, header = TRUE)
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Deaths = sum(Deaths))
country <- country[order(-country$Deaths),]
country %>%
  bar_chart(x = Country_Region, y = Deaths, top_n = 50)

