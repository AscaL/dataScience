str(wine)
summary(wine)
model1 = lm(Price ~ AGST, data = wine)
model1
summary(model1)
model1$residuals
SSE = sum(model1$residuals^2)
SSE
# Add harvest rain to model
model2 = lm(Price ~ AGST + HarvestRain, data = wine)
model2
summary(model2)
SSE = sum(model2$residuals^2)
SSE
model3 = lm(Price ~ AGST + HarvestRain + WinterRain + Age + FrancePop, data = wine)
summary(model3)
SSE = sum(model3$residuals^2)
SSE
model4 = lm(Price ~ HarvestRain + WinterRain, data = wine)
summary(model4)
model4 = lm(Price ~ AGST + HarvestRain + WinterRain + Age, data = wine)
summary(model4)
cor(wine$WinterRain, wine$Price)
cor(wine$Age, wine$FrancePop)
cor(wine)
model5 = lm(Price ~ AGST + HarvestRain + WinterRain, data = wine)
summary(model5)
cor(wine$WinterRain, wine$HarvestRain)
summary(WineTest)
str(WineTest)
predictTest = predict(model4, newdata = WineTest)
predictTest
SSE = sum((WineTest$Price - predictTest)^2)
SST = sum((WineTest$Price - mean(wine$Price))^2)
1-SSE/SST
# How many games a team needs to win to make it to playoffs?
str(baseball)
summary(baseball)
moneyball = subset(baseball, Year < 2002)
str(moneyball)
moneyball$RD = moneyball$RS - moneyball$RA
plot(moneyball$RD, moneyball$W)
WinsReg = lm(W ~ RD, data = moneyball)
summary(WinsReg)
# W = 80.881375 + 0.1058(RD) >= 95\
80.881375 + 0.1058 * (99)
# How does a team score more runs?
RunsReg = lm(RS ~ OBP + SLG + BA, data = moneyball)
summary(RunsReg)
RunsReg = lm(RS ~ OBP + SLG, data = moneyball)
-804.63 + (2737.77 * 0.311) + (1584.91 * 0.405)
teamRank = c(1,2,3,3,4,4,4,4,5,5)
wins2012 = c(94,88,95,88,93,94,98,97,93,94)
wins2013 = c(97,97,92,93,92,96,94,96,92,90)
cor(teamRank, wins2012)
cor(teamRank, wins2013)
# NBA SHIT
summary(NBA)
str(NBA)
table(NBA$W, NBA$Playoffs)
NBA$PTSDiff = NBA$PTS - NBA$oppPTS
plot(NBA$PTSDiff ~ NBA$W)
WinsReg = lm(W ~ PTSDiff, data = NBA)
summary(WinsReg)
# W = 41 + 0.0326(PTSDiff >= 42) ==> PTSDiff >= 30.67
PTSReg = lm(PTS ~ `2PA` + `3PA` + FTA + AST + ORB + DRB + TOV + STL + BLK, data = NBA)
summary(PTSReg)
PTSReg = lm(PTS ~ `2PA` + `3PA` + FTA + AST + ORB + STL, data = NBA)
summary(PTSReg)
PTSReg$residuals
SSE = sum(PTSReg$residuals^2)
SSE
RMSE = sqrt(SSE/nrow(NBA))
RMSE
mean(NBA$PTS)
PTSReg = lm(PTS ~ `2PA` + `3PA` + FTA + AST + ORB + DRB + STL + BLK, data = NBA)
summary(PTSReg)
PTSReg = lm(PTS ~ `2PA` + `3PA` + FTA + AST + ORB + STL + BLK, data = NBA)
PTSReg2 = lm(PTS ~ `2PA` + `3PA` + FTA + AST + ORB + STL, data = NBA)
summary(PTSReg2)
SSE2 = sum(PTSReg$residuals^2)
SSE2
RMSE2 = sqrt(SSE2/nrow(NBA))
RMSE2
summary(NBA_test)
PTSPred = predict(PTSReg2, newdata = NBA_test)
summary(PTSPred)
SSE = sum((PTSPred - NBA_test$PTS)^2)
SST = sum((mean(NBA$PTS) - NBA_test$PTS)^2)
R2 = 1 - SSE/SST
R2
RMSE = sqrt(SSE/nrow(NBA_test))
RMSE
# HW1
CCTRAINING = subset(climate_change, Year <= 2006)
CCTEST = subset(climate_change, Year > 2006)
TempReg2 = lm(Temp ~ MEI + CO2 + CH4 + N2O + `CFC-11` + `CFC-12` + TSI + Aerosols, data = CCTRAINING)
summary(TempReg)
cor(CCTRAINING$N2O, CCTRAINING$CO2)
cor(CCTRAINING$N2O, CCTRAINING$MEI)
cor(CCTRAINING$N2O, CCTRAINING$CH4)
cor(CCTRAINING$N2O, CCTRAINING$`CFC-11`)
cor(CCTRAINING$N2O, CCTRAINING$`CFC-12`)
cor(CCTRAINING$N2O, CCTRAINING$Aerosols)
cor(CCTRAINING$`CFC-11`, CCTRAINING$TSI)
cor(CCTRAINING$`CFC-11`, CCTRAINING$CO2)
cor(CCTRAINING$`CFC-11`, CCTRAINING$MEI)
cor(CCTRAINING$`CFC-11`, CCTRAINING$CH4)
cor(CCTRAINING$`CFC-11`, CCTRAINING$N2O)
cor(CCTRAINING$`CFC-11`, CCTRAINING$`CFC-12`)
cor(CCTRAINING$`CFC-11`, CCTRAINING$Aerosols)
cor(CCTRAINING$`CFC-11`, CCTRAINING$TSI)
# OR JUST THIS! FUCK ME
cor(CCTRAINING)
TempReg = lm(Temp ~ MEI + N2O + TSI + Aerosols, data = CCTRAINING)
summary(TempReg)
?step
step(TempReg2)
TempReg = lm(Temp ~ MEI + CO2 + N2O + `CFC-11` + `CFC-12` + TSI + Aerosols, data = CCTRAINING)
summary(TempReg)
TempPred = predict(TempReg, newdata = CCTEST)
SSE = sum((TempPred - CCTEST$Temp)^2)
SSE
SST = sum((mean(CCTRAINING$Temp) - CCTEST$Temp)^2)
SST
R2 = 1 - SSE/SST
R2
RMSE = sqrt(SSE/nrow(CCTEST))
RMSE
# HW 2
tapply(pisaTrain$readingScore, pisaTrain$male, mean)
summary(pisaTrain)
pisaTest = na.omit(pisaTest)
pisaTrain = na.omit(pisaTrain)
str(pisaTest)
str(pisaTrain)
# DOES NOT WORK!
pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")
lmScore = lm(readingScore ~ ., data = pisaTrain)
summary(lmScore)
SSE = sum(lmScore$residuals^2)
SSE
RMSE = sqrt(SSE/nrow(pisaTrain))
RMSE
# also, RMSE = sqrt(mean(lmScore$residuals^2))
predTest = predict(lmScore, newdata = pisaTest)
summary(readScorePred)
baseline = mean(pisaTrain$readingScore)
baseline
SSE = sum((predTest - pisaTest$readingScore)^2)
SSE
SST = sum((mean(pisaTrain$readingScore) - pisaTest$readingScore)^2)
SST
R2 = 1 - SSE/SST
R2
RMSE = sqrt(SSE/nrow(pisaTest))
RMSE
# HW 3
summary(FluTrain)
str(FluTrain)
subset(FluTrain, Queries == max(Queries))
hist(FluTrain$ILI)
plot(FluTrain$Queries, log(FluTrain$ILI))
FluTrend1 = lm(log(ILI) ~ Queries, data = FluTrain)
summary(FluTrend1)
# R^2 = Correlation^2 IF there is only a single variable
cor(log(FluTrain$ILI), FluTrain$Queries)
PredTest1 = exp(predict(FluTrend1, newdata = FluTest))
?which
which(FluTest$Week == "2012-03-11 - 2012-03-17")
FluTest$Week
PredTest1[11]
FluTest$ILI[11]
(FluTest$ILI[11] - PredTest1[11])/FluTest$ILI[11]
SSE = sum((PredTest1 - FluTest$ILI)^2)
RMSE = sqrt(SSE/nrow(FluTest))
install.packages("zoo")
library(zoo)
FluTrain$ILILag2 = lag(zoo(FluTrain$ILI), -2, na.pad = TRUE)
summary(ILILag2)
plot(log(ILILag2), log(FluTrain$ILI))
FluTrend2 = lm(log(ILI) ~ Queries + log(ILILag2), data = FluTrain)
summary(FluTrend2)
FluTest$ILILag2 = lag(zoo(FluTest$ILI), -2, na.pad = TRUE)
FluTest$ILILag2
summary(FluTest)
nrow(FluTrain)
FluTrain$ILI[416]
FluTrain$ILI[417]
FluTest$ILILag2[1] = FluTrain$ILI[416]
FluTest$ILILag2[2] = FluTrain$ILI[417]
FluTest$ILILag2[3]
PredTest2 = exp(predict(FluTrend2, newdata = FluTest))
SSE = sum((PredTest2 - FluTest$ILI)^2)
RMSE = sqrt(SSE/nrow(FluTest))
# RMSE = sqrt(mean((PredTest2 - FluTest$ILI)^2))
RMSE
