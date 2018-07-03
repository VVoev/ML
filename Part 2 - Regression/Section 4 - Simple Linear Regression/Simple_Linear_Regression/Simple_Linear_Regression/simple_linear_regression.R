# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split==FALSE)

# FEATURE SCALING
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_test[,2:3])

# Fitting SIMPLE LINEAR REGRESSION to the training test
regresor = lm(formula = Salary ~ YearsExperience,
              data = training_set)
summary(regresor)

# Predicting the Test set Result
y_pred = predict(regresor,newdata = test_set)

# Visualing the The training set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience,y=training_set$Salary),
             colour='red') +
  geom_line(aes(x= training_set$YearsExperience,y = predict(regresor,newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experience(Training set)')+
xlab('Years of experience') + 
  ylab('Salary')


# Visualing the The test set results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience,y=test_set$Salary),
             colour='red') +
  geom_line(aes(x= training_set$YearsExperience,y = predict(regresor,newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experience(Test set)')+
xlab('Years of experience') + 
  ylab('Salary')

