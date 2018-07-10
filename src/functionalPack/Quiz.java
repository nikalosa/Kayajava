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

    public Quiz(String title, Statement state, boolean shuffle){
        this.title = title;
        this.shuffle = shuffle;
        questions = new ArrayList<Questions>();
        try {
            state.executeQuery("USE " + DBinfo.DATABASE_NAME);
            //System.out.println("select * from "+DBinfo.QUESTION_TABLE+" where quizTitle="+"\'"+title+"\'");
            ResultSet questionsSet = state.executeQuery("select * from "+DBinfo.QUESTION_TABLE+" where quizTitle="+"\'"+title+"\'");
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


    public Questions takeQuestion(int index){
        return questions.get(index);
    }

}
