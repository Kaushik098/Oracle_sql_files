
--2.) To find out the region name for specific employee_id :

SELECT * FROM employees WHERE EMPLOYEE_ID = 100;
SELECT * FROM departments WHERE DEPARTMENT_ID = 90;
SELECT * FROM locations WHERE LOCATION_ID = 1700;
SELECT * FROM COUNTRIES WHERE COUNTRY_ID = 'US';
SELECT region_name FROM REGIONS WHERE REGION_ID = 2;

Output:
Americas


--3 a.) Region of Employee id = 108

SELECT * FROM employees WHERE EMPLOYEE_ID = 108;
SELECT * FROM departments WHERE DEPARTMENT_ID = 100;
SELECT * FROM locations WHERE LOCATION_ID = 1700;
SELECT * FROM COUNTRIES WHERE COUNTRY_ID = 'US';
SELECT region_name FROM REGIONS WHERE REGION_ID = 2;

Output:
Americas

-- 3 b.) Region of Employee id = 112

SELECT * FROM employees WHERE EMPLOYEE_ID = 112;
SELECT * FROM departments WHERE DEPARTMENT_ID = 100;
SELECT * FROM locations WHERE LOCATION_ID = 1700;
SELECT * FROM COUNTRIES WHERE COUNTRY_ID = 'US';
SELECT region_name FROM REGIONS WHERE REGION_ID = 2;

Output:
Americas.

-- 4.) Find the regions where there are no locations 

Region 1    BE, CH, DE, DK, FR, IT, NL, UK

Region 2    AR,BR,CA,MX,US

Region 3    AU, CN, IN, JP, ML, SG

Region 4    EG, IL, KW, NG, ZM, ZW    
 
 Region 1     BE, DK, FR
 Region 2     AR
 Region 3     ML 
 Region 4     EG, IL, KW, NG, ZM, ZW 
 
 SELECT * FROM locations WHERE country_id IN ('EG','IL','KW','NG','ZM''ZW');
 
 Answer:  Region 4 
 
-- 5) Find the employees who do not have managers

SELECT employee_id FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

Output:
100


-- 6.) Maximum number of countries in a region
 SELECT COUNT(region_id), region_id FROM countries GROUP BY region_id;
 SELECT MAX(region_id), region_id FROM countries GROUP BY region_id;
 
 Output:
 1 (Europe 8)

---7) How many locations are in US
 
 SELECT COUNT(*) FROM locations WHERE country_id IN ('US');
 
 Output:
  4
  
---8.) To which region does city Bern belong to  
 
   SELECT country_id FROM locations WHERE City = 'Bern';
  SELECT region_id FROM COUNTRIES WHERE COUNTRY_ID = 'CH';
  SELECT region_name FROM REGIONS WHERE region_id = 1;
  
  Output:
    Europe
	
--9.)  Fetch the employees who do not get commission

100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206	
	
---10.)  Fetch the employees joined after '21-MAY-07'

 SELECT * FROM EMPLOYEES  where hire_date > '21-may-2007';
--------------------------------------------------------------------------

Tasks:
SELECT DISTINCT department_id FROM employees
WHERE salary > 5000 AND department_id IS NOT NULL
ORDER BY department_id ASC;


SELECT DISTINCT department_id FROM employees
WHERE salary > 5000 AND department_id IS NOT NULL;
--Can you analyze IS NULL vs IS NOT NULL in a WHERE condition, come up with more query examples


SELECT DISTINCT department_id FROM employees
WHERE salary > 5000 AND department_id IS NOT NULL;
--Can you analyze IS NULL vs IS NOT NULL in a WHERE condition, come up with more query examples
  


-------------------------------------------------------------------------- 
 
--11.)  Fetch the countries where employees get salary more than 5000
SELECT * FROM employees WHERE SALARY > 5000;
 
--12.) DISTINCT USAGE:

DISTINCT :  It is used to return different values 
(If any values are repeating then it will not be shown as output)

Examples:

SELECT DISTINCT department_id FROM employees
WHERE salary > 5000 AND department_id IS NOT NULL
ORDER BY department_id DESC;

SELECT DISTINCT first_name FROM EMPLOYEES;

SELECT DISTINCT manager_id FROM EMPLOYEES;

SELECT DISTINCT manager_id FROM EMPLOYEES WHERE SALARY < 5000 OR SALARY >7000 AND manager_id IS NOT NULL;


SELECT DISTINCT department_id FROM employees
WHERE salary > 5000 AND department_id IS NULL;
  
-------------------------------------------------------------------------------




 
 
 
 