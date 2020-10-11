library(httr)
library(jsonlite)
library(lubridate)
library(tidyverse)

r <- GET("https://data.montgomerycountymd.gov/resource/xhwt-7h2h")

glimpse(r)

content(r, "text")

jsonRespText <- content(r, as="text")
jsonRespParsed <- content(r, as="parsed")
jsonRespParsed

df <- fromJSON(jsonRespText)
head(df)
class(df)
df1 <- as_tibble(df)

df1$arrest_date <- ymd_hms(df1$arrest_date, tz="EST")
df1$arrest_date
df1

