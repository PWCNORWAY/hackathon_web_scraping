# Merk, må ha satt JAVA_HOME først, før kode kjøres
library(RSelenium)
library(rvest)
library(stringr)

# Starter opp server/browser (anbefaler firefox)
rD <- rsDriver(browser=c("firefox")) 
# Henter ut driver (den som styrer kontrollene)
driver <- rD[["client"]]
# Navigerer til pwc.com
driver$navigate("https://www.pwc.com/")

# Henter ut rendret kildekode
parsed_pagesource <- driver$getPageSource()[[1]]

# Lukker driveren
driver$close()
# Stopper serveren
rD[["server"]]$stop()

# Bruker kildekode til å lese ut resultater
# på vanlig vis med Rvest
result <- read_html(parsed_pagesource) %>%
  html_elements(".ng-binding") %>%
  html_text2() 

# Printer resultatene
result %>% 
  str_split(., "  ") # Hver ny del starter med 2 mellomrom






