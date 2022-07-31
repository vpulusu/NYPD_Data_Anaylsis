setwd('/Users/vasanthireddy/Desktop/AIT 580')
library(lubridate)
library(chron)
library(readr)

# Reading and displaying the data file
NYdata <- read.csv('NYPD_Shooting_Incident_Data__Historic_.csv')
NYdata
is.na(NYdata)

#Deleting the unwanted columns from the dataset which are not used for data
NYdata <- NYdata[,!(names(NYdata) %in% c("PRECINCT","JURISDICTION_CODE","LOCATION_DESC","PERP_AGE_GROUP","PERP_SEX","PERP_RACE","X_COORD_CD","Y_COORD_CD","Latitude","Longitude","Lon_Lat"))]
is.na(NYdata)

#Creating new Column occur_hour which is exctracted the column OCCUR_TIME
class(NYdata$OCCUR_TIME)
NYdata$OCCUR_TIME <- format(strptime(NYdata$OCCUR_TIME,"%H:%M:%S",tz=""),format = "%H:%M")
NYdata$OCCUR_HOUR<-strptime(NYdata$OCCUR_TIME,format="%H:%M")
NYdata$OCCUR_HOUR<-hour((NYdata$OCCUR_HOUR))
NYdata$OCCUR_HOUR<-as.integer(NYdata$OCCUR_HOUR)
NYdata$STATISTICAL_MURDER_FLAG <- as.character(NYdata$STATISTICAL_MURDER_FLAG)

#Creating new columns OCCUR_DATE,OCCUR_MONTH,OCCUR_YEAR which are extracted from the column OCCUR_DATE
class(NYdata$OCCUR_DATE)
NYdata$OCCUR_DATE <- as.Date(NYdata$OCCUR_DATE, format="%m/%d/%y")
NYdata$OCCUR_YEAR <- year(ymd(NYdata$OCCUR_DATE))
NYdata$OCCUR_YEAR <- as.integer(NYdata$OCCUR_YEAR)
NYdata$OCCUR_MONTH <- month(ymd(NYdata$OCCUR_DATE))
NYdata$OCCUR_MONTH <- as.integer(NYdata$OCCUR_MONTH)
NYdata$OCCUR_DAY <- day(ymd(NYdata$OCCUR_DATE))
NYdata$OCCUR_DAY <- as.integer(NYdata$OCCUR_DAY)
#Converting the Dataframe into csv file and saving in required directory 
write.csv(NYdata,"/Users/vasanthireddy/Desktop/AIT 580/NewYork_ShootingData.csv", row.names = FALSE)



