/*
Databases Session 8 Tutorial
session8_sqlbasic_part_a.sql

student id: 31552544
student name: Huixin Wang
last modified date: 27/01/2022

*/

/* A1. List all units and their details. Order the output by unit code. */
SELECT
    *
FROM
    uni.unit
ORDER BY
    unitcode;


/* A2. List all students� details who live in Caulfield. 
Order the output by student first name.*/
SELECT
    *
FROM
    uni.student
WHERE
    studaddress like '%Caulfield'
ORDER BY
    studfname;


/* A3. List the student's id, surname, firstname and address for those students 
who have a surname starting with the letter 'S' and firstname contains the letter 'i'. 
Order the output by student id*/
SELECT
    *
FROM
    uni.student
WHERE
    studlname LIKE 'S%'
    AND studfname LIKE '%i%'
ORDER BY
    studid;

/* A4. Assuming that a unit code is created based on the following rules:
a. The first three letters represent faculty abbreviation, 
   e.g. FIT for the Faculty of Information Technology.
b. The first digit of the number following the letter represents the year level. 
   For example, FIT2094 is a unit code from Faculty of IT (FIT) 
   and the number 2 refers to a second year unit.

List the unit details for all first year units 
in the Faculty of Information Technology. Order the output by unit code.*/
SELECT
    *
FROM
    uni.unit
WHERE
    unitcode LIKE 'FIT1%'
ORDER BY
    unitcode;

/* A5. List the unit code and semester of all units that are offered in 2019. 
Order the output by unit code, and within a given unit code order by semester.*/
SELECT
    unitcode,
    semester
FROM
    uni.offering
WHERE
    to_char(ofyear, 'yyyy') = '2019'
    AND semester = 1
ORDER BY
    unitcode;


/* A6. List the year, semester, and unit code for all units that were offered 
in either semester 1 of 2019 or semester 1 of 2020. 
Order the output by year and semester then by unit code.*/



/* A7. List the student id, unit code and mark 
for those students who have failed any unit in semester 2 of 2019. 
Order the output by student id then order by unit code. */
