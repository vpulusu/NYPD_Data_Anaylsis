SELECT * FROM ait.nydp;
select distinct BORO from ait.nydp 
 group by BORO
 order by count(BORO);
select BORO,COUNT(INCIDENT_KEY) from ait.nydp
 GROUP BY BORO;
select COUNT(INCIDENT_KEY),VIC_RACE FROM ait.nydp
 group by VIC_RACE;
SELECT * FROM ait.nydp 
 order by OCCUR_HOUR;
SELECT *from ait.nydp
where OCCUR_YEAR=2006;
SELECT BORO,INCIDENT_KEY,STATISTICAL_MURDER_FLAG,VIC_AGE_GROUP FROM ait.nydp
where VIC_RACE='WHITE HISPANIC';


 

