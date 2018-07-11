package functionalPack;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;

public class Quiz {
    private String title;
    private boolean shuffle;
    ArrayList<Questions> questions;

    public Quiz(String title, StatementManager manager, boolean shuffle){
        this.title = title;
        this.shuffle = shuffle;
        questions = new ArrayList<Questions>();
        try {
            //System.out.println("select * from "+DBinfo.QUESTION_TABLE+" where quizTitle="+"\'"+title+"\'");
            ResultSet questionsSet = manager.getQuestions(title, shuffle);
            System.out.println("asdasdad");
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

    public int getQuestionNum(){return questions.size();}

    public Questions getQuestion(int index){return questions.get(index);}


    public Questions takeQuestion(int index){
        return questions.get(index);
    }

}
