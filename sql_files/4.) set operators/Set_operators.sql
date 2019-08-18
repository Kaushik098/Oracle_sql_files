
CREATE TABLE setTest1 ( id INT PRIMARY KEY, person_name VARCHAR(20));
INSERT INTO setTest1(id, person_name) VALUES (100, 'Adam');
INSERT INTO setTest1(id, person_name) VALUES (101, 'Zair');

CREATE TABLE setTest2 ( id INT PRIMARY KEY, person_name VARCHAR(20));
INSERT INTO setTest2 (id, person_name) VALUES (100, 'Adam');
INSERT INTO setTest2 (id, person_name) VALUES (102, 'Samir');

-- Set operators 
   --Set operators means one top of another.


   a.) UNION
   b.) UNION ALL 
   c.) INTERSECT
   d.) MINUS


  Consider two tables with some entries. 
  Table 1 :  adam
             zair
  Table 2 :  adam
             samir

 * UNION : It results only the unqiue values and it does not return the dublicate vales

  Example
SELECT * FROM setTest1
UNION  
SELECT * FROM setTest2;   
  
 * UNION ALL: It acts similar as union set. The difference in union all set is that it will return duplicate values also.

Example:
SELECT * FROM setTest1
UNION ALL 
SELECT * FROM setTest2;

  * INTERSECT : it return only the common values in comparing tables

SELECT * FROM setTest1
INTERSECT 
SELECT * FROM setTest2;

  * MINUS:  It compares tables and returns only the table1 unique values

SELECT * FROM setTest1
MINUS
SELECT * FROM setTest2;

--------------------------------------------------------------------------------------

/*
When you combine 2 or more tables using SET operators
Duplicate rows are automatically eliminated in all SET operators except in UNION ALL.
The output is sorted in ascending order by default in all SET operators except in UNION ALL.
*/


--input data
TABLE_1
A
C
D
B
A

TABLE_2
D
E
D
C


table1 union all table 2
A
C
D
B
A
D
E
D
C

Table2 union all table1
D
E
D
C
A
C
D
B
A


union:

table1 union table2
Step1:
A
C
D
B
A
D 
E
D 
C

Step2 : remove duplicates
a d b e c
Step3 : order by (Ascending order)
a b c d e 

c.) intersect 

table 1 intersect table 2:
C
D

table 2 intersect table 1:
C 
D    


d.) MINUS

Table 1 minus table 2
A
B

Table 2 minus Table 1
E

------------------------------------------------
DROP TABLE TABLE_1;
CREATE TABLE TABLE_1
(
 col CHAR(1)
);

select * from table_1;
INSERT INTO TABLE_1 VALUES ('A');
INSERT INTO TABLE_1 VALUES ('C');
INSERT INTO TABLE_1 VALUES ('D');
INSERT INTO TABLE_1 VALUES ('B');
INSERT INTO TABLE_1 VALUES ('A');
COMMIT;

--pin it
SELECT * FROM TABLE_1;
-------------------------------------------------------------
DROP TABLE TABLE_2;
CREATE TABLE TABLE_2
(
 col CHAR(1)
);

INSERT INTO TABLE_2 VALUES ('D');
INSERT INTO TABLE_2 VALUES ('E');
INSERT INTO TABLE_2 VALUES ('D');
INSERT INTO TABLE_2 VALUES ('C');
COMMIT;
   
   SELECT * FROM TABLE_2;

union all:

select col from table_1
union all 
select col from table_2;
  
  
select col from table_2
union all 
select col from table_1;
  


union:

select col from table_1
union
select col from table_2;

select col from table_2
union  
select col from table_1;


intersect:

select col from table_1
intersect 
select col from table_2;

select col from table_2
intersect 
select col from table_1;

minus:

select col from table_1
minus 
select col from table_2;

select col from table_2
minus 
select col from table_1;


RAMESH
MAHESH
BABU
KARTHIK
BALAKUMAR
ASHOK

select 'RAMESH' name from DUAL
union all 
select 'Mahesh' name from DUAL
union ALL
select 'Babu' name from DUAL
union all 
select 'Karthik' name from DUAL
union all 
select 'Balakumar' name from DUAL
union all 
select 'Ashok' name from DUAL;


select 'RAMESH' name from DUAL
union  
select 'Mahesh' name from DUAL
union 
select 'Babu' name from DUAL
union  
select 'Karthik' name from DUAL
union  
select 'Balakumar' name from DUAL
union 
select 'Ashok' name from DUAL
union 
select 'Ashok' name from DUAL;

SUB Query + Set operators:

SELECT * FROM
(
  select 'RAMESH' name , 'Kumar' lastname from DUAL
union all 
select 'Mahesh' name from DUAL
union ALL
select 'Babu' name from DUAL
union all 
select 'Karthik' name from DUAL
union all 
select 'Balakumar' name from DUAL
union all 
select 'Ashok' name from DUAL
);

SELECT * FROM
(
 select * from employees
);


--SET operator rules

Rule 1 :   
 --1) The expressions in the SELECT lists must match in number

SELECT 'RAMESH' stu_name FROM DUAL  --first query
UNION ALL
--2 columns
SELECT 'MAHESH' stu_name, 1 id FROM DUAL; --second query

Error:   ORA-01789: query block has incorrect number of result columns 

-- another eg:

-- if req came like they need an dummy/0/null id, we can write a query like follows:
 
SELECT 'RAMESH' stu_name, 1 id FROM DUAL  --first query
UNION ALL
SELECT 'SURESH' student, null id FROM DUAL --second query
ORDER BY stu_name;
-----------------------------------------------------------------
Rule 2 :
The data type of each column in the second query must match the data type of its corresponding column in the first query

SELECT 'RAMESH' stu_name FROM DUAL  --first query
UNION ALL
SELECT 1 id FROM DUAL; --second query

Error: 1 ORA-01790: expression must have same datatype as corresponding expression.
 ---------------------------------------------------------------------------
Rule 3:
 ORDER BY clause can appear only at the very end of the statement

SELECT 'RAMESH' stu_name FROM DUAL
ORDER BY stu_name--first query
UNION ALL
SELECT 'SURESH' stu_name FROM DUAL --second query
ORDER BY stu_name;


SELECT 'RAMESH' stu_name FROM DUAL
--first query
UNION ALL
SELECT 'SURESH' stu_name FROM DUAL --second query
ORDER BY stu_name;

--ordering happens at the end. So the order by clause inbetween the set operators results error.

-----------------------------------------------------------------------------------------------------------

Changing union set operators order by in descending.

select 'Anil' name from DUAL
union 
select 'Bharath' name from dual
order by name desc;


----------------------------------------------------------------------------

Mix of set operators:

1.) Set operators functions from top to bottom.

SELECT 1 id, 'Bala' student FROM DUAL
UNION
SELECT 1 id, 'Suresh' student FROM DUAL
UNION ALL
SELECT 1 id, 'Bala' student FROM DUAL;

step 1 : 'Bala' 'Suresh'
step 2:  'Bala' 'Suresh' 'Bala'

output: 'Bala' 'Suresh' 'Bala'


2.) changing the order of execution of set operators:

SELECT 1 id, 'Bala' student FROM DUAL
UNION
(
SELECT 1 id, 'Suresh' student FROM DUAL
UNION ALL
SELECT 1 id, 'Bala' student FROM DUAL
);


insert into students_set
(
select 'RAMESH' name from DUAL
union all 
select 'Mahesh' name from DUAL
union ALL
select 'Babu' name from DUAL
union all 
select 'Karthik' name from DUAL
union all 
select 'Balakumar' name from DUAL
union all 
select 'Ashok' name from DUAL;
);


--14/06/2019
a.) Category 1:

create table employees_table1 ( id integer, name varchar2(10), salary integer);

insert into employees_table1 (id, name, salary) values (1, 'aaa', 500);
insert into employees_table1 (id, name, salary) values (2, 'bbb', 500);

select * from employees_table1;

create table employees_table1_retired ( id integer, name varchar2(10), salary integer);

insert into employees_table1_retired (id, name, salary) values (9, 'ccc', 1000);

select * from employees_table1_retired;

SELECT SUM(tot_sal)
FROM
(
SELECT SUM(salary) tot_sal FROM employees_table1
UNION
SELECT SUM(salary) tot_sal FROM employees_table1_retired
);


select * from EMPLOYEES_TABLE1;
select * from employees_table1_retired;

drop table employees_table1_retired;

--------------------------------------------------------------------------------------

Category 2

create table employees_table2 ( id integer, name varchar2(10), salary integer);

insert into employees_table2 (id, name, salary) values (1, 'aaa', 500);
insert into employees_table2 (id, name, salary) values (2, 'bbb', 500);
insert into employees_table2 (id, name, salary) values (3, 'ccc', 1000);

create table employees_table2_retired ( id integer, name varchar2(10), salary integer);

insert into employees_table2_retired (id, name, salary) values (1, 'aaa', 1000);


select * from employees_table2;
select * from employees_table2_retired;


SELECT SUM(tot_sal)
FROM
(
SELECT SUM(salary) tot_sal FROM employees_table2
UNION
SELECT SUM(salary) tot_sal FROM employees_table2_retired
);
