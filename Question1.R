library(dplyr)

setwd('./DSciencesCoursera/04_ExploratoryDataAnalysis/Week3')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

NEI2 <- select(NEI,Emissions,year)
NEI3 <- group_by(NEI2,year)
emissions <- summarize(NEI3,total_emissions=sum(Emissions,na.rm=TRUE))
plot(emissions)
model <- lm(total_emissions~year,emissions)
abline(model,lwd=2)