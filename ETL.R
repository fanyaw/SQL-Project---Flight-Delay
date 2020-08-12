##### clean the data
#### jan_2020
### open the data
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
jan_2020$dep_del_min= NA
jan_2020$arr_del_min= NA
### convert those numeric variables below into factor varibles
jan_2020$DEP_TIME = as.factor(jan_2020$DEP_TIME)
jan_2020$DEP_DEL15 = as.factor(jan_2020$DEP_DEL15)
jan_2020$ARR_TIME = as.factor(jan_2020$ARR_TIME)
jan_2020$ARR_DEL15 = as.factor(jan_2020$ARR_DEL15)
jan_2020$CANCELLED = as.factor(jan_2020$CANCELLED)
jan_2020$DIVERTED = as.factor(jan_2020$DIVERTED)
jan_2020$DISTANCE = as.factor(jan_2020$DISTANCE)
### save the dataset
write.table(jan_2020, file = "clean_jan_2020.csv",
            sep = "\t", row.names = F)

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
feb_2020$dep_del_min= NA
feb_2020$arr_del_min= NA
### convert those numeric variables below into factor varibles
feb_2020$DEP_TIME = as.factor(feb_2020$DEP_TIME)
feb_2020$DEP_DEL15 = as.factor(feb_2020$DEP_DEL15)
feb_2020$ARR_TIME = as.factor(feb_2020$ARR_TIME)
feb_2020$ARR_DEL15 = as.factor(feb_2020$ARR_DEL15)
feb_2020$CANCELLED = as.factor(feb_2020$CANCELLED)
feb_2020$DIVERTED = as.factor(feb_2020$DIVERTED)
feb_2020$DISTANCE = as.factor(feb_2020$DISTANCE)
### save the dataset
write.table(feb_2020, file = "clean_feb_2020.csv",
            sep = "\t", row.names = F)


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
sapply(jan_2019,function(x)sum(is.na(x))) ## drop了arr_del15 以后，发现所有的na都没有了
### add columns, year, month, dep_del_minutes, arrive_del_minutes 
jan_2019$year = '2019'
jan_2019$month = 'January'
jan_2019$dep_del_min= NA
jan_2019$arr_del_min= NA
### convert those numeric variables below into factor varibles
jan_2019$DEP_TIME = as.factor(jan_2019$DEP_TIME)
jan_2019$DEP_DEL15 = as.factor(jan_2019$DEP_DEL15)
jan_2019$ARR_TIME = as.factor(jan_2019$ARR_TIME)
jan_2019$ARR_DEL15 = as.factor(jan_2019$ARR_DEL15)
jan_2019$CANCELLED = as.factor(jan_2019$CANCELLED)
jan_2019$DIVERTED = as.factor(jan_2019$DIVERTED)
jan_2019$DISTANCE = as.factor(jan_2019$DISTANCE)
### save the dataset
write.table(jan_2019, file = "clean_jan_2019.csv",
            sep = "\t", row.names = F)


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
feb_2019$dep_del_min= NA
feb_2019$arr_del_min= NA
### convert those numeric variables below into factor varibles
feb_2019$DEP_TIME = as.factor(feb_2019$DEP_TIME)
feb_2019$DEP_DEL15 = as.factor(feb_2019$DEP_DEL15)
feb_2019$ARR_TIME = as.factor(feb_2019$ARR_TIME)
feb_2019$ARR_DEL15 = as.factor(feb_2019$ARR_DEL15)
feb_2019$CANCELLED = as.factor(feb_2019$CANCELLED)
feb_2019$DIVERTED = as.factor(feb_2019$DIVERTED)
feb_2019$DISTANCE = as.factor(feb_2019$DISTANCE)
### save the dataset
write.table(feb_2019, file = "clean_feb_2019.csv",
            sep = "\t", row.names = F)


#### flight_delay
### combine the four dataset 
flight_delay = rbind(jan_2019, feb_2019, jan_2020, feb_2020)
### add columns flight_id, and date_id 
## add the columns flight_id
flight_delay$flight_id = 1:nrow(flight_delay)
## add the columns date_id
# set all date_id equal to 0
flight_delay$date_id = 0
# find all unique date (year, month, day of month, day of week)
date=  data.frame('date_id' = unique(flight_delay[c('year', 'month', 'day_of_week', 'day_of_month')]))
write.table(date, file = "date",
            sep = "\t", row.names = F)
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

### drop any capital case column 
flight_delay = flight_delay[c(-(1:21))]

### convert values of arr_delay_min and dep_delay_min 
## convert NA to 0 first 
flight_delay$arr_del_min[is.na(flight_delay$arr_del_min)] <- 0
flight_delay$dep_del_min[is.na(flight_delay$dep_del_min)] <- 0
## covert some of 0 to 15 when arr_del15 / dep_del15= 1 
flight_delay <- within(flight_delay, arr_del_min[arr_del_min == 0 & arr_del15 == 1] <- 15)
flight_delay <- within(flight_delay, dep_del_min[dep_del_min == 0 & dep_del15 == 1] <- 15)

### add a column named delay 
# set the delay column equal 0
flight_delay$delay = 0
# set the delay column equal 1 when dep_del15 or arr_del15 =1 
flight_delay <- within(flight_delay, delay[dep_del15 == 1|arr_del15 == 1] <- 1)

## add a new column named schedule_blk_id 
schedule_blk <- data.frame('dep_time_blk' = unique(flight_delay$dep_time_blk))
schedule_blk$schedule_blk_id = 1:nrow(schedule_blk)
head(schedule_blk,20)
# add the column back to the main dataset 
schedule_blk_id_list <- sapply(flight_delay$dep_time_blk, function(x) schedule_blk$schedule_blk_id[schedule_blk$dep_time_blk == x])
flight_delay$schedule_blk_id <- schedule_blk_id_list

######################################## save the dataset 
write.table(flight_delay, file = "clean_flight_delay.csv",
            sep = "\t", row.names = F)


###########################################################################################################################
##### connect to mySQL
library(odbc)
library(DBI)
db <- 'project'  #provide the name of your db
host_db <- 'localhost' #i.e. # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'  
db_port <- '5432'  # or any other port specified by the DBA
db_user <- 'postgres'  
db_password <- '123'
con <- dbConnect(RPostgres::Postgres(), dbname = db, host=host_db, port=db_port, user=db_user, password=db_password)
##### load the data into table 

### table origin 
## create a table name origin
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE origin(
  origin_airport_id varchar(50) NOT NULL,
  origin varchar(50),
  PRIMARY KEY(origin_airport_id)
  )'
)
## set up table 
origin = flight_delay[c('origin_airport_id', 'origin')]
## clean duplicated 
duplicated(origin)
origin_unique= origin[!duplicated(origin$origin_airport_id), ]
origin_unique$origin_airport_id = as.factor(origin_unique$origin_airport_id)
summary(origin_unique$origin_airport_id)
## insert the data 
dbWriteTable(con, name="origin", value=origin_unique , row.names=FALSE, append=TRUE)

### table dest 
## create a table named dest 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE dest (
  dest_airport_id varchar(50) NOT NULL,
  dest varchar(50),
  PRIMARY KEY(dest_airport_id)
  )'
)
# set up the table 
dest = flight_delay[c('dest_airport_id', 'dest')]
# clean the duplicated value 
duplicated(dest)
dest_unique= dest[!duplicated(dest$dest_airport_id), ]
# insert data 
dbWriteTable(con, name="dest", value=dest_unique , row.names=FALSE, append=TRUE)

### table date 
## create a table named date 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE date (
  date_id varchar(50) NOT NULL,
  year varchar(50),
  month varchar(50),
  day_of_month varchar(50),
  day_of_week varchar(50),
  PRIMARY KEY(date_id)
  )'
)
## set up table
date = flight_delay[c('date_id', 'year', 'month', 'day_of_month', 
                      'day_of_week')]
## clean the duplicated 
date_unique = date[!duplicated(date$date_id), ]
## insert data
dbWriteTable(con, name="date", value=date_unique , row.names=FALSE, append=TRUE)

### table airline 
## create a table named airline 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE airline (
  op_carrier_airline_id varchar(50) NOT NULL,
  op_unique_carrier varchar(50),
  PRIMARY KEY(op_carrier_airline_id)
  )'
)
## set up table 
airline = flight_delay[c('op_carrier_airline_id', 'op_unique_carrier')]
## clean the duplicated 
airline_unique = airline[!duplicated(airline$op_carrier_airline_id), ]
## insert data 
dbWriteTable(con, name="airline", value=airline_unique , row.names=FALSE, append=TRUE)

### table plane 
## create a table named plane 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE plane (
  tail_num varchar(50) NOT NULL,
  op_carrier_airline_id varchar(50),
  PRIMARY KEY(tail_num),
  FOREIGN KEY(op_carrier_airline_id) REFERENCES airline(op_carrier_airline_id)
  )'
)
## set up table 
plane = flight_delay[c('tail_num', 'op_carrier_airline_id')]
## clean the duplicated 
plane_unique = plane[!duplicated(plane$tail_num), ]
## insert the data
dbWriteTable(con, name="plane", value=plane_unique , row.names=FALSE, append=TRUE)

### table schedule_blk 
## set up the table 
schedule_blk = flight_delay[c('schedule_blk_id', 'dep_time_blk')]
## clean the duplicated 
schedule_blk_unique = schedule_blk[!duplicated(schedule_blk$schedule_blk_id), ]
## create the table 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE schedule_blk (
  schedule_blk_id varchar(50) NOT NULL,
  dep_time_blk varchar(50),
  PRIMARY KEY(schedule_blk_id)
  )'
)
## insert the data
dbWriteTable(con, name="schedule_blk", value=schedule_blk_unique , row.names=FALSE, append=TRUE)

### table flight_schedule 
## create the table 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE flight_schedule (
  flight_id varchar(50) NOT NULL,
  tail_num varchar(50),
  origin_airport_id varchar(50),
  dep_time varchar(50),
  dest_airport_id varchar(50),
  arr_time varchar(50),
  distance varchar(50),
  date_id varchar(50),
  PRIMARY KEY(flight_id),
  FOREIGN KEY(tail_num) REFERENCES plane(tail_num),
  FOREIGN KEY(origin_airport_id) REFERENCES origin(origin_airport_id),
  FOREIGN KEY(dest_airport_id) REFERENCES dest(dest_airport_id),
  FOREIGN KEY(date_id) REFERENCES date(date_id)
  )'
)
## set up the table 
flight_schedule = flight_delay[c('flight_id', 'tail_num', 'origin_airport_id', 'dep_time', 
                             'dest_airport_id', 'arr_time', 'distance', 'date_id')]
## insert the data 
dbWriteTable(con, name="flight_schedule", value=flight_schedule , row.names=FALSE, append=TRUE)

### table schedule_change 
## create the table 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE schedule_change (
  flight_id varchar(50) NOT NULL,
  diverted varchar(50),
  cancelled varchar(50),
  PRIMARY KEY(flight_id, diverted, cancelled),
  FOREIGN KEY(flight_id) REFERENCES flight_schedule(flight_id)
  )'
)
## set up table 
schedule_change= flight_delay[c('flight_id', 'diverted', 'cancelled')]
## insert data 
dbWriteTable(con, name="schedule_change", value=schedule_change , row.names=FALSE, append=TRUE)

### table flight_status
## set up the table 
flight_status = flight_delay[c('flight_id', 'schedule_blk_id', 'delay')]
## create table 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE flight_status (
  flight_id varchar(50) NOT NULL,
  schedule_blk_id varchar(50),
  delay varchar(50),
  PRIMARY KEY(flight_id, schedule_blk_id, delay),
  FOREIGN KEY(flight_id) REFERENCES flight_schedule(flight_id),
  FOREIGN KEY(schedule_blk_id) REFERENCES schedule_blk(schedule_blk_id)
  )'
)
## insert the data 
dbWriteTable(con, name="flight_status", value=flight_status , row.names=FALSE, append=TRUE)

### table delay_status 
## create the table 
library(dplyr)
library(dbplyr)
dbGetQuery(con, 
  'CREATE TABLE delay_status (
  flight_id varchar(50) NOT NULL,
  dep_del15 varchar(50),
  arr_del15 varchar(50),
  dep_del_min varchar(50),
  arr_del_min varchar(50),
  PRIMARY KEY(flight_id, dep_del15, arr_del15, dep_del_min, arr_del_min),
  FOREIGN KEY(flight_id) REFERENCES flight_schedule(flight_id)
  )'
)
## set up the table 
delay_status = flight_delay[c('flight_id', 'dep_del15', 'arr_del15',
                              'dep_del_min', 'arr_del_min')]
## insert the data
dbWriteTable(con, name="delay_status", value=delay_status , row.names=FALSE, append=TRUE)


