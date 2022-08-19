--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-ols-schm.sql

--Student ID: 31552544
--Student Name: Huixin Wang
--Tutorial No: 05

/* Comments for your marker:

All missing FK Constraints are added within the matching table section.


*/

-- Drop tables
DROP TABLE driver CASCADE CONSTRAINTS;

DROP TABLE driver_language CASCADE CONSTRAINTS;

DROP TABLE trip CASCADE CONSTRAINTS;

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- DRIVER
CREATE TABLE driver (
    driver_id               NUMBER(4) NOT NULL,
    driver_givenname        VARCHAR(50),
    driver_familyname       VARCHAR(50) NOT NULL,
    driver_license_no       CHAR(18) NOT NULL,
    driver_clearance_level  CHAR(1) NOT NULL
);

ALTER TABLE driver
    ADD CONSTRAINT driver_clearance_level_check CHECK (driver_clearance_level IN ('1', '2', '3', '4'));

-- COMMENT
COMMENT ON COLUMN driver.driver_id IS
    'Unique identifier for a driver';

COMMENT ON COLUMN driver.driver_givenname IS
    'Driver given name';
    
COMMENT ON COLUMN driver.driver_familyname IS
    'Driver family name';
    
COMMENT ON COLUMN driver.driver_license_no IS
    'Unique identifier for a driver';

COMMENT ON COLUMN driver.driver_clearance_level IS
    'The level of security clearance granted to the driver(1 to 4)';
    
-- PK
ALTER TABLE driver ADD CONSTRAINT driver_pk PRIMARY KEY (driver_id);

-- DRIVER_LANGUAGE
CREATE TABLE driver_language (
    driver_id       NUMBER(4) NOT NULL,
    lang_iso_code   CHAR(2) NOT NULL
);

-- COMMENT
COMMENT ON COLUMN driver_language.driver_id IS
    'Unique identifier for a driver';
    
COMMENT ON COLUMN driver_language.lang_iso_code IS
    'ISO code for a language (e.g., EN for English language)';
    
-- PK    
ALTER TABLE driver_language
    ADD CONSTRAINT driver_language_pk PRIMARY KEY (driver_id,
                                                   lang_iso_code);

-- FOREIGN
ALTER TABLE driver_language
    ADD CONSTRAINT driver_driver_language_fk FOREIGN KEY (driver_id)
        REFERENCES driver (driver_id);

ALTER TABLE driver_language
    ADD CONSTRAINT language_driver_language_fk FOREIGN KEY (lang_iso_code)
        REFERENCES language (lang_iso_code);

-- TRIP
CREATE TABLE trip (
    trip_id             NUMBER(6) NOT NULL,
    trip_start          DATE NOT NULL,
    trip_end            DATE NOT NULL,
    trip_start_actual   DATE,
    trip_end_actual     DATE,
    trip_start_km       NUMBER(6),
    trip_end_km         NUMBER(6),
    trip_passengers     NUMBER(2) NOT NULL,
    -- from the model
    veh_vin             CHAR(17) NOT NULL,
    location_id_from    NUMBER(6) NOT NULL,
    location_id_to      NUMBER(6) NOT NULL,
    off_olympic_id      CHAR(8) NOT NULL,
    driver_id           NUMBER(4) NOT NULL
);

-- Comment
COMMENT ON COLUMN trip.trip_id IS
    'Unique identifier for a trip';

COMMENT ON COLUMN trip.trip_start IS
    'Date and time the trip is booked to start';
    
COMMENT ON COLUMN trip.trip_end IS
    'Date and time the trip is booked to end';
    
COMMENT ON COLUMN trip.trip_start_actual IS
    'Date and time the booked trip actually starts';
    
COMMENT ON COLUMN trip.trip_end_actual IS
    'Date and time the booked trip actually ends';
    
COMMENT ON COLUMN trip.trip_start_km IS
    'The odometer reading at the start of the trip';
    
COMMENT ON COLUMN trip.trip_end_km IS
    'The odometer reading at the end of the trip';
    
COMMENT ON COLUMN trip.trip_passengers IS
    'The number of booked passengers for the trip';
    
-- PK    
ALTER TABLE trip ADD CONSTRAINT trip_pk PRIMARY KEY (trip_id);

-- UNIQUE
ALTER TABLE trip ADD CONSTRAINT trip_start_unq UNIQUE (trip_start);

ALTER TABLE trip ADD CONSTRAINT veh_vin_unq UNIQUE (veh_vin);

ALTER TABLE trip ADD CONSTRAINT off_olympic_id_unq UNIQUE (off_olympic_id);

ALTER TABLE trip ADD CONSTRAINT driver_id_unq UNIQUE (driver_id);

-- FOREIGN
ALTER TABLE trip
    ADD CONSTRAINT vehicle_trip_fk FOREIGN KEY (veh_vin)
        REFERENCES vehicle (veh_vin);

ALTER TABLE trip
    ADD CONSTRAINT location_trip_from_fk FOREIGN KEY (location_id_from)
        REFERENCES location (location_id);
        
ALTER TABLE trip
    ADD CONSTRAINT location_trip_to_fk FOREIGN KEY (location_id_to)
        REFERENCES location (location_id);
        
ALTER TABLE trip
    ADD CONSTRAINT official_trip_fk FOREIGN KEY (off_olympic_id)
        REFERENCES official (off_olympic_id);
        
ALTER TABLE trip
    ADD CONSTRAINT driver_trip_fk FOREIGN KEY (driver_id)
        REFERENCES driver (driver_id);

-- Add all missing FK Constraints below here
-- All missing FK Constraints are added within the matching table section.


