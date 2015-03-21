library(dplyr)
library(ggplot2)

setwd('./DSciencesCoursera/04_ExploratoryDataAnalysis/Week3')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC2<- SCC[grepl('Vehicles', SCC[,3]),1]

NEI2 <- NEI[is.element(NEI$SCC,SCC2) & NEI$fips=="24510",]
NEI3 <- group_by(NEI2,year)
emissions <- summarize(NEI3,total_emissions=sum(Emissions,na.rm=TRUE))
qplot(year,total_emissions,data=emissions,main="Motor Vehicle Emissions in Baltimore",method="lm",geom=c("point","smooth"))
