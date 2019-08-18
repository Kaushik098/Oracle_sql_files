1	Fetch the country name for Seattle City						
   
   select c.COUNTRY_NAME
   from countries c JOIN locations l
   on (l.COUNTRY_ID = c.COUNTRY_ID)
   where l.city = 'Seattle';

2	Fetch the count of employees in each department id

   select e.DEPARTMENT_ID, count(e.EMPLOYEE_ID) count_of_employees
   from employees e 
   group by e.DEPARTMENT_ID
   order by 1;
   
3	Fetch the count of employees in each department name	
  
   select d.DEPARTMENT_name, count(e.EMPLOYEE_ID)
   from employees e JOIN departments d 
   on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
   group by d.DEPARTMENT_name;
				
4	Fetch the department name having less than 10 employees and order by count

   select d.DEPARTMENT_name, count(e.employee_id)
   from employees e JOIN departments d 
   on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
   group by d.DEPARTMENT_name
   having count(*) < 10
   order by 2;

5	Fetch the count of employees under each manager id

  select manager_id, count(*)
  from employees e	
  group by manager_id;

6	Remove NULL manager id count from above output						
 
  
  select manager_id, count(*)
  from employees e	
  where manager_id is not null 
  group by manager_id;
  

7	Fetch the count of employees under each manager_name
  
  select mgr.first_name, count(wkr.EMPLOYEE_ID) count_of_employees
  from t_test_emp mgr JOIN t_test_emp wkr
  on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)
  group by mgr.first_name;
	
  1  2
  2  3
  5  2				
          
8	Fetch the manager names having only one employee reporting to them

  select mgr.first_name, count(wkr.EMPLOYEE_ID) count_of_employees
  from t_test_emp mgr JOIN t_test_emp wkr
  on (wkr.manager_id = mgr.EMPLOYEE_ID)
  group by mgr.first_name
  having count(wkr.EMPLOYEE_ID) = 1;
				
9	Fetch the manager names working in departments Shipping, Sales, Executive and having less than 8 employees reporting to them
  
  select mgr.EMPLOYEE_ID, mgr.FIRST_NAME, d.DEPARTMENT_NAME manager_department_name
  from t_test_emp mgr, t_test_emp wkr, t_test_dept d
  where (mgr.EMPLOYEE_ID = wkr.MANAGER_ID)
  and (mgr.DEPARTMENT_ID = d.DEPARTMENT_ID)
  and d.DEPARTMENT_NAME IN ('Oracle', 'Java')   
  order by 1;
 
  
  -- Fetch the manager names in oracle aand  java having employees more than 2
  select mgr.EMPLOYEE_ID, mgr.FIRST_NAME, d.DEPARTMENT_NAME manager_department_name, count(*) count_of_employees
  from t_test_emp mgr, t_test_emp wkr, t_test_dept d
  where (mgr.EMPLOYEE_ID = wkr.MANAGER_ID)
  and (mgr.DEPARTMENT_ID = d.DEPARTMENT_ID)
  and d.DEPARTMENT_NAME IN ('Oracle', 'Java') 
  group by (mgr.EMPLOYEE_ID, mgr.FIRST_NAME, d.DEPARTMENT_NAME)
  having count(*) > 2  
  order by 1;

   select * from t_test_emp;
   select * from t_test_dept;
-- selected manager_name, employee name along with department_name
  select mgr.EMPLOYEE_ID, mgr.FIRST_NAME employee_first_name, mgr.LAST_NAME employee_last_name,
         wkr.FIRST_NAME manager_first_name, wkr.LAST_NAME manager_last_name, wkr.DEPARTMENT_id, d.DEPARTMENT_NAME
  from employees mgr, employees wkr, departments d
  where (mgr.MANAGER_ID = wkr.employee_id)
  and (wkr.DEPARTMENT_ID = d.DEPARTMENT_ID)  
  order by 1;

 -- selecting employee name with manager name 
  select mgr.EMPLOYEE_ID, mgr.FIRST_NAME employee_first_name, mgr.LAST_NAME employee_last_name,
         wkr.FIRST_NAME manager_first_name, wkr.LAST_NAME manager_last_name
  from employees mgr, employees wkr
  where (mgr.MANAGER_ID = wkr.employee_id)  
  order by 1;

-- 10	Remove NULL manager id count from above output		

11	Fetch the region name and postal code for Donald
 
    select r.REGION_name, l.POSTAL_CODE
    from employees e JOIN departments d
    on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
    JOIN locations l 
    on (d.LOCATION_ID = l.LOCATION_ID)
    JOIN COUNTRIES c
    on (l.COUNTRY_ID = c.COUNTRY_ID)
    JOIN regions r
    on (c.REGION_ID = r.REGION_ID)
    where e.first_name = 'Donald';
    
12	Fetch the countries having less than 10 employees	
   
    select c.COUNTRY_NAME, count(e.EMPLOYEE_ID) count_of_employees
    from employees e JOIN departments d
    on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
    JOIN locations l 
    on (d.LOCATION_ID = l.LOCATION_ID)
    JOIN COUNTRIES c
    on (l.COUNTRY_ID = c.COUNTRY_ID)
    group by c.COUNTRY_NAME
    having count(e.EMPLOYEE_ID) < 10;

-- Cross Check
    select e.employee_id, d.DEPARTMENT_ID, l.LOCATION_ID, c.COUNTRY_ID, c.COUNTRY_NAME
    from employees e JOIN departments d
    on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
    JOIN locations l 
    on (d.LOCATION_ID = l.LOCATION_ID)
    JOIN COUNTRIES c
    on (l.COUNTRY_ID = c.COUNTRY_ID);
   
					
13	Fetch the department name and max of salary in each department name	
    
    select d.department_name, max(salary)
    from employees e, departments d
    where (e.DEPARTMENT_ID = d.department_id)
    group by d.DEPARTMENT_NAME;

			
14	Difference between ON and NATURAL JOIN
   
    ON:
      > In 'ON' condition we will declare one table column name (Foriegn Key) with another table column name (Primary Key).
    Natural Join:
      > No need of declaring (or) entering column names with Equal Assignment Operator while using join.
      > It automatically detects the column name and gives us the result.

 15 
dept1								
dept_no	d_name							

emp1								
emp_no	e_name	department_no						

How to join the above 2 tables using						
ON								
NATURAL JOIN								
USING								

create table dept1 as
select 1001 dept_id, 'CSE' d_name from dual
union all 
select 1002 dept_id, 'ECE' d_name from dual
union all 
select 1003 dept_id, 'EEE' d_name from dual
union all 
select 1004 dept_id, 'MECH' d_name from dual; 

create table emp1 as
select 100 emp_no, 'Aadhish' e_name, 1001 d_name from dual
union all 
select 102 emp_no, 'Bharath' e_name, 1002 d_name from dual
union all 
select 103 emp_no, 'Camelline' e_name, 1002 d_name from dual
union all 
select 104 emp_no, 'Daniel' e_name, 1003 d_name from dual
union all 
select 105 emp_no, 'Emille' e_name, 1001 d_name from dual
union all 
select 106 emp_no, 'Francais' e_name, 1002 d_name from dual
union all 
select 107 emp_no, 'Gambir' e_name, 1003 d_name from dual
union all 
select 108 emp_no, 'Heytmer' e_name, 1004 d_name from dual

select * from dept1;
select * from emp1;
alter table emp1 rename column dept_id to department_no;

ON:

SELECT *
from emp1 e JOIN DEPT1 d
on (e.department_no = d.DEPT_ID)

Natural Join:

SELECT *
from emp1 e Natural JOIN DEPT1 d;

Using:

SELECT *
from emp1 e JOIN DEPT1 d
using (dept_id);
2 ORA-00904: "E"."DEPT_ID"

16	Fetch the count of employees in each department name
					
Expected output								
Oracle	3							
Java	3							

select d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID) count_of_employees
from t_test_emp e, T_TEST_DEPT d
where (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
GROUP BY d.DEPARTMENT_NAME

17	Modify the above query to bring the below output
						
Expected output						
oracle 3
java   3
dotnet 0

select d.department_name, count(e.DEPARTMENT_ID) count_of_employees
from t_test_emp e RIGHT JOIN T_TEST_DEPT d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.DEPARTMENT_name;  

18	Add COUNT(ROWID) in above query

select d.department_name, count(e.DEPARTMENT_ID) count_of_employees, count(e.rowID) count_of_row_id
from t_test_emp e RIGHT JOIN T_TEST_DEPT d
ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
group by d.DEPARTMENT_name;  

select * from t_test_emp;
select rowid, e.* from t_test_emp e;
select rowid, e.* from employees e;

select rowid, e.* from dual e;
						
19	Fetch COUNT of employees in each Grade
    
    select g.title title_name, count(*) count_of_employees
    from employees e JOIN title g
    on (e.salary between g.MIN_SAL and g.MAX_SAL)
    group by g.title
    order by 1;


    select g.title title_name, count(*) count_of_employees
    from t_test_emp e JOIN title g
    on (e.salary between g.MIN_SAL and g.MAX_SAL)
    group by g.title
    order by 1;

select * from T_TEST_EMP;



20	Fetch the Grades which has count of employees more than 20					

    select g.title title_name, count(*) count_of_employees
    from t_test_emp e, title g
    where (e.salary between g.MIN_SAL and g.MAX_SAL)
    group by g.title
    having count(*) > 20
    order by 1;


21	Fetch the Grades and count of employees like below						
    
GRADE	Count_of_emps							
A	20							
B	45							
C	12							
…								
F	0							
   
    select g.title title_name, count(e.EMPLOYEE_ID) count_of_employees
    from t_test_emp e RIGHT JOIN title g
    on (e.salary between g.MIN_SAL and g.MAX_SAL)
    group by g.title
    order by 2 desc; 
   

22	Fetch the employees whose salary does not fall in any grade					
 
Table 1:

Employees:
101  4500  
102  5600  

Table 2:

Title:
A   4001 5000
B   5001 6000     

Case 1:
4500  between 4001 and 5000    correct
5600  between 4001 and 5000    wrong

Case 2:
4500  between 5001 and 6000    wrong
5600  between 5001 and 6000    correct 

select * from t_test_emp;
     
    select * 
    from t_test_emp e LEFT JOIN title g
    on (e.salary  between g.MIN_SAL and g.MAX_SAL)
    where g.min_sal is null and G.MAX_SAL is null
    order by 2 desc; 

23	Fetch output like below							

Parent table name	   Parent column	Child table	    Child column					

Departments	         Department_id	employees	      department_id					
Departments	         Department_id	emp_bk	        dept_id					
Departments	         Department_id	emp2	          department_id	

  