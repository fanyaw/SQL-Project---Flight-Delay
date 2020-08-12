##### 10 analysis
#### Establish connection 
library(odbc)
library(DBI)
db <- 'project'  #provide the name of your db
host_db <- 'localhost' #i.e. # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'  
db_port <- '5432'  # or any other port specified by the DBA
db_user <- 'postgres'  
db_password <- '123'
con <- dbConnect(RPostgres::Postgres(), dbname = db, host=host_db, port=db_port, user=db_user, password=db_password)  
### Check whether the connection is established 
dbListTables(con)


#### procedure1 
#### which carriers are the worst in terms of arriving or departing on time? 
#### num of arr_delay & dep_delay for carrier
### arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, op_unique_carrier
  FROM delay_status, flight_schedule, plane, airline 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND arr_del15= '1'
  GROUP BY op_unique_carrier 
  ORDER BY num_delay DESC
  "
)
#### WN, AA, OO, DL, and UA are the worst 5 carriers in terms of arriving on time. 

### dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, op_unique_carrier
  FROM delay_status, flight_schedule, plane, airline 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND dep_del15= '1'
  GROUP BY op_unique_carrier 
  ORDER BY num_delay DESC
  "
)
#### WN, AA, OO, DL, and UA are the worst 5 carriers in terms of departing on time. And WN is the worst of worst. 

#### Procedure2
#### which airports, as origin or destination, are the worst in terms of arriving or departing on time? 
#### num of arr_delay & dep_delay for origin and dest 
### origin
## arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, origin 
  FROM delay_status, flight_schedule, origin 
  WHERE delay_status.flight_id = flight_schedule.flight_id  AND flight_schedule.origin_airport_id = origin.origin_airport_id AND arr_del15 = '1'
  GROUP BY origin 
  ORDER BY num_delay DESC
 "
)
#### ORD, DFW, ATL, CLT, and DEN are the worst 5 origin airports in terms of arriving on time. And ORD is the worst of worst.

## dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, origin 
  FROM delay_status, flight_schedule, origin 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND flight_schedule.origin_airport_id = origin.origin_airport_id AND dep_del15 = '1'
  GROUP BY origin 
  ORDER BY num_delay DESC
  "
)
#### ORD, ATL, DFW, DEN, CLT are the worst 5 origin airports in terms of departing on time.

### dest
## arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, dest 
  FROM delay_status, flight_schedule, dest 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND flight_schedule.dest_airport_id = dest.dest_airport_id AND arr_del15 = '1'
  GROUP BY dest 
  ORDER BY num_delay DESC
  "
)
#### ORD, DFW, ATL, CLT and LGA are the worst 5 destination airports in terms of arriving on time.

## dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, dest 
  FROM delay_status, flight_schedule, dest 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND flight_schedule.dest_airport_id = dest.dest_airport_id AND dep_del15 = '1'
  GROUP BY dest 
  ORDER BY num_delay DESC
  "
)
#### ORD, ATL, DFW, CLT and LGA are the worst 5 destination airports in terms of departing on time.

#### Procedure#3 
#### what is the situation of delay in each year?
#### total number of arr_delay & dep_delay for year 
### arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, year 
  FROM flight_schedule, date, delay_status 
  WHERE flight_schedule.date_id = date.date_id AND delay_status.flight_id = flight_schedule.flight_id AND arr_del15 = '1'
  GROUP BY year
  ORDER BY num_delay DESC
  "
)
#### compared to the number of arrival delay in 2019, to the number of arrival delay in 2020 declined significantly. 

### dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, year 
  FROM flight_schedule, date, delay_status 
  WHERE flight_schedule.date_id = date.date_id AND delay_status.flight_id = flight_schedule.flight_id AND dep_del15 = '1'
  GROUP BY year
  ORDER BY num_delay DESC
  "
)
#### compared to the number of departure delay in 2019, to the number of departure delay in 2020 declined significantly. 

#### Procedure#4 
#### what is the situation of delay in each month?
#### total number of delay for month 
### 2019
## arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, month 
  FROM flight_schedule, date, delay_status 
  WHERE flight_schedule.date_id = date.date_id AND delay_status.flight_id = flight_schedule.flight_id AND arr_del15 = '1' AND year = '2019'
  GROUP BY month
  ORDER BY num_delay DESC
  "
)
#### in the year of 2019, the number of arrival delay in Feburary is 14,000 more than that in Januaray. 

## dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, month 
  FROM flight_schedule, date, delay_status 
  WHERE flight_schedule.date_id = date.date_id AND delay_status.flight_id = flight_schedule.flight_id AND dep_del15 = '1' AND year = '2019'
  GROUP BY month
  ORDER BY num_delay DESC
  "
)
#### in the year of 2019, the number of departure delay in Feburary is 20,000 more than that in Januaray. 

### 2020
## arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, month 
  FROM flight_schedule, date, delay_status 
  WHERE flight_schedule.date_id = date.date_id AND delay_status.flight_id = flight_schedule.flight_id AND arr_del15 = '1' AND year = '2020'
  GROUP BY month
  ORDER BY num_delay DESC
  "
)
#### in the year of 2020, the number of arrival delay in Feburary is the roughly same as that in Januaray. 

## dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, month 
  FROM flight_schedule, date, delay_status 
  WHERE flight_schedule.date_id = date.date_id AND delay_status.flight_id = flight_schedule.flight_id AND dep_del15 = '1' AND year = '2020'
  GROUP BY month
  ORDER BY num_delay DESC
  "
)
#### in the year of 2020, the number of departure delay in Feburary is the roughly same as that in Januaray. 

#### Procedure#5 
#### WN carrier has the worst performance of on-time, so which airports and which planes contributed most?
#### carrier WN
### origin 
## arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, origin  
  FROM flight_schedule, origin, airline, delay_status, plane 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND arr_del15 = '1' AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND op_unique_carrier = 'WN' AND flight_schedule.origin_airport_id = origin.origin_airport_id
  GROUP BY origin
  ORDER BY num_delay DESC
  "
)
#### MDW, DEN, LAS, BWI and DAL as origins contributed most in terms of arrival delay. 

## dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, origin  
  FROM flight_schedule, origin, airline, delay_status, plane 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND dep_del15 = '1' AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND op_unique_carrier = 'WN' AND flight_schedule.origin_airport_id = origin.origin_airport_id
  GROUP BY origin
  ORDER BY num_delay DESC
  "
)
#### MDW, DEN, LAS, BWI and DAL as origins contributed most in terms of departure delay. 

### dest 
## arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, dest
  FROM flight_schedule, dest, airline, delay_status, plane 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND arr_del15 = '1' AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND op_unique_carrier = 'WN' AND flight_schedule.dest_airport_id = dest.dest_airport_id
  GROUP BY dest
  ORDER BY num_delay DESC
  "
)
#### DEN, DAL, MDW, LAS and PHX as origins contributed most in terms of arrival delay.

## dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, dest
  FROM flight_schedule, dest, airline, delay_status, plane 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND dep_del15 = '1' AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND op_unique_carrier = 'WN' AND flight_schedule.dest_airport_id = dest.dest_airport_id
  GROUP BY dest
  ORDER BY num_delay DESC
  "
)
#### DEN, DAL, MDW, LAS and PHX as origins contributed most in terms of departure delay.

### tail_num (plane)
## arr_delay
dbGetQuery(con,
  "SELECT  DISTINCT flight_schedule.tail_num, COUNT(arr_del15) AS num_delay
  FROM flight_schedule, delay_status,plane, airline 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND arr_del15 = '1' AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND op_unique_carrier = 'WN' 
  GROUP BY flight_schedule.tail_num
  ORDER BY num_delay DESC
  "
)
#### planes N731SA, N914WN, N751SW, N782SA and N937WN contributed most in terms of arrival delay.

## dep_delay
dbGetQuery(con,
  "SELECT  DISTINCT flight_schedule.tail_num, COUNT(dep_del15) AS num_delay
  FROM flight_schedule, delay_status,plane, airline 
  WHERE delay_status.flight_id = flight_schedule.flight_id AND dep_del15 = '1' AND plane.tail_num = flight_schedule.tail_num AND airline.op_carrier_airline_id = plane.op_carrier_airline_id AND op_unique_carrier = 'WN' 
  GROUP BY flight_schedule.tail_num
  ORDER BY num_delay DESC
  "
)
#### planes N731SA, N704SW, N441WN, N782SA and N920WN contributed most in terms of departure delay.

#### procedure6
#### create the plot of distance
### create a view named distance 
dbGetQuery(con,
  "CREATE VIEW distance AS 
  SELECT distance 
  FROM arr_delay
  "
)
### create a view named arr_delay 
dbGetQuery(con,
   "CREATE VIEW arr_delay AS
   SELECT count(arr_del15) AS num_delay, distance
   FROM flight_schedule, delay_status 
   WHERE flight_schedule.flight_id = delay_status.flight_id 
   GROUP BY distance
  "
)
### create a view named dep_delay 
dbGetQuery(con,
  "CREATE VIEW dep_delay AS
   SELECT count(dep_del15) AS num_delay
   FROM flight_schedule, delay_status 
   WHERE flight_schedule.flight_id = delay_status.flight_id 
   GROUP BY distance
  "
)

### change the class of num_delay, num_delay.1
class(df$distance)
df$distance = as.integer(df$distance)
class(df$num_delay)
df$num_delay = as.integer(df$num_delay)
class(df$num_delay.1)
df$num_delay.1 = as.integer(df$num_delay.1)
### draw the time-series plot of distance
distance= dbGetQuery(con,
                       'SELECT * FROM distance'
)

arr_delay= dbGetQuery(con,
                      'SELECT num_delay FROM arr_delay'
)

dep_delay= dbGetQuery(con, 
                         'SELECT * FROM dep_delay'
)
df = data.frame(distance, arr_delay, dep_delay)

library(ggplot2)
ggplot(aes(x=distance,y=num_delay),data=df)+
  geom_line( lineend = "butt",
             linejoin = "round",
             linemitre = 10)
library(ggplot2)
ggplot(aes(x=distance,y=num_delay.1),data=df)+
  geom_line( lineend = "butt",
             linejoin = "round",
             linemitre = 10)
#### departure delay and arrival deplay share the pattern. From 0 to around 300, the number of delay increaes sharply and peaks at 300.
#### From around 300 to 2000, the number of delay decline sharply and reaches another peak at around 2500.
#### From 2500 to over 5000, the number of delay decreases sharly. 

#### Procedure #7 
#### Which pairs of origin and dest are worst in term of on-time?
#### pair of origin and dest 
### arr_delay
dbGetQuery(con,
  "SELECT COUNT(arr_del15) AS num_delay, origin, dest 
  FROM flight_schedule, delay_status, origin, dest 
  WHERE flight_schedule.flight_id = delay_status.flight_id AND arr_del15 = '1' AND flight_schedule.dest_airport_id = dest.dest_airport_id AND flight_schedule.origin_airport_id = origin.origin_airport_id
  GROUP BY origin, dest 
  ORDER BY num_delay DESC
  "
)
#### ORD-LGA, LGA-ORD, LAX-SFO and SFO-LAX are worst 4 in terms of arrival delay. 

### dep_delay
dbGetQuery(con,
  "SELECT COUNT(dep_del15) AS num_delay, origin, dest 
  FROM flight_schedule, delay_status, origin, dest 
  WHERE flight_schedule.flight_id = delay_status.flight_id AND dep_del15 = '1' AND flight_schedule.dest_airport_id = dest.dest_airport_id AND flight_schedule.origin_airport_id = origin.origin_airport_id
  GROUP BY origin, dest 
  ORDER BY num_delay DESC
  "
)
#### ORD-LGA, LGA-ORD, LAX-SFO and SFO-LAX are worst 4 in terms of departure delay. 



