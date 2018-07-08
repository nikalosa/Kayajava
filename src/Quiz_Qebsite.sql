

USE Quiz_Website;

drop table if exists Quiz;

create table Quiz (
	ID int not null auto_increment,
    title varchar(100),
    creatorID int not null,
    primary key(ID),
    unique key(title),
    numPlayed int,
    sumOfPoints int,
    foreign key (creatorID)  references User_Table(ID)
);

drop table if exists Question;

create table Question (
	ID int not null auto_increment,
    quizID int not null,
    questionType char(100),
    question varchar(400),
    answerOne varchar(100),
    answerTwo varchar(100),
    answerThree varchar(100),
    answerFour varchar(100),
    correct varchar(100) not null,
    primary key(ID), 
    foreign key (quizID) references Quiz(ID)
);

create table User_Table(
	ID int not null auto_increment,
    userName varchar(50) not null,
    unique key(userName),
    firstName varchar(50),
    lastName varchar(50), 
    mail varchar(50)
);

create table Friends(
	firstID int not null,
    secondID int not null
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

insert into Quiz(title,numQuest,numPlayed,sumOfPoints) values('yleQuiz4', 4, 0, 0);

select * from Quiz where ID=3;


