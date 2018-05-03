library(data.table)
library(dplyr)
library(spdplyr)
library(lubridate)
library(geojsonio)
library(tm)
library(dygraphs)
library(shiny)
library(shinydashboard)
library(leaflet)
library(markdown)
library(RColorBrewer)


# 
# request2015 = fread(file="./request2015.csv") %>% 
#               mutate(dateBegin = ymd_hms(dateBegin),
#                      dateEnd = ymd_hms(dateEnd),
#                      incidentzip = trimws(incidentzip)) 
request2015 = fread(file="./data.csv") %>%
  mutate(dateBegin = ymd_hms(dateBegin),
         dateEnd = ymd_hms(dateEnd),
         incidentzip = trimws(incidentzip))               

byzip = request2015 %>% group_by(incidentzip) %>% summarize(n=n()) %>% arrange(desc(n))

nyzip <- geojsonio::geojson_read("./zip.json", what='sp') %>%
  left_join(byzip, by=c("zip"="incidentzip")) %>% mutate(n = ifelse(is.na(n), 0, n))

top20 <- request2015$incidentzip[1:20]

# 
# request2015$Lat = jitter(request2015$Lat)
# request2015$Long = jitter(request2015$Long)
# request2015$incidentzip = formatC(request2015$incidentzip, width=5, format='d', flag='0')




