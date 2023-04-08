--RESTRICTING TO FEW VALUES IN A SINGLE ATTRIBUTE

create table enrolled (
StudentID number(5),
CourseID  number(4),
Quarter varchar(6) DEFAULT 'Fall',
Year          number(4),
  
  primary key (StudentID, CourseID),
  foreign key (StudentID) references student(SID),
  foreign key (CourseID) references course(CID)
); 

insert into enrolled (studentid, courseid, year)
    values (11035, 1092, 2012);
    
drop table enrolled;

create table enrolled (
StudentID number(5),
CourseID  number(4),
Quarter varchar(6) CHECK(quarter in ('Fall','Winter','Spring')),
Year          number(4),
  
  primary key (StudentID, CourseID),
  foreign key (StudentID) references student(SID),
  foreign key (CourseID) references course(CID)
); 

--RESTRICTING TO A FEW VALUES ACROSS ATTRIBUTES

insert into enrolled 
    values (11035, 1092, 'Fall', 2012);

drop table enrolled;
drop table course;

create table course (
         CID   number(4),
         CourseName    varchar(40),
         Department    varchar(4),
         CourseNr       char(3),
         primary key (CID),
         check (department != 'CSC' OR CourseNR > 100)
       );

insert into course
    values ( 1020, 'Theory of Computation', 'CSC', 89);


--CONTRASTING PK AND UNIQUE + NOT NULL; 
--Correlation in Primary Key; PK Vs Unique/Not NULL

create table student (
  LastName      varchar(40),
  FirstName     varchar(40),
  SID           number(5),
  SSN           number(9) not null,
  Career        varchar(4),
  Program       varchar(10),
  City          varchar(40),
  Started       number(4),
  
  primary key (SID),
  unique(SSN)
);


create table student (
  LastName      varchar(40),
  FirstName     varchar(40),
  SID           number(5),
  SSN           number(9),
  Career        varchar(4),
  Program       varchar(10),
  City          varchar(40),
  Started       number(4),
  
  primary key (SID,SSN)
);


insert into student
    values ( 'Brennigan', 'Marcus', 90421, 987654321, 'UGRD', 'COMP-GAM', 'Evanston', 2010 );
insert into student
    values ( 'Brennigan', 'Marcus', 90421, 987654322, 'UGRD', 'COMP-GAM', 'Evanston', 2010 );

drop table student;


insert into student
    values ( 'Brennigan', 'Marcus', 90421, 987654321, 'UGRD', 'COMP-GAM', 'Evanston', 2010 );
insert into student
    values ( 'Brennigan', 'Marcus', 90421, 987654322, 'UGRD', 'COMP-GAM', 'Evanston', 2010 );








