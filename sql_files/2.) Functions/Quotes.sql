1	Steven's last name is King and his salary is 24000. Today is 24-oct-2017. 17-06-03 is Steven King's hire date
  
  SELECT first_name || '''s last name is ' || last_name || ' and his salary is ' || salary || '. Today is '|| SYSDATE || '. '|| hire_date || ' is ' || 
    first_name || ' ' || last_name || '''s hire date' FROM employees;

  
  SELECT first_name || q'['s last name is ]' || last_name || ' and his salary is ' || salary || '. Today is '|| SYSDATE || '. '|| hire_date || ' is ' || 
    first_name || ' ' || last_name || q'['s hire date]' FROM employees;

 
2	24-0ct-2017 17-06-03's AD_PRES is job id and King's email id is SKING. 25000 is new salary after 1000 and old salary is 24000

  SELECT SYSDATE || hire_Date || '''s '|| job_id || ' is job id and ' || last_name || '''s email id is ' || email || '. ' || (salary+1000) ||
  ' is new salary after 1000 and old salary is '|| salary FROM employees;

   SELECT SYSDATE || hire_Date || q'['s ]'|| job_id || ' is job id and ' || last_name || q'['s email id is ]' || email || '. ' || (salary+1000) ||
  ' is new salary after 1000 and old salary is '|| salary FROM employees;

3	Sum of employee id and department id for AD_PRES Steven King is 190
 
   SELECT 'Sum of employee id and department id for ' || job_id ||' '|| first_name || ' ' || last_name || ' is ' || (employee_id+department_id) FROM employees;

4	Steven 515.123.4567'abcd 24000 ' .King's commission is 0.5 and employee id is 100'
 
  SELECT first_name || ' ' || PHONE_NUMBER || '''abcd ' || salary || '''' || '. ' || last_name || '''s commission is 0.5 and employee id is ' || EMPLOYEE_ID
    FROM employees;
  
   SELECT first_name || ' ' || PHONE_NUMBER || q'['abcd ]' || salary || q'[']' || '. ' || last_name || q'['s commission is 0.5 and employee id is ]' || EMPLOYEE_ID
    FROM employees;  
  

--5	If we add John's salary of 14000 and commission of 0.4, we get (24000 + 0.4) = 14000.4
   
    SELECT 'If we add ' || first_name || '''s salary of '|| salary || ' and commission of '|| NVL(commission_pct,0.4) ||' we get (' ||
    salary || '+ 0.4) = ' ||(salary+0.4) FROM employees;  
 
    SELECT 'If we add ' || first_name || q'['s salary of ]'|| salary || ' and commission of '|| NVL(commission_pct,0.4) ||' we get (' 
    || salary || '+ 0.4) = ' ||(salary+0.4) FROM employees;  

    SELECT * FROM employees;


    --------------------------------------------------------------------

      NULL exercise

       SELECT 'If we add ' || first_name || q'['s salary of ]'|| salary || ' and commission of '|| NVL2(commission_pct,1000,0.4) ||' we get (' 
    || salary || '+ 0.4) = ' ||(salary+0.4) FROM employees;  


  
          SELECT 'If we add ' || first_name || q'['s salary of ]'|| salary || ' and commission of '|| COALESCE(commission_pct, salary, 10) ||' we get (' 
    || salary || '+ 0.4) = ' ||(salary+0.4) FROM employees;  



