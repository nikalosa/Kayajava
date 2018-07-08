package functionalPack;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Quiz {
    private String name;
    private int ID;
    private int numQuestions;
    ArrayList<Questions> questions;

    public Quiz(String name, Statement state){
        this.name = name;
        numQuestions = 0;
        try {
            ResultSet quizSet = state.executeQuery("select * from "+DBinfo.QUIZ_TABLE+"where title="+name);
            quizSet.next();
            ID = quizSet.getInt(1);
            ResultSet questionsSet = state.executeQuery("select ID from "+DBinfo.QUESTION_TABLE+"where quizID="+ID);
            while(questionsSet.next()){
                numQuestions++;
                //questions.add(new Questions(questionsSet.getInt(1), state));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
