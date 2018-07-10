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


    public ResultSet takeUser(String userName,String password) {
        ResultSet set = null;
        String str = "select* from User_Table where userName=\"" +userName+"\" and password=\""+password+"\";";
        try {
            set = state.executeQuery(str);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return set;
    }

    public void insertUser(String username, String password, String mail){
        String insertCommand = "insert into "+DBinfo.USER_TABLE+" values(";
        insertCommand += username+", ";
        insertCommand += password+", ";
        insertCommand += mail+")";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
