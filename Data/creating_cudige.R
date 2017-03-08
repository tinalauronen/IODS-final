# IODS final assignment: data wrangling

# 8.3.2017
# Tina Lauronen

install.packages("gdata")
library(gdata)
library(dplyr)
library(stringr)


# Reading the data from excel, checking the dimensions and variable names
# 13161 observations and 373 variables: correct but way too slow to handle in RStudio

cudige <- read.xls("/Users/tlaurone/GitHub/tinalauronen/IODS-final/Data/cudige_data.xlsx")
dim(cudige)
colnames(cudige)

# Selecting nine variables

keep_columns <- c("Year", "Newspaper", "Art_form", "Artist_origin", "Artist_time", "Format", "Aesthetic", "Commercial", "Political")
cudige9 <- select(cudige, one_of(keep_columns))
str(cudige9)
summary(cudige9)

# Filtering out the observations with missing values

complete.cases(cudige9)
data.frame(cudige9[-1], comp = complete.cases(cudige9))
cudige_ <- filter(cudige9, complete.cases(cudige9))

str(cudige_)

# Labeling the values of the variables

cudige_$Year <- factor(cudige_$Year, levels = c(1960, 1970, 1980, 1990, 2000, 2010), labels = c("1960", "1970", "1980", "1990", "2000", "2010"))

cudige_$Newspaper <- factor(cudige_$Newspaper, levels = c(1:6), labels = c("ABC/EP", "DN", "GU", "HS", "LM", "MIL"))

cudige_$Art_form <- factor(cudige_$Art_form, levels = c(1:8), labels = c("Literature", "Popular music", "Classical music", "Film", "TV", "Theatre", "Fine arts", "Other"))

cudige_$Artist_origin <- factor(cudige_$Artist_origin, levels = c(1:4), labels = c("Domestic", "Other Europe", "USA", "Other"))

cudige_$Artist_time <- factor(cudige_$Artist_time, levels = c(1:4), labels = c("Present", "Post WW2", "Pre WW2", "Historical"))

cudige_$Format <- factor(cudige_$Format, levels = c(1, 2), labels = c("Live", "Recording"))

cudige_$Aesthetic <- factor(cudige_$Aesthetic, levels = c(0, 1), labels = c("No", "Yes"))

cudige_$Commercial <- factor(cudige_$Commercial, levels = c(0, 1), labels = c("No", "Yes"))

cudige_$Political <- factor(cudige_$Political, levels = c(0, 1), labels = c("No", "Yes"))

str(cudige_)
summary(cudige_)

# Saving the dataset

write.csv(cudige_, "/Users/tlaurone/GitHub/tinalauronen/IODS-final/Data/cudige.csv", row.names = FALSE)

# REPEATING THE SAME OPERATIONS WITH DATA SET WITHOUT TURKISH NEWSPAPER MILLIYET

# Reading the data from excel, checking the dimensions and variable names
# 11,775 observations and 373 variables: correct but way too slow to handle in RStudio

cudige5 <- read.xls("/Users/tlaurone/GitHub/tinalauronen/IODS-final/Data/cudige_data_5.xlsx")
dim(cudige5)
colnames(cudige5)

# Selecting nine variables

keep_columns5 <- c("Year", "Newspaper", "Art_form", "Artist_origin", "Artist_time", "Format", "Aesthetic", "Commercial", "Political")
cudige5_9 <- select(cudige5, one_of(keep_columns5))
str(cudige5_9)
summary(cudige5_9)

# Filtering out the observations with missing values

complete.cases(cudige5_9)
data.frame(cudige5_9[-1], comp = complete.cases(cudige5_9))
cudige5_ <- filter(cudige5_9, complete.cases(cudige5_9))

str(cudige5_)

# Labeling the values of the variables

cudige5_$Year <- factor(cudige5_$Year, levels = c(1960, 1970, 1980, 1990, 2000, 2010), labels = c("1960", "1970", "1980", "1990", "2000", "2010"))

cudige5_$Newspaper <- factor(cudige5_$Newspaper, levels = c(1:5), labels = c("ABC/EP", "DN", "GU", "HS", "LM"))

cudige5_$Art_form <- factor(cudige5_$Art_form, levels = c(1:8), labels = c("Literature", "Popular music", "Classical music", "Film", "TV", "Theatre", "Fine arts", "Other"))

cudige5_$Artist_origin <- factor(cudige5_$Artist_origin, levels = c(1:4), labels = c("Domestic", "Other Europe", "USA", "Other"))

cudige5_$Artist_time <- factor(cudige5_$Artist_time, levels = c(1:4), labels = c("Present", "Post WW2", "Pre WW2", "Historical"))

cudige5_$Format <- factor(cudige5_$Format, levels = c(1, 2), labels = c("Live", "Recording"))

cudige5_$Aesthetic <- factor(cudige5_$Aesthetic, levels = c(0, 1), labels = c("No", "Yes"))

cudige5_$Commercial <- factor(cudige5_$Commercial, levels = c(0, 1), labels = c("No", "Yes"))

cudige5_$Political <- factor(cudige5_$Political, levels = c(0, 1), labels = c("No", "Yes"))

str(cudige5_)
summary(cudige5_)

# Saving the dataset

write.csv(cudige5_, "/Users/tlaurone/GitHub/tinalauronen/IODS-final/Data/cudige5.csv", row.names = FALSE)



