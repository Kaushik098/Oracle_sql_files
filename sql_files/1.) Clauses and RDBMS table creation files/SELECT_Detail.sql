SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID 
FROM departments;

--- Alias Name ( AS is Optional )
   SELECT DEPARTMENT_ID AS d_id, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID FROM departments;

   SELECT DEPARTMENT_ID d_id, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID FROM departments;

   SELECT DEPARTMENT_ID AS d_id, DEPARTMENT_NAME AS d_name, MANAGER_ID AS m_id, LOCATION_ID AS loc_id FROM departments;

-- To get the exact case of column name
   SELECT DEPARTMENT_ID AS "d_id", DEPARTMENT_NAME AS "d_Name", MANAGER_ID AS "m_iD", LOCATION_ID AS "loc_id" FROM departments;
-- To get space in alias name
   SELECT DEPARTMENT_ID AS "d id", DEPARTMENT_NAME AS "d Name", MANAGER_ID AS "m iD", LOCATION_ID AS "loc id" FROM departments;


-- Req 1:   Increment the salary for employees 5000 rs. Do not update the table. Just do increment in select statement

-- Without updating we can able to operate in created table
   SELECT employee_id, first_name, salary, salary+500 FROM employees; 
-- Tried with alias name 
   SELECT employee_id AS "emp_id", first_name AS "f_name", salary AS "Current Salary", salary+500 AS "Proposed Salary" FROM employees; 

  ---------------------------------------------------------------
---Example : Trying WITH multiplication

    SELECT employee_id, first_name, salary, salary*3, salary/2, salary-1000 FROM EMPLOYEES WHERE salary > 5000;

------------------------------------------------------------------

 -- Req2: Annual Salary OF Employees

  SELECT employee_id, first_name, salary AS "Current Salary", salary*12 AS "Annual Salary" FROM employees; 

 -- Req3 :  FETCH THE Annual salary OF employees AND INCREMENT it BY 500 rs

  SELECT employee_id, first_name, salary AS "Current Salary", salary*12 AS "Annual Salary", (salary*12)+500 AS "Incremented Salary" FROM employees;   

  SELECT employee_id, first_name, salary AS "Current Salary", salary*12 AS "Annual Salary", salary*(12+500) AS "Incremented Salary" FROM employees;   

  -- Be careful with brackets while operating with many operators (BODMAS rule)


SELECT employee_id, first_name, salary current_salary, salary + 1000 proposed_salary, 
salary - 1000 "pro sal", salary /555 as "upd sal", salary * 434 as "mul sal",
employee_id + 1 as emp_id , (employee_id + department_id + salary)/ manager_id hhh
from employees;

--Eg:
    SELECT employee_id, first_name, salary AS "Current Salary", salary + employee_id+ (manager_id * 2) - 1000 "Updated Salary" FROM employees;


-- DUAL TABLE(It is a dubby TABLE and it is used for learning purpose):

  SELECT 1 AS normal_number, 1+1 "Double number", 1+2+3 "Triple number", 5*6 "Multipling two numbers" FROM DUAL;

  SELECT 1+1*3, (1+1)*3 FROM DUAL;

  SELECT ((5 * 12)/6) - 10 my_calc FROM DUAL;

  SELECT 1 id, 'Bala' NAME, '01-JAN-1990' d_o_b FROM DUAL;

-- To check the today's date
  SELECT SYSDATE FROM DUAL;
-- Alias name 
 SELECT SYSDATE "Today's Date" FROM DUAL;   

--Tomorrow Date
   SELECT SYSDATE + 1 tomorrow, SYSDATE+1000, SYSDATE-1 FROM DUAL;

SELECT 1 id, 'Bala', SYSDATE + 1 joining_date FROM DUAL;




-- DISTINCT

DROP TABLE t_states;
CREATE TABLE t_states
(
 STATE VARCHAR2(100)
);

INSERT INTO t_states VALUES ('TN');
INSERT INTO t_states VALUES ('TN');
INSERT INTO t_states VALUES ('TN');
INSERT INTO t_states VALUES ('KA');
INSERT INTO t_states VALUES ('KA');
INSERT INTO t_states VALUES ('MH');
COMMIT;
--select and check
SELECT * FROM t_states;
--identify the occurences for each state

--Requirement: fetch the distinct states
SELECT DISTINCT state FROM t_states;

DROP TABLE t_state_cities;
CREATE TABLE t_state_cities
(
 STATE VARCHAR2(100),
 CITY VARCHAR2(100)
);

INSERT INTO t_state_cities VALUES ('TN','Chennai');
INSERT INTO t_state_cities VALUES ('TN','Chennai');
INSERT INTO t_state_cities VALUES ('TN','Coimbatore');
INSERT INTO t_state_cities VALUES ('KA','Bangalore');
INSERT INTO t_state_cities VALUES ('KA','Mysore');
INSERT INTO t_state_cities VALUES ('MH','Mumbai');
COMMIT;



  --- only one distinct is allowed while writing a query


--select and check
SELECT * FROM t_state_cities;
--identify the occurences for each state and city

--Requirement: fetch the distinct states
SELECT DISTINCT state FROM t_state_cities;

--Requirement: fetch the distinct states and cities
SELECT DISTINCT state, city FROM t_state_cities;



