package functionalPack;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Questions {

    private String Question;
    private String correctAnswer;
    private int maxScore;
    private String type;

    public String getQuestion(){
        return Question;
    }

    public int maxScore(){
        return maxScore;
    }

    public Questions(String type, String Question, String correctAnswer) {

        this.type = type;
        this.Question = Question;
        this.correctAnswer = correctAnswer;
        this.maxScore = 1;



        //        if(type.equals("Question-Response")){
//
//        }else if(type.equals("Fill in the Blank")){
//
//        }else if(type.equals("Multiple Choice")){
//
//        }else if(type.equals("Picture-Response Questions")){
//
//        }else{
//
//        }

//    }
//<<<<<<< HEAD
//    public boolean checkAnswer(String answer) {
//        return correctAnswer.equals(answer);
//=======
//
//        private class FillInTheBlank implements QuestionInterface {
//            private String Question;
//            private int maxScore;
//            private String correctAnswer;
//            public FillInTheBlank(String Question, String correctAnswer){
//                this.maxScore = 1;
//                this.Question = new String(Question);
//                this.correctAnswer = new String(correctAnswer);
//                // this.startTime = System.currentTimeMillis();
//            }
//            @Override
//            public int checkAnswer(String answer) {
//                return (correctAnswer.equals(answer)?1:0);
//            }
//            @Override
//            public int maxScore() {
//                return maxScore;
//            }
//
//
//>>>>>>> 1c0bd7480ebb808d30121e866156435507ef0856
//        }
//        public int maxScore() {
//            return maxScore;
//        }
//
//
//
//<<<<<<< HEAD
//                =======
//        @Override
//        public int checkAnswer(String answer) {
//
//            return ((correctAnswer.equals(answer))?1:0);
//        }

//    private class QuestionResponse implements QuestionInterface {
//
//        //private long startTime;
//        private String Question;
//        private int maxScore;
//        private String correctAnswer;
//
//        public QuestionResponse(String Question, String correctAnswer){
//            this.Question = Question;
//            this.maxScore = 1;
//            this.correctAnswer = correctAnswer;
//           // this.startTime = System.currentTimeMillis();
//        }
//
//        @Override
//        public int checkAnswer(String answer) {
//            return (correctAnswer.equals(answer)?1:0);
//        }
//        @Override
//        public int maxScore() {
//            return maxScore;
//        }
//    }
//
//    private class FillInTheBlank implements QuestionInterface {
//
//        private String Question;
//        private int maxScore;
//        private String correctAnswer;
//        public FillInTheBlank(String Question, String correctAnswer){
//            this.maxScore = 1;
//            this.Question = Question;
//            this.correctAnswer = correctAnswer;
//       }
//        @Override
//        public int checkAnswer(String answer) {
//            return (correctAnswer.equals(answer)?1:0);
//        }
//        @Override
//        public int maxScore() {
//            return maxScore;
//        }
//
//
//    }
//
//    private class MultipleChoice implements QuestionInterface {
//
//        private String Question;
//        private String [] possibleAnswers;
//        private int maxScore;
//        private String correctAnswer;
//
//        public MultipleChoice(String Question, String[] possibleAnswers, String correctAnswer) {
//            this.Question = Question;
//            this.maxScore = 1;
//            this.possibleAnswers = possibleAnswers;
//            /*this.possibleAnswers = new String[possibleAnswers.length];
//            for(int i=0;i<possibleAnswers.length;i++){
//                this.possibleAnswers[i] = possibleAnswers[i];
//            }*/
//            this.correctAnswer = correctAnswer;
//        }
//
//        @Override
//        public int checkAnswer(String answer) {
//            return ((correctAnswer.equals(answer))?1:0);
//        }
//
//        @Override
//        public int maxScore() {
//            return maxScore;
//        }
//    }
//
//    private class PictureResponse implements QuestionInterface{
//        private String Question;
//        private int maxScore;
//        private String correctAnswer;
//
//        public PictureResponse(String Question, String correctAnswer){
//            this.Question = Question;
//            this.correctAnswer = correctAnswer;
//            maxScore = 1;
//        }
//
//        @Override
//        public int checkAnswer(String answer) {
//            return ((correctAnswer.equals(answer))?1:0);
//        }
//
//        @Override
//        public int maxScore() {
//            return maxScore;
//        }
//    }

//    private class MultiAnswer implements QuestionInterface{
//
//        private String Question;
//        private int maxScore;
//        private String [] correctAnswers;
//        private boolean relevantOrder;
//
//        public MultiAnswer(String Question, String[] correctAnswers, boolean relevantOrder){
//            this.relevantOrder = relevantOrder;
//            this.correctAnswers = correctAnswers;
//            /*correctAnswers = new String[correctAnswers.length];
//            for(int i=0;i<correctAnswers.length;i++){
//                this.correctAnswers[i] = new String(correctAnswers[i]);
//            }*/
//            this.maxScore = correctAnswers.length;
//        }
//
//        @Override
//        public int checkAnswer(String answer) {
//            return 0;
//        }
//
//        @Override
//        public int maxScore() {
//            return 0;
//        }
//    }
//
//    private class MultiChoiceAnswer implements QuestionInterface {
//
//        private String Question;
//        private String [] possibleAnswers;
//        private int maxScore;
//        private String correctAnswers;
//
//        public MultiChoiceAnswer(String Question, String[] possibleAnswers, String correctAnswers) {
//            this.Question = new String(Question);
//            this.maxScore = correctAnswers.length();
//            this.possibleAnswers = new String[possibleAnswers.length];
//            for(int i=0;i<possibleAnswers.length;i++){
//                this.possibleAnswers[i] = new String(possibleAnswers[i]);
//            }
//            this.correctAnswers = new String(correctAnswers);
//        }
//
//        @Override
//        public int checkAnswer(String answer) {
//            int result = 0;
//            for(int i=0;i<answer.length();i++){
//                boolean isThere = false;
//                for(int j=0;j<correctAnswers.length();j++){
//                    if(correctAnswers.charAt(j)==answer.charAt(i)){
//                        isThere = true;
//                        result++;
//                    }
//                }
//                if(!isThere){
//                    result--;
//                }
//            }
//            return ((result>0)?result:0);
//        }
//
//        @Override
//        public int maxScore() {
//            return maxScore;
//        }
//    }
//
//    private class Matching implements QuestionInterface{
//
//        void Matching(){
//
//        }
//
//        @Override
//        public int checkAnswer(String answer) {
//            return 0;
//        }
//
//        @Override
//        public int maxScore() {
//            return 0;
//        }
//    }

    }

    public boolean checkAnswer(String answer) {
        System.out.println("answer->"+answer+" //// "+"correct->"+correctAnswer);
        return answer.equals(correctAnswer);
    }
}
