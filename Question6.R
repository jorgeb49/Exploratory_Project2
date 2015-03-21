library(dplyr)
library(ggplot2)

setwd('./DSciencesCoursera/04_ExploratoryDataAnalysis/Week3')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC2<- SCC[grepl('Vehicles', SCC[,3]),1]

NEI2 <- NEI[is.element(NEI$SCC,SCC2) & is.element(NEI$fips,c("24510","06037")),]
NEI3 <- group_by(NEI2,year,fips)
emissions <- summarize(NEI3,total_emissions=sum(Emissions,na.rm=TRUE))
emissions2<-mutate(emissions,county=factor(fips),labels=c("Los Angeles County","Baltimore City"))
qplot(year,total_emissions,data=emissions2,main="Motor Vehicle Emissions in Los Angeles County and Baltimore City",method="lm",geom=c("point","smooth"),facets=.~labels)
