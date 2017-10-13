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
sensitivity = 16/25 # TP/TP+FP
specificity = 54/74 # TN/TN+FN
install.packages("ROCR")
library(ROCR)
ROCRpred = prediction(predictTrain, qualityTrain$PoorCare)
ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf, colorize = TRUE, print.cutoffs.at=seq(0,1,0.1), text.adj=c(-0.2,1.7))
