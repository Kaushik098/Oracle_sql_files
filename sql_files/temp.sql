S_id  Test1  Test2   Test3
-----------------------------------------
1         50        80       45
2         70        40       90


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

--------------------------------------------------------------------


3) Find the children of regions using SELF JOIN

select distinct uc.table_name
from user_constraints uc JOIN user_constraints cc
on (uc.R_CONSTRAINT_NAME = cc.CONSTRAINT_NAME)
where cc.table_name = 'REGIONS'
and cc.CONSTRAINT_TYPE = 'P';


---------------------------------------------------------------------


2) nested functions
👇👇👇

SELECT CONCAT ('RESULT IS :  ', CASE DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) 
WHEN 'EVEN' THEN 'output is even' ELSE 'output is odd' END ) result FROM DUAL;

SUBSTR (' Good afternoon', 2, 4)  -- Go

CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!') -- Go night !!!!!

TRAILING '!' FROM (CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!')) -- Go night
 
REPLACE (TRIM (TRAILING '!' FROM (CONCAT (SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day') -- Go day

UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day')))  GO DAY 

LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*') -- **********GO DAY

LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')) -- 16

MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2)  -- 16%2 = 0

DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) -- EVEN

CONCAT ('RESULT IS :  ', CASE DECODE ( MOD (LENGTH ( LPAD (UPPER (TRIM (REPLACE (TRIM (TRAILING '!' FROM (CONCAT (
SUBSTR (' Good afternoon', 2, 4), ' night !!!!!'))), 'night','day'))), 10, '*')), 2), 0, 'EVEN', 1, 'ODD' ) 
WHEN 'EVEN' THEN 'output is even' ELSE 'output is odd' END ) result   -- Output is even


-----------------------------------------------------------------------------------------------


4) Analyse last plsql block

PLSQL:

Plsql objects
- procedures
- functions
- packages
- triggers

For example,


Create a table T_1 with 2 columns and those 2 columns should be DATE...

drop table T_1;

CREATE TABLE T_1
(
col1 DATE,
col2 DATE
);

Create another table T_2 with 2 columns. One is DATE and another number

CREATE TABLE T_2
(
col1 DATE,
col2 NUMBER
);

so for this requirement -
fetch the tables having "ONLY" date column
Answer is - T_1

select table_name from USER_TAB_COLUMNS
group by table_name 
having sum(decode(DATA_TYPE,'DATE',1,0)) = count(*);

So you have to fetch from USER_TAB_COLUMNS
--------

 Procedure

create or replace procedure p_test (p_in_emp_id IN number,
                                    p_out_sal out number,
                                    p_out_dept_name out varchar2)
as
  v_dept_id number;
begin 
  select salary, department_id,
  into p_out_sal, V_DEPT_ID
  from EMPLOYEES
  where employee_id = p_in_emp_id;
  
  select department_name
  into p_out_dept_name 
  from departments 
  where department_id = v_dept_id;
  
END;
/      








--------------------------------------------------------------------------------------------------
7.) Practice Subqueries


-------------------------------------------------------------------------------------------------

1.) 1) Fetch the tables having only DATE column
INTERSECT
JOIN
SUM(DECODE(
COUNT(DECODE(


select table_name
from USER_TAB_COLUMNS
group by table_name
having sum(decode(DATA_TYPE, 'DATE',1,0)) = count(*);

select table_name
from USER_TAB_COLUMNS
group by table_name
having count(decode(DATA_TYPE, 'DATE',1,null)) = count(*);

select table_name, sum(decode(DATA_TYPE, 'DATE', 1,0))
from USER_TAB_COLUMNS
group by table_name  
intersect 
select table_name, count(decode(DATA_TYPE,'DATE',1, null)) 
from USER_TAB_COLUMNS 
group by table_name

select * from user_tab_columns where table_name IN ('JOB_HISTORY','DATE_VALUES')
select * from user_tab_columns;
, sum(Decode(DATA_TYPE,'DATE',1,0)) count_of_data_types, count(*) count_of_columns 