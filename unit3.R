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
