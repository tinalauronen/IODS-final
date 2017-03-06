install.packages("gdata")
library(gdata)
library(dplyr)
?read.xls


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

# Saving the dataset

write.csv(cudige_, "/Users/tlaurone/GitHub/tinalauronen/IODS-final/Data/cudige.csv")


