library(dplyr)
library(ggplot2)
library(plotly)



link_csv = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv"
df <- read.csv(link_csv, header = TRUE)
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Deaths = sum(Deaths))
country <- country[order(-country$Deaths),]
country_n<-country[1:5,]
others=sum(country$Deaths)-sum(country_n$Deaths)
others<-data.frame("Khác", others)
names(others)<-c("Country_Region","Deaths")
country <- rbind(country_n, others)

colors <- c('red','lightblue','bisque','yellow','green','darkorchid1')

cha <- country %>%
  plot_ly(labels = ~ Country_Region, values = ~ Deaths, type = 'pie',
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = 'black'),
          hoverinfo = 'text',
          text = ~paste(Deaths, 'human'),
          marker = list(colors = colors,
                        line = list(color = 'white', width = 2)),
          showlegend = TRUE)

cha <- cha %>% 
  layout(title = 'Số người chết theo vùng quốc gia(27-6-2020)',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

ggplotly(cha)

