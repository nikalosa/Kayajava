package functionalPack;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

public class Quiz {
    private String title;
    private int score;
    private int indexOfQuestion;
    ArrayList<Questions> questions;

    public Quiz(String title, StatementManager manager, boolean shuffle){
        this.title = title;
        this.score = 0;
        this.indexOfQuestion = 0;
        questions = new ArrayList<>();
        try {
            ResultSet questionsSet = manager.getQuestions(title, shuffle);
           while(questionsSet.next()){
                String questionType = questionsSet.getString(3);
                String question = questionsSet.getString(4);
                String correctAnswer = questionsSet.getString(5);
                System.out.println(questionType+" "+question+" "+correctAnswer);
                questions.add(new Questions(questionType,question,correctAnswer));
            }
            if(shuffle)
                Collections.shuffle(questions);
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
