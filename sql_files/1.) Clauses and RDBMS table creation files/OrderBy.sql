
-- ORdER BY CLAUSE 

--a.) ASC
SELECT * FROM employees ORDER BY first_name ASC;

SELECT * FROM employees ORDER BY first_name;

--b.) DESC
  SELECT * FROM employees ORDER BY first_name DESC;

--c.) Using where clause with order by 

  SELECT * FROM employees WHERE salary > 5000 ORDER BY first_name;

--d.) with commission pct
  
   SELECT  * FROM employees WHERE COMMISSION_PCT IS NOT NULL ORDER BY first_name; 

-- e.) With hire date
   
  SELECT * FROM employees ORDER BY HIRE_DATE;

  SELECT * FROM employees WHERE HIRE_DATE > '01-JAN-2007' ORDER BY HIRE_DATE;




