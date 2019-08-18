
Transaction Control Language

- COMMIT
- ROLLBACK
- SAVEPOINT

> DDL is auto commit
   create, alter, drop, truncate, rename

> We have to give commit for DML
   insert, delete, update, merge
 
drop table sample_table;
drop table sample_table2;

create table sample_table (id number);
select * from sample_table;

-- check whether the table is created in another session by running desc sample_table - table will be available in another session also 

-- checking whether DML data goes to the server 
insert into sample_table(id) values (101);

-- check whether the row is available in another session before executing commit and after executing commit
select * from sample_table;
commit;

-- once executed the commit we can't able to rollback.

--------------------------------------------------------------------------------------------------------------------

create table sample_table2(name varchar2(100));

insert into SAMPLE_TABLE2 values ('Ashok');
insert into sample_table values (102);

select * from sample_table;
select * from sample_table2;

commit;

--------------------------------------------------------------------------------------------------------------------

truncate table sample_table;

select  * from sample_table;

delete sample_table2;

select * from sample_table2;

commit;

------------------------------------------------------------------------------------------------------------------------

select * from sample_table;

insert into sample_table values (99);

select * from sample_table2;

insert into sample_table2 values ('Bala');

select * from sample_table2;

commit;

---------------------------------------------------------------------------------------------------------------------------


select * from sample_table;

insert into sample_table values (111);

select * from sample_table2;

insert into sample_table2 values ('Michael');

select * from sample_table2;

create table sample_table4 (id number);  - DDL will auto commit and it will push the above DML act rows to the server, so the below rollback doesn''t 
                                           do anything

rollback;

----------------------------------------------------------------------------------------------------------------------------

update sample_table set id = 101;

update sample_table2 set name = 'nadeem';

select * from sample_table;

select * from sample_table2;

commit;

----------------------------------------------------------------------------------------------------------------------------------

updating and DDL

update sample_table set id = 999;

update sample_table2 set name = 'Vishnu';

create table sample_table5(id number);

select * from sample_table;

select * from sample_table2;

-------------------------------------------------------------------------------------------------------------

delete sample_table;

delete sample_table2;

select * from SAMPLE_table;

select * from sample_table2;

rollback;

-------------------------------------------------------------------------------------------------------------

delete and DDL and rollback

delete sample_table;

delete sample_table2;

select * from SAMPLE_table;

select * from sample_table2;

create table sample_table6 (id number);

rollback;


--------------------------------------------------------------------------------------

Savepoint (Partial Rollback)

-Savepoint names must be distinct within a given transaction. If you create a second savepoint with the same identifier as an earlier savepoint, 
then the earlier savepoint is erased. 

-After a savepoint has been created, you can either continue processing, commit your work, roll back the entire transaction, 
or roll back to the savepoint.

create table savepoint_example(id number);

insert into savepoint_example values (100001);
insert into savepoint_example values (100002);

savepoint in_savepoint_example;  -- 1st savepoint created

insert into savepoint_example values (100010);

savepoint in_savepoint_example1;  -- 2nd savepoint created

select * from savepoint_example;

delete from savepoint_example; -- now deleting all entries 

rollback to in_savepoint_example; -- and trying back to rollback partially using savepoint created 

select * from savepoint_example;

insert into savepoint_example values (100201);

savepoint sv_eg2; -- another savepoint created

select * from savepoint_example;

delete from savepoint_example;

rollback to sv_eg2; -- when this latest savepoint is rollbacked then savepoint_example will be erased
rollback to in_savepoint_example;
2 ORA-01086: savepoint 'IN_SAVEPOINT_EXAMPLE' never established in this session or is invalid 


















