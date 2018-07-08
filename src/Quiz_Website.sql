USE Quiz_Website;

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
    foreign key (firstUser) references User_Table(userName),
    foreign key (SecondUser) references User_Table(userName)
);

create table Quiz (
    title varchar(100),
    creator varchar(100),
    primary key(title),
    numPlayed int,
    sumOfPoints int,
    foreign key (creator)  references User_Table(userName)
);

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
    primary key(ID),
    questionID int,
    foreign key(questionID) references Question(ID),
    answer varchar(100) not null
);

create table DoneQuizzes(
	player varchar(50),
    quizTitle varchar(100) not null,
    result int not null,
    usedTime time,
    startTime datetime,
    foreign key (player) references User_Table(userName),
    foreign key (quizTitle) references Quiz(title)
);