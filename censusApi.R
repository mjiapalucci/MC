library(httr)
library(jsonlite)
library(tidyverse)

# Import json data from Census API
data <- GET("https://api.census.gov/data/2019/acs/acs1/?get=NAME,B01001_001E,B01002_001E,C22001_001E,B25064_001E&for=county:*&in=state:24")
data <- content(data, as="text")

# Load into a data frame
df <- fromJSON(data)
class(df)
head(df)

# Change to tibble
df <- as_tibble(df)
head(df)

# Make first row column header names
names(df) <- c(df[1,])
head(df)

# Keep all but first row (which had the column header names)
df <- df[-1,]
head(df)

# Rename columns as needed
names(df) <- c('NAME',
               'B01001_001E' = 'Population',
               'B01002_001E' = 'Median_Age',
               'C22001_001E' = 'Household_Poverty',
               'B25064_001E' = 'Median_Gross_Rent',
               'state',
               'county')
head(df)
