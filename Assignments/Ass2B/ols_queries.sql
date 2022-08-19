--****PLEASE ENTER YOUR DETAILS BELOW****
-- ols_queries.sql

--Student ID: 31552544
--Student Name: Huixin Wang

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    driver_givenname || ' ' || driver_familyname AS FULLNAME
FROM
    ols.driver d
    JOIN ols.driver_language dl
    ON d.driver_id = dl.driver_id
WHERE
    lang_iso_code = 'EN'
    AND driver_clearance_level = '3'
ORDER BY
    FULLNAME asc;

/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    off_olympic_id,
    off_familyname
FROM
    ols.country c
    JOIN ols.official o
    ON o.country_ioc_code = c.country_ioc_code
    JOIN ols.ioc_role i
    ON o.ioc_role_code = i.ioc_role_code
WHERE
    country_ioc_name LIKE '%a'
    AND i.ioc_role_code = 'HC'
ORDER BY
    off_familyname,
    off_olympic_id;

/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    trip_id,
    trip_start,
    trip_end
FROM
    ols.trip t
    JOIN ols.location l
    ON t.location_id_from = l.location_id
    JOIN ols.location_type lt
    ON l.loctype_id = lt.loctype_id
WHERE
    loctype_desc = 'Airport'
ORDER BY
    trip_start,
    trip_id;

/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    v.veh_regonumber,
    COUNT(trip_id) AS "Total current bookings"
FROM   
    ols.vehicle v
    JOIN ols.trip t
    ON v.veh_vin = t.veh_vin
GROUP BY
    v.veh_regonumber
HAVING
    COUNT(trip_id) = (
        SELECT
            MAX(COUNT(trip_id))
        FROM
            ols.trip
        WHERE
            trip_end_actual IS NULL
        GROUP BY
            v.veh_regonumber,
            trip_id)  
ORDER BY
    veh_regonumber DESC;

/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    o.off_olympic_id,
    off_givenname || ' ' || off_familyname AS FULLNAME,
    COUNT(t.trip_id)
FROM
    ols.official o
    JOIN ols.trip t
    ON t.off_olympic_id = o.off_olympic_id
GROUP BY
    o.off_olympic_id, off_givenname || ' ' || off_familyname
HAVING
    COUNT(t.trip_id) > AVG(t.trip_id)
ORDER BY
    COUNT(t.trip_id),
    o.off_olympic_id DESC;


/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    trip_id,
    trip_start_actual,
    trip_end_actual,
    location_name,
    AVG(minutes_between(to_date(t.trip_start_actual), to_date(t.trip_end_actual))) AS "Average completed trip duration"
--    AVG(datediff(minutes, t.trip_start_actual, t.trip_end_actual))
FROM
    ols.trip t
    INNER JOIN ols.location l
    ON t.location_id_from = l.location_id
GROUP BY
    trip_id, trip_start_actual, trip_end_actual, location_name
HAVING
    COUNT ( * ) > 1
ORDER BY 
    trip_start_actual DESC,
    trip_id;

/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    location_id,
    location_name,
    COUNT(trip_id)
FROM
    ols.trip t
    JOIN ols.location l
    ON t.location_id_to = l.location_id
GROUP BY
    location_id,
    location_name
HAVING
    COUNT(trip_id) = (
        SELECT
            MAX(COUNT(trip_id))
        FROM
            ols.trip
        GROUP BY
            trip_id,
            location_id_to)
ORDER BY
    location_name;

/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    d.driver_id,
    d.driver_givenname || ' ' || d.driver_familyname AS fullname, 
CASE
    WHEN trip_start_actual IS NULL AND trip_end_actual IS NULL THEN 'Not Applicable'
    ELSE format(SUM(datediff(hour, t.trip_actual_start, t.trip_actual_end) * 40), 'C', 'EN')  
END AS "Total pament"
FROM 
    ols.driver d
    INNER JOIN ols.trip t
    ON d.driver_id = t.driver_id
GROUP BY
    d.driver_id
WHERE
    t.trip_actual_start >= '26/Jan/2022'
    AND t.trip_actual_end <= '09/Feb/2022'
ORDER BY
    d.driver_id;

/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon (;)
-- at the end of this answer
SELECT
    l.lang_name,
CASE
    WHEN COUNT(DISTINCT t.driver_id) > 0 THEN COUNT(DISTINCT t.driver_id)
    ELSE 0
END AS "Number of drivers",
CASE
    WHEN COUNT(t.trip_end_km || t.trip_start_km) > 0 THEN COUNT(t.trip_end_km || t.trip_start_km)
    ELSE 0
END AS "Number of trips"
FROM
    ols.language l
    LEFT JOIN ols.driver_language dl
    ON l.lang_iso_code = dl.lang_iso_code
    JOIN trip t
    ON dl.driver_id = t.driver_id
GROUP BY
    l.lang_name
ORDER BY
    l.lang_name;