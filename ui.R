


navbarPage(title='311 Requests Spatial Visualization', collapsible = TRUE,
           id='nav',
           #By ZipCode
           tabPanel('By Zip Code',
                    div(class="outer",
                        
                        tags$head(
                          includeCSS("styles.css"),
                          includeScript("gomap.js")
                                  ),
                        
                    leafletOutput(outputId = 'MapNY', width='77%', height='100%'),
                    
                    absolutePanel(id = 'controls', class = 'panel panel-default', fixed = TRUE, 
                                  draggable = FALSE, top = 60, left = 'auto', right = 20, bottom = 'auto',
                                  width = 300, height = 'auto',
                                  h2(""),
                                  selectizeInput("loctype",
                                                 "Location Type",
                                                 c('all','residence', 'public places', 'unpopulated')),
                                  selectizeInput("comptype",
                                                 "Complaint Type",
                                                 c('all', 'noise', 'sanitation', 'illegal')),
                                  selectizeInput("zipcode",
                                                 "Zip Code",
                                                 top20),
                                  
                                  plotOutput("timemonthly", height = 200),
                                  plotOutput("timehourly", height = 200)
                                  
                    )
                    
                    
                    )
            )
           # tabPanel('By Coordinates',
           #          div(class='outer',
           #              tags$head(includeCSS('styles.css')),
           #              
           #              leafletOutput(outputId = 'Map2', width = '100%', height = '100%'),
           #              
                        # absolutePanel(id = 'controls', class = 'panel panel-default', fixed = TRUE, 
                        #               draggable = TRUE, top = 60, left = 'auto', right = 20, bottom = 'auto',
                        #               width = 320, height = 'auto',
                        #               h2(""),
                        #               selectizeInput("loctype",
                        #                              "Location Type",
                        #                              c('all','residence', 'public places', 'unpopulated')),
                        #               selectizeInput("comptype",
                        #                              "Complaint Type",
                        #                              c('all', 'noise', 'sanitation', 'illegal'))

                                      # plotOutput("his")
             #            )
             #          )
             #            
             # )

           # #By Hour
           # tabPanel('Top 20 Analysis',
           #          fluidRow(
           #            column(3,
           #                   br(),
           #                   checkboxGroupInput(
           #                     InputId = "causecheckbox",
           #                     label = h4("Select Request Causes"),
           #                     choices = causelist)
           #                   ),
           #            column(9,
           #                   h3(''),
           #                   plotOutput(outputId = "graph1"))
           #          ))

)
