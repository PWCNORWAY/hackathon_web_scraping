library('rvest')
library('stringr')

# Leser inn HTML fra vg.no
html <- read_html("https://www.vg.no/", encoding = "UTF-8")

# Henter ut overskrifter på forsiden ved hjelp av html_elements
overskrifter <- html %>% 
  html_elements("h3") %>% #h3 er en overskriftstype
  html_text2() 

# Kan finne ut hvor mange overskrifter som inneholder "Corona"
overskrifter %>% 
  str_count("corona") %>% 
  sum()
  
# 6 av 179 overskrifter inneholder corona
















