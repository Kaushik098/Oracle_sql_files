
SELECT 'TODAY IS ' || SYSDATE || ' Bye ' AS Td FROM dual;

SELECT ' BALA ' || ' KUMAR ' || ' CSE' FROM dual;

----------------------------------------------------------

  --DECODE

  SELECT DECODE (4, 1, 100, 2, 200, 3, 300, 4, 400) FROM dual;

-- imp( Default, Source)

SELECT DECODE (5, 1, 100, 2, 200, 3, 300, 4, 400) FROM dual;

SELECT DECODE (5, 1, 100, 2, 200, 3, 300, 4, 400, 0) FROM dual;

----------------------------------------------------------


  SELECT  'MY NAME IS ' ||  first_name FROM employees;

  SELECT  'MY NAME IS ' ||  first_name || ' and my salary is '|| salary FROM employees;

----------------------------------------------------------------

  --MAIL PRACTICE
  1) Steven last name is King and his salary is 24000. 17-06-03 is Steven King hire date

  SELECT 'Steven last name is ' || last_name || ' and his salary is ' || salary ||'. ' || hire_date || ' is Steven King hire date'  
  AS DETAIL1 FROM EMPLOYEES;

  2.)  AD_PRES is job id and King email id is SKING. 25000 is new salary after adding 1000 and old salary is 24000

  --1st try
    SELECT job_id || ' is job id and ' || last_name || ' email id is '|| EMAIL || '.' FROM EMPLOYEES;

    SELECT salary+1000 || ' is new salary after adding 1000 and old salary is ' || salary FROM employees;
  
  --2nd try
    SELECT job_id || ' is job id and ' || last_name || ' email id is '|| EMAIL || '. ' || (salary+1000) || ' is new salary after adding 1000 and old salary is ' 
    || salary FROM employees;


  3.) Sum of employee id and department id for AD_PRES Steven King is 190

    SELECT 'Sum of employee id and department id for' || job_id || ' ' || first_name || ' ' || last_name || ' is ' || (employee_id+DEPARTMENT_ID) 
    FROM employees;    


 4.) Steven 515.123.4567. King commission is 0.5 and employee id is 100
   
      SELECT first_name || ' ' || phone_number || '. ' || last_name || ' commission is 0.5 and employee id is ' || employee_id AS detail4 
      FROM EMPLOYEES;

 5.) If we add John salary of 14000 and commission of 0.4, we get (24000 + 0.4) = 14000.4

    SELECT 'If we add '|| first_name || ' salary of ' || salary || 'and commission of ' || COMMISSION_PCT || ', we get (24000 + 0.4) = ' || (salary+COMMISSION_PCT)
    AS detail5 FROM employees WHERE COMMISSION_PCT = 0.4; 
   
   

-----------------------------------------------------------------------------


  --Whats App Activity

  SELECT 'hi' FROM dual;

  SELECT 'hi' || 100 FROM dual;
 ------------------------------------------------------
  
  
  --Err
  SELECT ('hi' + 100) FROM dual;

  SELECT 'hi' || 100+100 FROM dual;

  SELECT 100 || 100+100 FROM dual;
  -----------------------------------------------------
  
  
  SELECT 'hi'|| (100+100) from dual;
--------------------------------------------------------------------------------


  SELECT 'todays date is: '||SYSDATE||'. good morning' FROM DUAL;

  SELECT 'Balas house. Anands house' FROM DUAL;

-- Single quote is keyword for oracle. So oracle gets confused

  SELECT 'Bala's house. Anand's house' FROM DUAL;

-- To get single quote in between, please use single quote followed by single quote
  SELECT 'Bala''s house. Anand''s house' FROM DUAL;

  SELECT 'Amar''s house is in front of school' FROM DUAL;


  -------------------------------------------------------------------------

    Steven's last name is King and his salary is 24000. Today is 24-oct-2017. 17-06-03 is Steven King's hire DATE

    SELECT first_name|| '''s last name is ' || last_name || ' and his salary is ' || salary || '. Today is ' || SYSDATE || '. ' || hire_date || ' is ' 
      || first_name ||' ' || last_name || '''s hire date' AS TASK1 FROM EMPLOYEES; 

   -- using q quotes
     SELECT first_name|| q'['s last name is ]' || last_name || ' and his salary is ' || salary || '. Today is ' || SYSDATE || '. ' || hire_date || ' is ' 
      || first_name ||' ' || last_name || q'['s hire date]' AS TASK1 FROM EMPLOYEES; 


    SELECT 'Bala ''s ' FROM dual;

    --q quotes
    SELECT q'[]' FROM DUAL;
    
    Example
    SELECT q'[Bala's house. Anand's house]' FROM DUAL;
     
    SELECT q'[]' FROM DUAL;

    Employee Bala's salary is 3000. Bala's hire date is: 01-jan-2001

    SELECT 'Employee ' || first_name || '''s salary is ' || salary ||'. ' || first_name || '''s hire date is : ' || hire_date FROM employees;

    SELECT 'Employee ' || first_name || q'['s salary is ]' || salary || '. ' || first_name || q'['s hire date is : ]' || hire_date FROM employees;


    -- null
--NULL - dangerous guy
--How will you SELECT NULL from dual?

SELECT NULL from dual;

--give alias name
SELECT NULL my_null from dual;

--or else, you can give like
SELECT '' my_null from dual;

CREATE TABLE t_tt123
(
emp_id number,
first_name varchar2(100)
);

SELECT * FROM t_tt123;

INSERT INTO t_tt123 values (1,null);
INSERT INTO t_tt123 values (2,'');
INSERT INTO t_tt123 values (3,' ');
INSERT INTO t_tt123 values (4,'bala');
commit;

-- Null can be inserted in two ways. We should be careful for the second way ie.) ''.

-- Better to use null;

  SELECT 1 + 1 my_sum FROM dual;

  SELECT 1 + 1 + 1 + NULL my_sum FROM dual;

  -- in oracle any operation done witht null will give null value.

 SELECT (2 * 3) + 10 FROM dual;

SELECT (2 * 3) + 10 + null FROM dual;

SELECT 1/NULL null_divide, 1*NULL null_multiply, 1- NULL null_subtract FROM dual;

--requirement: add and show Rs 100 for all employees as commission - just for display purpose. No change in internal table

  SELECT * FROM  employees;

  -- Operation can  be performed with values and not with null values ( Usage of null)
  -- It gives wrong result for null values (Business wise wrong but technically correct)

  SELECT EMPLOYEE_ID , COMMISSION_PCT, COMMISSION_PCT + 100 AS PROPOSED_COMMISSION FROM EMPLOYEES 


 -- Solution is we have to use oracle inbuilt functions like NVL

      SELECT EMPLOYEE_ID , COMMISSION_PCT, NVL(COMMISSION_PCT,0) + 100 AS PROPOSED_COMMISSION FROM EMPLOYEES
        
        
   SELECT UPPER('bala'),LOWER('BALA') FROM DUAL;

   SELECT UPPER(first_name), LOWER(first_name) FROM employees;

  NVL- if the first parameter is null then replace it with second parameter

  if the first parameter is not null then NVL will not do any thing

      SELECT EMPLOYEE_ID , COMMISSION_PCT, NVL(COMMISSION_PCT,10) + 100 AS PROPOSED_COMMISSION FROM EMPLOYEES
  
        SELECT EMPLOYEE_ID , COMMISSION_PCT, NVL(COMMISSION_PCT,10) + 100 AS PROPOSED_COMMISSION FROM EMPLOYEES ORDER BY employee_id DESC;


  NVL2 -- NVL2( expression1, expression2, expression3)
        IF expression1 IS NULL THEN expression will be returned 
        ELSE expression2 will be returned

 COALESCE -- it examines the first expression
        The advantage of the COALESCE() function over the NVL() function is that the COALESCE function can take multiple 
        alternate values. In simple words COALESCE() function returns the first non-null expression in the list.