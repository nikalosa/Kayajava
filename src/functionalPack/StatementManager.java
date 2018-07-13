package functionalPack;

import java.sql.*;
import java.util.ArrayList;

public class StatementManager {
    Statement state;

    public StatementManager(Connection con){
        try {
            state = (Statement) con.createStatement();
            state.executeQuery("USE "+DBinfo.DATABASE_NAME);
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

    private int returnValue(ResultSet set) throws SQLException {
        set.next();
        return set.getInt(1);
    }

    public int getNumPlayed(String quiz){
        String getNumPlayedCommand = "select numPlayed from "+DBinfo.QUIZ_TABLE+" where title="+"'"+quiz+"'";
        try {
            return returnValue(state.executeQuery(getNumPlayedCommand));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void incNumPlayed(String quiz){
        String updateCommand = "UPDATE "+DBinfo.QUIZ_TABLE+" SET numPlayed = "+(getNumPlayed(quiz)+1)+
                " where title="+"'"+quiz+"'";
        try {
            state.execute(updateCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getSumPoints(String quiz){
        String getSumPointsCommand = "select sumOfPoints from "+DBinfo.QUIZ_TABLE+" where title="+"'"+quiz+"'";

        try {
            return returnValue(state.executeQuery(getSumPointsCommand));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void incSumPoints(String quiz, int delta){
        String updateCommand = "UPDATE "+DBinfo.QUIZ_TABLE+" SET sumOfPoints = "+(getSumPoints(quiz)+delta)+
                " where title="+"'"+quiz+"'";
        try {
            state.execute(updateCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void insertQuiz(String title, String description, String creatorMail, boolean random, boolean multiPage, boolean immediateCorrection, String picture){
        String insertCommand = "insert into "+DBinfo.QUIZ_TABLE+"(title, description, creatorMail, numPlayed, sumOfPoints, randQuestions, multiplePage, immediateCorrection, picture)";
        insertCommand +=" value(";
        insertCommand += "'"+title+"', '";
        insertCommand += description+"', '";
        insertCommand += creatorMail+"', 0, 0, ";
        insertCommand += random+", "+multiPage+", "+immediateCorrection+", '";
        insertCommand += picture+"')";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
           // System.out.println(insertCommand);

            e.printStackTrace();
        }
    }

    public int insertQuestion(String quiz, String type, String question, String correctAnswer, String picture){
        String insertCommand = "insert into "+DBinfo.QUESTION_TABLE+"(quizTitle, questionType, question, correct,picture)";
        insertCommand += " value('"+quiz+"' ,'";
        insertCommand += type+"', '";
        insertCommand += question+"', '";
        insertCommand += correctAnswer+"', '";
        insertCommand += picture+"')";
        try {
            state.execute(insertCommand);
            String selectCommand = "select ID from "+DBinfo.QUESTION_TABLE+" where ";
            selectCommand += "quizTitle='"+quiz+"' and ";
            selectCommand += "question='"+question+"' order by ID desc";
            ResultSet set = state.executeQuery(selectCommand);
            if(set.next()){
                return set.getInt(1);
            }
        } catch (SQLException e) {
            //System.out.println(insertCommand);
            e.printStackTrace();
        }
        return 0;
    }

    public void insertAnswer(int ID, String answer){
        String insertCommand = "insert into "+DBinfo.ANSWER_TABLE+"(questionID, answer)";
        insertCommand += " value('"+ID+"', '";
        insertCommand += answer+"')";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            //System.out.println(insertCommand);
            e.printStackTrace();
        }
    }

    public ResultSet getQuiz(String quizTitle){

        String selectCommand = "select * from "+DBinfo.QUIZ_TABLE+" where title="+"\'"+quizTitle+"\'";
        if(quizTitle.equals("title")) selectCommand = "select * from "+DBinfo.QUIZ_TABLE+" where title=title";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getQuizInformation(int ID, String information){
        String selectCommand = "select "+information+" from "+DBinfo.QUIZ_TABLE+" where ID="+ID;
        System.out.println(selectCommand);
        try {
            ResultSet set = state.executeQuery(selectCommand);
            if(set.next()) {
                return set.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getQuestions(String quizTitle, boolean rand){
        String selectCommand = "select * from "+DBinfo.QUESTION_TABLE+" where quizTitle="+"\'"+quizTitle+"\'";
        if(rand) {
            selectCommand += " order by rand()";
        }else{
            selectCommand += " order by ID asc";
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

    public void deleteQuiz(String quizTitle){
        deleteQuestions(quizTitle);
        String deleteCommand = "delete from "+DBinfo.QUIZ_TABLE+" where quizTitle='"+quizTitle+"'";
        try {
            state.execute(deleteCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteQuestions(String quizTitle){
        try {
            ResultSet answers = state.executeQuery("select * from "+DBinfo.QUESTION_TABLE+" where quizTitle='"+quizTitle+"'");
            while(answers.next()){
                int ID = answers.getInt(1);
                deleteAnswers(ID);
            }
            String deleteCommand = "delete from "+DBinfo.QUESTION_TABLE+" where quizTitle='"+quizTitle+"'";
            state.execute(deleteCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteAnswers(int ID){
        String deleteCommand = "delete from "+DBinfo.ANSWER_TABLE+" where questionID='"+ID+"'";
        try {
            state.execute(deleteCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getTrendingQuizzes() {
        String selectCommand = "select * from "+DBinfo.QUIZ_TABLE+" order by numPlayed desc limit 5";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getRecentQuizzes() {
        String selectComand = "select * from "+DBinfo.QUIZ_TABLE+" order by ID desc limit 3";
        try {
            ResultSet set = state.executeQuery(selectComand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertDoneQuiz(String quizTitle, String mail, int result, String usedTime, String dateTime) throws SQLException {

        String insertCommand = "insert into "+DBinfo.DONE_QUIZ_TABLE+"(playerMail,quizTitle,result,usedTime,startTime) values(";
        insertCommand += "'"+mail+"',";
        insertCommand += "'"+quizTitle+"',";
        insertCommand += result+",";
        insertCommand += "'"+usedTime+"',";
        insertCommand += "'"+dateTime+"')";
        //System.out.println(insertCommand);
        state.execute(insertCommand);

    }


    public ResultSet getTopResults(String quizTitle) {
        String selectCommand = "select * from "+DBinfo.DONE_QUIZ_TABLE+" where quizTitle='";
        selectCommand += quizTitle+"' order by result desc, usedTime asc limit 10";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getMyQuizzes(String mail) {
        try {
            ResultSet set = state.executeQuery("select * from "+DBinfo.QUIZ_TABLE+" where creatorMail='"+mail+"' order by ID desc");
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet getRecentlyPlayedQuizzes(String mail) {
        String selectCommand = "select ID, title from "+DBinfo.QUIZ_TABLE;
        selectCommand += " inner join "+DBinfo.DONE_QUIZ_TABLE;
        selectCommand += " where playerMail='"+mail+"' order by startTime limit 5";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String> getFriends(String mail){
        ArrayList<String> result = new ArrayList<>();
        try {
            ResultSet set = state.executeQuery("select secondMail from "+DBinfo.FRIENDS_TABLE+" where firstmail='"+mail+"'");
            while(set.next()) {
                result.add(set.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void addToHistory(String mail, String activity) {
        String insertCommand = "insert into "+DBinfo.HISTORY_TABLE+" values(\"";
        insertCommand += mail+"\", \"";
        insertCommand += activity+"\", now());";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            System.out.println(insertCommand);
            e.printStackTrace();
        }
    }

    public ResultSet getHistory(String mail) {
        try {
            ResultSet set = state.executeQuery("select * from "+DBinfo.HISTORY_TABLE+" where userMail='"+mail+"' order by actTime desc");
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getRank(String quiz, String mail) {
        String selectCommand = "select playerMail from "+DBinfo.DONE_QUIZ_TABLE+" where quizTitle='"+quiz+"' order by result desc, usedTime asc";
        System.out.println(selectCommand);
        try {
            ResultSet set = state.executeQuery(selectCommand);
            int count = 1;
            while(set.next()) {
                if(set.getString(1).equals(mail))
                    break;
                count++;
            }
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void addNotification(String mail, String notifierMail, String notification) {
        String insertCommand = "insert into "+DBinfo.NOTIFICATION_TABLE+"(userMail, notifierMail, notification, seen)";
        insertCommand += " values('"+mail+"', '"+notifierMail+"', '"+notification+"', 0)";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getNotifications(String mail) {
        String selectCommand = "select * from "+DBinfo.NOTIFICATION_TABLE+" where userMail='"+mail+"' order by ID desc";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public ArrayList<String> searchFriends(String friendMail){
        ArrayList<String> result = new ArrayList<>();
        String selectCommand = "select mail from "+DBinfo.USER_TABLE+" where mail like '%"+friendMail+"%'";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            while(set.next()) {
                result.add(set.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public ResultSet searchQuizzes(String quiz) {
        String selectCommand = "select * from "+DBinfo.QUIZ_TABLE+" where title like '%"+quiz+"%'";
        try {
            ResultSet set = state.executeQuery(selectCommand);
            return set;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getQuizID(String quiz) {
        try {
            ResultSet set = state.executeQuery("select ID from "+DBinfo.QUIZ_TABLE+" where title='"+quiz+"'");
            if(set.next()) {
                return set.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean checkFriend(String first,String second) {
        String str = "select * from " + DBinfo.FRIENDS_TABLE + " where firstMail= '"+first+ "' and secondMail= '"
                +second+"';";
        try {
            ResultSet set = state.executeQuery(str);
            if(!set.next()) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



    public void removeNotifications(String first,String second) {
        String str = "delete from Notifications where userMail ='" + first + "' and notifierMail= '"+second+"';";
        try {
            state.executeQuery(str);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://"+DBinfo.DATABASE_SERVER, DBinfo.USERNAME, DBinfo.PASSWORD);
            StatementManager manager = new StatementManager(con);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
