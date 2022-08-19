create table custbalance(
    cust_id number(4),
    cust_bal number(4),
    constraint custbalance_pk primary key (cust_id)
);

insert into custbalance values (1,100);
insert into custbalance values (2, 200);
commit;

select * from custbalance;

-- Task 3
-- (1)
update custbalance
set cust_bal = 110
where cust_id = 1;

-- (2)
select * from custbalance;

-- (4)
commit;
select * from custbalance;

-- Task 4
-- (1)
update custbalance
set cust_bal = 150
where cust_id = 2;
select * from custbalance;
-- commit
commit;

-- Task 5
-- (1)
update custbalance
set cust_bal = 175
where cust_id = 2;
commit;
select * from custbalance;

-- Task 6
-- 1) update cust_id = 1
-- 2) update cust_id = 2
--The order of operations
--1) T1 (1)
--2) T2 (1)
--3) T1 (2) --> T1 wait T2 --> cancelled by Oracle --> Rollback
--4) T2 (2) --> T2 wait T1

-- Task 6
-- (1)
update custbalance set cust_bal = 10
where cust_id = 1;

update custbalance set cust_bal = 10
where cust_id = 2;