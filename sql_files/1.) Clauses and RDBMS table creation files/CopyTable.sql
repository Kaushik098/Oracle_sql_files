CREATE TABLE myemp1 AS SELECT * FROM employees;

select * from myemp1;

CREATE TABLE myemp2 AS SELECT * FROM employees
WHERE 1 = 2;

select * from myemp2;

CREATE TABLE emp3 as
SELECT employee_id, first_name from employees;

select * from emp3;

CREATE TABLE emp4 as
Select employee_id eid, first_name fname from employees;

Check the structure of table and also rows for all the new tables created

CREATE TABLE emp5 as
Select employee_id, salary + 2000 salary FROM employees;

select * from emp5;

CREATE TABLE emp6 as
SELECT 1 id, 'bala' name from dual
UNION ALL
SELECT 2 id, 'Sri' name from DUAL
UNION ALL
SELECT 3 id, 'john' name from dual;

select * from emp6;

