package functionalPack;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class AccountManager {

    public AccountManager(){
    }

    public boolean checkAccount(String userName, String password){
        Connection con = getConnection();
        StatementManager st = new StatementManager(con);
        ResultSet set = st.takeUser(userName,password);
        try {
            if(set.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


//    public boolean inUse(String userName, String mail){
//        return (userMap.containsKey(userName) || userMap.contains(mail));
//    }

    public void addAccount(User user) {
        Connection con = null;
        PreparedStatement preparedStatement = null;
        try {
            con = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        StatementManager st = new StatementManager(con);
        st.insertUser(user.getUserName(),user.getPassword(),user.getMail());
    }

    public static Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/easybase", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}