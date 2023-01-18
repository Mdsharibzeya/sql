create database cricket;
use cricket;
create table cricket_1(
Player_Id varchar(20),
Player_Name varchar(20),
Runs int,
Popularity int);
insert into cricket_1(Player_Id,Player_Name,Runs,Popularity) VALUES('PL1','Virat',50,10);
insert into cricket_1 values('PL2',	'Rohit', 41,7);
insert into cricket_1 values('PL3','Jadeja',33,6);
insert into cricket_1 values('PL4','Dhoni',35,15);
insert into cricket_1 values('PL5','Dhawan',45,12);
insert into cricket_1 values('PL6','Yadav',66,10);
insert into cricket_1 values('PL7','Raina',32,9);
insert into cricket_1 values('PL8','Binny',44,11);
insert into cricket_1 values('PL9','Rayudu',63,12);
insert into cricket_1 values('PL10','Rahane',21,10);
insert into cricket_1 values('PL11','A.Patel',12,9);
insert into cricket_1 values('PL12','B.Kumar',30,7);
select * from cricket_1




create table cricket_2(
Player_Id varchar(20),
Player_Name varchar(20),
Runs int,
Charisma int);
insert into cricket_2(Player_Id,Player_Name,Runs,Charisma) VALUES('PL1','Virat',50,55);
insert into cricket_2 values('PL2',	'Rohit', 41,30);
insert into cricket_2 values('PL3','Jadeja',33,24);
insert into cricket_2 values('PL4','Dhoni',35,59);
insert into cricket_2 values('PL13','Yuraaj',33,50);
insert into cricket_2 values('PL6','Yadav',66,35);
insert into cricket_2 values('PL14','Tendulkar',74,80);
insert into cricket_2 values('PL8','Binny',44,32);
insert into cricket_2 values('PL9','Rayudu',63,39);
insert into cricket_2 values('PL15','Dravid',65,55);
insert into cricket_2 values('PL16','Yusuf',40,40);

select * from cricket_2

create table cric_combined(
Player_Id varchar(20),
Player_Name varchar(20),
Runs int,
Popularity int,
Charisma int);

insert into cric_combined(Player_Id,Player_Name,Runs,Popularity,Charisma)
VALUES
('PL1','Virat',50,10,55),
('PL2','Rohit',41,7,30),
('PL3','Jadeja',33,6,24),
('PL4','Dhoni',35,15,59),
('PL6','Yadav',66,10,35),
('PL8','Binny',44,11,32),
('PL9','Rayudu',63,12,39);

select * from cric_combined;
drop table cric_combined;