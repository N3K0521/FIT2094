-- Task 3
-- (3)
select * from custbalance;
-- (5)
select * from custbalance;

-- Task 4
-- (2)
update custbalance
set cust_bal = 100
where cust_id = 2;
commit;

-- Task 5
-- (2)
update custbalance
set cust_bal = 125
where cust_id = 1;
commit;
select * from custbalance;

-- Task 6
-- 1) update cust_id = 2
-- 2) update cust_id = 1

-- Task 6
-- (2)
update custbalance set cust_bal = 5
where cust_id = 2;

update custbalance set cust_bal = 15
where cust_id = 1;