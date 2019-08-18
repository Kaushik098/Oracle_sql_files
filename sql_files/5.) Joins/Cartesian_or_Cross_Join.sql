Cartesian or Cross Join :
------------------------

** The output of cross join is wrong, used only for data testing purpose.

select *
from t_test_emp e, T_TEST_DEPT d
where (e.DEPARTMENT_ID = d.DEPARTMENT_ID);

-- The following query results 3 * 8 rows 

select *
from t_test_emp e, T_TEST_DEPT d;

Cross Join happens when we miss the join condition or the given join condition is invalid.

select *
from t_test_emp e, T_TEST_DEPT d
where 1 = 1;

Purpose of Cross Join:

** Testing of front end screen
a.) to check whether the application can handle many rows.
b.) To check page navigation.

-- 8 * 3 * 8 = 192 rows
select *
from t_test_emp e, T_TEST_DEPT d, T_TEST_EMP;

ANSI CROSS JOIN:

select *
from t_test_emp e CROSS JOIN T_TEST_DEPT d CROSS JOIN T_TEST_EMP;