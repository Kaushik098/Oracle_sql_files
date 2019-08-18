ANSI Outer Join:
    
    - LEFT
    - RIGHT
    - FULL


select * from T_TEST_EMP;

select * from T_TEST_DEPT;

select *
from t_test_emp e JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

 Outer Join example (Fetching additional non matching rows)
    
select *
from t_test_emp e LEFT JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

-- similar to above query
select *
from t_test_emp e LEFT OUTER JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);


select *
from t_test_emp e RIGHT OUTER JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);


Outer Join in Natural Join:
----------------------------
SELECT e.employee_id, e.first_name, department_id, d.department_name
FROM t_test_emp e  natural right outer JOIN t_test_dept d;

Outer Join in Using JOIN:
-------------------------
SELECT e.employee_id, e.first_name, department_id, d.department_name
FROM t_test_emp e  right outer JOIN t_test_dept d using (department_id);




*****Oracle Outer Join:
-----------------    
     - (+)


select *
from t_test_emp e, T_TEST_DEPT d
where (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

LEFT JOIN in Oracle Join:

-- to get values in left table ie.) employees table, we have to put (+) symbol at last of opposite table.

select *
from t_test_emp e, T_TEST_DEPT d
where (e.DEPARTMENT_ID = d.DEPARTMENT_ID (+));

RIGHT JOIN in Oracle JOIN:

select *
from t_test_emp e, T_TEST_DEPT d
where (e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID);

----------------

select * from courses; 
select * from students;

select * 
from students s JOIN courses c
on (s.COURSE_ID = c.COURSE_ID);

LEFT JOIN IN ANSI:

select * 
from students s LEFT JOIN courses c
on (s.COURSE_ID = c.COURSE_ID);

RIGHT JOIN IN ANSI:

select * 
from students s RIGHT JOIN courses c
on (s.COURSE_ID = c.COURSE_ID);


ORACLE JOIN 

LEFT JOIN :

select * 
from students s JOIN courses c
on (s.COURSE_ID = c.COURSE_ID(+));

RIGHT JOIN:

select * 
from students s JOIN courses c
on (s.COURSE_ID(+) = c.COURSE_ID);

--------


FULL OUTER JOIN IN ANSI:
(Combination of both left join and right join)

select *
from t_test_emp e FULL JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

select *
from t_test_emp e FULL OUTER JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID);
 

FULL OUTER JOIN IN ORACLE JOIN:

select *
from t_test_emp e, t_test_dept d
where (e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID(+))

1 ORA-01468: a predicate may reference only one outer-joined table 

NOTE: there is no full outer join in old join (oracle join). 

select *
from t_test_emp e, t_test_dept d
where (e.DEPARTMENT_ID = d.DEPARTMENT_ID(+))
union 
select * 
from t_test_emp e, t_test_dept d
where (e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID);

-- REQ 

-- Fetch the count of employees in each department id

select department_id, count(*) count_of_employees
from t_test_emp e
group by department_id
order by 1;

-- include the departments id's which does not have employees in above output

select *
from t_test_emp e RIGHT JOIN T_TEST_DEPT d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

select d.department_id, count(e.DEPARTMENT_ID) count_of_employees
from t_test_emp e RIGHT JOIN T_TEST_DEPT d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.DEPARTMENT_ID
order by 1;

- Always try to use primary key column name in count.

select d.department_id, count(e.EMPLOYEE_ID) count_of_employees
from t_test_emp e RIGHT JOIN T_TEST_DEPT d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.DEPARTMENT_ID
order by 1;

-- Fetch the count of employees in each department name

select d.department_name, count(*) count_of_employees
from employees e JOIN DEPARTMENTS d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.DEPARTMENT_NAME
order by 2;

select * from employees;
select * from departments;
 
-- Fetch the department names not having employees in above query

select d.department_name, count(e.EMPLOYEE_ID) count_of_employees
from employees e RIGHT JOIN DEPARTMENTS d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.DEPARTMENT_NAME
order by 2;
 
-- Do the same in region - countries

select * from countries;
select * from regions;

select r.REGION_NAME, count(*) count_of_countries
from countries c JOIN regions r 
on (c.REGION_ID = r.REGION_ID)
group by r.REGION_name
order by 2; 

select r.region_name, count(c.country_id) count_of_countries
from countries c RIGHT JOIN regions r
on (c.region_id = r.region_id)
group by r.REGION_NAME
order by 2;

-- Courses - students 

select * from students;

select c.COURSE_NAME, count(*) count_of_students
from students s JOIN courses c 
on (c.COURSE_ID = s.COURSE_ID)
group by c.COURSE_NAME;

select c.COURSE_NAME, count(s.STUDENT_ID) count_of_students
from students s LEFT JOIN courses c 
on (c.COURSE_ID = s.COURSE_ID)
group by c.COURSE_NAME
order by 1;

-------------------------------------------------------------------------------------------------------

Fetch output like below	
department_id	department_name	cnt
10	 Oracle	 3
20	 Java	 3
30	 Dotnet	0

select d.department_id, d.department_name, count(e.department_id) 
from t_test_emp e right join t_test_dept d
on (e.department_id = d.department_id)
group by (d.department_id, d.department_name)
order by 1;

create or replace view v_EMP_DET_DET
as
select d.department_id, d.department_name, count(e.department_id) count_of_dept_id
from t_test_emp e right join t_test_dept d
on (e.department_id = d.department_id)
group by (d.department_id, d.department_name)
order by 1;

select * from v_emp_det_det;

department_id	department_name  employees_availability
30	           Dotnet	           no employees
20	           Java	            has employees
10	           Oracle	          has employees

select d.department_id, d.department_name, decode(count(e.department_id), 0,'no employees','has employees') employee_exist_or_not
from t_test_emp e right join T_TEST_DEPT d
on (e.department_id = d.department_id)
group by (d.department_id, d.department_name)
order by 1;


select d.department_id, d.department_name, 
       case when count(e.DEPARTMENT_ID) = 0 then 'no employees' else'has employees' end employee_exist_or_not 
from t_test_emp e right join T_TEST_DEPT d
on (e.department_id = d.department_id)
group by (d.department_id, d.department_name)
order by 1;

select d.department_id, d.department_name, 
       case when count(e.DEPARTMENT_ID) > 0 then 'has employees' else 'no employees' end employee_exist_or_not 
from t_test_emp e right join T_TEST_DEPT d
on (e.department_id = d.department_id)
group by (d.department_id, d.department_name)
order by 1;


create or replace view v_emp_det_det
as 
select d.department_id, d.department_name, 
       case when count(e.DEPARTMENT_ID) > 0 then 'has employees' else 'no employees' end employee_exist_or_not 
from t_test_emp e right join T_TEST_DEPT d
on (e.department_id = d.department_id)
group by (d.department_id, d.department_name)
order by 1;

select * from v_emp_det_det


decode(count(e.department_id), 0,'no employees','has employees') employee_exist_or_not

case when count(e.department_id) = 0 then 'no employees' else'has employees' end employee_exist_or_not 

sum(decode)
case when  

