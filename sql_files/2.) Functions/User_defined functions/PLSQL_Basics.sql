SET SERVEROUTPUT ON
DECLARE
  v_num NUMBER;
  v_var VARCHAR2(100);
BEGIN
  DBMS_OUTPUT.PUT_LINE('START');
  DBMS_OUTPUT.PUT_LINE('v_num print1:'||v_num);
  DBMS_OUTPUT.PUT_LINE('v_var print1:'||v_var);
  v_num := 10;
  v_var := 'APPLE';
  DBMS_OUTPUT.PUT_LINE('v_num print2:'||v_num);
  DBMS_OUTPUT.PUT_LINE('v_var print2:'||v_var);
  v_num := 20;
  v_var := 'ORANGE';  
  --uncomment and try this exception scenario later
  --v_num := 20/0;  
  DBMS_OUTPUT.PUT_LINE('v_num print3:'||v_num);
  DBMS_OUTPUT.PUT_LINE('v_var print3:'||v_var);

  DBMS_OUTPUT.PUT_LINE('END');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM||'-'||SQLCODE);
END;
/

Output:

START
v_num print1:
v_var print1:
v_num print2:10
v_var print2:APPLE
v_num print3:20
v_var print3:ORANGE
END

--------------------------------------------------------------------
SQL PLUS COMPILATION:

A.)SET SERVEROUPUT ON
B.) DECLARE
C.) BEGIN
D.) LOOP INSIDE OR ANY STATEMENT WORKING LOGICALLY
E.) END 
F.) /

-----------------------------------------------------------------------------------------------------------------------

try PIVOT, sub queries, 2 TABLE JOIN AND 3 TABLE JOIN 
  
  PIVOT:  -- the purpose of pivot query is to rotate the table and to display the vertical data horizontally
  
  aggregate_function
        It can be a function such as SUM, COUNT, MIN, MAX, or AVG functions.


  Advantages:
    A.) More DATA visualization 
    B.) TIME saving
    C.) Complex TYPE OF DATA analysis

  QUERY Example:
  
A.)SELECT * FROM employees 
   PIVOT
  (
   MAX(first_name)
   FOR(employee_id)
   IN (100,101,102)
  ); 


SELECT * FROM employees

b.) SELECT * FROM 
       (
        SELECT employee_id, last_name FROM employees
       )
    PIVOT
    (
     MAX(last_name)
     FOR(employee_id)
     IN (100,101,102)
    );

--C.)  
     
     SELECT DISTINCT job_id FROM JOB_HISTORY; 
     

     SELECT * FROM JOBS WHERE MIN_SALARY = 4500 AND MAX_SALARY = 10500
     - job_id   pk
     - job _title VARCHAR
     - min_salary NUMBER
     -max_salary number
 

    SELECT * FROM JOBS 
    PIVOT 
    (
     MAX(job_title)
     FOR(job_id)
     IN('AC_ACCOUNT', 'AC_MGR', 'AD_ASST', 'IT_PROG','MK_REP','SA_MAN','SA_REP','ST_CLERK')
      )


d.)
SELECT * FROM
(
  SELECT customer_ref, product_id
  FROM orders
)
PIVOT
(
  COUNT(product_id)
  FOR product_id IN (10, 20, 30)
)
ORDER BY customer_ref;

Output:
 
customer_ref	10	20	30
ANDERSON	0	0	1
JONES	1	1	0
SMITH	2	3	0


SELECT DISTINCT location_id FROM departments;

department_id pk
department_name VARCHAR
manager_id fk
LOCATION_id fk
  (1800, 2400, 1400, 2500, 1700, 2700, 1500)

SELECT * FROM 
  (
   SELECT /*department_name,*/ location_id FROM DEPARTMENTS 
  )
  PIVOT 
  (
   COUNT(location_id)
   FOR(location_id) IN (1800, 2400, 1400, 2500, 1700, 2700, 1500)
  )


  SELECT COUNT(location_id) FROM departments WHERE location_id = 1700;

----------------------------------------------------------------------------------------

SUBQUERIES:

  -- A subquey is a query within another query.
  -- Called a Nested queries

  What Makes A Subquery
    -- A subquery is a "SELECT" statement within the "WHERE" or "HAVING" clause of an outer "INSERT," "UPDATE," "MERGE" or "DELETE" statement.
    -- The subquery also is called the "inner query" or "inner select." 

    Advantage OF Subquery
    
      We can able TO isolate the statement , perform the same operation that would ordinarily require complex joins and unions and are easier to read.
      
    Disadvantage :
       
      We cannot able TO MODIFY A TABLE AND SELECT FROM THE same TABLE WITHIN A subquery IN THE same SQL STATEMENT.
        
        
        Example Syntax:
      
SELECT
    product_id,
    product_name,
    list_price
FROM
    products
WHERE
    list_price = (
        SELECT
            MAX( list_price )
        FROM
            products
    ); 
    
    
    
    A.) SELECT * FROM countries;  

        SELECT * FROM 
          ( SELECT country_id, country_name FROM countries); 

        SELECT * FROM
             ( SELECT COUNT(country_id) FROM countries);

        SELECT * FROM 
             ( SELECT country_name, country_id FROM countries WHERE region_id = 1);


*    b.) SELECT * FROM employees WHERE department_id = 110;

         SELECT * FROM EMPLOYEES 
         WHERE
            ( department_id = 
            (SELECT MAX(department_id) FROM employees)
            );

    C.) 
         SELECT employee_id, first_name, last_name, department_id FROM EMPLOYEES 
         WHERE
            ( department_id = 
            (SELECT MAX(department_id) FROM employees)
            );
-----------------------------------------------------------------------------------------------------

