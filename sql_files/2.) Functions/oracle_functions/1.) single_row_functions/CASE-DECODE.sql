select REVERSE('Rakesh') from dual;

select SYSDATE from dual;

select 1 id, 'Bala' name from dual;

--DECODE is used to check matched/not matched conditions

SELECT DECODE(employee_id,  --LHS
              198,    -- RHS 
              'Yes it is 198','Not 198'), employee_id
FROM employees;

select DECODE('Hi', 'Hello') from dual;

 -- ORA-00938: not enough arguments for function
 -- There should be 4 parameters in decode.

select DECODE('Hi', 
              'Hello',
              'Matched', 'Not Matched') from dual;

select DECODE('Hi',
              'Hi',
              'Matched', 'Not Matched') from dual;


---------------------------------------------------------------------------------------



--Copy paste all queries in sqldeveloper or sqlplus and analyse

--Using CASE
--FInd out the requirement
SELECT employee_id, 
       first_name,
       salary,
       CASE WHEN salary IS NULL THEN 'No Grade'
            WHEN salary < 3000 THEN 'Grade 1'
            WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
            ELSE 'Grade 3'
       END Grade
FROM employees
ORDER BY 3 DESC;

--try

SELECT employee_id, 
       first_name,
       salary,
       CASE WHEN salary IS NULL THEN 'No Grade'
            WHEN salary < 3000 THEN 'Grade 1'
            WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
            ELSE 'Grade 3'
       END GRADE
FROM employees
ORDER BY 3 DESC;



--Using a simple subquery
SELECT *
FROM
(
    SELECT employee_id, 
           first_name,
           salary,
           CASE WHEN salary IS NULL THEN 'No Grade'
                WHEN salary < 3000 THEN 'Grade 1'
                WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
                ELSE 'Grade 3'
           END Grade
    FROM employees
    ORDER BY 3 DESC
)
ORDER BY 4 DESC;

-- try

SELECT *
FROM
(
    SELECT employee_id, 
           first_name,
           salary,
           CASE WHEN salary IS NULL THEN 'No Grade'
                WHEN salary < 3000 THEN 'Grade 1'
                WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
                ELSE 'Grade 3'
           END Grade
    FROM employees
    ORDER BY 3 DESC
)
ORDER BY 4;

--Using GROUP BY
SELECT grade, COUNT(*)
FROM
(
    SELECT employee_id, 
           first_name,
           salary,
           CASE WHEN salary IS NULL THEN 'No Grade'
                WHEN salary < 3000 THEN 'Grade 1'
                WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
                ELSE 'Grade 3'
           END Grade
    FROM employees
    ORDER BY 3 DESC
)
GROUP BY Grade
ORDER BY 2 DESC;


--Using HAVING
SELECT grade, COUNT(*) grade_count
FROM
(
    SELECT employee_id, 
           first_name,
           salary,
           CASE WHEN salary IS NULL THEN 'No Grade'
                WHEN salary < 3000 THEN 'Grade 1'
                WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
                ELSE 'Grade 3'
           END Grade
    FROM employees
    ORDER BY 3 DESC
)
GROUP BY Grade
HAVING COUNT(*) > 25
ORDER BY 2 DESC;


--Creating a view for above SELECT
CREATE OR REPLACE VIEW v_grade_count AS
SELECT grade, COUNT(*) grade_count
FROM
(
    SELECT employee_id, 
           first_name,
           salary,
           CASE WHEN salary IS NULL THEN 'No Grade'
                WHEN salary < 3000 THEN 'Grade 1'
                WHEN salary BETWEEN 3000 AND 5999 THEN 'Grade 2'
                ELSE 'Grade 3'
           END Grade
    FROM employees
    ORDER BY 3 DESC
)
GROUP BY Grade
HAVING COUNT(*) > 25
ORDER BY 2 DESC;


--Selecting from view
SELECT * FROM v_grade_count;

--------------------------------------------------------------------------------------


--Less5

--case
/*
CASE expressions allow you to use the IF-THEN-ELSE logic in SQL statements
*/

DROP TABLE t_emp_test;
CREATE TABLE t_emp_Test
(
  emp_id NUMBER,
  e_name VARCHAR2(100),
  gender CHAR(1),
  salary NUMBER
);

INSERT INTO t_emp_test VALUES (100, 'Bala', 'M', 2000);
INSERT INTO t_emp_test VALUES (101, 'Suresh', 'M', 2500);
INSERT INTO t_emp_test VALUES (102, 'Vimala', 'F', 3500);
INSERT INTO t_emp_test VALUES (103, 'Shreya', 'F', 4500);
INSERT INTO t_emp_test VALUES (104, 'Krlos Ganhui', NULL, NULL); -- new joinee, other details including gender will be updated later
COMMIT;

/*
--Requirement: Select all columns from employee table
If gender is M then print Male, if gender is F then print Female, else 'Not yet updated'
*/
--pint it
SELECT * FROM t_emp_test;

SELECT emp_id, e_name, gender, salary, 
DECODE(gender,
              'M', 'Male', --IF 'M' THEN 'Male'
              'F', 'Female',--ELSIF 'F' THEN 'Female'
              'No yet updated' --ELSE - default
      ) new_gender
FROM t_emp_test;

--rewrite above using CASE
SELECT emp_id, e_name, gender, salary, 
CASE gender 
            WHEN  'M' THEN 'Male' --IF 'M' THEN 'Male'
            WHEN  'F' THEN 'Female'--ELSIF 'F' THEN 'Female'
            ELSE  'No yet updated' --ELSE - default
END new_gender
FROM t_emp_test;

--You can use DECODE or CASE - as your wish

/*
CASE expr WHEN comparison_expr1 THEN return_expr1
         [WHEN comparison_expr2 THEN return_expr2
          WHEN comparison_exprn THEN return_exprn
          ELSE else_expr]
END

The expressions expr and comparison_expr must be of the same data type, 
which can be CHAR, VARCHAR2, NCHAR, or NVARCHAR2. 
All of the return values (return_expr) must be of the same data type.

*/

--------------------------------------------------------------------------------
--CASE has 2 types
--type1 - as above

--type2
SELECT emp_id, e_name, gender, salary, 
CASE WHEN gender = 'M'  THEN 'Male' --IF 'M' THEN 'Male'
     WHEN gender = 'F' THEN 'Female'--ELSIF 'F' THEN 'Female'
     ELSE  'No yet updated' --ELSE - default
END new_gender
FROM t_emp_test;
---------------
--DECODE and case Type1 can be used only for = (equal to) comparison requirements

--case Type2 can be used for other operators also - LIKE, !=, BETWEEN, >, <, >=, <=
SELECT emp_id, e_name, gender, salary, 
CASE WHEN gender != 'M'  THEN 'Male' --IF 'M' THEN 'Male'
     WHEN gender != 'F' THEN 'Female'--ELSIF 'F' THEN 'Female'
     ELSE  'No yet updated' --ELSE - default
END new_gender
FROM t_emp_test;
---------------
--Adding additional conditions in case type 1
SELECT emp_id, e_name, gender, salary, 
CASE gender 
            WHEN  'M' AND 1=1 THEN 'Male' --IF 'M' THEN 'Male'
            WHEN  'F' AND 1=1 THEN 'Female'--ELSIF 'F' THEN 'Female'
            ELSE  'No yet updated' --ELSE - default
END new_gender
FROM t_emp_test;
--error

--case Type2 can be used for adding additional conditions
SELECT emp_id, e_name, gender, salary, 
CASE WHEN gender = 'M' AND 1=1 THEN 'Male' --IF 'M' THEN 'Male'
     WHEN gender = 'F' AND 1=1 THEN 'Female'--ELSIF 'F' THEN 'Female'
     ELSE  'No yet updated' --ELSE - default
END new_gender
FROM t_emp_test;

--------------------------------------------------------------------------------

--try in lab
SELECT last_name, job_id, salary,
       CASE job_id WHEN 'IT_PROG'  THEN  1.10*salary
                   WHEN 'ST_CLERK' THEN  1.15*salary
                   WHEN 'SA_REP'   THEN  1.20*salary
       ELSE      salary END     "REVISED_SALARY"
FROM   employees;


SELECT last_name, job_id, salary,
       DECODE(job_id, 'IT_PROG',  1.10*salary,
                      'ST_CLERK', 1.15*salary,
                      'SA_REP',   1.20*salary,
              salary)
       REVISED_SALARY
FROM   employees;

SELECT last_name, salary,
       DECODE (TRUNC(salary/2000, 0),
                         0, 0.00,
                         1, 0.09,
                         2, 0.20,
                         3, 0.30,
                         4, 0.40,
                         5, 0.42,
                         6, 0.44,
                            0.45) TAX_RATE
FROM   employees
WHERE  department_id = 80;
