PRAGMA foreign_keys = TRUE;

DROP TABLE Bird;
DROP TABLE Location;
DROP TABLE Staff;
DROP TABLE Observation;

CREATE TABLE Bird (
ring_id CHAR(5),
species VARCHAR(20),
date_ringed DATE,
age_ringed INTEGER,
PRIMARY KEY (ring_id)
);

CREATE TABLE Location (
loc_id CHAR(5),
loc_name VARCHAR(20),
latitude DOUBLE(5),
longitude DOUBLE(5),
postcode CHAR(6),
county VARCHAR(20),
PRIMARY KEY (loc_id)
);

INSERT INTO Location
VALUES ('00001', 'Fife NO.1', '60.23', '10.45', 'V94MN5', 'Fife');

CREATE TABLE Staff (
staff_id CHAR(5),
name VARCHAR(20),
address VARCHAR(20),
phone INTEGER,
PRIMARY KEY (staff_id)
);

CREATE TABLE Observation (
ring_id CHAR(5),
loc_id CHAR(5),
date DATE,
staff_id CHAR(5),
weight INTEGER,
bird_length INTEGER,
wingspan DOUBLE(5),
PRIMARY KEY (ring_id, loc_id, staff_id),
FOREIGN KEY (ring_id) REFERENCES Bird,
FOREIGN KEY (loc_id) REFERENCES Location,
FOREIGN KEY (staff_id) REFERENCES Staff
);

SELECT loc_name, latitude, longitude FROM Location
WHERE county = 'Fife'
ORDER BY postcode;

SELECT DISTINCT species FROM Bird NATURAL JOIN (SELECT  count(ring_id) FROM Observation);

SELECT DISTINCT loc_name, 
	(SELECT count(ring_id) FROM Observation NATURAL JOIN Bird WHERE species = 'swan' AND date LIKE '2019-%-%' ) AS "swan_number"
	FROM Location;

ALTER TABLE Location
ADD COLUMN country VARCHAR(10) NOT NULL DEFAULT 'UK';






