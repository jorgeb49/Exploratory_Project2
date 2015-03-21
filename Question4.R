library(dplyr)
library(ggplot2)

setwd('./DSciencesCoursera/04_ExploratoryDataAnalysis/Week3')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC2<- SCC[grepl('Comb', SCC[,3]) & grepl("Coal",SCC[,3]),1]
head(NEI)
NEI2 <- filter(NEI,is.element(NEI$SCC,SCC2))
NEI3 <- group_by(NEI2,year)
emissions <- summarize(NEI3,total_emissions=sum(Emissions,na.rm=TRUE))
qplot(year,total_emissions,data=emissions,main="Coal Combustion in US",method="lm",geom=c("point","smooth"))
