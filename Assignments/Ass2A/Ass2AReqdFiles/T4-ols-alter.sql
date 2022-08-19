--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-ols-alter.sql

--Student ID: 31552544
--Student Name: Huixin Wang
--Tutorial No: 05

/* Comments for your marker:




*/

-- 4(a)
ALTER TABLE trip ADD trip_duration DATE DEFAULT 0;

COMMENT ON COLUMN trip.trip_duration IS
    'The actual trip duration for each completed trip';

-- difference in minutes
SELECT
  trip_id,
  trip_start_actual,
  trip_end_actual,
  DATEDIFF(minutes, trip_end_actual, trip_start_actual) AS trip_duration
FROM trip;

COMMIT;


-- 4(b)
ALTER TABLE driver ADD(
    driver_status CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT chk_driver_status CHECK (driver_status IN ('Y', 'N'))
);
/*
Assumptions: The reason to set the defaul value to 'Y' is because the following
sql code will update all the drivers to 'N' (which is according to the requirement
"assume that a driver is not available if they are already booked for at least 1 trip today")
*/
COMMENT ON COLUMN driver.driver_status IS
    'Driver availability status (e.g., Y or N)';

UPDATE driver
SET
    driver_status = 'N'
WHERE
    driver_id = (
        SELECT
            driver_id
        FROM
            trip
        WHERE
            driver_id is not NULL
        );
        
COMMIT;

-- 4(c)
ALTER TABLE trip 
    ADD off_givenname VARCHAR(50) NOT NULL;

ALTER TABLE trip 
    ADD off_familyname VARCHAR(50) NOT NULL;   

COMMENT ON COLUMN trip.off_givennname IS
    'Olympics given name';
    
COMMENT ON COLUMN trip.off_familyname IS
    'Olympics family name';
    

    



