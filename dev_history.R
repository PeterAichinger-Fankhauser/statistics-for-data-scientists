# dev_hist

library(tidyverse)
library(learnr)

dfw <- read.csv("data/dfw_airline.csv")
save(dfw, file="data/dfw.RData")
save(sp500_px, file="data/sp500_px.RData")
save(sp500_sym, file="data/sp500_sym.RData")

state <- read.csv(file.path('data/', 'state.csv'))
save(state, file="data/state.RData")

kc_tax <- read.csv("data/kc_tax.csv")
save(kc_tax, file="data/kc_tax.RData")

lc_loans <- read.csv("data/lc_loans.csv")
save(lc_loans, file="data/lc_loans.RData")

airline_stats <- read.csv("data/airline_stats.csv") %>% as_tibble()
save(airline_stats, file="data/airline_stats.RData")

loans_income <- read_csv("data/loans_income.csv")
save(loans_income, file="data/loans_income.RData")

library(readr)
loan_data <- read.csv("data/loan_data.csv") %>% as_tibble()
save(loan_data, file="data/loan_data.RData")
#View(loan_data)
seed <- 10101
loan3000 <- loan_data[sample(nrow(loan_data), 3000),  
                      c("outcome", "purpose_", "dti", "borrower_score", "payment_inc_ratio")]
loan_data$purpose <- factor(loan_data$purpose_)

save(loan3000, file="data/loan3000.rdata")

set.seed(1234)
heads <- rbinom(1, 50, 0.5)
prop.test(heads, 50, conf.level=0.99)
save(heads, file="data/heads.RData")

ab_data <- read.csv("data/ab_data.csv")
ab_test <- ab_data %>% select(group, converted)
save(ab_test, file="data/ab_test.RData")

session_times <- read.csv(file.path('data/web_page_data.csv'))
save(session_times, file="data/session_times.RData")


four_sessions  <- read.csv('data/four_sessions.csv')
save(four_sessions, file = "data/four_sessions.RData")

click_rates <-  read.csv('data/click_rates.csv')
save(click_rates, file="data/click_rates.RData")

imanishi <-  read.csv('data/imanishi_data.csv')
save(imanishi, file="data/imanishi.RData")

library(readr)
house <- read.csv('data/house_sales.csv', sep='\t')
save(house, file="data/house.RData")

### Extra Data
automobile <- read.csv('data/automobile.csv')
save(automobile, file='data/automobile.RData')

laptops <- read.csv('data/laptops.csv')
save(laptops, file='data/laptops.RData')

weatherAUS <- read.csv('data/weatherAUS.csv')
save(weatherAUS, file = "data/weatherAUS.RData")

laptops_unclean <- laptops
del <- sample(0:1303, 12)
laptops_unclean$Price_euros[del]<-NA
save(laptops_unclean, file="data/laptops_unclean.RData")

#### UNVotes
# load packages ----------------------------------------------------------------

library(unvotes)
library(tidyverse)
library(here)

# unvotes ----------------------------------------------------------------------

unvotes <- un_votes %>%
  mutate(country =
           case_when(
             country == "United Kingdom of Great Britain and Northern Ireland" ~ "UK & NI",
             country == "United States of America"                             ~ "US",
             TRUE                                                              ~ country
           )) %>%
  inner_join(un_roll_calls, by = "rcid") %>%
  inner_join(un_roll_call_issues, by = "rcid")

## Docker

# docker tag IMAGE_ID docker.pkg.github.com/g4challenge/statistics-for-data-scientists/rstudio:0.1
# docker push docker.pkg.github.com/g4challenge/statistics-for-data-scientists/rstudio:0.1