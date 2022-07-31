setwd('/Users/vasanthireddy/Desktop/AIT 580')
install.packages('ggplot2')
install.packages('ggcorrplot')
install.packages("readx1")
install.packages("wrtierx1")
install.packages("corrplot")
library(ggplot2)
library(ggcorrplot)
library(readx1)
library(corrplot)
nysd<- read.csv('NewYork_ShootingData.csv')
head(nysd)
summary(nysd)


plot(nysd$INCIDENT_KEY,nysd$OCCUR_YEAR,xlab = "INCIDENT",ylab = "YEAR",main="SHOOTING INCIDENT FREQUENCY IN EACH YEAR")

#4
hist(nysd$OCCUR_YEAR,xlab = "YEAR",ylab = "Number of Incidents",main="FREQUENCY OF SHOOTING INCIDENTS OCCURED EACH YEAR")

cor.test(nysd$OCCUR_HOUR,nysd$OCCUR_YEAR)

nd<-data.frame(nysd$OCCUR_HOUR,nysd$INCIDENT_KEY,nysd$OCCUR_YEAR,nysd$OCCUR_MONTH,nysd$OCCUR_DAY)
cor(nd)
plot(nd)
corrplot(cor(nd))
ggcorrplot(cor(nd),hc.order = TRUE)+ggtitle("PLOT OF CORRELATION")
ggplot(data = nysd,aes(x=BORO,y=OCCUR_YEAR))+geom_boxplot()+
ggtitle("BOX PLOT FOR BORO AND OCCUR YEAR OF SHOOTING DATA")

ggplot(data=nysd, aes(x =OCCUR_DAY, y = OCCUR_MONTH)) + geom_point()

ggplot(nysd) +
  geom_point(aes(x = OCCUR_MONTH, y= OCCUR_YEAR, color =STATISTICAL_MURDER_FLAG))+ggtitle("PLOT FOR OCCUR MONTH,OCCUR YEAR, AND STATISTICAL_MURDER_FLAG OF SHOOTING DATA")

             