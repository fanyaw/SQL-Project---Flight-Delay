PROBLEM STATEMENT
Since the coronavirus flared up worldwide, the airline industry has been on the verge of collapse. Airlines are now bleeding money and dropping more airports than expected. Major airlines, such as Delta and JetBlue, are losing $350 million to $400 million per day as expenses like payroll and maintenance far exceed money earned. By April 2020, passenger traffic was down 96%, and half of the airplanes were parked at major airports. Thus, the airline industry drew our attention.
Even with the reduction in air traffic from the global pandemic, flight delay is still a common issue in the airline industry. According to the FAA, one out of three flights was delayed in 2019. Delay is not only a significant strain on the US air transportation system; it also directly damages the US airline industry and indirectly hurts the US economy. The $16.7 billion passengers’ compensation is based on passengers’ time lost due to delayed flights, flights cancellation, and missed connections. More people avoid air travel as a result of delays resulting in a $2.2 billion loss in demand. To make matters worse, insufficiency in airline transportation increases the cost of running business. There is an estimate that airline delays reduced US GDP at least by $30 billion.
 We, a group of analysts, are hired by United States Air Traffic Control (ATC) to ease the congestion. Since 2012, delays caused by ATC have spiked by 69%. ATC wants to figure out which origin airports and destination airports have abnormal rates of delay, and which days of week and which days of month have abnormal rates of delay. Based on that, ATC can adjust flight schedules on certain days and at certain airports. Because air traffic changes from month to month, ATC wants to monitor delays on a monthly basis.
 
PROPOSAL
 	Our goal is to help airlines reduce occurrences of delays and to benefit consumers by minimizing travel time lost. In the datasets we chose, there is information regarding carriers, flight dates, origin airports, destination airports, the departure time, and the arrival time. Through diagnosing which dates more frequently trigger delays, consumers can reduce those dates for air travel and airports can manipulate air traffic on those dates. We will assess which airlines have the highest rate of delay, so consumers are aware of poor air travel experiences within their preferred carrier. We will evaluate which airports have disproportionate rates of delay so we can help the airport improve air traffic. Our ultimate goal is establishing the dashboard to monitor delays of each airport. 
. 
In addition to improving ATC’s performance, there are other potential benefits. First, new airports infrastructure may be boosted. According to the FAA, building new runways results in the largest increase in capacity. If ATC believes that under the current capacity, the adjustment does not decrease the delay rate significantly, ATC will prompt new airport runways, which are currently built in New York, Boston and Chicago. Second, the airspace redesign is critical to realize the full benefits of new runways. According to the FAA, revamping airspace reduces delays by at least 200,000 hours. If new runway and airspace revamp are fully implemented, the delay rate will decline sharply.
There are four datasets culminating in 2.2 million observations. Each row is a single flight and stores flight identity information, airports, airlines, and scheduling. Combining the four datasets and breaking them up into a relational database will provide ease in maintenance of the tables as airlines enter and exit the market due to bankruptcy or launch.  Views can be created based on routine reports that need to be delivered to executives in both the private airlines and ATC. The database can also be hooked up to a statistical application for data engineers and scientists to explore predictive modeling that can predict or identify possible areas for improvement. These results can be applied to ATC staffing or for the private airlines to diagnose delays.
 
TEAM STRUCTURE AND TIMELINE
The team is comprised of four individuals. While individuals may contribute to individual tasks, all tasks are validated as a team. Cheng and Bridget drafted the Project Proposal. Cheng provided a draft of how the various elements could be broken out. Both Cheng and Bridget extrapolated normalization strategies and drew out ER Diagrams. The team workshopped to come up with the finalized ER Diagram and normalization.  With the ER Diagram as a guide, Fanya wrote the SQL code to create the tables in the database. Once created, Cheng cleaned the dataset and performed ETL. Bridget performed additional ETL to successfully load the data into the database. Luna outlined the ETL process and created the customer interaction plan for C-suite executives and analysts.  Fanya and Cheng created Dashboards and ran statistical models to address key questions in the proposal. Bridget synthesized the final report from checkpoints and drafted report details that were not covered in the checkpoints. Luna created the presentation deck. 
 
DATABASE SCHEMA
The dataset originated with 21 attributes. There were three themes within the dataset: time, location, and plane. The dataset in its entirety was very redundant. Each row in the dataset required all its attributes to be able to differentiate it from other rows. Thus, the actual “flight” entity was comprised of multiple attributes to make it a unique instance. For every tuple in the flight table, there is a many-to-one relationship. For example, a plane and a schedule block can have many flights but there is one plane and schedule block per flight. 



We clearly identified that there were 9 groups of attributes that could be separate tables. We found that not all of the information in each tuple needs to be accessed at the same time. We created two tables for location-based attributes which are called Origin and Destination. A flight is required to have both of these fields. As such, they are non-nullable.  An airline carrier has many planes (tail numbers) but each plane has one carrier. Tail numbers must be unique per FAA requirements. Each airline carrier has a one-to-one relationship with an assigned carrier ID. We split these three attributes into two tables to eliminate transitive dependencies. 
The time attributes also contained transitive dependencies: the day of the week that a day of the month falls depends on the year and month. Hence, date has its own table. We maintained the schedule block and the actual time of departure and arrival. This is because the schedule block is used to assign flights to a time ranger whereas the actual times of the flights relay the status of the flight (whether it was delayed or on time). These attributes collectively are used to survey what schedule blocks have the most planes at any given time. It is important to note that schedule blocks are exclusive categorical variables. As such, they passed first normal form without further decomposition. 
Finally, we created tables that supported the flight schedules. Separating them out into tables was important for analysis and performance. The purpose of the delay column (also newly introduced) was to break the dependency of needing to query for dep_del15 and dep_arr_15 in the same table. In this design, if an analyst wants to know which flights were delayed in any case, they can query the flight_status table only. If they want to analyze further into the delay specifics, they can query the delay_status table. 
The final result is the following 10 tables:

origin (*origin_airport_id*, origin)


dest (*dest_airport_id*, dest)


date (*date_id*, year, month, day_of_month, day_of_week)



airline (*op_carrier_airline_id*, op_unique_carrier)


plane (*tail_num*, op_carrier_airline_id)


schedule_blk (*schedule_blk_id*, dep_time_blk)


flight_schedule (*flight_id*, tail_num, origin_airport_id, dep_time, dest_airport_id, arr_time, distance, date_id)



schedule_change (*flight_id *, *diverted*, *cancelled*)


flight_status (*flight_id*, *schedule_blk_id*, *delay*)


delay_status (*flight_id*, *dep_del15*, *arr_del15*, *dep_del_min*, *arr_del_min*)


The ETL process was by far the most difficult. For ETL, we used R to read all of our four datasets: Jan_2020_ontime.csv, Feb_2020_ontime.csv, Jan_2019_ontime.csv, and Feb_2019_ontime.csv. Then we used the head() function to look at the first few lines of the data, checked for NAs in each dataset, dropped the last unnamed column (contains only null values), and dropped all records containing NAs in arr_del15 and dep_del15 columns.
 Next, in order to prepare for later datasets concatenation, we added year and month columns into each dataset. We expect that this table will be updated continuously with new data by day and month so we needed a way to differentiate the year of the flight and realize the month that was in the title of the data spreadsheets. We also added dep_del_min, arrive_del_min columns to track the delay time for each flight, and assigned null values first for them in all records, later we converted the NAs of arr_delay_min and dep_delay_min into 0, or 15 if arr_del15 =1 or dep_del15= 1. These are new columns we introduced. We introduced them because the dep_del15 and arr_del15 only signify if the flight was delayed by at least 15 minutes. Going forward, we expect more data to be collected to obtain the exact number of minutes a flight was delayed so that it can be delivered to stakeholders. 
In addition, numeric variables were also converted into factor variables, including DEP_TIME, DEP_DEL15, ARR_TIME, ARR_DEL15, CANCELLED, DIVERTED and DISTANCE. Finally, we saved cleaned datasets into new CSV files.

After the above procedures, we combined the four cleaned datasets into one data frame. Then we added the flight_id and found all unique dates (year, month, day of month, day of week) to convert them into a new added date_id column. To prepare for later insertion, we also changed all columns’ names to lowercase. Next, we created several new columns: delay (assign 1 if dep_del15 = 1 or arr_del15 = 1), schedule_blk_id (will be used as PK for schedule_blk). 
It was very difficult to create the unique keys in the date table. In the end, we manually coded the ID assignment but the ETL code must be enhanced to auto assign the IDs for future entries. Some of the assumptions we made during the schema design caused issues during the loading of the completed table transformation. Firstly, some of the values in the attributes did not meet the requirements of the attribute type. For example, originally, we set tail_num as a number, but as it turns out, there are tail_num entries with alpha characters. We had to go back and correct the schema to all for varchars. We also found that, even though tail_num is required to be unique, there was a mistype in the data causing a duplicate. When the table failed to load, we had to research which value was the duplicate or error. A third issue came in using timestamp without properly transforming the time data. In the dep_time and arr_time attributes, the time was a 24-hour clock but it was missing the colon. We had to go back and manipulate the string to transform it into a time. We could not simply change the database attribute to a varchar because we need to be able to calculate hours and minutes for reports. 
 Finally, we saved the cleaned main data frame into a new CSV file, called clean_flight_delay.csv. In R, by specifying the database, host, port, username, and password, we were able to make a connection to the PostgreSQL, so that later we can execute SQL statements in R through the connection and to insert the unique values from the dataset into related tables.

ANALYTICS APPLICATIONS
We performed our initial ETL process in R so we would expect any updates to continue in this public, widespread coding language. for analysis and visualization, we would want the database to easily flow into tools typical for businesses like Tableau. We can also develop an API to the FAA website for flight passengers to check the status of their flights online. We can create a query function of the information that is on the site for the customer to enter. When the customer clicks search, a request will be sent to the database and pass in the customer selections into astored function. It will return the customers results on the screen.

						https://www.fly.faa.gov/flyfaa/usmap.jsp
For analysts, we will create a view function because this function can help analysts to view the total number of flights in schedule block per airport with the number of departure delays in that schedule block by airport. This information can be used to diagnose congestion delays for departures. The same can be done in reverse for congestion due to arrival delays. View with attributes Date, Origin, Destination, Time Components, Delay can be extracted into R or Python to run models. Airline analysts can use Views for delays by aircraft to monitor if a specific plane is having problems. This can also protect the data structure being destroyed. 



Using the views, the following questions can be explored:
Which carriers are the worst in terms of arriving or departing on time? 
Results: WN, AA, OO, DL, and UA are the worst 5 carriers in terms of arriving or departing on time.
Which airports, as origin or destination, are the worst in terms of arriving or departing on time?
Origin Results:MDW, DEN, LAS, BWI and DAL as origins contributed most in terms of arrival delay. MDW, DEN, LAS, BWI and DAL as origins contributed most in terms of departure delay.
Destination Results: DEN, DAL, MDW, LAS and PHX as destinations contributed most in terms of arrival delay. DEN, DAL, MDW, LAS and PHX as destinations contributed most in terms of departure delay
What is the situation of delay in each year?
Results
What is the situation of delay in each month?
Results
WN carrier has the worst performance of on-time, so which airports and which planes contributed most?
Results:  Planes N731SA, N914WN, N751SW, N782SA and N937WN contributed most in terms of arrival delay. planes N731SA, N704SW, N441WN, N782SA and N920WN contributed most in terms of departure delay.
Which pairs of origin and dest are worst in terms of on-time?
Results: ORD-LGA, LGA-ORD, LAX-SFO and SFO-LAX are worst 4 in terms of arrival delay. ORD-LGA, LGA-ORD, LAX-SFO and SFO-LAX are the worst four in terms of departure delay.
What are the most important variables for flight delays?
Airline carrier, departure time, and arrival time are the most significant. Month is also significant but more analysis needs to be done on additional months.
What are the least relevant variables for flight delays?
What is the relationship between the distance and the number of delays?
Departure delay and arrival delay share the pattern. From 0 to around 300, the number of delays increases sharply and peaks at 300. From around 300 to 2000, the number of delays declined sharply and reached another peak at around 2500. From 2500 to over 5000, the number of delays decreased sharply.



For the executive C-level officer, there are new columns we introduced. Delay_mins can let the executive team understand the exact time the flight is delayed. We expect more data to be collected to obtain the exact number of minutes a flight was delayed so that it can be delivered to C-suite executives. We anticipate this data can provide more insight to the C-level people of how long the flight got delayed and which airline they belong to and which airport is often delayed.


Ultimately, we look for major relationships between flight delayed times, originated airports and arrivals airports. We also check which flight airline and flight ID are. From our experience and in the mindset of customers (our primary client), they are interested in which airport’s flights or airline got the most delayed, flights delayed per carrier, total lost time due to delays, year-over-year trend of flight delays so that they can take this as their consideration. With these factors in mind, many of our original questions posed in Checkpoint 1 cover any issues of performance related to querying redundancy. 
We were able to reduce redundancy based on our schema design. The original dataset had all attributes in a row to distinguish one row for the next. We identified the minimal number of attributes needed in a table to be able to uniquely identify the row and related it. We did face performance issues in querying because the database is so large. We have over 2 million rows in some of the tables. We ended up indexing flight_id because it is the most important key in the database and it is the most frequently used. 
Our final recommendation would be for this database to be on cloud. As stated above, the database has 2 million rows and that is only for 4 months over the past two years. With the variability in the airline market, the need for scalability is apparent. For example, at the height of the US coronavirus pandemic, flights were reduced by 80%. Additionally, the information comes from all over the country and is accessed by different types of individuals (analysts, customers), so the cloud will be more accessible. In terms of data security, the flight dataset is publicly available data and does not contain personally identifiable information.
 
RESOURCES
February Flight Delays Data
January Flight Delays Data
Lucidchart ER Diagram
Tableau Dashboard
