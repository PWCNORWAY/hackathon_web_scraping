if (!require('rvest')) install.packages('rvest'); library('rvest')
if (!require('stringr')) install.packages('stringr'); library('stringr')

# Leser inn HTML fra vg.no
html <- session("https://www.pwc.com/")

# Henter ut overskrifter på forsiden ved hjelp av html_elements
overskrifter <- html %>% 
  html_elements("h4") %>% 
  html_text2() 

html %>% 
  html_elements(".ng-binding") %>% 
  html_text2() 

# Funker ikke


















