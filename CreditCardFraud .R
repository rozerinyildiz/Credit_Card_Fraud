
# --Installing libraries--
# install.packages("caret")
# install.packages("rpart")
# install.packages("xgboost")
# install.packages("dplyr")
# install.packages("rpart.plot")
# install.packages("pROC")

# Libraries
library(caret)
library(rpart)
library(dplyr)
library(ROSE)
library(randomForest)
library(rpart.plot)
library(xgboost)

# Reading dataset 
credit_card = read.csv(file = 'C:/Users/rozer/OneDrive/Belgeler/creditcard.csv')

# Viewing dataset
View(credit_card)

# Displaying columns
names(credit_card)

# Printing structure of the dataset
str(credit_card)

# Printing 6 obs of the dataset
head(credit_card)

# Converting the Class to factor as it has 0 (non-frauds) and 1 (frauds)
credit_card$Class = as.factor(credit_card$Class)

#  Summarizing the count of the Frauds and Non-Frauds
summary(credit_card$Class)

# Checking for any na value
sum(is.na(credit_card))

# Separating frauds and non-frauds (new dfs)
credit_card.true = credit_card[credit_card$Class == 0,]
credit_card.false = credit_card[credit_card$Class == 1,]


install.packages("ggplot2") # Install it again
library(ggplot2) # Load the librarie (you have to do this one on each new session)



# DATA Visualization
ggplot()+geom_density(data = credit_card.true, aes(x = Time),color="blue",
                      fill="blue", alpha=0.12) +
  geom_density(data = credit_card.false, aes(x = Time), color="red",fill="red",
               alpha=0.12)

ggplot()+geom_density(data = credit_card.true, aes(x = Amount),color="blue",
                      fill="blue", alpha=0.12) +
  geom_density(data = credit_card.false, aes(x = Amount), color="red", fill="red",
               alpha = 0.12)


#Pie chart for comparing no.of frauds and non-frauds
labels = c("NON-FRAUD", "FRAUD")
labels = paste(labels, round(prop.table(table(credit_card$Class))*100, 2))
labels = paste(labels, "%")
pie(table(credit_card$Class), labels, col = c("blue", "red"),
    main = "Pie Chart of Credit Card TRansactions")




