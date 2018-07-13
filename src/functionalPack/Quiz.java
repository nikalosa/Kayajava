package functionalPack;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;

public class Quiz {
    private int score;
    private String title;
    private int indexOfQuestion;
    private String dateTime;
    private long startTime;
    private int ID;
    private String mail;

    private StatementManager manager;
    ArrayList<Questions> questions;

    public Quiz(String title, StatementManager manager) {
        this.title = title;
        this.score = 0;
        this.indexOfQuestion = 0;
        this.manager = manager;

        ResultSet quizSet = manager.getQuiz(title);
        this.startTime = System.currentTimeMillis();
        this.questions = new ArrayList<>();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        this.dateTime = dtf.format(now);
        try{
            quizSet.next();
            this.ID = quizSet.getInt(1);
            this.mail = quizSet.getString(4);
            ResultSet questionsSet = manager.getQuestions(title, quizSet.getBoolean(9));
            while(questionsSet.next()){
                String questionType = questionsSet.getString(3);
                String question = questionsSet.getString(4);
                String correctAnswer = questionsSet.getString(5);
                //System.out.println(questionType);
                //System.out.println(question);
                //System.out.println(correctAnswer);
                questions.add(new Questions(questionType,question,correctAnswer));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

    }

    public String getDateTime(){
       // System.out.println(this.dateTime);
        return this.dateTime;
    }


    public String addDoneQuiz() {
        try {
            long time = System.currentTimeMillis()-startTime;
            String realltime = String.format("%02d:%02d:%02d",(time/(1000*60*60))%24,(time/(1000*60))%60,(time/1000)%60);
           // System.out.println(realltime);
            manager.insertDoneQuiz(title,this.mail,getScore(),realltime,dateTime);
            return realltime;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "";
    }

    public int getID(){
        return this.ID;
    }

    public boolean getMulti() throws SQLException {
        return true;//quizSet.getBoolean(10);
    }

    public boolean getCorrection() throws SQLException {
        return true;//quizSet.getBoolean(11);
    }

    public void incNumPlayed(){
        manager.incNumPlayed(title);
    }

    public int getNumPlayed(){
        return manager.getNumPlayed(title);
    }

    public int getSumPoints() {
        return manager.getSumPoints(title);
    }

    public void incSumPoints(){
        manager.incSumPoints(title,getScore());
    }

    public String getTitle(){
        return title;
    }


    public void incScore(){
        this.score++;
    }

    public int getScore(){
        return this.score;
    }

    public int indexOfQuestion(){
        return this.indexOfQuestion;
    }

    private void incIndexOfQuestion(){
        this.indexOfQuestion++;
    }

    public int numbOfQuestions(){
        return questions.size();
    }

    public boolean isEnd(){
        return indexOfQuestion()==questions.size();

    }

    public Questions getQuestion(int ind){
        return questions.get(ind);
    }

    public Questions getQuestion(){
        return questions.get(indexOfQuestion());
    }

    public void nextQuestion(){
        incIndexOfQuestion();
    }


}
