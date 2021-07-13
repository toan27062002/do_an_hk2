library(ggplot2)
library(plotly)
library(dplyr)


df <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-27-2020.csv")

ggplot(df[0:1000,], aes(x=Recovered, y=Province_State, fill= Recovered)) + 
  geom_point(aes(color=Recovered)) + 
  labs(title="Đồ thị thể hiện ca phục hồi ở 1 số tiểu bang của mĩ (06-27-2020)",x = "Recovered", y="Province")

