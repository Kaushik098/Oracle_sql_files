Joins:

select * from t_test_emp;

-- Fetch the department id of bala 

select department_id from T_TEST_EMP
where first_name = 'Bala Ora Mgr';

-- Fetch the department name of bala 

select department_name from T_TEST_DEPT
where department_id = 10;


We go for joins when we need data from more than one table.

-- Prerequiste:
a.) understand the requirement..
b.) Find out the tables needed to satisfy the requirement.
c.) Join the tables.

-------------------------------------------
TYPES OF JOIN
---------------

a.) Oracle Join (Old Join) - eg: employees e, departments d where LHS = RHS;
b.) ANSI Join (New Join) 

1. EQUII JOIN -- 95% use
   ON
   NATURAL
   USING
2. OUTER JOIN
   LEFT
   RIGHT
   FULL

3. NONEQUII JOIN
4. CARTESIAN OR CROSS JOIN
5. SELF JOIN


Oracle Join( Equi Join)

select * from t_test_emp;


select department_id from T_TEST_EMP
where first_name = 'Bala Ora Mgr';

UPDATE t_test_emp
SET department_id = 20
WHERE employee_id = 7;

select * from t_test_emp;
COMMIT;


EQUI Join:

select * 
from t_test_dept, T_TEST_EMP
where t_test_dept.DEPARTMENT_ID = T_TEST_emp.DEPARTMENT_ID;
-- 3 rows doesn't come ( 1 in dept and 2 in emp)

LHS RHS part is so important 
Department id in t_test_dept -- LHS
Department id in t_test_emp -- RHS
LHS and RHS checks and displays the result.


-- Similarly note that there is no ordering in checking between two tables 

select * 
from  T_TEST_EMP,t_test_dept
where t_test_dept.DEPARTMENT_ID = T_TEST_emp.DEPARTMENT_ID;

According to order in 'From clause' The table will be resulted as such.
-- All tables will be joined.

-Table Alias name :

select * 
from  T_TEST_EMP e,t_test_dept d
where d.DEPARTMENT_ID = e.DEPARTMENT_ID;

select employee_id, first_name, department_name 
from  T_TEST_EMP e,t_test_dept d
where d.DEPARTMENT_ID = e.DEPARTMENT_ID;

 select * from employees;
 select * from departments;

select * from employees where department_id is not null;

select department_id, count(*) from EMPLOYEES
group by department_id
order by department_id;

select *
from employees e, departments d
where d.DEPARTMENT_ID = e.DEPARTMENT_ID;


-- Fetch department name of bala 

select *
from t_test_emp e, t_test_dept d
where e.DEPARTMENT_ID = d.department_id;

select *
from t_test_emp e, t_test_dept d
where e.DEPARTMENT_ID = d.department_id
and e.first_name = 'Bala Ora Mgr';

select DEPARTMENT_NAME
from t_test_emp e, t_test_dept d
where e.DEPARTMENT_ID = d.department_id
and e.first_name = 'Bala Ora Mgr';


-- Fetch the employees in department id 10(Join in not required)
select * from employees where department_id = 10;

-- Fetch the employees in oracle department 
select *
from t_test_emp e, t_test_dept d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID;


select *
from t_test_emp e, t_test_dept d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
and d.DEPARTMENT_NAME = 'Oracle';


--------------------------------------------------------------------------------------------------

-- employees <=> departments (department id)
-- departments <=> locations (location id)
-- locations <=> countries (country id)
-- countries <=> regions (region id)

 b.) departments <=> locations (location id)

select * from departments;
select * from locations;

-- Fetching the matching location id details

select * 
from locations l, departments d
where l.location_id = d.location_id; 

-- Fetch the street addrees of given location id

select l.street_address
from locations l, departments d
where l.location_id = d.LOCATION_ID
and d.department_id = 10;

-- Fetch the complete address using department id referring location table 

select l.street_address, postal_code, city, state_province, country_id
from locations l, departments d
where l.location_id = d.LOCATION_ID
and d.department_id = 10;


c.) locations <=> countries (country id)

select * from locations; -- child class
select * from countries; -- parent class

-- fetching all matched country id's

select *
from locations l, countries c
where l.COUNTRY_ID = c.COUNTRY_ID;

-- Fetch the country name by giving location id 

select c.COUNTRY_NAME, c.region_id
from locations l, countries c
where l.COUNTRY_ID = c.COUNTRY_ID
and l.location_id = 1200;

(Three table join)
-- As well as trying to get the region name using location id 

select c.COUNTRY_NAME, r.REGION_NAME
from locations l, countries c, regions r
where l.COUNTRY_ID = c.COUNTRY_ID
and c.REGION_ID = r.REGION_ID
and l.location_id = 1200;

 Try to get the complete address using employee_id (Imp)

select r.region_name
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id 
and d.location_id = l.location_id
and l.country_id = c.COUNTRY_ID
and c.region_id = r.REGION_ID
and e.EMPLOYEE_ID = 110;

select * from employees where employee_id = 110;
select * from departments where DEPARTMENT_ID = 100;
select * from locations where location_id = 1700;
select * from countries where country_id = 'US';
select region_name from regions where region_id = 2;

-- try


select region_id
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id 
and d.location_id = l.location_id
and l.country_id = c.COUNTRY_ID
and c.region_id = r.REGION_ID
and e.EMPLOYEE_ID = 110;

ORA-00918 Ambiguous error

select * from regions;


----------------------------------------------------------

-- students and courses
select * from students;
select * from courses;

-- Fetching all details which matches the course id 
select *
from students s, courses c
where s.course_id = c.course_id;

-- Fetch only the student_name and course_name 

select s.student_name, c.course_name
from students s, courses c
where s.course_id = c.course_id;

-- Using group by and having 

select c.course_name, count(*)  
from students s, courses c
where s.course_id = c.course_id
group by course_name
having count(*) >= 1;


-----------------------------------------------------------------------------------------

select *
from students s, courses c
where s.course_id = c.course_id;

select s.student_id, s.student_name, c.course_id, c.course_name
from students s, courses c
where s.course_id = c.course_id;

select s.student_name, c.course_name
from students s, courses c
where s.course_id = c.course_id;

select student_id, student_name, course_id, course_name
from students s, courses c
where s.course_id = c.course_id;

1 ORA-00918: column ambiguously defined- (Solution is use alias name) 
-- single column name will return without alias name but the common column name should be specified with alias name or table name 


Advantage of Alias name:
1.) Easy table reference.
2.) Fast Access of Querying - Tuning.(Use alias name. It directly access the table in joins list).

Main error in joins: Ambiguous.

































-------------------------------------------------------------------------------------
Learn TO WRITE A QUERY IN FOLLOWING ways :
A.) joining TABLES USING WHERE clause
b.) joining TABLES USING ANSI Standard  
C.) joining TABLES USING 'USING' keyword 

Examples OF two TABLE JOIN

ORACLE EQUII JOIN
----------------
SELECT e.employee_id, e.first_name, d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id;

ORACLE EQUII JOIN can also be written in ANSI STANDARD like below 2 queries
---------------------------
SELECT e.employee_id, e.first_name, d.department_id, d.department_name 
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, department_id, d.department_name 
FROM employees e JOIN departments d
USING (department_id);


    ---------------------------------------------------------------------------------------------------------------

      (12.04.2019)
 Examples OF Joins (Three TABLE JOIN)

 ORACLE - 3 table join example - EQUII JOIN
----------------

SELECT * FROM departments

SELECT e.employee_id, e.first_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND l.location_id = d.location_id;

ORACLE EQUII JOIN can also be written in ANSI STANDARD like below 2 queries
---------------------------
SELECT e.employee_id, e.first_name, d.department_id, d.department_name, l.city
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON  l.location_id = d.location_id;

SELECT e.employee_id, e.first_name, department_id, d.department_name, l.city 
FROM employees e JOIN departments d
USING (department_id)
JOIN locations l
USING (location_id);


-------------------------------------------------------------------------------------------------

  SELECT * FROM employees  (job_id fk, manager_id fk, department_id fk)
  SELECT * FROM departments (manager_id fk, location_id fk)
  SELECT * FROM locations (country_id fk)
  SELECT * FROM countries (region_id fk)
  SELECT * FROM regions;
    
  -- Joining many table using ANSI STANDARD
  SELECT z.employee_id, z.first_name,z.last_name, d.department_id, d.department_name, l.location_id, l.STREET_ADDRESS, c.COUNTRY_NAME, r.REGION_NAME
  FROM employees z JOIN departments d
  ON z.department_id = d.department_id
  JOIN locations l
  ON l.location_id = d.location_id
  JOIN countries c
  USING (country_id)
  JOIN regions r
  USING (region_id);       
  


  --------------------------------------------------------------------------------------------
    
    SELECT z.employee_id, z.first_name, z.last_name, d.department_id, d.department_name
    FROM employees z
    JOIN departments d
    ON (z.department_id = d.department_id);

    
    SELECT * FROM employees; 
    SELECT * FROM departments;
    
    
INNER JOIN:

    SELECT z.employee_id, z.first_name, z.last_name, d.department_id, d.department_name
    FROM employees z
    INNER JOIN departments d
    ON z.department_id = d.department_id;          

    
    SELECT *
    FROM employees z
    INNER JOIN departments d
    ON z.department_id = d.department_id; 


LEFT (OUTER) JOIN   
RIGHT (OUTER) JOIN 
FULL (OUTER) JOIN 

EQUII JOIN
NONEQUII JOIN
SELF JOIN
OUTER - LEFT RIGHT FULL
CROSS JOIN


Latest
-- Fetching the employees who located in Americas and Europe according to hired year using 'hire_date' in employees where count of employees is greater than 5
 
SELECT region_name, TO_CHAR(hire_date,'YYYY') yr, COUNT(*) cnt
FROM employees e, departments d, locations l, countries c, regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND r.region_name IN ('Americas','Europe')
GROUP BY region_name, TO_CHAR(hire_date,'YYYY')
HAVING count(*) > 5
ORDER BY 1,2 DESC;

select r.REGION_NAME, to_char(e.hire_date,'yyyy'), count(*) from employees e, departments d, LOCATIONS l, COUNTRIES c, regions r
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
and d.LOCATION_ID = l.LOCATION_ID
and l.COUNTRY_ID = c.COUNTRY_ID
and c.REGION_ID = r.REGION_ID
and r.REGION_NAME  IN ('Americas')
group by (r.REGION_NAME, to_char(e.hire_date,'yyyy'))
having count(*) > 5




