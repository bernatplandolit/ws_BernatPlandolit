library(stringr)

# Exercice 1 --------------------------------------------------------------

text1 <- "The current year is 2017"
my_pattern <- "[:digit:]"
grepl(my_pattern, text1)


# Exercice 11 -------------------------------------------------------------

data <- read.csv2("LipidData.csv")

vars <- as.character(data$LIPID)

carbons <- str_split(vars, "C*[:digit:]{2,}[[:punct:][:alpha:]]")
