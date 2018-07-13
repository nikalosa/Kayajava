package functionalPack;

import java.lang.reflect.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Questions {

    private String Question;
    private String correctAnswer;
    private int maxScore;
    private String type;
    private String image;
    private ArrayList < String > possAns;

    public String getQuestion(){
        return Question;
    }

    public int maxScore(){
        return maxScore;
    }



    public Questions(String type, String Question, String correctAnswer, String image) {
        this.image = image;
        this.type = type;
        this.Question = Question;
        this.correctAnswer = correctAnswer;
        this.maxScore = 1;

    }



    public Questions(String type, String Question, String correctAnswer, String image, ArrayList<String> possAns){
        this.type = type;
        this.Question = Question;
        this.correctAnswer = correctAnswer;
        this.maxScore = 1;
        this.possAns = possAns;
        this.image = image;
    }

    public String getQuestionImage(){
        return this.image;
    }
    public String getCorrectAnswer(){
        return this.correctAnswer;
    }
    public int getPossibleAnswersLen(){
        return possAns.size();
    }

    public String getPossibleAnswer(int index){
        return possAns.get(index);
    }

    public String getType(){
        return this.type;
    }

    public boolean checkAnswer(String answer) {
        return correctAnswer.equals(answer);
    }

}
