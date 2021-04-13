#install.packages("polite")


library(polite)
library(rvest)
library(stringr)

url <- "https://www.vg.no/"

# Bukker før tilkobling
session <- bow(url, force = TRUE, user_agent = "Mitt Navn")

# Bruker scrape for å hente ut informasjon
# på en polite måte
scrape(session) %>% 
  html_elements("h3") %>% 
  html_text2() %>% 
  str_count("corona") %>% 
  sum()

  
  

