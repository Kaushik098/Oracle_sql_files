ORDER OF excecution

FROM
WHERE
SELECT
ORDER BY 

 
1.) Fetch the employees in job id SA_REP
  SELECT * FROM jobs WHERE job_id = 'SA_REP';

2.)	Fetch the employees in job_id SA_REP, MK_REP, PR_REP
  SELECT * FROM jobs WHERE job_id in ('SA_REP', 'MK_REP', 'PR_REP');

3.)	Fetch the employees in job_id ending with last 3 letters REP (meaning - fetch all the representatives in company)
   SELECT * FROM jobs WHERE job_id LIKE '%REP';

4.)	Fetch employees getting salary more than 5000
   SELECT * FROM employees WHERE salary > 5000;

5.)	Fetch the employees with first name starting with Pa
  SELECT * FROM employees WHERE first_name LIKE 'Pa%';

6.)	Fetch the employees joined on '07-06-02'
   SELECT * FROM employees WHERE HIRE_DATE = '07-June-2002';

7.)	Fetch the employees joined after '07-06-02'
  SELECT * FROM employees WHERE HIRE_DATE > '07-June-2002';

8.)	Fetch the employees having numbers 123 in their phone_number 
   SELECT * FROM employees WHERE PHONE_NUMBER LIKE '%123%';

9.)	Fetch the employees joined in year 06 (2006)
   SELECT * FROM employees WHERE HIRE_DATE BETWEEN '01-JAN-2006' AND '31-DEC-2006';

10.)	Fetch the employees getting salary more than 3000 and getting commission
    SELECT * FROM employees WHERE salary > 3000 AND COMMISSION_PCT IS NOT NULL;

11.)	fetch employees joined in 2002
    SELECT * FROM employees WHERE HIRE_DATE BETWEEN '01-JAN-2002' AND '31-DEC-2002';

12.)	fetch employees joined in 2002 and getting salary > 8000
   SELECT * FROM employees WHERE HIRE_DATE BETWEEN '01-JAN-2002' AND '31-DEC-2002' AND salary > 3000;

13.) 	fetch employees joined in 2002 and getting salary > 8000 and are REPs (job_id column)
    SELECT * FROM employees WHERE HIRE_DATE BETWEEN '01-JAN-2002' AND '31-DEC-2002' AND salary > 8000 AND job_id LIKE '%REP';

14.) fetch employees reporting to manager id 100
    SELECT * FROM employees WHERE MANAGER_ID = 100;   

15.)	fetch employees reporting to manager id 100 and 101
    SELECT * FROM employees WHERE MANAGER_ID IN (100,101);

16	fetch employees reporting to manager id 100 and 101 and having 'e' in their first_names
    SELECT * FROM employees WHERE manager_id IN (100,101) AND first_name LIKE 'E%';

17	fetch the employees not getting commission and salary > 3000
    SELECT * FROM employees WHERE commission_pct IS NULL AND salary > 3000;

--18	fetch the employees in department_id 80 and getting salary = 10000 and under manager_id 146. Rule is - you should not use AND keyword in your QUERY
    SELECT * FROM employees WHERE DEPARTMENT_ID||SALARY||manager_id = 8010000146;

19	Fetch all the employees but there is A condition - if he gets commission then fetch only those who have salary > 10000. If he doesnot gets commission then no need to check his salary, just fetch him
    SELECT * FROM employees 
    WHERE (COMMISSION_PCT IS NOT NULL AND salary > 10000)
    OR ( COMMISSION_PCT IS NULL);  

20	fetch employees in department id 80 or 50
    SELECT * FROM employees WHERE department_id = 80 OR department_id = 50;

    -- note 
      fetch employees in department id 80 or 50
   fetch employees in department id 80 and 50
   SELECT * FROM employees WHERE department_id = 80 OR department_id = 50;
   -- note
     SELECT * FROM employees WHERE department_id = 80 OR department_id = 50;
    SELECT * FROM employees WHERE department_id in ( 80,50);


21	fetch employees whose manager id value is greater than department id value (example - mgr id 108 > dept id 100)
    SELECT * FROM employees WHERE manager_id > department_id;

22	fetch the employees where the employee id value is one number more than manager id. (Example - emp id 101 mgr id 100)
    SELECT * FROM employees WHERE employee_id = (manager_id + 1);

23	fetch the employees who have salary not in the range 10000 and 20000 and in the range 5000 and 24000
    SELECT * FROM employees WHERE (salary NOT BETWEEN 10000 AND 20000) AND (salary BETWEEN 5000 AND 24000) 

24	fetch the employees whose salary is square of their department id (example - salary 2500 is square of department id 50)
     SELECT * FROM employees WHERE salary = department_id*department_id;

25	fetch the cities having word South and order the output based on location_id in desc order (LOCATIONS table)
    SELECT * FROM locations WHERE city LIKE '%South%' 
    ORDER BY location_id DESC;

26	fetch the locations without postal code and also the locations without state_province value. Order the output based on country id asc
    SELECT * FROM locations 
    WHERE POSTAL_CODE IS NULL AND STATE_PROVINCE IS NULL
    ORDER BY COUNTRY_ID;

    SELECT location_id, street_address, 

27	fetch the locations without postal code and also the locations without state_province value. Order the output based on postal code asc and push NULLS first
    

28	fetch the employees having even employee_id. Clue - u got a function similar to POWER, SQRT
29	fetch the employees ordered by job id asc and then by salary desc and then by first_name desc
30	fetch the salary,commission and total salary details for all reps. Order the output based on total salary in desc order
31	fetch the employees in department id 80. If they are under manager 145 then fetch only those with salary > 8000 or hire date is in 2005. 
    If they are under manager 100 then fetch those with salary > 13000 and hire date in 2005. Order the output based on first name


    retrieve all employees in department_id 90
     SELECT * FROM employees WHERE DEPARTMENT_ID = 90;
     SELECT * FROM EMPLOYEES;


    -----------------------------------------------------------------------------------------------------

      --WHERE

--Requirement: retrieve all employees in department_id 90
SELECT * FROM employees
WHERE department_id = 90; --LHS = RHS

--Requirement: retrieve all employees in department_id 100
SELECT * FROM employees
WHERE manager_id = 100; --LHS = RHS

--Requirement: retrieve all employees in hire_Date 30-OCT-05
SELECT * FROM employees
WHERE hire_date = '30-OCT-05'; --LHS = RHS

--you can also write like
SELECT * FROM employees
WHERE 90 = department_id; --LHS = RHS

--try in lab--------
--Requirement: retrieve all employees in department_id 100
SELECT * FROM employees
WHERE 100 = manager_id; --LHS = RHS

--Requirement: retrieve all employees in hire_Date 30-OCT-05
SELECT * FROM employees
WHERE '30-OCT-05' = hire_date; --LHS = RHS
--try in lab----xxx----


--------------------------------------------------------------------------------

--we will learn using DUAL
SELECT 1 ID FROM DUAL
WHERE 1 = 1; --LHS = RHS

--what will be the output?
SELECT 1 ID FROM DUAL
WHERE 1 = 2; --LHS <> RHS

--what will be the output?
SELECT 1 ID FROM DUAL
WHERE 1 < 2; --LHS = RHS

--what will be the output?
SELECT 1 ID FROM DUAL
WHERE 2 > 1; --LHS = RHS

SELECT * FROM DUAL
WHERE 1 > 1;

SELECT * FROM DUAL
WHERE 1 >= 1;

SELECT * FROM DUAL
WHERE 1 <> 2;

--what will be the output?
SELECT 1 FROM DUAL
WHERE 'bala' = 'Bala';

SELECT 1 FROM DUAL
WHERE 3 BETWEEN 1 AND 5;

SELECT 1 FROM DUAL
WHERE 1 BETWEEN 1 AND 5;

SELECT 1 FROM DUAL
WHERE 5 BETWEEN 1 AND 5;

SELECT 1 FROM DUAL
WHERE 6 BETWEEN 1 AND 5;

--Slide 8
--Comparison Operators
SELECT * FROM DUAL
WHERE 4 IN (1,2,3,4,5);

SELECT * FROM DUAL
WHERE 6 IN (1,2,3,4,5);

SELECT * FROM DUAL
WHERE 'Bala' IN ('Suresh','bala','Mahesh');

SELECT * FROM DUAL
WHERE 'Bala' IN ('Suresh','Bala','Mahesh');

SELECT * FROM DUAL
WHERE 'Bala' IN ('Suresh','bala','Mahesh','Bala');

SELECT 1 FROM DUAL
WHERE 'Bala' IN ('Suresh','bala','Mahesh','Bala','Bala');
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--what will be the output?
--correct it
SELECT first_name, job_id, department_id
FROM   employees
WHERE  first_name = 'donald';

SELECT * FROM employees WHERE first_name = 'donald';

--try these in lab
SELECT last_name, salary
FROM   employees
WHERE  salary <= 3000 ;

SELECT last_name, salary
FROM   employees
WHERE  salary BETWEEN 2500 AND 3500;

SELECT employee_id, last_name, salary, manager_id
FROM   employees
WHERE  manager_id IN (100, 101, 201) ;

--NULL - dangerous guy
--Requirement: fetch the employees who do not get commission
--what will be the output?
SELECT * FROM employees
WHERE commission_pct = NULL;

SELECT * FROM employees;

SELECT * FROM employees
WHERE commission_pct IS NULL;

--Requirement: fetch the employees who get commission
SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

--check any other column in employees table with NULL value and use it in WHERE condition
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--LIKE
/*
Use the LIKE operator to perform wildcard searches of valid search string values.
Search conditions can contain either literal characters or numbers:
% denotes zero or many characters.
_ denotes one character.
*/
DROP TABLE t_students;
CREATE TABLE t_students
(
  stu_name VARCHAR2(100)
);


Insert into T_STUDENTS (STU_NAME) values ('RAMESH');
Insert into T_STUDENTS (STU_NAME) values ('MAHESH');
Insert into T_STUDENTS (STU_NAME) values ('BABU');
Insert into T_STUDENTS (STU_NAME) values ('KARTHIK');
Insert into T_STUDENTS (STU_NAME) values ('BALAKUMAR');
Insert into T_STUDENTS (STU_NAME) values ('ASHOK');

COMMIT;

--pin it
SELECT * FROM t_students;


--1.Ending with SH
SELECT stu_name FROM t_students
WHERE stu_name LIKE '%SH';

SELECT stu_name FROM t_students
WHERE stu_name LIKE '%sh';
--------------------------------------------------------------------------------
--2.Starting with BA
SELECT stu_name FROM t_students
WHERE stu_name LIKE 'BA%';
--------------------------------------------------------------------------------
--3.Starting with BA but having only 4 letters
SELECT stu_name FROM t_students
WHERE stu_name LIKE 'BA__';
--------------------------------------------------------------------------------
--4.having ES in middle
SELECT stu_name FROM t_students
WHERE stu_name LIKE '%ES%';
--------------------------------------------------------------------------------
--5.having AR in the middle
SELECT stu_name FROM t_students
WHERE stu_name LIKE '%AR%';

SELECT stu_name FROM t_students
WHERE stu_name LIKE '%KA%';

--------------------------------------------------------------------------------
--6.having AR only in the second and third position
SELECT stu_name FROM t_students
WHERE stu_name LIKE '_AR%';

--try these in lab
SELECT	first_name
FROM 	employees
WHERE	first_name LIKE 'S%' ;

SELECT last_name
FROM   employees
WHERE  last_name LIKE '_o%' ;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Logical Operators

--AND operator - Returns TRUE if both component conditions are true

--we have seen this already
SELECT * FROM DUAL
WHERE 1 = 1;

--adding more conditions using AND logical operator
SELECT * FROM DUAL
WHERE 1 = 1 AND 1 =1;  --LHS = RHS

--What will be the output?
SELECT * FROM DUAL
WHERE 1 = 1 AND 'bala' = 'Bala';

--What will be the output?
SELECT * FROM DUAL
WHERE 1 = 1 
AND 'Bala' = 'Bala'
AND (10/2) = 5
AND '01-JAN-2016' = '01-JAN-2016'
AND (5+5+6) - 1 = (30/2);

--What will be the output?
SELECT * FROM DUAL
WHERE 'HI HELLO' = 'HI'||' HELLO';

--What will be the output?
SELECT * FROM DUAL
WHERE dummy = dummy; --LHS = RHS

SELECT * FROM employees
WHERE first_name = first_name; --LHS = RHS
--you will get all the rows

SELECT * FROM DUAL
WHERE dummy = 'X';

SELECT * FROM dual 
WHERE dummy = 'Y';

--NULL - dangerous guy
--what will be the output?
SELECT * FROM DUAL
WHERE NULL = NULL;

--this will work
SELECT * FROM DUAL
WHERE NULL IS NULL;

SELECT * FROM DUAL
WHERE NULL + NULL = NULL + NULL;

SELECT * FROM DUAL
WHERE 1 + NULL = NULL + 1;
--one NULL is not equal to another NULL

--what will be the output?
SELECT * FROM DUAL
WHERE 1 = 1 
AND 'Bala' = 'Bala'
AND (10/2) = 5
AND '01-JAN-2016' = '01-JAN-2016'
AND (5+5+6) - 1 = (30/2)
AND 1 = NULL;

--using AND operator in employees table
--Requirement: Fetch the employees in department 100 AND getting salary > 15000
SELECT * FROM employees
WHERE department_id = 100
  AND salary > 15000;
  
--Requirement: Fetch/Select the employees in department 100 and who do not get any commission
SELECT * FROM employees
WHERE department_id = 100
  AND commission_pct = NULL;
  
SELECT * FROM employees
WHERE department_id = 100
  AND commission_pct IS NULL;
--try NOT NULL
--------------------------------------------------------------------------------
--OR logical operator - Returns TRUE if either component condition is true

--What will be the output
SELECT 'HI' FROM DUAL
WHERE 1 =1 OR 29 = 1;

SELECT 'HI' FROM DUAL
WHERE 1+ 1 = 1 + 0 OR 29 + 1 = 32 - 2 + 1;


SELECT 'HI' FROM DUAL
WHERE 1+ 1 = 2 OR 29 + 1 = 32 - 2 + 1;

--for easy understanding, you can give brackets
SELECT 'HI' FROM DUAL
WHERE (1+ 1 = 1 + 1) OR (29 + 1 = 32 - 2 + 1);

--try OR with employees table with requirement of your own
--------------------------------------------------------------------------------
--combining logical operators
--AND OR 
--theres is rules of precedence
--slide 20
--OR comes after AND

--employees table
--pin and check the output
SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id = 'SA_REP'
OR     job_id = 'AD_PRES'
AND    salary > 15000;

SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id = 'AD_PRES'
OR     job_id = 'SA_REP'
AND    salary > 15000;


  SELECT * FROM employees;
--rewrite it
--you just added brackets and the output changed
--becareful with brackets
SELECT last_name, job_id, salary
FROM   employees
WHERE  (job_id = 'SA_REP'
OR     job_id = 'AD_PRES')
AND    salary > 15000;

  
--------------------------------------------------------------------------------
--NOT operator - Returns TRUE if the condition is false

--We have seen this example previously
--for single value
SELECT * FROM DUAL
WHERE 1 <> 2;

--or, you can write like
SELECT * FROM DUAL
WHERE 1 != 2;

--Multiple values - use NOT IN Logical operator
SELECT * FROM DUAL
WHERE 'Jinesh' NOT IN ('Suresh','bala','Mahesh','Bala');
--Jinesh is not in RHS, so LHS = RHS hence TRUE

--using NOT in LIKE

--select and pin
SELECT * FROM t_students;

--Requirement: Fetch the students not having letter BA anywhere in their name
SELECT stu_name FROM t_students
WHERE stu_name NOT LIKE '%BA%';

--What will be the output?
SELECT 1 FROM DUAL
WHERE 0 NOT BETWEEN 1 AND 5;
--NOT will do the opposite

--try in lab - the above examples using employees table

--employees - example
SELECT last_name, job_id
FROM   employees
WHERE  job_id 
       NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--ORDER BY
--pin the output
SELECT * FROM t_students;

--in order to get the data in ASC or DESC order, you have to give ORDER BY clause
--specify the column name in ORDER BY
SELECT * FROM t_students
ORDER BY stu_name ASC;

--default ordering is ASC
--try without giving ASC
SELECT * FROM t_students
ORDER BY stu_name;-- ASC;

--try descending
SELECT * FROM t_students
ORDER BY stu_name DESC;

--You can control NULLs like
SELECT * FROM employees
ORDER BY first_name NULLS FIRST;

SELECT * FROM employees
ORDER BY first_name DESC NULLS LAST;

SELECT * FROM employees
ORDER BY first_name NULLS LAST;

--Requirement: Retrieve all the employees data
SELECT * FROM employees;

--Requirement: Retrieve all the employees data
--Show the output in order of first_name
--like A B C D ... Z
SELECT * FROM employees
ORDER BY first_name;
--check the output - rows with NULL first_name will be in the last

--try desc
SELECT * FROM employees
ORDER BY first_name DESC;
--NULLs will come first

--try giving different columns in ORDER BY - use ASC and DESC
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--Requirement: Fetch all the employees, all the columns
--and then show me the employees ordered by hire_Date descending and then order by first_name asc
--like
/*
01-DEC-2015 A
01-DEC-2015 B
01-DEC-2015 C

20-JAN-2015 F
20-JAN-2015 G
20-JAN-2015 H
*/

SELECT * FROM employees
ORDER BY hire_date DESC, first_name;

--try ordering using different columns - string columns, number columns, date columns

--it is not necessary that, the columns in ORDER by should be made available in SELECT clause
SELECT employee_id, first_name
FROM employees
ORDER BY hire_Date;


--Order of Execution of CLAUSES
--FROM
--WHERE
--SELECT
--ORDER BY

--tell the Order of Execution in the below query
SELECT employee_id, first_name
FROM employees
WHERE department_id = 100
ORDER BY first_name;



--other points in ORDER BY clause
--You can use alias names in ORDER BY - because ORDER BY is executed after SELECT

--give alias name
SELECT employee_id e_id, first_name f_n
FROM employees
WHERE department_id = 100
ORDER BY first_name;

--use alias name in ORDER BY
SELECT employee_id e_id, first_name f_n
FROM employees
WHERE department_id = 100
ORDER BY f_n;

--you can use the SELECT column positions in ORDER BY
SELECT employee_id e_id, first_name f_n, DEPARTMENT_ID dept_id, salary 
FROM employees
WHERE department_id = 100
ORDER BY 2;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


Doubt 

 -- NULLS LAST, NULLS FIRST
 -- 1 <> 2
 --  DUMMY

SELECT * FROM employees WHERE DEPARTMENT_ID IN (90,100);

SELECT * FROM employees WHERE first_name = 'Steven';

SELECT * FROM employees WHERE first_name IN ('Steven', 'Daniel');

SELECT * FROM employees WHERE first_name LIKE 'S%';

SELECT * FROM employees WHERE salary BETWEEN 3000 AND 6000;

operators in WHERE
=
IN
LIKE
<
>
<=
>=
BETWEEN



SELECT * FROM employees WHERE DEPARTMENT_ID NOT IN (90,100);

SELECT * FROM employees WHERE first_name <> 'Steven';   -- <> is same as != operator

SELECT * FROM employees WHERE first_name NOT IN ('Steven', 'Daniel');

SELECT * FROM employees WHERE first_name NOT LIKE 'S%';

SELECT * FROM employees WHERE salary NOT BETWEEN 3000 AND 6000;

  SELECT * FROM employees WHERE first_name LIKE 'S%';
-- null

  SELECT * FROM employees;
Requirement : FETCH THE employees who do NOT get commission
 
  SELECT * FROM employees WHERE COMMISSION_PCT IS NULL;

 -- THE FOLLOWING QUERY doesn't work
 -- In oracle 1 null is not equal to another null

  SELECT * FROM employees WHERE COMMISSION_PCT = NULL;

  SELECT * FROM dual WHERE 1 = 1;

  SELECT * FROM dual WHERE null = null;

  abc
  abcd
  aamn
  axy

  WHERE first_name LIKE 'a__';

SELECT * FROM DUAL
WHERE dummy = dummy;

SELECT * FROM employees
WHERE first_name = first_name; 

SELECT * FROM employees
WHERE department_id = 100
 AND salary > 15000;
-------------------
SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id = 'SA_REP'
OR     job_id = 'AD_PRES'
AND    salary > 15000;


SELECT * FROM employees ORDER BY hire_date, first_name;

-- Req: order by dept id desc then firstname asc

SELECT * FROM employees ORDER BY department_id DESC, first_name ASC, last_name;

-- null 

  -- by default nulls will come in the last
  SELECT * FROM employees ORDER BY COMMISSION_PCT;
  -- nulls first is used to display all null values at the top
  SELECT * FROM employees ORDER BY COMMISSION_PCT NULLS FIRST;

----------------------------------------------------------------------------
  ORDER BY alias NAME EXP

   SELECT DEPARTMENT_ID d_id, MANAGER_ID m_id FROM departments  ORDER BY m_id DESC, department_name;   

-----------------------------------------------------------------------------
  SELECT first_name, last_name, EMPLOYEE_ID, COMMISSION_PCT FROM employees ORDER BY HIRE_DATE DESC; 












