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
lasted = subset(country, date == max(date))
lasted = arrange(lasted, desc(confirmed), decreasing= FALSE)
lasted$raterecover = sprintf((lasted$recovered /lasted$confirmed*100), fmt = '%#.2f')
z= arrange(lasted, desc(raterecover), decreasing= FALSE)
top10z = z[1:50,]
ggplot(top10z, aes(x=Country.Region, y=raterecover)) +
  geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
  ggtitle("Top 50 places with the highest recovery rate",
          subtitle="Covid case from 07-09-2021 to 07-11-2021") +
  geom_text(aes(label = raterecover),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y")+
  coord_flip() +
  xlab("") +
  theme_bw()+theme(plot.title = element_text(size=15),axis.text.x= element_text(size=10),
                   axis.text.y= element_text(size=10), axis.title=element_text(size=15))

