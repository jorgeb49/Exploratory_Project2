library(dplyr)
library(ggplot2)

setwd('./DSciencesCoursera/04_ExploratoryDataAnalysis/Week3')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI2 <- filter(NEI,fips=="24510")

head(NEI2)

NEI3 <- group_by(NEI2,year,type)
emissions <- summarize(NEI3,total_emissions=sum(Emissions,na.rm=TRUE))
qplot(year,total_emissions,data=emissions,facets=.~type,main="Emissions in Baltimore City",method="lm",geom=c("point","smooth"))
