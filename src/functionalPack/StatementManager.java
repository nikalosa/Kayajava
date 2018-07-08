package functionalPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

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

    public void insertUser(String username, String firstName, String secondName, String mail){
        String insertCommand = "insert into "+DBinfo.USER_TABLE+" values(";
        insertCommand += username+", ";
        insertCommand += firstName+", ";
        insertCommand += secondName+", ";
        insertCommand += username+")";
        try {
            state.execute(insertCommand);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
