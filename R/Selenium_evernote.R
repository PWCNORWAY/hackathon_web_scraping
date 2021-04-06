# Merk, må ha satt JAVA_HOME først, før kode kjøres
if (!require('RSelenium')) install.packages('RSelenium'); library('RSelenium')
if (!require('purrr')) install.packages('purrr'); library('purrr')
if (!require('rvest')) install.packages('rvest'); library('rvest')

# Starter opp server/browser (anbefaler firefox)
rD <- rsDriver(browser=c("firefox")) 
# Henter ut driver (den som styrer kontrollene)
driver <- rD[["client"]]


# Navigerer til login @ evernote
driver$navigate("https://www.evernote.com/Login.action")

# Finner elementet for å legge inn brukernavn. 
# Merk: findElement, ikke Elements!
username <- driver$findElement(using = "css", "#username")
username$sendKeysToElement(list("tjebsen"))

# Finner elementet for å gå videre
continue <- driver$findElement(using = "css", "#loginButton")
continue$clickElement()

# Finner og fyller inn passord
password <- driver$findElement(using = "css", "#password")
password$sendKeysToElement(list("Pwctest1!"))

# Trykker enter for å logge inn
password$sendKeysToElement(list(key = "enter"))










# Lukker driveren
driver$close()
# Stopper serveren
rD[["server"]]$stop()


