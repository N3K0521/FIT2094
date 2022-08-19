--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-ols-insert.sql

--Student ID: 31552544
--Student Name: Huixin Wang
--Tutorial No: 05

/* Comments for your marker:




*/

-- Task 2 Load the DRIVER, DRIVER_LANGUAGE and TRIP tables with your own
-- test data following the data requirements expressed in the brief

-- INSERTING into DRIVER
INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    01,
    'Tom',
    'Lee',
    'A2b3l42',
    '1'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    262,
    'Anna',
    'Christian',
    '123ab',
    '2'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    33,
    NULL,
    'Wu',
    'LF20493',
    '1'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    40,
    'Sam',
    'Megan',
    '20984la',
    '1'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    5,
    'Cici',
    'Ng',
    '23401qw',
    '4'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    6,
    'May',
    'Osdiwu',
    '098298fl',
    '3'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    7777,
    'Alice',
    'Bob',
    'p13iud',
    '1'
);

INSERT INTO driver (
    driver_id,
    driver_givenname,
    driver_familyname,
    driver_license_no,
    driver_clearance_level
) VALUES (
    8,
    'Luis',
    'Migeul',
    '398swi',
    '1'
);

-- INSERTING into DRIVER_LANGUAGE
INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    01,
    'EN'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    262,
    'ES'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    33,
    'ES'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    40,
    'ZH'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    5,
    'EN'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    6,
    'EN'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    7777,
    'EN'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    7777,
    'ES'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    8,
    'EN'
);

INSERT INTO driver_language (
    driver_id,
    lang_iso_code
) VALUES (
    8,
    'ES'
);

-- INSERTING into TRIP
INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    1,
    TO_DATE('8-Feb-2022 08:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('8-Feb-2022 09:00:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    NULL,
    NULL,
    NULL,
    NULL,
    90,
    'SANFDAE11U1286116',
    34,
    35,
    'AUS00101',
    01
);

INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    2,
    TO_DATE('7-Feb-2022 08:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('7-Feb-2022 09:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    NULL,
    NULL,
    NULL,
    NULL,
    78,
    'SB2252300ADT01359',
    39,
    1,
    'CHN00102',
    7777
);

INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    3,
    TO_DATE('6-Feb-2022 08:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('6-Feb-2022 09:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    NULL,
    NULL,
    NULL,
    NULL,
    90,
    'SD2252300BDU00040',
    40,
    41,
    'JPN00101',
    6
);

INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    4,
    TO_DATE('27-Jan-2022 08:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('27-Jan-2022 09:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('27-Jan-2022 08:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('27-Jan-2022 09:08:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    520,
    490,
    90,
    'SK30URHHAAS217472',
    40,
    41,
    'AUS00103',
    262
);

INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    5,
    TO_DATE('28-Jan-2022 10:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('28-Jan-2022 11:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('28-Jan-2022 10:20:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('28-Jan-2022 11:33:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    390,
    520,
    90,
    'SMNFDAE11U1286256',
    40,
    41,
    'CHN00101',
    33
);

INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    6,
    TO_DATE('1-Feb-2022 10:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('1-Feb-2022 11:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('1-Feb-2022 10:20:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('1-Feb-2022 11:33:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    390,
    520,
    90,
    'SB2252300ADT00644',
    40,
    41,
    'JPN00102',
    40
);

INSERT INTO trip (
    trip_id,
    trip_start,
    trip_end,
    trip_start_actual,
    trip_end_actual,
    trip_start_km,
    trip_end_km,
    trip_passengers,
    -- from the model
    veh_vin,
    location_id_from,
    location_id_to,
    off_olympic_id,
    driver_id
) VALUES (
    7,
    TO_DATE('3-Feb-2022 10:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('3-Feb-2022 11:15:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('3-Feb-2022 10:20:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    TO_DATE('3-Feb-2022 11:33:00', 'dd-Mon-yyyy hh:mi:ss AM'),
    390,
    520,
    90,
    'SM30URHHAAS153052',
    40,
    41,
    'AUS00106',
    8
);

COMMIT;