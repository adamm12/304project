drop table Personnel CASCADE CONSTRAINTS;
drop table Pilot CASCADE CONSTRAINTS;
drop table FlightAttendant CASCADE CONSTRAINTS;
drop table FlightCrew CASCADE CONSTRAINTS;
drop table Airline CASCADE CONSTRAINTS;
drop table Plane CASCADE CONSTRAINTS;
drop table Flight CASCADE CONSTRAINTS;
drop table Reservations CASCADE CONSTRAINTS;
drop table Passenger CASCADE CONSTRAINTS;
drop table Ticket CASCADE CONSTRAINTS; 
drop table PlaneModel CASCADE CONSTRAINTS;
drop table TicketPrice CASCADE CONSTRAINTS;

create table Airline(
id integer PRIMARY KEY,
airlineName varchar(128));

create table Personnel(
id    integer PRIMARY KEY,
pname  varchar(128),
phoneNumber integer, 
hireDate   DATE,
airlineId   integer,
FOREIGN KEY (airlineId) REFERENCES Airline(id) ON DELETE CASCADE);

create table Pilot(
id    integer PRIMARY KEY,
certification varchar(32),
FOREIGN KEY (id) REFERENCES Personnel(id) ON DELETE CASCADE);

create table FlightAttendant(
id integer PRIMARY KEY,
languageSpecialization varchar(32),
FOREIGN KEY (id) REFERENCES Personnel(id) ON DELETE CASCADE);

create table PlaneModel(
model varchar(32) PRIMARY KEY,
capacity integer);

create table Plane(
id integer PRIMARY KEY,
model varchar(32),
dateMade DATE,
status varchar(32),
capacity integer,
airlineId integer,
FOREIGN KEY (airlineId) REFERENCES Airline(id) ON DELETE CASCADE,
FOREIGN KEY (model) REFERENCES PlaneModel(model) ON DELETE CASCADE);

create table Flight(
id integer PRIMARY KEY,
departureTime TIMESTAMP,
arrivalTime TIMESTAMP,
scheduledDeparture TIMESTAMP,
scheduledArrival TIMESTAMP, 
origin varchar(128),
destination varchar(128), 
status varchar(32),
planeId integer,
airlineId integer,
FOREIGN KEY (airlineId) REFERENCES Airline(id) ON DELETE CASCADE,
FOREIGN KEY (planeId) REFERENCES Plane(id) ON DELETE CASCADE);

create table FlightCrew (
personnelId integer,
flightId    integer,
PRIMARY KEY (personnelId, flightId),
FOREIGN KEY (personnelID) REFERENCES Personnel(id) ON DELETE CASCADE,
FOREIGN KEY (flightID) REFERENCES Flight(id) ON DELETE CASCADE);

create table Passenger(
id  integer PRIMARY KEY,
passengerName varchar(128),
airMiles  integer);

create table Reservations( 
id integer PRIMARY KEY,
flightId integer,
passengerId integer,
FOREIGN KEY (flightId) REFERENCES Flight(id) ON DELETE CASCADE,
FOREIGN KEY (passengerId) REFERENCES Passenger(id) ON DELETE CASCADE);

create table TicketPrice(
class varchar(32),
seat varchar(32),
price integer,
PRIMARY KEY (class, seat));

create table Ticket(
id integer PRIMARY KEY,
class varchar(32),
seat varchar(32),
passengerId integer,
flightId integer,
FOREIGN KEY (passengerId) REFERENCES Passenger(id) ON DELETE CASCADE,
FOREIGN KEY(class, seat) REFERENCES TicketPrice(class, seat) ON DELETE CASCADE,
FOREIGN KEY (flightId) REFERENCES Flight(id) ON DELETE CASCADE);

insert into Airline values
	(1, 'Pokemon Air');
insert into Airline values 
	(2, 'Digimon Air');
insert into Airline values
	(3, 'Dragon Air');
insert into Airline values
	(4, 'Air Canada');
insert into Airline values
	(5, 'Asiana Airlines');
  
insert into Personnel values 
	(011, 'Ash Ketchum', 6043214156, '2014-01-30', 1);
insert into Personnel values 
	(012, 'Professor Oak', 6043214156, '2014-01-30', 1);
insert into Personnel values 
	(013, 'Brock', 6049234123, '2000-12-29',1);
insert into Personnel values
	(014 , 'Misty', 6041234567, '2012-01-31',1);
insert into Personnel values
	(021, 'Izzy Izumi', 7782318931, '2012-01-31',2);
insert into Personnel values
	(022, 'Matt Ishida', 7784526214, '2010-02-14',2);
insert into Personnel values
	(023, 'Kari Kamiya',7782331020, '2002-03-12',2);
insert into Personnel values
	(024, 'Tai Kamiya',7782331020, '2002-03-12',2);
insert into Personnel values
	(031, 'Eragon', 2572120930, '1999-09-12',3);
insert into Personnel values
	(032, 'Arya', 2572738981, '1999-09-12',3);
insert into Personnel values
	(033, 'Angela', 2572120930, '1999-07-13',3);
insert into Personnel values
	(034, 'Brom', 2571231222, '1999-07-13',3);
insert into Personnel values
	(041, 'Edwards Ko', 90241230987, '2000-01-23',4);
insert into Personnel values
	(042, 'Linda Dee', 90241233212, '1997-01-12',4);
insert into Personnel values
	(043, 'John Lund', 9024122312, '1996-05-23',4);
insert into Personnel values
	(044, 'Param Puri', 9023120986, '2002-03-03',4);
insert into Personnel values
	(051, 'Jenny Ng', 8529871273, '2009-06-11',5);
insert into Personnel values
	(052, 'Kyle Ju', 8521230987, '1999-09-29',5);
insert into Personnel values
	(053, 'Jack Koo', 8521238747, '2001-01-23',5);
insert into Personnel values
	(054, 'Henry Liu', 8521245867, '2002-02-15',5);

insert into FlightAttendant values
	(012, 'English, French');
insert into FlightAttendant values
	(013, 'English, French');
insert into FlightAttendant values
	(021, 'Japanese, Korean');
insert into FlightAttendant values
	(024, 'Japanese, Korean, Chinese');
insert into FlightAttendant values
	(033, 'Spanish, English');
insert into FlightAttendant values
	(034, 'English, Japanese');
insert into FlightAttendant values
	(041, 'English, Russian');
insert into FlightAttendant values
	(042, 'English, Finish');
insert into FlightAttendant values
	(051, 'English, Dutch');
insert into FlightAttendant values
	(052, 'English, French, Russian');

insert into Pilot values
	(011, 'ATPL');
insert into Pilot values 
	(014, 'CPL');
insert into Pilot values
	(022, 'ATPL');
insert into Pilot values
	(023, 'CPL');
insert into Pilot values
	(031 , 'CPL');
insert into Pilot values
	(032, 'CPL');
insert into Pilot values
	(043, 'ATPL');
insert into Pilot values
	(044, 'ATPL');
insert into Pilot values 
	(053, 'CPL');
insert into Pilot values
	(054, 'CPL');

insert into PlaneModel values 
	('Boeing 717', 100);
insert into PlaneModel values 
	('Boeing 787', 195 );
insert into PlaneModel values 
	('Embraer 170', 76);
insert into PlaneModel values
	('Airbus A330', 265);
insert into PlaneModel values 
	('Airbus A380',544);
insert into PlaneModel values
	('Boeing 777',300);

insert into Plane values 
	(101, 'Boeing 717', '2000-10-03', 'In Flight', 100, 1);
insert into Plane values 
	(102, 'Boeing 787', '1993-10-31', 'Retired', 195, 1);
insert into Plane values 
	(103 , 'Airbus A330', '2010-03-12', 'Being Repaired', 265,2);
insert into Plane values
	(201, 'Boeing 777', '2003-02-27', 'In Flight',300,2);
insert into Plane values
	(202, 'Embraer 170', '2015-03-21', 'In Flight', 76, 2);
insert into Plane values
	(203, 'Airbus A380', '2012-04-12', 'Retired', 544,2);
insert into Plane values
	(301, 'Boeing 787', '2008-05-01', 'Being Repaired', 195,3);
insert into Plane values 
	(302, 'Airbus A330', '2014-04-12', 'In Flight', 265,3);
insert into Plane values 
	(303, 'Airbus A330', '2014-04-12', 'In Flight', 265, 3);
insert into Plane values
	(401, 'Airbus A380','2013-12-31', 'Being Repaired', 544,4);
insert into Plane values
	(402, 'Embraer 170', '2010-08-21', 'Being Repained', 76,4);
insert into Plane values 
	(403, 'Boeing 777', '2014-01-19', 'In Flight', 300,4);
insert into Plane values 
	(501, 'Boeing 787', '2015-02-24', 'In Flight', 195,5);
insert into Plane values 
	(502, 'Boeing 777', '2013-05-22', 'Being Repaired', 300,5);
insert into Plane values 
	(503, 'Airbus A380', '2016-02-24', 'Retired', 544,5);
  
insert into Flight values
  (23101, '2005-05-13 07:15:00.0000', '2005-06-13 02:45:00.0000', '2005-05-13 07:15:00.0000', '2005-06-13 02:45:00.0000', 'ATL', 'PEK', 'Landed', 301, 3);
insert into Flight values
  (23102, '2008-11-02 14:30:00.0000', '2008-11-02 16:55:00.0000', '2008-11-02 15:30:00.0000', '2008-11-02 19:55:00.0000', 'LAX', 'CDG', 'Landed', 403, 4);
insert into Flight values
  (23103, '2012-11-02 11:30:00.0000', NULL, '2012-11-02 11:30:00.0000', '2012-11-02 19:30:00.0000', 'JFK', 'MIA', 'On Time', 101, 1);
insert into Flight values
  (23104, '2013-05-02 18:30:00.0000', NULL, '2013-05-02 19:30:00.0000', '2012-11-02 23:00:00.0000', 'ICN', 'MIA', 'Delayed', 201, 2);
insert into Flight values
  (23105, '2014-10-02 19:30:00.0000', NULL, '2014-10-02 16:30:00.0000', '2014-10-03 10:30:00.0000', 'PEK', 'PHX', 'On Time', 202, 2);
insert into Flight values
  (23106, '2015-03-02 14:30:00.0000', NULL, '2014-01-02 14:30:00.0000', '2014-11-02 14:30:00.0000', 'DEN', 'SIN', 'Landing', 302, 3);
insert into Flight values
  (23107, '2016-04-02 14:30:00.0000', NULL, '2016-04-02 14:30:00.0000', '2016-04-02 14:31:00.0000', 'AMS', 'IST', 'On Time', 303, 3);
insert into Flight values
  (23108, '2016-05-02 14:30:00.0000', NULL, '2016-05-02 14:30:00.0000', '2016-05-02 14:35:00.0000', 'LAX', 'JFK', 'Delayed', 403, 4); 
insert into Flight values
  (23109, '2013-05-13 23:15:31.1234', NULL, '2013-05-13 23:15:00.0000', '2016-07-14 13:30:00.0000', 'Earth', 'Mars', 'Lost', 501, 5); 
insert into Flight values
  (23110, NULL, NULL, '2016-08-03 12:00:00.0000', '2016-08-04 10:00:00.0000', 'PVG', 'LAX', 'Scheduled', 101, 1);
insert into Flight values
  (23111, NULL, NULL, '2017-02-22 14:00:00.0000', '2017-02-24 01:00:00.0000', 'DXB', 'MMK', 'Scheduled', 103, 2);

insert into Passenger values
  (567, 'Ted Striker', 156);
insert into Passenger values
  (568, 'Clarence Oveur', 121354);
insert into Passenger values
  (569, 'Roger Murdock', 15);
insert into Passenger values
  (570, 'Steve McCroskey', 0);
insert into Passenger values
  (571, 'Elaine Dickinson', 0);
insert into Passenger values
  (572, 'Rumack', 138);
insert into Passenger values
  (573, 'Jive Lady', 9001);

insert into Reservations values
  (236, 23104, 567);
insert into Reservations values
  (237, 23110, 567);
insert into Reservations values
  (238, 23110, 571);
insert into Reservations values
  (239, 23110, 573);
insert into Reservations values
  (240, 23111, 573);
  
insert into TicketPrice values
  ('economy', 'window', 500);
insert into TicketPrice values
  ('economy', 'normal', 450);
insert into TicketPrice values
  ('business', 'window', 900);
insert into TicketPrice values
  ('business', 'normal', 800);
insert into TicketPrice values
  ('first', 'window', 2000);
insert into TicketPrice values
  ('first', 'normal', 1800);
insert into TicketPrice values
  ('super first', 'pilot seat', 999999);

insert into Ticket values
  (96023, 'economy', 'window', 568, 23105);
insert into Ticket values
  (96024, 'business', 'normal', 571, 23104);
insert into Ticket values
  (96025, 'first', 'normal', 571, 23105);
insert into Ticket values
  (96026, 'business', 'normal', 571, 23106);
insert into Ticket values
  (96027, 'economy', 'window', 567, 23109);
insert into Ticket values
  (96028, 'economy', 'normal', 569, 23110);
insert into Ticket values
  (96029, 'super first', 'pilot seat', 573, 23111);