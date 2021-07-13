library(ggplot2)
library(plotly)

library(dplyr)

df = read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv')
cha <- df %>%
  ggplot(aes(x = Deaths, y = Confirmed, fill = Province_State, size = Confirmed)) +
  geom_point(color="#69b3a2", alpha=0.8, show.legend = FALSE) +
  theme_ipsum() +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        legend.text = element_text(size = 10),
        legend.title = element_text(size = 16, hjust = 0.5),
        panel.border = element_rect(colour = '#990000', fill = NA, size = 1.5))+
  labs(title = "COVID 19 in US 29-01-2021")

ggplotly(cha, dynamicTicks = TRUE) 

