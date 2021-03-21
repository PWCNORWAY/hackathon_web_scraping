
# Arbeidsfil for Selenium. Se MVP for fungerende

if (!require('RSelenium')) install.packages('RSelenium'); library('RSelenium')
library(purrr)

rD <- rsDriver(browser=c("firefox"))

driver <- rD[["client"]]

# navigate to an URL
driver$navigate("https://www.pwc.com/")

elements <- driver$findElements(using = "css",".ng-binding")

#element$getElementText()[[1]]
#element$getElementAttribute("class")[[1]]


# get result as a list
texts_purrr_map <- map(elements,~ .x$getElementText()[[1]])
# get result as a string vector
texts_purrr_map_chr <- map_chr(elements,~ .x$getElementText()[[1]])


#close the driver
driver$close()

#close the server
rD[["server"]]$stop()




### Enkleste måten?

parsed_pagesource <- driver$getPageSource()[[1]]
# using rvest to extract information
result <- read_html(parsed_pagesource) %>%
  html_nodes("h4") %>%
  html_text()
