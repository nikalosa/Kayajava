

USE Quiz_Website;

drop table if exists Quiz;

create table Quiz (
	title varchar(100),
  creator varchar(100) not null,
  primary key(title),
  numPlayed int,
  sumOfPoints int,
  foreign key (creator)  references User_Table(userName)
);

drop table if exists Question;

create table Question (
	ID int not null auto_increment,
  quizTitle varchar(100),
  questionType char(100),
  question varchar(400),
  correct varchar(100) not null,
  primary key(ID),
  foreign key (quizTitle) references Quiz(title)
);

create table Answer (
	ID int not null auto_increment,
  questionID int,
  foreign key(questionID) references Question(ID),
  answer varchar(100) not null
);

create table User_Table(
  userName varchar(50),
  primary key(username),
  firstName varchar(50),
  lastName varchar(50),
  mail varchar(50)
);

create table Friends(
	firstUser varchar(50),
  secondUser varchar(50),
  foreign key (firstUser) references User_Tabel(userName),
  foreign key (SecondUser) references User_Tabel(userName)
);

create table DoneQuizzes(
	playerID int not null,
    quizID int not null,
    result int not null,
    usedTime time,
    startTime datetime,
    foreign key (playerID) references User_Table(ID),
    foreign key (quizID) references Quiz(ID)
);

insert into DoneQuizzes values(1, 1, 90, '00:14:46', '2018-08-15 15:30:00');

select * from DoneQuizzes order by usedTime limit 1;

insert into Quiz(title,numQuest,numPlayed,sumOfPoints) values('Quiz4', 4, 0, 0);

select * from Quiz where ID=3;


