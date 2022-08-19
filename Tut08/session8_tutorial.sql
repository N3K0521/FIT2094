-- select * from uni.staff;
-- desc uni.unit;

desc uni.student;

-- List all students and their details
select
    *
from
    uni.student
order by
    studid;

select
    tochar(sysdate, 'dd/mm/yyyy hh24:mi:ss') as server_date
from
    dual;

select
    tochar(sysdate, 'dd/mm/yyyy hh24:mi:ss') as server_date_plus_10_hrs
from
    dual;

-- list the student's details for those students who have a surname starting with the letter "s".
select
    STUDID ,
    STUDFNAME as firstname,
    STUDLNAME as lastname,
    STUDDOB ,
    STUDADDRESS ,
    STUDPHONE ,
    STUDEMAIL  
from 
    uni.student;
where 
    studlname like 'S%'
order by
    firstname;