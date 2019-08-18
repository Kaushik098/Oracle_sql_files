Inbuilt Functions 

Single Row Functions

a.) null functions
The following functions work with any data type and pertain to using nulls:
NVL (expr1, expr2)
NVL2 (expr1, expr2, expr3)
NULLIF (expr1, expr2)
COALESCE (expr1, expr2, ..., exprn)

NVL - the first and second datatype should be same inside parameter
SELECT employee_id, salary, commission_pct,  NVL(commission_pct,'a') total_salary
FROM employees;

ERROR:
1 ORA-01722: invalid number 

positive scenario:
SELECT employee_id, salary, commission_pct, salary + NVL(commission_pct,0) total_salary
FROM employees;

SELECT NVL('hello','hi') FROM DUAL;
SELECT NVL(null,'hi') FROM DUAL;


Sub Query

SELECT * FROM
(
   SELECT first_name, NVL(first_name,'No first Name') nvl_name
   FROM employees
)
WHERE nvl_name = 'No first Name';


--requirement: if an employee has last_name then print - HAS NAME, else DOESN'T HAVE NAME
SELECT last_name, NVL2(last_name, 'doesn''t have name', 'has name') AS NVLNAME FROM employee

Note: In NVL2 if 1st parameter commission_pct - source is null the second paramater will be returned
      if commission_pct is not null then third parameter will be returned
example:	  
SELECT employee_id, commission_pct, NVL2(commission_pct,1000,2000) FROM employees;

SELECT NVL2(NULL, 'hi', 'sir') FROM dual;

SELECT NVL2('Madam', ' hi', 'sir') FROM dual;

--COLAESCE
CREATE TABLE t_coalesce_test
(
 EMPLOYEE_ID NUMBER,
 FATHER_NUMBER NUMBER,
 MOTHER_NUMBER NUMBER,
 SPOUSE_NUMBER NUMBER
);

INSERT INTO t_coalesce_test VALUES (100,9876456544,987654323,982254323);
INSERT INTO t_coalesce_test VALUES (200,NULL,987654222,900054323);
INSERT INTO t_coalesce_test VALUES (300,NULL,987654222,NULL);
INSERT INTO t_coalesce_test VALUES (400,9876456544,NULL,NULL);
INSERT INTO t_coalesce_test VALUES (500,NULL,NULL,902344323);
INSERT INTO t_coalesce_test VALUES (600,NULL,NULL,NULL);
COMMIT;
----------------------------------


SELECT employee_id, COALESCE(father_number,mother_number,spouse_number) FROM t_coalesce_test;

-- the following wuery returns 0 for the null values
/* if the father number is not available it check for mother number 
   even though there is no number it checks for spouse number
   if there is no null number in all three params 
   then it returns 0 */
   
SELECT employee_id, COALESCE(father_number,mother_number,spouse_number,0) FROM t_coalesce_test;


NULLIF
--RETURN NULL IF BOTH THE PARAMETERS ARE SAME
SELECT NULLIF('a','a') FROM dual;

--if both paramaters are not same then it returns first paramter 
SELECT NULLIF('a','b') FROM dual;

-- Req (1/0 must return null)
SELECT 1/NULLIF(0,0) FROM dual;
SELECT 1/NULLIF(10,0) FROM dual;


--------------------------------------------------------------------------------------------------------


  Practical SESSION

   SELECT employee_id, salary, commission_pct,  NVL(commission_pct,'a') total_salary
FROM employees;


  SELECT employee_id, salary, commission_pct,  NVL2(commission_pct,0,) total_salary
FROM employees;

--USING dual
SELECT NVL('hello','hi') FROM DUAL;

SELECT first_name, NVL(first_name,'No first Name') nvl_name
FROM employees;


SELECT * FROM
(
   SELECT first_name, NVL(first_name,'No first Name') nvl_name
   FROM employees
)
WHERE nvl_name = 'No first Name';


--requirement: if an employee has last_name then print - HAS NAME, else DOESN'T HAVE NAME
SELECT last_name, NVL2(last_name, 'has name', 'doesn''t have name') AS NVLNAME FROM employees;

SELECT employee_id, commission_pct, NVL2(commission_pct,1000,2000) FROM employees;

SELECT NVL2(NULL, 'hi', 'sir') FROM dual;

SELECT NVL2('Madam', ' hi', 'sir') FROM dual;



--COLAESCE
CREATE TABLE t_coalesce_test
(
 EMPLOYEE_ID NUMBER,
 FATHER_NUMBER NUMBER,
 MOTHER_NUMBER NUMBER,
 SPOUSE_NUMBER NUMBER
);

INSERT INTO t_coalesce_test VALUES (100,9876456544,987654323,982254323);
INSERT INTO t_coalesce_test VALUES (200,NULL,987654222,900054323);
INSERT INTO t_coalesce_test VALUES (300,NULL,987654222,NULL);
INSERT INTO t_coalesce_test VALUES (400,9876456544,NULL,NULL);
INSERT INTO t_coalesce_test VALUES (500,NULL,NULL,902344323);
INSERT INTO t_coalesce_test VALUES (600,NULL,NULL,NULL);
COMMIT;

SELECT * FROM t_coalesce_test;

-- Req
  FETCH THE FIRST available NUMBER FOR ALL THE employees 

  SELECT employee_id, father_number AS emergency_number, mother_number AS emergency_number, spouse_number AS emergency_number FROM T_COALESCE_TEST 
  
    SELECT employee_id, COALESCE(father_number,mother_number,spouse_number) FROM t_coalesce_test;

  SELECT employee_id, COALESCE(father_number,mother_number,spouse_number) FROM t_coalesce_test;

SELECT employee_id, COALESCE(father_number,mother_number,spouse_number,0) FROM t_coalesce_test;

  SELECT 1/NULLIF(10,0) FROM dual;

  SELECT NULLIF('a','b') FROM dual;

  SELECT NULLIF (1, 1) FROM dual;


---------------------------------------------------------------------------------------------------


  Understanding

  NVL2(exp1, exp2, exp3)

  exp1 -  source( it can be null or not null VALUE)
  exp2 -  it IS returned WHEN THE exp1 IS NOT NULL
  exp3 -  it IS returned WHEN THE exp2 IS NULL

  NVL( exp1, exp2 )
  exp1 - source ( might be NULL OR NOT NULL)
      -- if it is not null the value will be returned as such
      -- or else the exp2 will be returned
  exp2 -- it is returned when the exp1 source value is null

  COALESCE ( exp1, exp2 ... expn)

        -- it works like if .. else if condition
        
      -- for eg:)
 IF address1 is not null THEN
    result := address1;

ELSIF address2 is not null THEN
   result := address2;

ELSIF address3 is not null THEN
   result := address3;

ELSE
   result := null;

END IF;


Own examples with practicals:

 SELECT EMPLOYEE_ID, salary, commission_pct, NVL(commission_pct,0) propsed_salary
 FROM employees;

 SELECT last_name, salary, commission_pct,
 NVL2(commission_pct, salary+COMMISSION_PCT /*returns if exp1 is not null*/, salary /*it is returned when exp1 is null */)
 income FROM employees;

SELECT last_name, COALESCE( last_name,' it has last name', ' it doesn''t have last name') 
FROM employees; 

SELECT last_name, COALESCE( commission_pct,salary+COMMISSION_PCT,salary+COMMISSION_PCT+COMMISSION_PCT) proposed_salary
FROM employees; 