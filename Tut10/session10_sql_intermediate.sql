/*
Databases Session 10 Tutorial
session10_sql_intermediate.sql

student id: 31552544
student name: Huixin Wang
last modified date:

*/

/* 1. Find the average mark of FIT2094 in semester 2, 2019.
Show the average mark with two decimal places.
Name the output column as “Average Mark”. */
SELECT
    to_char(AVG(mark), '999.00') as "Avg mark"
FROM
    uni.enrolment
WHERE
    unitcode = 'FIT2094'
    AND semester = 2
    AND to_char(ofyear, 'yyyy') = '2019';


/* 2. List the average mark for each offering of FIT9136.
In the listing, include the year and semester number.
Sort the result according to the year then the semester.*/
SELECT
    to_char(ofyear, 'yyyy') as year,
    semester,
    to_char(AVG(mark), '999.99') as "Avg mark"
FROM
    uni.enrolment
WHERE
    unitcode = 'FIT9136'
GROUP BY
    ofyear,
    semester
ORDER BY
    ofyear,
    semester;


/* 3. Find the number of students enrolled in FIT1045 in the year 2019,
under the following conditions:
      a. Repeat students are counted each time
      b. Repeat students are only counted once
*/

-- a. Repeat students are counted each time
SELECT
    COUNT(studid) as "Repeat students"
FROM
    uni.enrolment
WHERE
    unitcode = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019';


-- b. Repeat students are only counted once



/* 4. Find the total number of prerequisite units for FIT5145. */




/* 5. Find the total number of prerequisite units for each unit.
In the list, include the unitcode for which the count is applicable.
Order the list by unit code.*/



/*6. Find the total number of students
whose marks are being withheld (grade is recorded as 'WH')
for each unit offered in semester 1 2020.
In the listing include the unit code for which the count is applicable.
Sort the list by descending order of the total number of students
whose marks are being withheld, then by the unitcode*/
SELECT
    unitcode,
    COUNT(studid) as "Total number of students"
FROM
    uni.enrolment
WHERE
    semester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
    AND grade = 'WH'
GROUP BY
    unitcode
ORDER BY
    "Total number of students" DESC, unitcode;


/* 7. For each prerequisite unit, calculate how many times
it has been used as a prerequisite (number of times used).
In the listing include the prerequisite unit code,
the prerequisite unit name and the number of times used.
Sort the output by unit name. */



/*8. Display unit code and unit name of units
which had at least 2 students who were granted deferred exam
(grade is recorded as 'DEF') in semester 1 2020.
Order the list by unit code.*/



/* 9. Find the unit/s with the highest number of enrolments
for each offering in the year 2019.
Sort the list by semester then by unit code. */
SELECT
    unitcode,
    semester,
    COUNT(studid) as "number of enrolments"
FROM
    uni.enrolment
WHERE
    to_char(ofyear, 'yyyy') = '2019'
GROUP BY
    unitcode,
    semester
HAVING
    count(studid) = (
        SELECT
            max(count(studid))
        FROM
            uni.enrolment
        WHERE
            to_char(ofyear, 'yyyy') = '2019'
        GROUP BY
            unitcode,
            semester
    )
ORDER BY
    semester,
    unitcode;

-- subquery
SELECT
    max(count(studid))
FROM
    uni.enrolment
WHERE
    to_char(ofyear, 'yyyy') = '2019'
Group by
    unitcode,
    semester;




/* 10. Find all students enrolled in FIT3157 in semester 1, 2020
who have scored more than the average mark for FIT3157 in the same offering?
Display the students' name and the mark.
Sort the list in the order of the mark from the highest to the lowest
then in increasing order of student name.*/