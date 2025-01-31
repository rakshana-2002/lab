
library(plotly)
data <- read.csv("D:\\23801931\\sales.csv")
print(data)
shipmodecolor = c("first" = "darkgreen", "second" = "red", "standard" = "black", "Samemode" = "orange")

k <- 1
while(k > 0) {
  print("MENU")
  print("1. Scatter plot for sales by shipmode sorted by first class")
  print("2. Scatter plot for sales by region")
  
  op <- readline(prompt="Enter Your Choice: ")
  
  switch(op,
         
         
         "1" = {
           print("1. Scatter plot for sales by shipmode sorted by first class")
           data$Shipmode <- as.factor(data$Shipmode)
           
           
           plot <- plot_ly(data = data, 
                           x = ~Shipmode, 
                           y = ~Sales, 
                           type = 'scatter', 
                           mode = 'markers', 
                           text = ~paste("Shipmode: ", Shipmode, "<br>Sales: ", Sales),  # Labels to show when hovering
                           hoverinfo = 'text',  
                           marker = list(color = shipmodecolor[data$Shipmode], size = 12))
           
           plot <- layout(plot, 
                          title = "Sales by Shipmode",
                          xaxis = list(title = "Shipmode"),
                          yaxis = list(title = "Sales"))
           
           
           print(plot)  
           Sys.sleep(5) 
         },
         
         "2" = {
           print("2. Scatter plot for sales by region")
           data$REGION <- as.factor(data$Region)
           
           plot <- plot_ly(data = data, 
                           x = ~Region, 
                           y = ~Sales, 
                           type = 'scatter', 
                           mode = 'markers',  
                           text = ~paste("Region: ", Region, "<br>Sales: ", Sales),  # Labels to show when hovering
                           hoverinfo = 'text', 
                           marker = list(color = rainbow(length(data$Sales)), size = 12))
           
           plot <- layout(plot, 
                          title = "Sales by Region",
                          xaxis = list(title = "Region"),
                          yaxis = list(title = "Sales"))
           
           print(plot)  
           Sys.sleep(5)  
         }
  )
  c <- readline(prompt="Do you want to continue (1 for Yes, 0 for No): ")
  k <- as.integer(c)  # Convert user input to integer
}