Data Dictionary:

- Oracle stores all database information in data dictionary.
- We can select and see  the information.

-- To know information about all Data Dictionary.
select * from DICT

a.) User Objects (Main Data Dictionary)

Select * from user_objects;

select distinct object_type from user_objects;

-- Fetch the count of objects in your schema

select object_type, count(*) from user_objects
group by object_type
order by 2 desc;

select * from user_objects
where OBJECT_TYPE = 'TABLE'
order by LAST_DDL_TIME desc;

select * from vehicle;
truncate table vehicle;

b.) user_tables

Select * from user_tables;

select table_name, num_rows from user_tables;

c.) user_tab_columns

select * from USER_TAB_COLUMNS where table_name = 'T_TEST_EMP';

select * from user_tab_columns where DATA_TYPE = 'DATE';

select * from USER_TAB_COLUMNS;

select  table_name from USER_TAB_COLUMNS where DATA_TYPE = 'DATE';


-- creating tables using two Date columns 

create table date_values (date1 date, date2 date);

insert into date_values (date1, date2) values ('03-Jan-2000', '10-Nov-2010');

insert into date_values (date1, date2) values ('23-Feb-2004', '10-Oct-2014');

select * from date_values;

select table_name from user_tab_columns where data_type = 'DATE';

select table_name, data_type from user_tab_columns where data_type = 'DATE';

select table_name, decode(data_type,'DATE',data_type,'some_other_data_type') data_type from user_tab_columns where data_type = 'DATE';

select table_name, data_type 
from user_tab_columns ut JOIN data_values dv
where (ut.DATA_TYPE = dv.);

select * from date_values;


user_cons_columns - to get the details of column name along with constraint.
user_constraints  - to get the details of constraints information.

----------------------------------------------------------------

select * from user_tab_columns;

--Fetch the table name which has only date date type.

Clue

1) INTERSECT in user_tab_columns

2) JOIN in user_tab_columns

select * from user_tab_columns;

3) Using SUM(DECODE .....

select table_name, sum(decode(data_type, 'DATE', 1, 0)) count_of_data_types, count(*) count_of_columns
from user_tab_columns
group by table_name
having sum(decode(data_type, 'DATE', 1, 0)) = count(*);

select table_name, sum(decode(data_type, 'DATE', 1, 0)) count_of_data_types
from user_tab_columns
group by table_name
having sum(decode(data_type, 'DATE', 1, 0)) = count(*);

select table_name, count(decode(data_type, 'DATE', null, 0)) count_of_data_types
from user_tab_columns
group by table_name
having sum(decode(data_type, 'DATE', 1, 0)) = count(*);





