library("tidyverse")
# create a vector
vec = c(1,2,3,4)
Country = c("Brazil", "China", "India", "Sqitzerland", "USA")
LifeExpectancy = c(74,76,65,83,79)
Country[2]
# Create a sequence
seq(0, 100, 2)
CountryData = data.frame(Country, LifeExpectancy)
?data.frame
CountryData
# Dollar Sign to add to collection
CountryData$Population = c(199000, 1390000, 1240000, 7997, 318000)
Country = c("Australia", "Grece")
LifeExpectancy = c(82,81)
Population = c(23050, 11125)
NewCountryData = data.frame(Country, LifeExpectancy, Population)
NewCountryData
AllCountryData = rbind(CountryData, NewCountryData)
AllCountryData
summary(WHO)
WHO_EU = subset(WHO, Region == "Europe")
WHO_EU
ls()
WHO$Under15
mean(WHO$Under15)
sd(WHO$Under15)
summary(WHO$Under15)
which.min(WHO$Under15)
WHO$Country[86]
which.max(WHO$Under15)
WHO$Country[124]
plot(WHO$GNI, WHO$FertilityRate)
# Does not work...
Outliers = subset(WHO, GNI > 10000 & FertilityRate > 2.5)
nrow(Outliers)
Outliers[c("Country", "GNI", "FertilityRate")]
mean(WHO$Over60)
which.max(WHO$Over60)
WHO$Country[86]
which.min(WHO$Over60)
WHO$Country[183]
summary(WHO$LiteracyRate)
which.max(WHO$LiteracyRate)
WHO$Country[44]
hist(WHO$CellularSubscribers)
boxplot(WHO$LifeExpectancy ~ WHO$Region)
boxplot(WHO$LifeExpectancy ~ WHO$Region, xlab="", ylab="Life Expectancy", main="Life Exp of Countries By Region")
table(WHO$Region)
tapply(WHO$Over60, WHO$Region, mean)
tapply(WHO$LiteracyRate, WHO$Region, min)
tapply(WHO$LiteracyRate, WHO$Region, min, na.rm=TRUE)
tapply(WHO$ChildMortality, WHO$Region, mean)
