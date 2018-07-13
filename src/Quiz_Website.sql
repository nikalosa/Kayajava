create database Quiz_Website;
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
select* from User_Table;
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
    picture varchar(400),
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
select * from History;

create table Notifications(
    ID int auto_increment,
    primary key(ID),
    userMail varchar(50) not null,
    notifierMail varchar(50),
    notification varchar(500),
    seen boolean,
    foreign key (userMail) references User_Table(mail)
);


insert into User_Table(userName, password, mail) values ('admin','admin','admin@kayajava.com');
insert into Quiz(title, description, creatorMail, numPlayed, sumOfPoints, randQuestions, multiplePage, immediateCorrection, picture) values
  ('GeneralKnowledge1','General Knowledge','admin@kayajava.com',0,0,1,1,0,'https://kevera.com/useruploads/post/37_1469980191.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('GeneralKnowledge1','Picture-Response','','The Great Wall of China','http://cdn.playbuzz.com/cdn/7780d1bc-5c0a-4588-85df-a25828dfc426/f814bff1-3871-4cf4-9457-3ccdb3d79b68.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('GeneralKnowledge1','Picture-Response','','St. Helena','http://cdn.playbuzz.com/cdn/7780d1bc-5c0a-4588-85df-a25828dfc426/125a64d5-9b31-4682-bfdf-d70fc85e7201.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('GeneralKnowledge1','Picture-Response','','Canberra','http://cdn.playbuzz.com/cdn/7780d1bc-5c0a-4588-85df-a25828dfc426/d12415a2-2a45-496b-8220-cb8630b66594.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('GeneralKnowledge1','Picture-Response','','Rasputin','http://cdn.playbuzz.com/cdn/7780d1bc-5c0a-4588-85df-a25828dfc426/8d8af227-93ab-4779-84e0-3e344bb848c6.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('GeneralKnowledge1','Picture-Response','','A Whale Shark','http://cdn.playbuzz.com/cdn/7780d1bc-5c0a-4588-85df-a25828dfc426/85a5c953-843c-4885-85a7-d51c1530a1d6.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('GeneralKnowledge1','Picture-Response','','Marcel Duchamp','http://cdn.playbuzz.com/cdn/7780d1bc-5c0a-4588-85df-a25828dfc426/197e77c4-ccea-4385-896a-0c0152fc4401.jpg');


insert into Quiz(title, description, creatorMail, numPlayed, sumOfPoints, randQuestions, multiplePage, immediateCorrection, picture) values
  ('MovieQuiz','TV and Movie Quiz','admin@kayajava.com',0,0,1,0,1,'https://i.ytimg.com/vi/VvIEcIwv7QA/hqdefault.jpg');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('MovieQuiz','Multiple Choice','In which year did Chariots of Fire win Best Picture Oscar?','1982','');
insert into Answer(questionID, answer) values (1,'1986');
insert into Answer(questionID, answer) values (1,'1984');
insert into Answer(questionID, answer) values (1,'1982');
insert into Answer(questionID, answer) values (1,'1980');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('MovieQuiz','Multiple Choice','Which Disney film features a cat called Sergeant Tibbs?','101 Dalmations','');
insert into Answer(questionID, answer) values (2,'Cinderella');
insert into Answer(questionID, answer) values (2,'101 Dalmations');
insert into Answer(questionID, answer) values (2,'Peter Pan');
insert into Answer(questionID, answer) values (2,'The Lion King');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('MovieQuiz','Multiple Choice','In which film is there a computer named HAL?','2001: A Space Odyssey','');
insert into Answer(questionID, answer) values (3,'I Robot');
insert into Answer(questionID, answer) values (3,'2001: A Space Odyssey');
insert into Answer(questionID, answer) values (3,'The Matrix');
insert into Answer(questionID, answer) values (3,'A.I.');
insert into Question (quizTitle, questionType, question, correct, picture) values
  ('MovieQuiz','Multiple Choice','Who played 007 in the film On Her Majestys Secret Service?','George Lazenby','');
insert into Answer(questionID, answer) values (4,'George Lazenby');
insert into Answer(questionID, answer) values (4,'Roger Moore');
insert into Answer(questionID, answer) values (4,'Sean Connery');
insert into Answer(questionID, answer) values (4,'Timothy Dalton');

 
insert into Quiz(title, description, creatorMail, numPlayed, sumOfPoints, randQuestions, multiplePage, immediateCorrection, picture)
    value("Simple Arithmetics", "This quiz is manly about your knowledge in simple arithmetics", "admin@kayajava.com", 0, 0, 0, 0, 0, "https://thumbs.dreamstime.com/z/multiplication-table-3-25805539.jpg");
insert into Question(quizTitle, questionType, question, correct, picture) value
("Simple Arithmetics", "Question-Response", "17 - 8 = ?", "9", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "3 * _ = 12", "4", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "21 / 7 = ?", "3", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "8 * 7 = ?", "56", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "77 / __ = 7", "11", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "12 * 5 = ?", "60", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "39 / 13 = ?", "3", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "7 * 7 = ?", "49", "");
insert into Question(quizTitle, questionType, question, correct, picture) value("Simple Arithmetics", "Question-Response", "2700 + 63 = ?", "2763", "");