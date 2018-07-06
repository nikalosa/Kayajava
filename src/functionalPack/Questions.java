package functionalPack;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Questions {

    private class QuestionResponse implements QuestionInterface {

        //private long startTime;
        private String Question;
        private int maxScore;
        private String correctAnswer;

        public QuestionResponse(String Question, String correctAnswer){
            this.Question = new String(Question);
            this.maxScore = 1;
            this.correctAnswer = new String(correctAnswer);
           // this.startTime = System.currentTimeMillis();
        }

        @Override
        public int checkAnswer(String answer) {
            return (correctAnswer.equals(answer)?1:0);
        }
        @Override
        public int maxScore() {
            return maxScore;
        }
//        @Override
//        public long timeNeeded() {
//            return 0;
//        }


    }

    private class FillInTheBlank implements QuestionInterface {

        private String Question;
        private int maxScore;
        private String correctAnswer;
        public FillInTheBlank(String Question, String correctAnswer){
            this.maxScore = 1;
            this.Question = new String(Question);
            this.correctAnswer = new String(correctAnswer);
            // this.startTime = System.currentTimeMillis();
        }
        @Override
        public int checkAnswer(String answer) {
            return (correctAnswer.equals(answer)?1:0);
        }
        @Override
        public int maxScore() {
            return maxScore;
        }


    }

    private class MultipleChoice implements QuestionInterface {

        private String Question;
        private String [] possibleAnswers;
        private int maxScore;
        private String correctAnswers;

        public MultipleChoice(String Question, String[] possibleAnswers, String correctAnswers) {
            this.Question = new String(Question);
            this.maxScore = possibleAnswers.length;
            this.possibleAnswers = new String[possibleAnswers.length];
            for(int i=0;i<possibleAnswers.length;i++){
                this.possibleAnswers[i] = new String(possibleAnswers[i]);
            }
            this.correctAnswers = new String(correctAnswers);
        }

        @Override
        public int checkAnswer(String answer) {
            int result = 0;
            for(int i=0;i<answer.length();i++){
                boolean isThere = false;
                for(int j=0;j<correctAnswers.length();j++){
                    if(correctAnswers.charAt(j)==answer.charAt(i)){
                        isThere = true;
                        result++;
                    }
                }
                if(!isThere){
                    result--;
                }
            }
            return ((result>0)?result:0);
        }

        @Override
        public int maxScore() {
            return maxScore;
        }
    }

    public class PictureResponse implements QuestionInterface{
        private String Question;
        private int maxScore;
        private String correctAnswer;

        public PictureResponse(String Question, String correctAnswer){
            this.Question = Question;
            this.correctAnswer = correctAnswer;
            maxScore = 1;
        }

        @Override
        public int checkAnswer(String answer) {
            return ((correctAnswer.equals(answer))?1:0);
        }

        @Override
        public int maxScore() {
            return maxScore;
        }
    }
}
