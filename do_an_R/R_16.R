library(ggplot2)
library(plotly)
library(dplyr)


df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv")

cha <- ggplot(df, aes(Confirmed, Active,
                        colour = Active, fill = Province_State, size = Active)) +
  geom_point() + 
  geom_smooth(method = 'loess', formula = 'y ~ x',
              fill = '#CC6600',colour = '#990099') + 
  theme_bw() + 
  labs(title = 'Relationship between Active and Confirmed human in US') +
  theme(plot.title = element_text(hjust = 0.5),
        legend.background = element_rect(fill="lightblue",
                                         size=0.5, linetype="solid", 
                                         colour ="darkblue"),
        panel.border = element_rect(colour = '#990000', fill = NA, size = 1.5)) +
  guides(colour = FALSE)

ggplotly(cha, dynamicTicks = TRUE) %>%
  rangeslider() %>%
  layout(hovermode = "x")

