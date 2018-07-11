package functionalPack;

import java.sql.*;

public class StatementManager {
    Statement state;

    public StatementManager(Connection con){
        try {
            state = (Statement) con.createStatement();
            state.executeQuery("USE"+DBinfo.DATABASE_NAME);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void insertUser(String username, String password, String mail){
        String insertCommand = "insert into "+DBinfo.USER_TABLE+" values(";
        insertCommand += '\''+username+"', '";
        insertCommand += password+"', '";
        insertCommand += mail+"')";
        System.out.println(insertCommand);
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean userExists(String password,String mail){
        String selectCommand = "select * from "+DBinfo.USER_TABLE+" where mail='"+mail+"' and password='"+password+'\'';
        try {
            System.out.println(selectCommand);
            ResultSet set = state.executeQuery(selectCommand);
            if(set.next()) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void addFriend(String firstMail , String secondMail){
        String insertCommand = "insert into "+DBinfo.FRIENDS_TABLE+" values(";
        insertCommand += '\''+firstMail+"', '"+secondMail+"')";
        String secondInsert = "insert into "+DBinfo.FRIENDS_TABLE+" values(";
        secondInsert += '\''+secondMail+"', '"+firstMail+"')";
        try {
            state.execute(insertCommand);
            state.execute(secondInsert);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertQuiz(String title, String description, String creatorMail){
        String insertCommand = "insert into "+DBinfo.QUIZ_TABLE+" value(";
        insertCommand += "'"+title+",' '";
        insertCommand += description+"', '";
        insertCommand += creatorMail+"', 0, 0)";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertQuestion(String quiz, String type, String question, String correctAnswer){
        String insertCommand = "insert into "+DBinfo.QUESTION_TABLE+"(quizTitle, questionType, question, correct)";
        insertCommand += " value("+"'"+quiz+"', '";
        insertCommand += type+"', '";
        insertCommand += question+"', '";
        insertCommand += correctAnswer+"')";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getQuiz(String quizTitle){
        String selectCommand = "select * from "+DBinfo.QUIZ_TABLE+" where quizTitle="+"\'"+quizTitle+"\'";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getQuestions(String quizTitle, boolean rand){
        String selectCommand = "select * from "+DBinfo.QUESTION_TABLE+" where quizTitle="+"\'"+quizTitle+"\'";
        if(rand) {
            selectCommand += "order by rand()";
        }else{
            selectCommand += "order by ID";
        }
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getAnswers(int ID){
        String selectCommand = "select * from "+DBinfo.ANSWER_TABLE+" where questionID='"+ID+"'";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://"+DBinfo.DATABASE_SERVER, DBinfo.USERNAME, DBinfo.PASSWORD);
            StatementManager manager = new StatementManager(con);
            manager.insertQuestion("kaiQvizi", "prastoi", "ramdenze magaria mixo", "yvelaze");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
