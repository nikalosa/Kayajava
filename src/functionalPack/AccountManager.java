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
        Connection con = makeConnection();
        StatementManager st = new StatementManager(con);
        boolean exists = st.userExists(userName,password);
        return exists;
    }


//    public boolean inUse(String userName, String mail){
//        return (userMap.containsKey(userName) || userMap.contains(mail));
//    }

    public void addAccount(User user) {
        Connection con = makeConnection();
        StatementManager st = new StatementManager(con);
        st.insertUser(user.getUserName(),user.getPassword(),user.getMail());
    }

    public static Connection makeConnection () {
        try {
            Statement st;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + DBinfo.DATABASE_SERVER + "?useSSL=false" ,DBinfo.USERNAME
                    ,DBinfo.PASSWORD);
            st = con.createStatement();
            st.executeQuery("USE " + DBinfo.DATABASE_NAME);
            return con;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}