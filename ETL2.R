##### clean the data
#### jan_2020
### open the data
library(readr)
library(dplyr)
jan_2020 = read.csv('Jan_2020_ontime.csv')
### skim the data
head(jan_2020,5)
### check any NAs
sapply(jan_2020,function(x)sum(is.na(x)))
### drop x 
jan_2020 = jan_2020[c(-22)]
### drop arr_del15, and dep_del15 with NAs
jan_2020= jan_2020[!is.na(jan_2020$ARR_DEL15), ]
sapply(jan_2020,function(x)sum(is.na(x))) ## drop了arr_del15 以后，发现所有的na都没有了
### add columns, year, month, dep_del_minutes, arrive_del_minutes 
jan_2020$year = '2020'
jan_2020$month = 'January'
jan_2020$dep_del_min  = ifelse(jan_2020$DEP_DEL15  == 1, 15, 0)
jan_2020$arr_del_min  = ifelse(jan_2020$ARR_DEL15  == 1, 15, 0)
### convert those numeric variables below into factor varibles
jan_2020$DEP_TIME = as.factor(jan_2020$DEP_TIME)
jan_2020$DEP_DEL15 = as.factor(jan_2020$DEP_DEL15)
jan_2020$ARR_TIME = as.factor(jan_2020$ARR_TIME)
jan_2020$ARR_DEL15 = as.factor(jan_2020$ARR_DEL15)
jan_2020$CANCELLED = as.factor(jan_2020$CANCELLED)
jan_2020$DIVERTED = as.factor(jan_2020$DIVERTED)
jan_2020$DISTANCE = as.factor(jan_2020$DISTANCE)

#### feb_2020
### open the data
feb_2020 = read.csv('Feb_2020_ontime.csv')
### skim the data
head(feb_2020,5)
### check any NAs
sapply(feb_2020,function(x)sum(is.na(x)))
### drop x 
feb_2020 = feb_2020[c(-22)]
### drop arr_del15, and dep_del15 with NAs
feb_2020= feb_2020[!is.na(feb_2020$ARR_DEL15), ]
sapply(feb_2020,function(x)sum(is.na(x))) ## drop了arr_del15 以后，发现所有的na都没有了
### add columns, year, month, dep_del_minutes, arrive_del_minutes 
feb_2020$year = '2020'
feb_2020$month = 'Feburary'
feb_2020$dep_del_min  = ifelse(feb_2020$DEP_DEL15  == 1, 15, 0)
feb_2020$arr_del_min  = ifelse(feb_2020$ARR_DEL15  == 1, 15, 0)
### convert those numeric variables below into factor varibles
feb_2020$DEP_TIME = as.factor(feb_2020$DEP_TIME)
feb_2020$DEP_DEL15 = as.factor(feb_2020$DEP_DEL15)
feb_2020$ARR_TIME = as.factor(feb_2020$ARR_TIME)
feb_2020$ARR_DEL15 = as.factor(feb_2020$ARR_DEL15)
feb_2020$CANCELLED = as.factor(feb_2020$CANCELLED)
feb_2020$DIVERTED = as.factor(feb_2020$DIVERTED)
feb_2020$DISTANCE = as.factor(feb_2020$DISTANCE)

#### jan_2019
### open the data
jan_2019 = read.csv('Jan_2019_ontime.csv')
### skim the data
head(jan_2019,5)
### check any NAs
sapply(jan_2019,function(x)sum(is.na(x)))
### drop x 
jan_2019 = jan_2019[c(-22)]
### drop arr_del15, and dep_del15 with NAs
jan_2019= jan_2019[!is.na(jan_2019$ARR_DEL15), ]
sapply(jan_2019,function(x)sum(is.na(x))) ## drop了arr_del15 
### add columns, year, month, dep_del_minutes, arrive_del_minutes 
jan_2019$year = '2019'
jan_2019$month = 'January'
jan_2019$dep_del_min  = ifelse(jan_2019$DEP_DEL15  == 1, 15, 0)
jan_2019$arr_del_min  = ifelse(jan_2019$ARR_DEL15  == 1, 15, 0)
### convert those numeric variables below into factor varibles
jan_2019$DEP_TIME = as.factor(jan_2019$DEP_TIME)
jan_2019$DEP_DEL15 = as.factor(jan_2019$DEP_DEL15)
jan_2019$ARR_TIME = as.factor(jan_2019$ARR_TIME)
jan_2019$ARR_DEL15 = as.factor(jan_2019$ARR_DEL15)
jan_2019$CANCELLED = as.factor(jan_2019$CANCELLED)
jan_2019$DIVERTED = as.factor(jan_2019$DIVERTED)
jan_2019$DISTANCE = as.factor(jan_2019$DISTANCE)

#### feb_2019
### open the data
feb_2019 = read.csv('Feb_2019_ontime.csv')
### skim the data
head(feb_2019,5)
### check any NAs
sapply(feb_2019,function(x)sum(is.na(x)))
### drop x 
feb_2019 = feb_2019[c(-22)]
### drop arr_del15, and dep_del15 with NAs
feb_2019= feb_2019[!is.na(feb_2019$ARR_DEL15), ]
sapply(feb_2019,function(x)sum(is.na(x))) ## drop了arr_del15 以后，发现所有的na都没有了
### add columns, year, month, dep_del_minutes, arrive_del_minutes 
feb_2019$year = '2019'
feb_2019$month = 'Feburary'
feb_2019$dep_del_min  = ifelse(feb_2019$DEP_DEL15  == 1, 15, 0)
feb_2019$arr_del_min  = ifelse(feb_2019$ARR_DEL15  == 1, 15, 0)
### convert those numeric variables below into factor varibles
feb_2019$DEP_TIME = as.factor(feb_2019$DEP_TIME)
feb_2019$DEP_DEL15 = as.factor(feb_2019$DEP_DEL15)
feb_2019$ARR_TIME = as.factor(feb_2019$ARR_TIME)
feb_2019$ARR_DEL15 = as.factor(feb_2019$ARR_DEL15)
feb_2019$CANCELLED = as.factor(feb_2019$CANCELLED)
feb_2019$DIVERTED = as.factor(feb_2019$DIVERTED)
feb_2019$DISTANCE = as.factor(feb_2019$DISTANCE)

#### flight_delay
### combine the four dataset 
flight_delay = rbind(feb_2019, feb_2020, jan_2019, jan_2020)
### add columns flight_id
flight_delay$flight_id = 1:nrow(flight_delay)
### convert any capital case columns into lower case columns 
flight_delay$day_of_month = flight_delay$DAY_OF_MONTH
flight_delay$day_of_week = flight_delay$DAY_OF_WEEK
flight_delay$op_unique_carrier = flight_delay$OP_UNIQUE_CARRIER
flight_delay$op_carrier_airline_id = flight_delay$OP_CARRIER_AIRLINE_ID
flight_delay$op_carrier = flight_delay$OP_CARRIER
flight_delay$tail_num = flight_delay$TAIL_NUM
flight_delay$op_carrier_fl_num = flight_delay$OP_CARRIER_FL_NUM
flight_delay$origin_airport_id = flight_delay$ORIGIN_AIRPORT_ID
flight_delay$origin_airport_seq_id = flight_delay$ORIGIN_AIRPORT_SEQ_ID
flight_delay$origin = flight_delay$ORIGIN
flight_delay$dest_airport_id = flight_delay$DEST_AIRPORT_ID
flight_delay$dest_airport_seq_id = flight_delay$DEST_AIRPORT_SEQ_ID
flight_delay$dest = flight_delay$DEST
flight_delay$dep_time = flight_delay$DEP_TIME
flight_delay$dep_del15 = flight_delay$DEP_DEL15
flight_delay$dep_time_blk = flight_delay$DEP_TIME_BLK
flight_delay$arr_time = flight_delay$ARR_TIME
flight_delay$arr_del15 = flight_delay$ARR_DEL15
flight_delay$cancelled = flight_delay$CANCELLED
flight_delay$diverted = flight_delay$DIVERTED
flight_delay$distance = flight_delay$DISTANCE
#create logical for two delay fields to help filtering for delay status table
flight_delay$delay <-ifelse(flight_delay$DEP_DEL15 == 1 | flight_delay$ARR_DEL15 ==1, 1, 0)
### drop any capital case column 
flight_delay = flight_delay[c(-(1:21))]
### save the dataset 
write.table(flight_delay, file = "clean_flight_delay.csv",
             row.names = F)
flight_delay$date_id = 0
# 119 unique date convert into date_id 
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 1 ] <- 1)

flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 2 ] <- 2)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 3 ] <- 3)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 4 ] <- 4)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 5 ] <- 5)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 6 ] <- 6)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 7 ] <- 7)

flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 8 ] <- 8)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 9 ] <- 9)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 10 ] <- 10)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 11 ] <- 11)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 12 ] <- 12)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 13 ] <- 13)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 14 ] <- 14)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 15 ] <- 15)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 16 ] <- 16)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 17 ] <- 17)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 18 ] <- 18)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 19 ] <- 19)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 20 ] <- 20)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 21 ] <- 21)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 22 ] <- 22)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 23 ] <- 23)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 24 ] <- 24)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 25 ] <- 25)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 26 ] <- 26)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 27 ] <- 27)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 28 ] <- 28)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 29 ] <- 29)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 30 ] <- 30)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 31 ] <- 31)

flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 1 ] <- 32)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 2 ] <- 33)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 3 ] <- 34)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 4 ] <- 35)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 5 ] <- 36)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 6 ] <- 37)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 7 ] <- 38)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 8 ] <- 39)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 9 ] <- 40)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 10 ] <- 41)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 11 ] <- 42)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 12 ] <- 43)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 13 ] <- 44)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 14 ] <- 45)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 15 ] <- 46)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 16 ] <- 47)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 17 ] <- 48)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 18 ] <- 49)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 19 ] <- 50)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 20 ] <- 51)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 21 ] <- 52)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 22 ] <- 53)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 23 ] <- 54)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 24 ] <- 55)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 25 ] <- 56)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 26 ] <- 57)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 27 ] <- 58)
flight_delay <- 
  within(flight_delay, date_id[year == '2019' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 28 ] <- 59)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 1 ] <- 60)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 2 ] <- 61)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 3 ] <- 62)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 4 ] <- 63)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 5 ] <- 64)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 6 ] <- 65)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 7 ] <- 66)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 8 ] <- 67)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 9 ] <- 68)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 10 ] <- 69)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 11 ] <- 70)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 12 ] <- 71)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 13 ] <- 72)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 14 ] <- 73)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 15 ] <- 74)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 16 ] <- 75)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 17 ] <- 76)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 18 ] <- 77)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 19 ] <- 78)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 20 ] <- 79)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 21 ] <- 80)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 22 ] <- 81)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 23] <- 82)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 24 ] <- 83)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 6 & day_of_month == 25 ] <- 84)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 7 & day_of_month == 26 ] <- 85)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 1 & day_of_month == 27 ] <- 86)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 2 & day_of_month == 28 ] <- 87)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 3 & day_of_month == 29 ] <- 88)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 4 & day_of_month == 30 ] <- 89)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'January' & 
                                 day_of_week == 5 & day_of_month == 31 ] <- 90)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 1 ] <- 91)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 2 ] <- 92)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 3 ] <- 93)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 4 ] <- 94)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 5 ] <- 95)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 6 ] <- 96)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 7 ] <- 97)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 8 ] <- 98)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 9 ] <- 99)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 10 ] <- 100)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 11 ] <- 101)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 12 ] <- 102)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 13 ] <- 103)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 14 ] <- 104)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 15 ] <- 105)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 16 ] <- 106)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 17 ] <- 107)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 18 ] <- 108)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 19 ] <- 109)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 20] <- 110)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 21 ] <- 111)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 22 ] <- 112)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 7 & day_of_month == 23 ] <- 113)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 1 & day_of_month == 24 ] <- 114)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 2 & day_of_month == 25 ] <- 115)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 3 & day_of_month == 26 ] <- 116)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 4 & day_of_month == 27 ] <- 117)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 5 & day_of_month == 28 ] <- 118)
flight_delay <- 
  within(flight_delay, date_id[year == '2020' & month == 'Feburary' & 
                                 day_of_week == 6 & day_of_month == 29 ] <- 119)
#create date table
date =  data.frame(unique(flight_delay[c('date_id','year', 'month', 'day_of_week', 'day_of_month')]))
#create destination table
destination = flight_delay[, c('dest_airport_id', 'dest')]
destination_df <- data.frame(unique(destination))
#create origin table
origin = flight_delay[, c('origin_airport_id', 'origin')]
origin_df = data.frame(unique(origin))
#create schedule change table
schedule_change_df = flight_delay[, c('flight_id', 'diverted', 'cancelled')]
#create schedule block table
schedule_block = flight_delay[, c("dep_time_blk")]
schedule_block_df = data.frame("dep_time_blk" = unique(schedule_block))
schedule_block_df$schedule_blk_id = 1:nrow(schedule_block_df)
schedule_block_df = schedule_block_df[,c(2,1)]
#create delay status table
delay_status = flight_delay[, c("flight_id", "dep_del15", "arr_del15","dep_del_min","arr_del_min")]
#create airline table
airline = flight_delay[,c("op_carrier_airline_id", "op_carrier")]
airline_df = data.frame(unique(airline))
#create plane table
plane = flight_delay[,c("op_carrier_airline_id", "tail_num")]
plane_unique = plane[!duplicated(plane$tail_num), ]
plane_df = data.frame(unique(plane_unique))
#create flight status table
flight_status_df = flight_delay[,c("flight_id","delay")]
block_id_list <- sapply(flight_delay$dep_time_blk, function(x) schedule_block_df$schedule_blk_id[schedule_block_df$dep_time_blk == x])
flight_status_df$schedule_blk_id = block_id_list
#create flight schedule table
flight_schedule = flight_delay[, c("flight_id", "tail_num", "origin_airport_id", "dep_time", "dest_airport_id", "arr_time", "distance", "date_id")]
#fix time for flight_schedule
library(stringr)
right = function(text, num_char) {
  substr(text, nchar(text) - (num_char-1), nchar(text))
}
x = as.character(flight_schedule$dep_time)
x = str_pad(x, 4, pad = "0")
flight_schedule$dep_time = gsub("(\\d\\d)(\\d\\d)", "\\1:\\2", x)
y = as.character(flight_schedule$arr_time)
y = str_pad(y, 4, pad = "0")
flight_schedule$arr_time = gsub("(\\d\\d)(\\d\\d)", "\\1:\\2", y)

######################################################################3

#Load the PostgreSQL driver:
library(RPostgreSQL)
drv <- dbDriver('PostgreSQL')

# list credentials here
hostname = 'group1.czl0pji2xj8f.us-east-2.rds.amazonaws.com'
username = 'postgres'
pwd = 'group100'
database = 'postgres'
con <- dbConnect(drv, dbname = database,
                 host = hostname, port = 5432,
                 user = username, password = pwd)



## insert the data 
dbWriteTable(con, name="origin", value=origin_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="destination", value=destination_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="date", value=date , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="airline", value=airline_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="plane", value=plane_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="schedule_block", value=schedule_block_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="flight_schedule", value=flight_schedule , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="schedule_change", value=schedule_change_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="flight_status", value=flight_status_df , row.names=FALSE, append=TRUE)
dbWriteTable(con, name="delay_status", value=delay_status , row.names=FALSE, append=TRUE)

dbDisconnect(con)
closeAllConnections()
