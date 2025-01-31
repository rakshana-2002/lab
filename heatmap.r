
install.packages("ggplots")
library(ggplots)

data <- read.csv("D://23801931//heat.csv")  # Load data
print(data)

# Initialize the loop for menu-driven program
k <- 1
while(k > 0) {
  # Display the menu
  print("MENU")
  print("1. Heatmap for sales by categories")
  print("2. Heatmap for sales by subcategories")
  
  # Get the user's choice
  op <- readline(prompt="Enter Your Choice: ")
  
  # Switch statement for handling menu options
  switch(op,
         
         # Option 1: Heatmap for Sales by Categories
         "1" = {
           print("Heatmap for sales by categories")
           
           # Aggregate sales by category
           category_sales <-aggregate(Sales ~ Category, data, sum)
           
           # Create a 2D matrix with sales values for categories
           # Create a matrix with 2 rows and N columns
           category_sales_matrix <- matrix(rep(category_sales$Sales,2), nrow = 2, byrow = TRUE)
           
           # Set column names for the matrix (Category names)
           colnames(category_sales_matrix) <- category_sales$Category
           
           # Create a heatmap using gplots' heatmap.2 function
           heatmap(category_sales_matrix,
                   main = "Sales Heatmap by Category",
                   col = colorRampPalette(c("green", "orange"))(10),  # Red color scale
                   xlab = "Category", ylab = "Sales"
           )  
         },
         
         # Option 2: Heatmap for Sales by Subcategories
         "2" = {
           print("Heatmap for sales by subcategories")
           
           # Aggregate sales by subcategory
           subcategory_sales <- aggregate(Sales ~ Subcategory, data, sum)
           
           # Create a 2D matrix with sales values for subcategories
           # Create a matrix with 2 rows and N columns
           subcategory_sales_matrix <- matrix(rep(subcategory_sales$Sales, 2), nrow = 2, byrow = TRUE)
           
           # Set column names for the matrix (Subcategory names)
           colnames(subcategory_sales_matrix) <- subcategory_sales$Subcategory
           
           # Create a heatmap using gplots' heatmap.2 function
           heatmap(subcategory_sales_matrix, 
                   main = "Sales Heatmap by Subcategory",
                   col = colorRampPalette(c("pink", "blue"))(10),  # Blue color scale
                   xlab = "Subcategory", ylab = "Sales")
           
         }
  )
  
  # Ask if the user wants to continue
  c <- readline(prompt="Do you want to continue (1 for Yes, 0 for No): ")
  k <- as.integer(c)  # Convert user input to integer
}