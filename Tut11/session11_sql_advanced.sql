/*
Databases Session 11 Tutorial
session11_sql_advanced.sql

student id: 31552544
student name: Huixin Wang
last modified date:

*/

/* 1.  Find the number of scheduled classes assigned to each staff member 
for each semester in 2019. If the number of classes is 2 then this 
should be labelled as a correct load, more than 2 as an overload 
and less than 2 as an underload. Include the staff id, staff first name, 
staff last name, semester, number of scheduled classes and load in the listing. 
Sort the list by decreasing order of the number of scheduled classes 
and when the number of classes is the same, sort by increasing order 
of staff id then by the semester. */
-- table(s): schedclass, staff
SELECT
    s.staffid,
    stafffname,
    stafflname,
    semester,
    count(*) as numberclasses,
--case grade
--WHEN 'HD' then ''
--end
CASE
    when count(*) > 2 then 'Overload'
    when count(*) = 2 then 'Correct load'
    else 'Underload'
end load
FROM
    uni.schedclass c 
JOIN uni.staff s ON c.staffid = s.staffid -- you can use natural join here
WHERE
    to_char(ofyear, 'yyyy') = '2019'
GROUP BY
    s.staffid, stafffname, stafflname, semester
ORDER BY
    numberclasses desc, staffid, semester
;

/* 2. Display the unit code and unit name for units that do not have a prerequisite. 
Order the list in increasing order of unit code. 

There are many approaches that you can take in writing an SQL statement to answer this query. 
You can use the SET OPERATORS, OUTER JOIN and a SUBQUERY. 
Write SQL statements based on all three approaches.*/

/* Using outer join */
SELECT 
    u.unitcode,
    unitname
FROM
    uni.unit u
    LEFT OUTER JOIN uni.prereq p ON u.unitcode = p.unitcode
GROUP BY
    u.unitcode,
    u.unitname
HAVING
    COUNT(has_prereq_of) = 0
ORDER BY
    unitcode;


/* Using set operator MINUS */
--A is a set
--B is a set
--A - B = number of A that is not exists in B
--A set consists of set of attributes and data
--both attributes that are involved in the operation have the same number and domain
--A (number, char) then B (number, char)

--A: all units
SELECT
    unitcode,
    unitname
FROM
    uni.unit
--A: all units
MINUS
--B: units that have prereqs
SELECT
    unitcode,
    unitname
FROM
         uni.unit u
    JOIN uni.prereq p
    ON u.unitcode = p.unitcode
ORDER BY
    unitcode;

/* Using subquery */
SELECT
    unitcode,
    unitname
FROM
    uni.unit
WHERE
    unitcode NOT IN (
        SELECT
            unitcode
        FROM
            uni.prereq
    )
ORDER BY
    unitcode;

/* 3. List the unit code, year, semester, number of enrolments 
and the average mark for each unit offering. 
Include offerings without any enrolment in the list. 
Round the average to 2 digits after the decimal point. 
If the average result is 'null', display the average as 0.00. 
All values must be shown with two decimal digits. 
Order the list in increasing order of average mark, 
and when the average mark is the same, sort by increasing order of year 
then by the semester and unit code. 
*/



/* 4. List all units offered in semester 2 2019 which do not have any enrolment. 
Include the unit code, unit name, and the chief examiner's name in the list. 
Order the list based on the unit code. */



/* 5. List the id and full name of students who are enrolled in both 'Introduction to databases' 
and 'Introduction to computer architecture and networks' (note: both unit names are unique)
in semester 1 2020. Order the list by the student id.*/



/* 6. Given that the payment rate for a tutorial is $42.85 per hour 
and the payment rate for a lecture is $75.60 per hour, 
calculate the weekly payment per type of class for each staff member in semester 1 2020. 
In the display, include staff id, staff name, type of class (lecture or tutorial), 
number of classes, number of hours (total duration), 
and weekly payment (number of hours * payment rate). 
Order the list by increasing order of staff id and for a given staff id by type of class.*/
-- table(s) schedclass, staff
SELECT
    staffid,
    stafffname
    || ' '
    || stafflname                                                             AS staffname,
    'Lecture'                                                                 AS type,
    COUNT(*)                                                                  AS no_of_classes,
    SUM(clduration)                                                           AS total_hours,
    lpad(to_char(SUM(clduration) * 75.68, '$999.99'), 14, ' ')               AS weekly_payment
FROM
         uni.schedclass
    NATURAL JOIN uni.staff
WHERE
        semester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
    AND cltype = 'L'
GROUP BY
    staffid,
    stafffname
    || ' '
    || stafflname,
    cltype
UNION
SELECT
    staffid,
    stafffname
    || ' '
    || stafflname                                                             AS staffname,
    'Tutorial'                                                                AS type,
    COUNT(*)                                                                  AS no_of_classes,
    SUM(clduration)                                                           AS total_hours,
    lpad(to_char(SUM(clduration) * 42.85, '$999.99'), 14, ' ')                AS weekly_payment
FROM
         uni.schedclass
    NATURAL JOIN uni.staff
WHERE
        semester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
    AND cltype = 'T'
GROUP BY
    staffid,
    stafffname
    || ' '
    || stafflname,
    cltype
ORDER BY
    staffid,
    type;

    
/* 7. Given that the payment rate for a tutorial is $42.85 per hour 
and the payment rate for a lecture is $75.60 per hour, 
calculate the total weekly payment (the sum of both tutorial and lecture payments) 
for each staff member in semester 1 2020. 
In the display, include staff id, staff name, total weekly payment for tutorials, 
total weekly payment for lectures and the total weekly payment. 
If the payment is null, show it as $0.00. 
Order the list by increasing order of staff id.*/


    
/* 8. Assume that all units are worth 6 credit points each, 
calculate each student's Weighted Average Mark (WAM) and GPA. 
Please refer to these Monash websites: https://www.monash.edu/exams/results/wam 
and https://www.monash.edu/exams/results/gpa for more information about WAM and GPA respectively. 
Do not include NULL, WH or DEF grade in the calculation.

Include student id, student full name (in a 40 characters wide column headed "Student Full Name"), 
WAM and GPA in the display. Order the list by descending order of WAM then descending order of GPA.
If two students have the same WAM and GPA, order them by their respective id.
*/
