Please analyse and solve below
Few might be repeated (already mailed to you) which you can try again

Save all these in your sub query folder

1	What will be the output?							
select sysdate + 1 tomorrow, dd today, ff.* 					
FROM								
(								
select sysdate dd, e.* from employees e					
) ff;								


2	What will be the output?							
select sysdate, e.* from employees e;						

3	What will be the output?							

3a	SELECT *								
FROM (SELECT 1 id, 'Hari' name FROM DUAL) e JOIN (SELECT 1 id, 'Suresh' my_name FROM DUAL) d
ON (e.id = d.id);							

3b	SELECT *								
FROM (SELECT 1 id, 'Hari' name FROM DUAL) e JOIN (SELECT 1 id, 'Suresh' my_name FROM DUAL) d
ON (e.id = d.id and name = my_name);


4 
Fetch output like this for all employees	
Employee_id	First_name	salary	grade_level
108	John	30000	D	
100	Suresh	20000	E	

Using joins							

select e.employee_id, e.first_name, e.salary, g.grade_id
from employees e JOIN grade_list g
on (e.salary between g.Starting_sal_range and g.Ending_salary_range)
order by e.employee_id;

Using subquery in SELECT

select e.employee_id, e.first_name, e.salary, (select grade_id from grade_list where Starting_sal_range <= e.salary and Ending_salary_range >= e.salary) 
from employees e


create table grade_list (grade_id char(1) primary key, Starting_sal_range number, Ending_salary_range number)
insert into grade_list values ('A', 20000, 26000);
insert into grade_list values ('B', 15000, 19999);
insert into grade_list values ('C', 11000, 14999);
insert into grade_list values ('D', 6000, 9999);
insert into grade_list values ('E', 1000, 5999);
commit;

update grade_list set ENDING_SALARY_RANGE = 10999 where grade_id = 'D';
select * from grade_list;

5	Correct this query									
SELECT first_name, last_name, department_id, (SELECT MAX(department_name, location_id from departments) d_name
from employees e;									
-- only one columns can be selected in select sub query 

SELECT first_name, last_name, department_id, (SELECT department_name from departments where DEPARTMENT_ID = e.DEPARTMENT_ID) d_name
from employees e;									

6	Will this query throw error?								
SELECT first_name, last_name, department_id, (SELECT MAX(department_name) from departments) d_name	
from employees e;									
 -- No it will not throw error but output will be wrong 
 -- doubt (why it is fixing department_name as 'Treasury'

select department_id, count(*)
from employees 
group by DEPARTMENT_ID;

select department_id, department_name from departments;

7	What will be the output?									
SELECT *										
FROM (SELECT 1 id1, SYSDATE my_date1 FROM DUAL) e JOIN (SELECT 1 id2, SYSDATE my_date2 FROM DUAL) d	
ON (e.id1 = d.id2 AND e.my_date1 = d.my_date2);						

--   1  today_date 1 today_date

8	What will be the output?									
SELECT *										
FROM (SELECT SYSDATE id1, 1  my_date1 FROM DUAL) e JOIN (SELECT 1 id2, SYSDATE my_date2 FROM DUAL) d	
ON (e.id1 = d.my_date2 AND e.my_date1 = d.id2);

today_date 1 1 today_date			

-- 
 
9	Fetch the maximum length of first name in first_name column					

select MAX(Length(first_name)) max_length_f_frist_name from employees

Fetch the employee(s) having the maximum lengthy first name					

select first_name from employees 
group by first_name 
having Max(Length(replace(first_name,' ',''))) = 11;

10	Fetch the employees getting max salary in each department					


select employee_id, first_name, department_id, salary max_sal_dept_wise1 from (
select e.employee_id, e.FIRST_NAME, e.DEPARTMENT_ID, e.SALARY, max(salary) over(partition by department_id) max_sal_dept_wise
from t_test_emp e 
group by (salary, first_name, employee_id, department_id)
order by department_id)
where salary = max_sal_dept_wise
order by employee_id;


-- manager and department_id comparison department wise

select wkr.employee_id, wkr.first_name, wkr.department_id, mgr.FIRST_NAME manager_name 
from t_test_emp wkr LEFT JOIN t_test_emp mgr
on (wkr.MANAGER_ID = mgr.EMPLOYEE_ID)
order by wkr.employee_id;

 
