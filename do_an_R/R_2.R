library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)


link_csv = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv"
df <- read.csv(link_csv, header = TRUE)
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Recovered=sum(Recovered),
                                 Confirmed=sum(Confirmed),
                                 Deaths=sum(Deaths),
                                 Active=sum(Active))
country <- country[order(-country$Confirmed),]
groupbar <- country %>% filter(Country_Region == "US")
Brazil<-country %>% filter(Country_Region == "Brazil")
groupbar<-rbind(groupbar,Brazil)
Italy<-country %>% filter(Country_Region == "Italy")
groupbar<-rbind(groupbar,Italy)
fig <- plot_ly(groupbar, x = ~Country_Region, y = ~Confirmed, type = 'bar', name = 'Confirmed',text =groupbar$Confirmed, textposition = 'auto',
               marker= list(color='blue'))
fig <- fig %>% add_trace(y = ~Recovered, name = 'Recovered',text =groupbar$Recovered, textposition = 'auto',
                         marker=list(color='yellow'))
fig <- fig %>% add_trace(y = ~Deaths, name = 'Deaths',text =groupbar$Deaths, textposition = 'auto',
                         marker=list(color='red'))
fig <- fig %>% layout(title='Statistical chart of 3 countries(27-6-2002)',
                      yaxis = list(title = 'Count'),
                      xaxis = list(title = 'Country'), barmode = 'group')

fig

