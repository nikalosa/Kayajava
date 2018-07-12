USE Quiz_Website;

create table User_Table(
    userName varchar(50),
    password varchar(50),
    mail varchar(50),
    primary key(mail)
);

create table Friends(
	firstMail varchar(50),
    secondMail varchar(50),
    foreign key (firstMail) references User_Table(mail),
    foreign key (SecondMail) references User_Table(mail)
);

create table Quiz (
    title varchar(100),
    description varchar(1000),
    creatorMail varchar(100),
    primary key(title),
    numPlayed int,
    sumOfPoints int,
    foreign key (creatorMail)  references User_Table(mail)
);

create table Question (
	ID int not null auto_increment,
    quizTitle varchar(100),
    questionType varchar(100),
    question varchar(400),
    correct varchar(100) not null,
    picture varchar(100),
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
	playerMail varchar(50),
    quizTitle varchar(100) not null,
    result int not null,
    usedTime time,
    startTime datetime,
    foreign key (playerMail) references User_Table(mail),
    foreign key (quizTitle) references Quiz(title)
);

create table History(
	userMail varchar(50),
    activity varchar(500),
    actTime datetime
);