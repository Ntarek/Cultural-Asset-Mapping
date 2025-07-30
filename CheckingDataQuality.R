library(vtable)
library(tidyr)
library(dplyr)
library(tidyverse)


data<- read.csv("/Users/norhantarek/Desktop/New Data/Downloaded Data/OSM/la_street_art.csv")
#replace with downloaded dataset being examined

head(data,2)
st(data)
names(data)
#View(data)



# Count NA values
na_counts <- sapply(data, function(x) sum(is.na(x)))

# Count empty string values
empty_counts <- sapply(data, function(x) sum(x == "", na.rm = TRUE))

# Combine into a summary data frame
missing_summary <- data.frame(
  Column = names(data),
  NA_Count = na_counts,
  Empty_String_Count = empty_counts,
  Total_Missing = na_counts + empty_counts,
  Percent_Missing = (na_counts + empty_counts) / nrow(data) * 100
)

# Show only columns with missing data
missing_summary <- missing_summary[missing_summary$Total_Missing > 0, ]

# View result
print(missing_summary)

