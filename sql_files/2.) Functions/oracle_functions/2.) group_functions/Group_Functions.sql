FUNCTIONS
------------
   USER DEFINED FUNCTIONS
   -----------------------
       CREATE OR REPLACE FUNCTION - PLSQL
   
   INBUILT FUNCTIONS
   --------------------
       SINGLE ROW FUNCTIONS
       -----------------------
       STRING FUNCTIONS
       NULL FUNCTIONS
       DATE FUNCTIONS
       NUMBER FUNCTIONS
       CONVERSION FUNCTIONS
       ANALYTICAL FUNCTIONS
       
       GROUP ROW FUNCTIONS
       -----------------------
       SUM
       MIN
       MAX
       AVG
       COUNT
       
Group Functions:

        GROUP ROW FUNCTIONS RULES
1) group functions ignore null values
2) you cannot select a column along with Group function


SUM      
COUNT
MAX
MIN
AVG

SELECT SUM(salary), COUNT(employees), MAX(salary), MIN(salary) , MAX(hire_date), AVG(salary) FROM employees;

What will be the output?
SELECT 1 + NULL FROM DUAL;

Output will be NULL

Now coming to group functions - 
SUM
MIN
MAX
AVG
COUNT

Taking an example:
We know that commission column in EMPLOYEES table has many NULL values like below
EMPLOYEES
employee_id   First_name    Commission_pct
-------------------------------------------
1                      Bala               100
2                      John          
3                      Suresh        


Requirement:
* Select and show the sum of all the commissions of all employees
Hint: so it is 100 + NULL + NULL

Answer:
SELECT SUM(commission_pct) FROM employees;

Whats will be the output?
option a) 100
option b) NULL

Answer :  b.)

SUM:

select sum(100+null+null) from dual;

select sum (10+20+30) from dual; 

select sum(salary) from employees;

select sum(commission_pct) from employees;
select sum(commission_pct) from employees where COMMISSION_PCT is not null;
select sum(commission_pct) from employees where commission_pct is null;

MIN:

select min(salary) from employees;

MAX:  

select max(salary) from employees;

select max(employee_id) from employees;

select max(first_name) from employees;  



--Requirement: 
--a) calculate and display the total commission earned by all employees in the company  9500
--b) Show me the lowest (MINIMUM) commission in the company   1500
--b) Show me the highest (MAXIMUM) commission in the company  3000
--c) calculate and display the average commission in the company  1583.33
--e) get the count of all employees in the company 6

       emp_id    commission_pct
       -------------------------
row1    100       1500
row2    200       2000
row3    300       3000
row4    400           ---no commission for this employee
row5    500       3000
row6    600           ---no commission for this employee

there are 6 rows - 6 employees

Group row functions act on one or more rows and give one value as output

SELECT (1500 + 2000 + 3000 + 3000 )/6 FROM DUAL;

create table grpwork(employee_id number primary key, employee_name varchar(10), com_pct number); 

insert into grpwork values(101, 'aarthi', 1500); 
insert into grpwork values(102, 'barathi',2000);
insert into grpwork values(103, 'candy',3000);
insert into grpwork values(104, 'donald', null);
insert into grpwork values(105, 'manik',3000);
insert into grpwork values(106, 'nair', null);
commit;

insert into grpwork(employee_id, employee_name, com_pct) values (107,'Shruthi', 1000);
commit;
rollback;

select * from grpwork;

NULL insertion:
INSERT INTO T_GRP_FUNC (emp_id,  ename, commission_pct) VALUES (400, 'Bala',  NULL);
INSERT INTO T_GRP_FUNC (emp_id,  ename, commission_pct) VALUES (400, 'Bala',  '');

select * from grpwork;

INSERT INTO T_GRP_FUNC VALUES (&E_ID, '&ENAME',&ABCDEDDD);

SELECT 100, 'Bala', 1500 FROM DUAL;
SELECT 200, 'Ashok',  2000 FROM DUAL;

SELECT 100, 'Bala', 1500 FROM DUAL
UNION ALL
SELECT 200, 'Ashok',  2000 FROM DUAL;

delete from GRPWORK;
select * from grpwork;
rollback;

commit;
rollback;
-----------------------------------------------------------------------
INSERT INTO GRPWORK (employee_id,  employee_name, com_pct)
SELECT 100, 'Bala', 1500 FROM DUAL
UNION ALL
SELECT 200, 'Ashok',  2000 FROM DUAL;

delete from grpwork;

-- column name in insert syntax is optional
select * from grpwork;

SET operation:
SELECT 100, 'Bala', 1500 FROM DUAL
UNION ALL
SELECT 200, 'Ashok',  2000 FROM DUAL
UNION ALL
SELECT 500, 'Suresh',  3000 FROM DUAL;

---------------------------------------------
multi row INSERT

INSERT INTO grpwork
SELECT 100, 'Bala', 1500 FROM DUAL
UNION ALL
SELECT 200, 'Ashok',  2000 FROM DUAL
UNION ALL
SELECT 500, 'Suresh',  3000 FROM DUAL;


select * from grpwork;
commit;

DELETE FROM GRPWORK;

  

-- REQ:
--a) calculate and display the total commission earned by all employees in the company  9500
  
       select sum(com_pct) from grpwork;   ---- group functions ignores null; -- output: 9500

--b) Show me the lowest (MINIMUM) commission in the company   1500
       select min(com_pct) from grpwork;      

--c) Show me the highest (MAXIMUM) commission in the company  3000
       select max(com_pct) from grpwork;
--c) calculate and display the average commission in the company  1583.33
       select avg(com_pct) from grpwork;  -- it results by ignoring null values
     
    -- so we have to use null functions to convert the null values into some values
       SELECT AVG(nvl(com_pct,0)) FROM GRPWORK;

    -- by default we should give nvl during average calculation
    -- we can avoid nvl only when the column is not null using constraints

--e) get the count of all employees in the company 
       select count(*)  from grpwork;
     
 
 -/ select count(*), count(nvl(com_pct,0)) from grpwork;

  SELECT 100 + nvl(NULL,0) + 500 numb FROM DUAL;
  
  SELECT 100 * nvl(NULL,1) * 500 numb FROM DUAL;

  SELECT (100 + nvl(NULL,0) + 500)/3 numb FROM DUAL;

  SELECT AVG(nvl(com_pct,0)) FROM GRPWORK;

  select sum(nvl(numb, 0)) from dual;

-  desc employees;

  -- for count we can always use *
  -- if we are asked to count in any column we should always use nvl
  -- count of employee_id in below query doesn't not need nvl because we have given data type as not null values

  SELECT COUNT(*), COUNT(employee_id), COUNT(com_pct), COUNT(nvl(com_pct,0))  FROM GRPWORK;

  --------------------------------------------------------------

  SELECT  SUM(com_pct),
       MIN(com_pct),
       MAX(com_pct),
       AVG(NVL(com_pct,0)),
       COUNT(NVL(com_pct,0))
FROM grpwork;

  -- REQ:

    fetch the count of employees in dept_id 50
       select count(*) from employees where DEPARTMENT_ID = 50;

      --using group functions on string column
SELECT /* SUM(first_name) */
       MIN(first_name),
       MAX(first_name),
       /*AVG(NVL(first_name,0)),
       COUNT(NVL(first_name,0))*/
FROM employees;

select min(first_name), max(first_name) from employees;

--using group functions on string column
SELECT  --SUM(first_name), --will not work wiTh string
       MIN(first_name),
       MAX(first_name),
       --AVG(NVL(first_name,0)), --will not work wirh string
       COUNT(NVL(first_name,0))
FROM employees;

--using group functions on string column
SELECT  SUM(hire_date), --will not work wiTh string
       MIN(hire_date),
       MAX(hire_date),
       AVG(NVL(hire_date,0)), --will not work wirh date
       COUNT(NVL(hire_date,0)) --will not work wirh date
FROM employees;      

select MIN(hire_date) from employees; 
select MIN(hire_date), MAX(hire_date) from employees;
select MAX(hire_date) from employees;
select AVG(NVL(hire_date,0)) from employees;
select COUNT(NVL(hire_date,0)) from employees;

--STDDEV
/*
mathematical explanation
The Standard Deviation is a measure of how spread out numbers are
a quantity expressing by how much the members of a group differ from the mean value for the group
*/
SELECT STDDEV(commission_pct) FROM employees;

--VARIANCE
/*
The variance measures how far each number in the set is from the mean
the fact or quality of being different, divergent, or inconsistent.
*/
SELECT VARIANCE(commission_pct) FROM employees;


2) you cannot select a column along with Group function

  select employee_id, max(salary) from employees;

 select employee_id from employees;

SELECT  MAX(commission_pct) FROM employees;

select employee_id, MAX(commission_pct) FROM employees; --1 ORA-00937: not a single-group group function 

-- max function is a group function and employee_id is not a grp function so it results error because grp function takes multiple values and results one output


SELECT  SUM(DISTINCT com_pct) s, --output will change
       MIN(DISTINCT com_pct) mi,
       MAX(DISTINCT com_pct) ma,
       AVG(DISTINCT NVL(com_pct,0)) a, --output will change
       COUNT(DISTINCT NVL(com_pct,0)) c --output will change
FROM GRPWORK;

SELECT  SUM(ALL com_pct) s, --output will change
       MIN(ALL com_pct) mi,
       MAX(ALL com_pct) ma,
       AVG(ALL NVL(com_pct,0)) a, --output will change
       COUNT(ALL NVL(com_pct,0)) c --output will change
FROM GRPWORK;

select  SUM(DISTINCT com_pct) s from GRPWORK;--output will changes
select MIN(DISTINCT com_pct) mi from GRPWORK;
select MAX(DISTINCT com_pct) ma from GRPWORK;
select AVG(DISTINCT NVL(com_pct,0)) a from GRPWORK; --output will change
select COUNT(DISTINCT NVL(com_pct,0)) c from GRPWORK;

select count(nvl(com_pct,0)) from grpwork;
select avg(nvl(com_pct,0)) from grpwork;

select 6500/4 from dual;
select * from grpwork;


create table stud_details 
(
  student_id int primary key,
  student_name varchar(20),
  student_fees int 
)

insert into stud_details values (1001, 'Ashok', 20000);

insert into stud_details values (1002, 'Bala', 30000)
union all
insert into stud_details values (1004, 'Candid', 30000);
commit;
rollback;

insert into stud_details values (1004, 'Ser Davos', 40000);
insert into stud_details values (1005, 'Brandon', 50000);
rollback;


select * from stud_details;

select 101, 'abc', 2000 from dual
UNION ALL
select 102, 'xyz', 3000 from dual;


SELECT 100, 'Bala', 1500 FROM DUAL
UNION ALL
SELECT 200, 'Ashok',  2000 FROM DUAL;

-------------------------------------------------------------------------------------------
create table test_val (s_id number primary key, test1 number, test2 number, test3 number);

insert into test_val values (1, 50,80,45);
insert into test_val values (2, 70,40,90);

select * from test_val;

SQL requirement:
Fetch the highest and lowest marks of students like below

Expected output:

S_id    highest    lowest
--------------------------------------
1          80             45
2          90             40


SELECT s_id, Greatest(test1, test2, test3) highest, Least(test1, test2, test3) lowest from TEST_VAL;
