titanicData <- read.csv("W:/Dataset_midterm_Section(B).csv", header=TRUE, sep=",")
titanicData

names(titanicData)
str(titanicData)
summary(titanicData)

colSums(is.na(titanicData))
rowSums(is.na(titanicData))

removeData<- na.omit(titanicData)
print(removeData)

install.packages("dplyr")
library(dplyr)
removeData %>% summarise_if(is.numeric, sd)
removeData %>% summarise_if(is.numeric, mean)
removeData %>% summarise_if(is.numeric, median)
removeData %>% summarise_if(is.numeric, range)

boxplot(titanicData$age, main = "Outlier for Age", ylab = "Age", col = "cyan")
hist(titanicData$age, main = "Histogram for Age", xlab = "Age", ylab = "Frequency", col = "lightblue")


titanicData[is.na(titanicData$age), "age"] <-median(titanicData$age,na.rm=TRUE)
titanicData

for (Gender in colnames(titanicData)) {freq_table <- table(titanicData[[Gender]])
  most_frequent <- names(freq_table)[which.max(freq_table)]
  titanicData[[Gender]][is.na(titanicData[[Gender]])] <- most_frequent
}
titanicData