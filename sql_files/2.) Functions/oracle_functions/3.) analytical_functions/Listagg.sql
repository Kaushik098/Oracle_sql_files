SELECT LISTAGG(column_name,',') WITHIN GROUP (ORDER BY column_id)
FROM USER_TAB_COLUMNS
WHERE table_name = 'T_TEST_EMP';

SELECT LISTAGG('mgr.'||column_name,'/') WITHIN GROUP (ORDER BY column_id)
FROM USER_TAB_COLUMNS
WHERE table_name = 'T_TEST_EMP';

SELECT LISTAGG(DECODE(MOD(employee_id,2),0,employee_id,''),',') WITHIN GROUP (ORDER BY employee_id) even_employees,
       LISTAGG(DECODE(MOD(employee_id,2),1,employee_id,''),',') WITHIN GROUP (ORDER BY employee_id) odd_employees
FROM employees;

SELECT LISTAGG(DECODE(MOD(employee_id,2),0,INITCAP(first_name),''),',') WITHIN GROUP (ORDER BY employee_id) even_employees,
       LISTAGG(DECODE(MOD(employee_id,2),1,INITCAP(first_name),''),',') WITHIN GROUP (ORDER BY employee_id) odd_employees
FROM employees;

SELECT department_id, LISTAGG(employee_id||'-'||NVL(first_name,' no first name')||'-'||NVL(phone_number,'no phone_number'),',') WITHIN GROUP (ORDER BY employee_id) emp_list
from employees
GROUP BY department_id;



select LISTAGG(employee_id,',') within group (order by employee_id) from employees;

select  department_id,
        LISTAGG(employee_id||'-'||first_name||'-'||salary,',') 
        within group (order by employee_id) details
from employees
group by department_id;



-------------------------------------------------------------------------------------------------------------

select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;



