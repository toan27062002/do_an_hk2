library(ggplot2)
library(plotly)
library(dplyr)
df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv")
cha <- ggplot(df, aes(Confirmed, Deaths, 
                        colour = Deaths, size = Deaths, text = Province_State)) +
  geom_point() + 
  geom_smooth(method = lm, formula = y~x, 
              fill = '#CC6600',colour = '#990099') + 
  geom_hline(yintercept=10000, color="orange", size=1) + 
  geom_vline(xintercept=500000, color="orange", size=1) +
  theme_bw() + 
  labs(title = 'Relationship between Deaths and Confirmed in US') +
  theme(plot.title = element_text(hjust = 0.5),
        panel.border = element_rect(colour = '#990000', fill = NA, size = 1.5))

ggplotly(cha, dynamicTicks = TRUE) %>%
  rangeslider() %>%
  layout(hovermode = "x")

