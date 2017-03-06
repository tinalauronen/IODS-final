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

cudige_$Newspaper <- factor(cudige_$Newspaper, levels = c(1:6), labels = c("ABC/EP", "DN", "GU", "HS", "LM", "MIL"))

cudige_$Art_form <- factor(cudige_$Art_form, levels = c(1:8), labels = c("Literature", "Popular music", "Classical music", "Film", "TV", "Theatre", "Fine arts", "Other"))

cudige_$Artist_origin <- factor(cudige_$Artist_origin, levels = c(1:4), labels = c("Domestic", "Other Europe", "USA", "Other"))

cudige_$Artist_time <- factor(cudige_$Artist_time, levels = c(1:4), labels = c("Present", "Post WW2", "Pre WW2", "Historical"))

cudige_$Format <- factor(cudige_$Format, levels = c(1, 2), labels = c("Live", "Recording"))

cudige_$Aesthetic <- factor(cudige_$Aesthetic, levels = c(0, 1), labels = c("No", "Yes"))

cudige_$Commercial <- factor(cudige_$Commercial, levels = c(0, 1), labels = c("No", "Yes"))

cudige_$Political <- factor(cudige_$Political, levels = c(0, 1), labels = c("No", "Yes"))


# Saving the dataset

write.csv(cudige_, "/Users/tlaurone/GitHub/tinalauronen/IODS-final/Data/cudige.csv", row.names = FALSE)


