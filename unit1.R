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
str(USDA)
USDA$Sodium
which.max(USDA$Sodium)
names(USDA)
USDA$Description[265]
HighSodium = subset(USDA, Sodium>10000)
HighSodium
nrow(HighSodium)
HighSodium$Description
USDA$Sodium[4154]
match("CAVIAR", USDA$Description)
USDA$Sodium[match("CAVIAR", USDA$Description)]
summary(USDA$Sodium)
sd(USDA$Sodium)
sd(USDA$Sodium, na.rm = TRUE)
plot(USDA$Protein, USDA$TotalFat)
plot(USDA$Protein, USDA$TotalFat, xlab = "Protein", ylab = "Fat", main = "Protein vs Fat", col = "Blue")
hist(USDA$VitaminC, xlab = "Vit C (mg)", main = "VitC Histo")
hist(USDA$VitaminC, xlab = "Vit C (mg)", main = "VitC Histo", xlim = c(0, 100))
hist(USDA$VitaminC, xlab = "Vit C (mg)", main = "VitC Histo", xlim = c(0, 100), breaks = 100)
hist(USDA$VitaminC, xlab = "Vit C (mg)", main = "VitC Histo", xlim = c(0, 100), breaks = 2000)
hist(USDA$VitaminC, xlab = "Vit C (mg)", main = "VitC Histo", xlim = c(0, 100), breaks = 4000)
boxplot(USDA$Sugar, main = "Box of Sugar", ylab = "Sugar")
ggplot(data = USDA) + 
  geom_point(mapping = aes(USDA$Protein, USDA$TotalFat, alpha = USDA$Protein))
USDA$Sodium[1] > mean(USDA$Sodium, na.rm = TRUE)
USDA$Sodium[5] > mean(USDA$Sodium, na.rm = TRUE)
HighSodium = USDA$Sodium > mean(USDA$Sodium, na.rm = TRUE)
str(HighSodium)
HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm = TRUE))
str(HighSodium)
USDA$HighSodium = as.numeric(USDA$Sodium > mean(USDA$Sodium, na.rm = TRUE))
str(USDA)
USDA$HighProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm = TRUE))
USDA$HighFat = as.numeric(USDA$TotalFat > mean(USDA$TotalFat, na.rm = TRUE))
USDA$HighCarbs = as.numeric(USDA$Carbohydrate > mean(USDA$Carbohydrate, na.rm = TRUE))
str(USDA)
table(USDA$HighSodium)
table(USDA$HighSodium, USDA$HighFat)
tapply(USDA$Iron, USDA$HighProtein, mean, na.rm = TRUE)
tapply(USDA$VitaminC, USDA$HighCarbs, max, na.rm = TRUE)
tapply(USDA$VitaminC, USDA$HighCarbs, summary, na.rm = TRUE)
mvt = mvtWeek1
str(mvt)
max(mvt$ID)
min(mvt$Beat)
count(mvt$Arrest == TRUE)
str(mvt$Arrest)
subset(mvt$Arrest == TRUE)
hist(mvt$Arrest)
rm(mvtWeek1)
# Number of true/false
table(mvt$Arrest)
table(mvt$LocationDescription)
# Number of "ALLEY"
table(mvt$LocationDescription)[names(table(mvt$LocationDescription))=="ALLEY"]
match("ALLEY", mvt$LocationDescription)
mvt$LocationDescription[46]
mvt$Date[1]
mvt$Date[2]
# Convert date to Date obj
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
DateConvert
median(DateConvert)
mvt$Month = months(DateConvert)
mvt$Weekdays = weekdays(DateConvert)
mvt$Date = DateConvert
table(mvt$Month)
# Max number of gta in a month
which.min(table(mvt$Month))
which.max(table(mvt$Month))
which.max(table(mvt$Weekdays))
hist(mvt$Date, breaks = 100)
boxplot(mvt$Date)
boxplot(mvt$Date ~ mvt$Arrest)
boxplot(mvt$Arrest ~ mvt$Date)
summary(mvt$Arrest)
table(mvt$Arrest, mvt$Year)
sort(table(mvt$LocationDescription))
Top5 = subset(mvt$LocationDescription, mvt$LocationDescription == "STREET" |  mvt$LocationDescription == "ALLEY" |  mvt$LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)" | mvt$LocationDescription == "GAS STATION" |  mvt$LocationDescription == "DRIVEWAY - RESIDENTIAL")
Top5
table(Top5)
summary(Top5)
table(mvt$LocationDescription == "GAS STATION", mvt$Weekdays)
table(mvt$LocationDescription == "DRIVEWAY - RESIDENTIAL", mvt$Weekdays)
# HW 2 Start
IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")
summary(IBM)
str(IBM)
str(CocaCola)
summary(GE)
summary(CocaCola)
summary(Boeing)
sd(ProcterGamble$StockPrice)
plot(CocaCola$Date, CocaCola$StockPrice, "l", col = "red")
ggplot(CocaCola) + geom_point(aes(CocaCola$Date, CocaCola$StockPrice, color = CocaCola$StockPrice))
lines(ProcterGamble$Date, ProcterGamble$StockPrice)
abline(v=as.Date(c("2003-03-01")), lwd=3)
plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(ProcterGamble$Date, ProcterGamble$StockPrice, col = "blue")
lines(IBM$Date, IBM$StockPrice, col = "green")
lines(GE$Date, GE$StockPrice, col = "yellow")
lines(Boeing$Date, Boeing$StockPrice, col = "purple")
abline(v=as.Date(c("2003-03-01")), lwd=2)
abline(v=as.Date(c("1997-09-01")), lwd=3)
abline(v=as.Date(c("1997-11-01")), lwd=2)
tapply(IBM$StockPrice, months(IBM$Date), mean)
tapply(GE$StockPrice, months(GE$Date), mean)
# HW 3 Start
summary(CPS)
str(CPS)
sort(table(CPS$Industry))
sort(table(CPS$State))
str(CPS)
table(CPS$Citizenship)
table(CPS$Hispanic, CPS$Race)
summary(CPS)
is.na(CPS$Married)
table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married))
table(CPS$Citizenship, is.na(CPS$Married))
table(CPS$State, is.na(CPS$MetroAreaCode))
table(CPS$Region, is.na(CPS$MetroAreaCode))
mean(table(CPS$State, is.na(CPS$MetroAreaCode)))
# Witch state has a proportion of interviewees living in non metro area closest to 30%
sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))
str(MetroAreaCodes)
summary(MetroAreaCodes)
nrow(CountryCodes)
CPS = merge(CPS, MetroAreaCodes, by.x="MetroAreaCode", by.y = "Code", all.x = TRUE)
summary(CPS)
sort(table(CPS$MetroArea))
sort(tapply(CPS$Hispanic, CPS$MetroArea, mean))
CPS$Race=="Asian"
sort(tapply(CPS$Race=="Asian", CPS$MetroArea, mean))
sort(tapply(CPS$Education=="No high school diploma", CPS$MetroArea, mean, na.rm = TRUE))
CPS = merge(CPS, CountryCodes, by.x="CountryOfBirthCode", by.y = "Code", all.x = TRUE)
str(CPS)
summary(CPS$Country)
sort(table(CPS$Country))
sort(tapply(CPS$Citizenship, CPS$MetroArea, mean))
table(CPS$MetroArea == "New York-Northern New Jersey-Long Island, NY-NJ-PA", CPS$Country != "United States")
# To get the number of true values in a vector of t/r i can use sum()
sort(tapply(CPS$Country=="India", CPS$MetroArea, sum, na.rm = TRUE))
sort(tapply(CPS$Country=="Brazil", CPS$MetroArea, sum, na.rm = TRUE))
sort(tapply(CPS$Country=="Somalia", CPS$MetroArea, sum, na.rm = TRUE))
