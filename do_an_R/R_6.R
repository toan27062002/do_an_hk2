library(tidyr)
library(dplyr)
library(ggplot2)


confirmedraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
str(confirmedraw)
deathsraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")
recoveredraw <- read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")
confirmed <- confirmedraw %>% gather(key="date", value="confirmed", -c(Country.Region, Province.State, Lat, Long)) %>% group_by(Country.Region, date) %>% summarize(confirmed=sum(confirmed))
deaths <- deathsraw %>% gather(key="date", value="deaths", -c(Country.Region, Province.State, Lat, Long)) %>% group_by(Country.Region, date) %>% summarize(deaths=sum(deaths))
recovered <- recoveredraw %>% gather(key="date", value="recovered", -c(Country.Region, Province.State, Lat, Long)) %>% group_by(Country.Region, date) %>% summarize(recovered=sum(recovered))
summary(confirmed)
country <- full_join(confirmed, deaths) %>% full_join(recovered)
str(country) 
country$date <- country$date %>% sub("X", "", .) %>% as.Date("%m.%d.%y")
str(country) 
country <- country %>% group_by(Country.Region) %>% mutate(cumconfirmed=cumsum(confirmed), days = date - first(date) + 1)
vietnam<- country %>% filter(Country.Region=="Vietnam")
ggplot(vietnam, aes(x=date, y=deaths)) + geom_bar(stat="identity", width=1) +
  theme_classic() +
  labs(title = "Death Covid-19 cases in Vietnam", x= "Date", y= "Death Case") +
  theme(plot.title = element_text(hjust = 0.5))

