# UNIT 3
z = 3.72
y = 1/z
x = 1-y
k = x + y
odds = y/x
logit = log(odds)
str(quality)
table(quality$PoorCare)
98/131
install.packages("caTools")
library(caTools)
set.seed(88)
# SPLIT DATA IN TRAINING AND TEST SET
split = sample.split(quality$PoorCare, SplitRatio = 0.75)
table(split)
qualityTrain = subset(quality, split == TRUE)
qualityTest = subset(quality, split == FALSE)
QualityLog = glm(PoorCare ~ OfficeVisits + Narcotics, data = qualityTrain, family = binomial)
QualityLog2 = glm(PoorCare ~ StartedOnCombination + ProviderCount, data = qualityTrain, family = binomial)
summary(QualityLog)
summary(QualityLog2)
predictTrain = predict(QualityLog, type="response")
summary(predictTrain)
tapply(predictTrain, qualityTrain$PoorCare, mean)
# PREDICT POOR/GOOD CARE VIA THRESHOLD CONF MATRIX
table(qualityTrain$PoorCare, predictTrain > 0.2)
sensitivity = 16/25 # TP/TP+FN
specificity = 54/74 # TN/TN+FP
install.packages("ROCR")
library(ROCR)
ROCRpred = prediction(predictTrain, qualityTrain$PoorCare)
ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf, colorize = TRUE, print.cutoffs.at=seq(0,1,0.1), text.adj=c(-0.2,1.7))
predictTest = predict(QualityLog, type="response", newdata = qualityTest)
table(qualityTest$PoorCare, predictTest > 0.3)
predictTest2 = predict(QualityLog, type="response", newdata=qualityTest)
ROCRpredTest = prediction(predictTest2, qualityTest$PoorCare)
auc = as.numeric(performance(ROCRpredTest, "auc")@y.values)
# Framingham Hearth Study
str(framingham)
library(caTools)
set.seed(1000)
split = sample.split(framingham$TenYearCHD, SplitRatio = 0.65)
train = subset(framingham, split == TRUE)
test = subset(framingham, split == FALSE)
framinghamLog = glm(TenYearCHD ~ ., data = train, family = binomial())
summary(framinghamLog)
predictTest = predict(framinghamLog, type = "response", newdata = test)
table(test$TenYearCHD, predictTest > 0.5)
sensitivity = 11/(11+187)
sensitivity
specificity = 1069/(1069+7)
specificity
accuracy = (1069+11)/(1069+6+11+187)
accuracy
(1069+6)/(1069+6+11+187)
library(ROCR)
ROCRpred = prediction(predictTest, test$TenYearCHD)
as.numeric(performance(ROCRpred, "auc")@y.values)
# Election Forecasting
summary(PollingData)
str(PollingData)
table(PollingData$Year)
install.packages("mice")
library(mice)
simple = PollingData[c("Rasmussen", "SurveyUSA", "PropR", "DiffCount")]
summary(simple)
set.seed(144)
# Remove Missing Values based on old ones
imputed = complete(mice(simple))
summary(imputed)
PollingData$Rasmussen = imputed$Rasmussen
PollingData$SurveyUSA = imputed$SurveyUSA
summary(PollingData)
train = subset(PollingData, Year == 2004 | Year == 2008)
test = subset(PollingData, Year == 2012)
# Decide a baseline
table(train$Republican)
sign(PollingData$Rasmussen) # Return 1 if pos, 0 if 0, -1 if neg
table(sign(train$Rasmussen))
table(train$Republican, sign(train$Rasmussen))
cor(train)
str(train)
cor(train[c("Rasmussen", "SurveyUSA", "PropR", "DiffCount", "Republican")])
mod1 = glm(Republican ~ PropR, data = train, family = "binomial")
summary(mod1)
pred1 = predict(mod1, type="response")
table(train$Republican, pred1 >= 0.5)
mod2 = glm(Republican ~ SurveyUSA + DiffCount, data = train, family = "binomial")
pred2 = predict(mod2,type="response")
table(train$Republican, pred2 >= 0.5)
summary(mod2)
table(test$Republican, sign(test$Rasmussen))
testPred = predict(mod2, newdata = test, type = "response")
table(test$Republican, testPred >= 0.5)
subset(test, testPred >= 0.5 & Republican == 0)
# HW 1
str(songs)
summary(songs)
summary(songs$year == 2010)
table(songs$year)
summary(songs$artistname == "Michael Jackson" & songs$Top10 == TRUE)
MJ = subset(songs, artistname == "Michael Jackson" & songs$Top10 == TRUE)
MJ[c("songtitle", "Top10")]
table(songs$timesignature)
which.max(songs$tempo)
songs$songtitle[6206]
songsTrain = subset(songs, year <= 2009)
songsTest = subset(songs, year == 2010)
nonvars = c("year", "songtitle", "artistname", "songID", "artistID")
songsTrain = songsTrain[ , !(names(songsTrain) %in% nonvars)]
songsTest = songsTest[ , !(names(songsTest) %in% nonvars)]
mod1 = glm(Top10 ~ ., data = songsTrain, family = binomial)
summary(mod1)
cor(songsTrain$loudness, songsTrain$energy)
mod2 = glm(Top10 ~ . -loudness, data = songsTrain, family = binomial)
mod3 = glm(Top10 ~ . -energy, data = songsTrain, family = binomial)
summary(mod2)
summary(mod3)
testPred = predict(mod3, newdata = songsTest, type = "response")
summary(testPred)
table(songsTest$Top10, testPred >= 0.45)
accuracy = (309+19)/(309+19+40+5)
table(songsTest$Top10) # Baseline
accuracyBase = 314/(314+59)
sensitivity = 19/(19+40)
specificity = 309/314
# HW 2
summary(parole)
str(parole)
table(parole$violator)
parole$state = as.factor(parole$state)
parole$crime = as.factor(parole$crime)
summary(parole)
set.seed(144)
library(caTools)
split = sample.split(parole$violator, SplitRatio = 0.7)
train = subset(parole, split == TRUE)
test = subset(parole, split = FALSE)
mod1 = glm(violator ~ ., data = train, family = binomial)
summary(mod1)
testPred = predict(mod1, newdata = test, type = "response")
summary(testPred)
table(test$violator, as.numeric(testPred >= 0.5))
accuracy = 578/(578+27)
sensitivity = 27/(27+51)
specificity = 578/(578+19)
table(test$violator)
library(ROCR)
pred = prediction(testPred, test$violator)
as.numeric(performance(pred, "auc")@y.values)
# HW 3
summary(loans)
str(loans)
table(loans$not.fully.paid)
install.packages("mice")
library(mice)
set.seed(144)
vars.for.imputation = setdiff(names(loans), "not.fully.paid")
imputed = complete(mice(loans[vars.for.imputation]))
loans[vars.for.imputation] = imputed
set.seed(144)
split = sample.split(loans$not.fully.paid, SplitRatio = 0.7)
train = subset(loans, split == TRUE)
test = subset(loans, split = FALSE)
mod1 = glm(not.fully.paid ~ ., data = train, family = "binomial")
summary(mod1)
test$predicted.risk = predict(mod1, newdata = test, type = "response")
table(test$not.fully.paid, test$predicted.risk > 0.5)
summary(testPred)
library(ROCR)
pred = prediction(test$predicted.risk, test$not.fully.paid)
as.numeric(performance(pred, "auc")@y.values)
bivariate = glm(not.fully.paid ~ int.rate, data = train, family = "binomial")
summary(bivariate)
cor(train$int.rate, train$fico)
pred.bivariate = predict(bivariate, newdata = test, type = "response")
summary(pred.bivariate)
prediction.bivariate = prediction(pred.bivariate, test$not.fully.paid)
as.numeric(performance(prediction.bivariate, "auc")@y.values)
test$profit = exp(test$int.rate*3) - 1
test$profit[test$not.fully.paid == 1] = -1
summary(test$profit)
highInterest = subset(test, int.rate >= 0.15)
summary(highInterest$profit)
table(highInterest$not.fully.paid)
cutoff = sort(highInterest$predicted.risk, decreasing = FALSE)[100]
selectedLoans = subset(highInterest, predicted.risk <= cutoff)
sum(selectedLoans$profit)
table(selectedLoans$not.fully.paid)
