



bins <- c(0, 50, 100, 200, 350, 500, 1000, 2000, 3000, 4000, Inf)
pal <- colorBin("Blues", domain = nyzip$n, bins = bins)
labels <- sprintf("<strong>%s</strong><strong>%s</strong><strong>%s</strong><br/>%g requests",
                  nyzip$po_name,":", nyzip$zip, nyzip$n ) %>%
  lapply(htmltools::HTML)


function(input, output, session){
  # acm_defaults <- function(map, x, y){
  #   addCircleMarkers(map, x, y, radius=10, color='black', fillColor='orange', fillOpacity==1, opacity =1,
  #                    weight=2, storke=TRUE, layerID='Selected')}
  
  output$MapNY <- renderLeaflet({
    leaflet() %>% 
      setView(lng = -73.99, lat = 40.75, zoom = 11) %>%
      addProviderTiles(providers$Stamen.TonerLite) %>%
      addPolygons(data=nyzip, weight = 2, opacity = 1, fillOpacity = 0.7,
                  fillColor = ~pal(n),
                  color = "white",
                  dashArray = "3",
                  highlight = highlightOptions(weight = 5, 
                                               color = "#666", 
                                               dashArray = "",
                                               fillOpacity = 0.7,
                                               bringToFront = TRUE),
                  label = labels,
                  labelOptions = labelOptions(
                    style = list("font-weight" = "normal", padding = "3px 8px"),
                    textsize = "15px",
                    direction = "auto"
                  ))
    


    # output$timemonthly = renderPlot({
    #   clean = request2015 %>%
    #     filter(incidentzip %in% input$zipcode) %>%
    #     mutate(month= month(dateBegin)) %>%
    #     group_by(month) %>% summarize(n=n())
    #   dygraph(clean)
    # })

    
    # output$timemonthly = renderPlot({
    #   hist(AirPassengers)
    # })
    
#       # ggplot(clean, aes(month, n)) + geom_line() +
#       #  xlab("") + ylab("Monthly Counts")
#     })

    
    # 
    # output$timehourly = renderPlot({
    #   r = request2015 %>% filter(incidentzip == "11101")
    #   g = r %>% group_by(hour(dateBegin)) %>% summarize(n=n())
    #   dygraph(g)
    # })
    
    # showZipcodePopup <- function(zipcode, lat, lng) {
    #   selectedZip <- nyzip[nyzip$zip == zipcode,]
    #   content <- as.character(tagList(
    #     tags$h4("#of Requests:", as.integer(selectedZip$n)),
    #     tags$strong(HTML(sprintf("%s, %s %s",
    #                              selectedZip$city.x, selectedZip$state.x, selectedZip$zipcode
    #     ))), tags$br(),
    #     sprintf("Median household income: %s", dollar(selectedZip$income * 1000)), tags$br(),
    #     sprintf("Percent of adults with BA: %s%%", as.integer(selectedZip$college)), tags$br(),
    #     sprintf("Adult population: %s", selectedZip$adultpop)
    #   ))
    #   leafletProxy("map") %>% addPopups(lng, lat, content, layerId = zipcode)
    # }
    # 
    # observe({
    #   leafletProxy("map") %>% clearPopups()
    #   event <- input$map_shape_click
    #   if (is.null(event))
    #     return()
    #   isolate({
    #     showZipcodePopup(event$id, event$lat, event$lng)
    #   })
    # })
    
    # observeEvent(input$map_marker_click, {
    #   p <- input$map_marker_click
    #   proxy <- leafletProxy("MapNY")
    #   if(p$id=="Selected"){
    #     proxy %>% removeMarker(layerId="Selected")
    #   } else {
    #     proxy %>% setView(lng=p$lng, lat=p$lat, input$Map_zoom) %>% acm_defaults(p$lng, p$lat)
    #   }
    # 
    # })
    
    # observeEvent(input$map_marker_click, {
    #   p <- input$map_marker_click
    #   if(!is.null(p$id)){
    #     if(is.null(input$incidentzip) || input$incidentzip!=p$id) updateSelectInput(session, "incidentzip", selected=p$id)
    #   }
    # })
  })
  
  
  
}

