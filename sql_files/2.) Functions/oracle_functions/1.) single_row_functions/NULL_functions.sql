	NVL NVL2 COALESCE NULLIF	

Use table T_COALESCE_TEST - script available in NULL functions FILE

1	fetch the employees who are yet to submit any of their contact details in t_coalesce_test table (example emp id 600) using NULL functions

  SELECT * FROM T_COALESCE_TEST 
  WHERE COALESCE(FATHER_NUMBER, MOTHER_NUMBER,SPOUSE_NUMBER) IS NULL ;  


2	Try the above without using NULL FUNCTION
  
  SELECT * FROM T_COALESCE_TEST
  WHERE FATHER_NUMBER IS NULL
  AND MOTHER_NUMBER IS NULL 
  AND SPOUSE_NUMBER IS NULL;

3	fetch the employees who have submitted atleast one emergency contact (reverse of above requirement) using NULL functions
   
  SELECT * FROM T_COALESCE_TEST 
  WHERE COALESCE(FATHER_NUMBER,MOTHER_NUMBER,SPOUSE_NUMBER) IS NOT NULL;   

4	Try the above without using NULL FUNCTION
  
  SELECT * FROM T_COALESCE_TEST
  WHERE FATHER_NUMBER IS NOT NULL 
  OR MOTHER_NUMBER IS NOT NULL
  OR SPOUSE_NUMBER IS NOT NULL;

5	We got an emergency number in hand - 987654222. Fetch the employee(s) who has given this as emergency number (from table t_coalesce_test)
--Hint - you have to use more than one NULL functions to achieve this
 
   SELECT * FROM T_COALESCE_TEST
   WHERE COALESCE(FATHER_NUMBER,MOTHER_NUMBER,SPOUSE_NUMBER) = 987654222;
  

6	Try the above without using NULL FUNCTION

  SELECT * FROM T_COALESCE_TEST
  WHERE FATHER_NUMBER = 987654222
  OR MOTHER_NUMBER = 987654222 
  OR SPOUSE_NUMBER = 987654222;


7	fetch only those employees who have given all 3 numbers (hint use AND/OR - straight forward without using any functions).
  answer is 100 - who has given all 3 numbers

  SELECT * FROM T_COALESCE_TEST 
  WHERE FATHER_NUMBER IS NOT NULL 
  AND MOTHER_NUMBER IS NOT NULL 
  AND spouse_number IS NOT NULL;


--8	Assume these data in employees table

employee_id	first_name	last_name
100	Bala	Kumar
101	Suresh	Kalyan
102	Gopinath	Surya
... other employees records	


You have to write a query using mix of NULL and other functions to achieve output like below.
Bring out an additional column - length_same_or_not

employee_id	first_name	last_name	length_same_or_not	
100	Bala	Kumar	not same		
101	Suresh	Kalyan	same		
102	Gopinath	Surya	not same		
... other employees records				


SELECT first_name, last_name, NVL(Length(first_name),100), NVL(Length(last_name),100) FROM employees;

SELECT employee_id, first_name, last_name, NULLIF(LENGTH(first_name), LENGTH(last_name)),  LENGTH AS length_same_or_not
FROM employees 

  SELECT first_name, last_name, NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)),'not same','same') AS length_same_or_not FROM employees;

SELECT * FROM employees;

9	Fetch the employees who are not getting commission using NULLIF

   SELECT * FROM employees 
   WHERE NULLIF(commission_pct, null) IS NULL;   
    
10	Fetch the employees who are not getting commission using NVL2

  SELECT * FROM employees 
  WHERE NVL2(commission_pct, commission_pct, null) IS NULL 


11	Fetch the employees who are not getting commission using COALESCE

   SELECT * FROM employees 
   WHERE COALESCE(commission_pct, null) IS NULL

     

12	Fetch the employees getting commission using NULLIF, NVL2, COALESCE - write 3 separate SELECT queries

   NULLIF
     
   SELECT * FROM employees 
   WHERE NULLIF(commission_pct, null) IS NOT NULL;   

   NVL2

   SELECT * FROM employees 
   WHERE NVL2(commission_pct, commission_pct, null) IS NOT NULL; 
 
   COALESCE

   SELECT * FROM employees 
   WHERE COALESCE(commission_pct, null) IS NOT NULL



select NVL(null,90) from dual;

select NVL2(1,20,100) from dual;
select NVL2(null,20,100) from dual;

select COALESCE(0,0,9,null) from dual
select COALESCE(null,null,9,null) from dual
select COALESCE(null,null,null,null) from dual