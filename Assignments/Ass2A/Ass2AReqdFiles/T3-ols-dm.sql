--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-ols-dm.sql

--Student ID: 31552544
--Student Name: Huixin Wang
--Tutorial No: 05

/* Comments for your marker:




*/

-- 3(a)
-- DROP
drop sequence driver_seq;
drop sequence trip_seq;

-- CREATE SEQUENCE
create sequence driver_seq start with 100 increment by 1;
create sequence trip_seq start with 100 increment by 1;


-- 3(b)
INSERT INTO driver VALUES(
    driver_seq.NEXTVAL,
    'Michael',
    'Chu',
    'X33445566778899MCH',
    '3'
);

INSERT INTO driver_language VALUES (
    (
        SELECT
            driver_id
        FROM
            driver
        WHERE
            driver_license_no = 'X33445566778899MCH'
    ),
    'EN'
);

INSERT INTO trip VALUES(
    trip_seq.NEXTVAL,
    TO_DATE('7-Feb-2022 07:30:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('7-Feb-2022 09:00:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    NULL,
    NULL,
    NULL,
    NULL,
    1,
    (
        SELECT
            veh_vin
        FROM
            vehicle
        WHERE
            veh_regonumber = 'OLSID22'
    ),
    (
        SELECT
            location_id
        FROM
            location
        WHERE
            location_name = 'Beijing National Stadium'
    ),
    (
        SELECT
            location_id
        FROM
            location
        WHERE
            location_name = 'National Alpine Ski Centre'
    ),
    (
        SELECT
            off_olympic_id
        FROM
            official
        WHERE
            off_givenname = 'Simon' AND off_familyname = 'Nathan' AND COUNTRY_IOC_CODE = 'AUS'
    ),
    (
        SELECT
            driver_id
        FROM
            driver
        WHERE
            driver_license_no = 'X33445566778899MCH'
    )
);

COMMIT;

-- 3(c)
UPDATE trip
SET
    trip_start_actual = ('7-Feb-2022 07:35:00')
WHERE
    trip_start_actual = NULL;
    
UPDATE trip
SET
    trip_end_actual = ('7-Feb-2022 09:00:00')
WHERE
    trip_end_actual = NULL;  

UPDATE trip
SET
    trip_start_km = 5678
WHERE
    trip_start_km = NULL; 

UPDATE trip
SET
    trip_end_km = 5780
WHERE
    trip_end_km = NULL;   

COMMIT;

-- 3(d)
DELETE FROM trip
WHERE
    off_olympic_id = (
        SELECT
            off_olympic_id
        FROM
            official
        WHERE
            off_givenname = 'Simon' AND off_familyname = 'Nathan' AND COUNTRY_IOC_CODE = 'AUS'
    );

COMMIT;
    
