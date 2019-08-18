--Subqueries

--very interesting topic
--you can play

SELECT 1 id FROM DUAL;

--will it throw error?
(SELECT 1 id FROM DUAL);

--will it throw error?
SELECT (1) id FROM DUAL;

--subqueries in SELECT
SELECT (SELECT SYSDATE FROM DUAL) today FROM DUAL;

--will throw error
SELECT (SELECT SYSDATE, 1 FROM DUAL) today FROM DUAL;
2 ORA-00913: too many values D:\oracleLearning2019\sql\mail\Sub

SELECT  (SELECT SYSDATE FROM DUAL) today,
        (SELECT 1 ID FROM DUAL) num, --ID alias name will be overridden
        (SELECT 1 ID FROM DUAL) 
FROM DUAL;

--multi level in SELECT
--what will be the output?
SELECT (SELECT (SELECT 1 FROM DUAL) + 1 FROM DUAL) + 1 sub_query
FROM DUAL;

--write the above query as below - for easy understanding
SELECT (
          SELECT (
                    SELECT 1 FROM DUAL
                  ) + 1 g FROM DUAL
        ) + 1 sub_query
FROM DUAL;

--remember decode
SELECT dummy, DECODE ('M',
                      'M','Male',
                      'Not updated'
                      ) my_decode
FROM dual;

--other ways of subqueries
SELECT dummy, DECODE ((SELECT dummy FROM DUAL),
                      (SELECT dummy FROM DUAL),(SELECT 'It is X' FROM DUAL),
                      (SELECT 'It is not X' FROM DUAL)
                      ) my_decode
FROM dual;

--try out your own examples and update me - I will add
--------------------------------------------------------------------------------
--subqueries in JOIN
--remember join?
SELECT e.employee_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

--what will be the output?
SELECT *
FROM (SELECT 1 id FROM DUAL) e JOIN (SELECT 1 id FROM DUAL) d
ON (e.id = d.id);

--------------------------------------------------------------------------------
--subqueries in FROM clause
SELECT inner_qry.my_date today_date FROM
(
  SELECT my_date FROM
  (
      SELECT * FROM
      (
        SELECT SYSDATE my_Date FROM DUAL
      )
  )
) inner_qry;

select employee_id, first_name, department_id.*  from 
(
   select * from employees
) department_id


SELECT 'Bala' user_name, inner_qry.* FROM
(
  SELECT 1 id, 'Tomorrow''s date is: '||tomorrow tomorrow FROM
  (
      SELECT my_date + 1 tomorrow FROM
      (
        SELECT SYSDATE my_Date FROM DUAL
      )
  )
) inner_qry;

select e.* from employees e

select 'bala' user_name, sysdate, e.* from employees e

select 'bala' user_name, sysdate, e.* from (
   SELECT 1 id, 'Tomorrow''s date is: '||tomorrow tomorrow FROM
  (
      SELECT my_date + 1 tomorrow FROM
      (
        SELECT SYSDATE my_Date FROM DUAL
      )
  ) 
) e

select 'hongkong' database_name, d.* from 
(
  select  v.date1 + 1 from (
      select hire_date date1 from employees where employee_id = 101 
  ) v
) d 

select hire_date from employees where employee_id = 101;


--------------------------------------------------------------------------------
--subqueries in WHERE
--what will be the output?
SELECT dummy FROM DUAL
WHERE 1 = 1;

--what will be the output?
SELECT dummy FROM DUAL
WHERE (SELECT 2016 FROM DUAL) = 2016;

SELECT dummy FROM DUAL
WHERE 2016 = (SELECT 2016 FROM DUAL);

--------------------------------------------------------------------------------
--just put your SELECT query inside ( ) and it becomes a subquery in SELECT, WHERE, FROM ...
--------------------------------------------------------------------------------
--Requirement:
--fetch employees in Marketing department

--Requirement:
--fetch employees in Marketing and Purchasing department

--Requirement: Fetch the employees who get salary more that Surya

--Requirement: Fetch the employees who are in Surya department and earn more than her

--Who is getting this minimum salary in company?
SELECT * FROM t_test_emp
WHERE salary = (SELECT MIN(salary) FROM t_test_emp);


--Requirement: Group data in t_Test_emp BY department and get COUNT and MAX of salary
--pin it
SELECT department_id, COUNT(*) cnt, MAX(salary) max_sal
FROM t_Test_emp
GROUP BY department_id;

--Requirement: Group data in t_Test_emp BY department and get COUNT and MIN of salary
--Then from the output of this group fetch only the groups which has MAX sal > 10000
SELECT department_id, COUNT(*) cnt, MAX(salary) max_sal
FROM t_Test_emp
GROUP BY department_id
HAVING MAX(salary) > 10000;

--Requirement: Group data in t_Test_emp BY department and get COUNT and MIN of salary
--Then from the output of this group fetch only the groups which has MAX sal > MAX sal of dept 10
SELECT department_id, COUNT(*) cnt, MAX(salary) max_sal
FROM t_Test_emp
GROUP BY department_id
HAVING MAX(salary) > (SELECT MAX(salary) FROM t_Test_emp WHERE department_id = 10);
--this is - HAVING Clause with Subqueries
--------------------------------------------------------------------------------
--try these

SELECT *
FROM (SELECT 1 id1, SYSDATE my_date1 FROM DUAL) e JOIN (SELECT 1 id2, SYSDATE my_date2 FROM DUAL) d
ON (e.id1 = d.id2 AND e.my_date1 = d.my_date2);

--what will be the output?
SELECT dummy, EXTRACT (YEAR FROM SYSDATE) yr FROM DUAL
WHERE (SELECT 2016 FROM DUAL) = EXTRACT (YEAR FROM SYSDATE);

SELECT dummy, EXTRACT (YEAR FROM SYSDATE) yr FROM DUAL
WHERE (SELECT 2019 FROM DUAL) = EXTRACT (YEAR FROM SYSDATE);

--subqueries in WHERE
--what will be the output?
SELECT dummy, DECODE (dummy,
                      'X','It is X',
                      'It is not X'
                      ) my_decode,  CASE dummy 
                                        WHEN 'X' THEN 'It is X'
                                        ELSE 'It is not X' END my_case
FROM dual
WHERE DECODE (dummy,
                      'X','It is X',
                      'It is not X'
                      )             = 
                                        CASE dummy 
                                        WHEN 'X' THEN 'It is X'
                                        ELSE 'It is not X' END;

--what will be the output?
SELECT dummy, DECODE (dummy,
                      'X','It is X',
                      'It is not X'
                      ) my_decode,  CASE dummy 
                                        WHEN 'X' THEN 'It is X'
                                        ELSE 'It is not X' END my_case
FROM dual
WHERE (SELECT DECODE (dummy,
                      'X','It is X',
                      'It is not X'
                      )  FROM DUAL)          = 
                                      (SELECT 
                                        CASE dummy 
                                        WHEN 'X' THEN 'It is X'
                                        ELSE 'It is not X' END
                                        FROM DUAL);
                                        
SELECT dummy, UPPER(
                    DECODE (
                            UPPER((SELECT LOWER(dummy) FROM DUAL)),
                            (SELECT dummy FROM DUAL),(SELECT 'It is X' FROM DUAL),
                            (SELECT 'It is not X' FROM DUAL)
                            )
                    ) my_decode
FROM dual;
--------------------------------------------------------------------------------
--understand structure and data and then execute below examples
SELECT last_name, salary
FROM   employees
WHERE  salary >
               (SELECT salary
                FROM   employees
                WHERE  last_name = 'Abel');
                
SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id =  
                (SELECT job_id
                 FROM   employees
                 WHERE  last_name = 'Taylor')
AND    salary >
                (SELECT salary
                 FROM   employees
                 WHERE  last_name = 'Taylor');

SELECT   department_id, MIN(salary)
FROM     employees
GROUP BY department_id
HAVING   MIN(salary) >
                       (SELECT MIN(salary)
                        FROM   employees
                        WHERE  department_id = 50);
                        
subqry.sql
Displaying subqry.sql.




select * from t_test_emp;