library(tidyverse)
library(lubridate)


theme_set(theme_minimal())
covid19_raw <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
covid19 <- covid19_raw %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "confirmed_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(confirmed_n = sum(confirmed_n)) %>%
  ungroup()

covid19 <- covid19 %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_cases_n = confirmed_n - lag(confirmed_n, default = 0)) %>%
  ungroup()
covid19 %>%
  filter(country_region %in% c("India", "Vietnam")) %>%
  group_by(country_region) %>%
  mutate(first_date_over_50_confirmed_cases = min(date[confirmed_n >= 50])) %>%
  ungroup() %>%
  mutate(days_after_50 = (first_date_over_50_confirmed_cases %--% date) / days(1)) %>%
  filter(days_after_50 >= 0) %>%
  ggplot(aes(x = days_after_50, y = new_cases_n, color = country_region)) +
  geom_line(show.legend = FALSE) +
  scale_y_continuous(labels = scales::comma) +
  facet_wrap(~country_region, ncol = 1, scales = "free_y") +
  labs(
    x = "Days >= 50 confirmed cases in the country", y = "New cases",
    title = "New cases in Vietnam and India"
  )

