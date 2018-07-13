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
    ID int auto_increment,
    title varchar(100) not null,
    description varchar(1000),
    creatorMail varchar(100),
    primary key(ID),
    unique key(title),
    numPlayed int,
    sumOfPoints int,
    randQuestions boolean,
    multiplePage boolean,
    immediateCorrection boolean,
    picture varchar(100),
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
    actTime datetime,
    foreign key (userMail) references User_Table(mail)
);
drop table Notifications;
create table Notifications(
	ID int auto_increment,
    primary key(ID),
    userMail varchar(50) not null,
    notifierMail varchar(50),
    notification varchar(500),
    seen boolean,
    foreign key (userMail) references User_Table(mail)
);