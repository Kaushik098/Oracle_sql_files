SELECT 2+1 FROM dual;

SELECT SYSDATE FROM DUAL;

SELECT 1, 'BALA' FROM dual;

-- To print the giving name in an opposite way.
SELECT REVERSE('RAKESH') FROM DUAL;


-----------------------------------------------------------------------------------
-- DECODE : It is used to check whether the given values matches or not

SELECT DECODE(198,198, 'Yes it is 198','Not 198') FROM employees;

SELECT DECODE(2,3, 'Yes it is','Not') FROM employees;

SELECT DECODE('Hi','Hello','matched','Not matched') FROM DUAL;

SELECT DECODE(employee_id, 198, 'Yes it is 198', 'Not 198') FROM employees;



--------------------------------------------------------------------------------

-- PALINDROME

A.)
SELECT DECODE ( 'MADAM', REVERSE('MADAM'), 'The entered text is a palindrome', 'The entered text is not a palindrome')palin FROM dual;

B.)
--Using WITH clause
WITH temp 
AS
(SELECT '&ENTER_WORD' enter_word FROM DUAL)

SELECT DECODE(enter_word, enter_word,
              enter_word||' - Given word is a palindrome',
              enter_word||' - Given word is not a palindrome'
              ) palin
FROM temp;





SELECT DECODE('enter_word', 'enter_word',
              ' - Given word is a palindrome',
              ' - Given word is not a palindrome'
              ) palin
FROM DUAL;




-------------------------------------------------------------------------------------


  -- Other tasks

  SELECT * FROM USER_OBJECTS
  WHERE object_name = 'EMPLOYEES';

  DESC user_objects;

