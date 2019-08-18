a)  

worker.       Manager

Bala            King
Surya          Bala
Cyrus          No manager
King            No manager


-- Regarding manager

select wkr.first_name worker, nvl(mgr.first_name, 'no manager') manager
from t_test_emp mgr RIGHT JOIN t_test_emp wkr
on (mgr.EMPLOYEE_ID = wkr.MANAGER_ID)
order by wkr.EMPLOYEE_ID;


-- Regarding dept

select e.employee_id, e.FIRST_NAME employee_name, nvl(d.DEPARTMENT_NAME, 'no department') department_id
from t_test_emp e LEFT JOIN t_test_dept d
on (e.DEPARTMENT_ID = d.DEPARTMENT_ID)
order by e.EMPLOYEE_ID;


b.) SQL question

fetch the tables having only date column

SELECT * from USER_TAB_COLUMNS;

SQL question

fetch the tables having only date column

SELECT * from USER_TAB_COLUMNS

SELECT table_name from USER_TAB_COLUMNS where data_type 

 

 
