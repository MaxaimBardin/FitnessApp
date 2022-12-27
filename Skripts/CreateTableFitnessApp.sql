Create table Clients
(ClientId int not null identity(1,1),
NameClient varchar(20) not null,
SurnameClient varchar(20) not null,
Numbertelephone varchar(18) not null check (Numbertelephone
like '+7 ([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]') unique,
Email varchar(50)NOT NULL check (Email LIKE '%@%.%' AND Email NOT LIKE '@%'
AND Email NOT LIKE '%@%@%') unique,
Password varchar(30) not null,
MentorId int not null)
go
alter table Clients
add constraint PK_Clients primary key(ClientId)
go
create table Mentors
(MentorId int not null identity(1,1),
NameMentor varchar(20) not null,
SurnameMentor varchar(20) not null,
Post varchar(20) not null check(Post in 
('Стажер','Младший тренер','Старший тренер')))
go
alter table Mentors
add constraint PK_Mentors primary key(MentorId)
go
alter table Clients
add constraint FK_Clients_Mentors foreign key(MentorId) references Mentors(MentorId)