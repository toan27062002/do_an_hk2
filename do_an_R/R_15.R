library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
#Load Data
link = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2021.csv"
df <- read.csv(link, header = TRUE)
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Recovered=sum(Recovered),
                                 Deaths=sum(Deaths))
#Sort
country <- country[order(-country$Deaths),]
country<-country[-c(1,2,3,4,7,11),]
country<-country<-country[1:50,]
fig <- plot_ly(country, y = ~Deaths, x = ~Country_Region, name = "Deaths", type = 'scatter',
               mode = "markers", marker = list(color = "Red"))

fig <- fig %>% add_trace(y = ~Recovered, x = ~Country_Region, name = "Recovered",type = 'scatter',
                         mode = "markers", marker = list(color = "Green"))
fig <- fig %>% layout(
  title = "Correlation of Covid cure rates of 50 countries (27-6-2002)",
  xaxis = list(title = "Country"),
  yaxis = list(title='Humans')
)

fig

