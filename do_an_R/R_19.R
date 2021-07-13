library(ggplot2)
library(plotly)
library(dplyr)
df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv")
ggplot(df[20: 30,], aes(x='', y=Confirmed, fill=Province_State)) +
  geom_bar(stat="identity", width=1) +
  theme_void() +
  coord_polar("y", start=0) + 
  labs(title="Đồ thị biểu diễn ca nhiểm tại một số Tiểu Bang của Mĩ(27-6-2021)") +
  geom_text(aes(label = paste0(Confirmed)), position = position_stack(vjust=0.5)) 

