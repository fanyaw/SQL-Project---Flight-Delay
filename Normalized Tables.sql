
CREATE TABLE origin (
	origin_airport_id numeric,
	origin varchar(3),
	PRIMARY KEY (origin_airport_id)
);

CREATE TABLE destination (
	dest_airport_id numeric,
	dest varchar(3),
	PRIMARY KEY (dest_airport_id)
);
CREATE TABLE date (
	date_id numeric,
	year numeric,
	day_of_week varchar(10),
	month varchar(10),
	day_of_month numeric,
	PRIMARY KEY (date_id)
);

CREATE TABLE airline (
	op_carrier_airline_id numeric,
	op_carrier varchar(2),
	PRIMARY KEY (op_carrier_airline_id)
);

CREATE TABLE plane (
	tail_num varchar,
	op_carrier_airline_id numeric,
	PRIMARY KEY (tail_num),
	FOREIGN KEY (op_carrier_airline_id) REFERENCES airline(op_carrier_airline_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE schedule_block (
	schedule_blk_id numeric,
	dep_time_blk varchar(9),
	PRIMARY KEY (schedule_blk_id)
);


CREATE TABLE flight_schedule (
	flight_id numeric,
	tail_num varchar,
	origin_airport_id numeric,
	dep_time time,
	dest_airport_id numeric,
	arr_time time,
	distance numeric(6,1),
	date_id numeric,
	PRIMARY KEY (flight_id),
	FOREIGN KEY (tail_num) REFERENCES plane
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (origin_airport_id) REFERENCES origin(origin_airport_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (dest_airport_id) REFERENCES destination(dest_airport_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);
drop table schedule_change
CREATE TABLE schedule_change (
	flight_id numeric,
	diverted bit,
	cancelled bit,
	PRIMARY KEY (flight_id, diverted, cancelled),
	FOREIGN KEY (flight_id) REFERENCES flight_schedule(flight_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE flight_status (
	flight_id numeric,
	schedule_blk_id numeric,
	delay bit,
	PRIMARY KEY (flight_id, schedule_blk_id),
	FOREIGN KEY (flight_id) REFERENCES flight_schedule (flight_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (schedule_blk_id) REFERENCES schedule_block(schedule_blk_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE delay_status (
	flight_id numeric,
	dep_del15 bit,
	arr_del15 bit,
	dep_del_min numeric,
	arr_del_min numeric,
	PRIMARY KEY (flight_id, dep_del15, arr_del15, dep_del_min, arr_del_min),
	FOREIGN KEY (flight_id) REFERENCES flight_schedule (flight_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX idx_flight 
ON flight_status(flight_id);