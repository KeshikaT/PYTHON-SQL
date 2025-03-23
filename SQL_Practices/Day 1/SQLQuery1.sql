create database foundationtraining;
use foundationtraining;

--view 
select * from sys.databases;
select name from sys.databases;

--alter table/modify table
alter database foundationtraining modify name= foundationtraining1;
alter database foundationtraining1 add file (name=mynewfile, filename="D:\SQL_Practices\mynewfile.txt");
alter database foundationtraining1 set read_only;
alter database foundationtraining1 set read_write;

 --create table
create table ipltable (teamid int not null primary key, teamName varchar(45), teamOwner varchar(45), teamCaptain varchar(45));
insert into ipltable values(1,'CSK','India Cements','RG');
insert into ipltable values (2,'MI','Reliance','HP'),(3,'RCB','KF','VK'),(4,'DC','CV','Axar');

--alter
alter table ipltable add winscore int;
update ipltable set winscore = 10 where teamName = 'CSK';
update ipltable set winscore = 9 where teamName = 'RCB';
update ipltable set winscore = 5 where teamName = 'MI';
update ipltable set winscore = 8 where teamName = 'DC';

UPDATE ipltable 
set winscore = case 
    when teamName = 'CSK' then 10
    when teamName = 'RR' then 9
    when teamName = 'MI' then 5
    when teamName = 'GT' then 11
    when teamName = 'DC' THEN 8
    else winscore 
end;

--changing table name
exec sp_rename 'ipltable','ipl'

select * from ipl

--droping a table
drop table ipl;

--delete data
delete from ipl where winscore<6

--Manipulating 
update ipl set winscore = 8 where teamName = 'DC';

--viewing 
select * from ipl

select teamName from ipl

select teamName from ipl where teamCaptain='VK'

--crime table(task)
create table report(CrimeId int not null primary key, CrimeType varchar(45), CrimeLocation varchar(45));
insert into report values(1,'Theft','Chennai'),(2,'Assault','Coimbatore'),(3,'Cyber Attack','Bangalore'),(4,'Hit and Run','Madurai');
select * from report;

--Identifying Data types
exec sp_help ipl

--datatypes
select 
    c.name as ColumnName, 
    c.max_length as MaxLength, 
    c.is_nullable as IsNullable 
from sys.columns c;

select t.name as datatype from sys.types t;

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'ipl';

--inserting values
insert into ipl values (5,'MI','indiawin','HardikPandya',10);
insert into ipl values(6,'RR','royalMultisport','sanjuSamson',2);

update ipltable set teamCaptain = 'Sachin' where teamName='MI';

--view 
select * from ipl
select * from ipltable where winscore<10; 
select * from ipltable where teamCaptain in ('Sachin','sanjuSamson');
select * from ipltable where teamCaptain not in ('Sachin','sanjuSamson');
select * from ipltable where winscore between 10 and 20;
select teamName as name from ipltable;
select teamName name from ipltable;
 
--creating a new table
create table playerdata(
id int not null primary key, 
name varchar(45), 
age int, 
score int
);
 
insert into playerdata values(1,'sachin',55,240),(2,'rahul',54,200),(3,'zahir',53,40),(4,'yuvraj',52,200),(5,'sehwag',56,300);

--view  
select * from playerdata;
select distinct score from playerdata;
select * from playerdata where age<55 and score>100;
select * from playerdata where age<55 or score>100;
select * from playerdata where not age<55; 
select * from playerdata where name like 's%';
select * from playerdata where name like 'z_h__';

-- new table: Students (task)
create table marks (studName varchar(45), SubjName varchar(45), StudMarks int not null);
insert into marks 
values ('Ram','English',84),('Ram','Math',98),('Ram','Science',88),
('Raj','English',95),('Raj','Math',85),('Raj','Science',84);
select * from marks

select studName, sum(StudMarks) as tot_Marks from marks group by studName;
select studName, sum(StudMarks) as tot_Marks from marks
group by studName order by tot_Marks desc 

drop database crimeReporting