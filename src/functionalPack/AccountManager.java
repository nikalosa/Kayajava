package functionalPack;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class AccountManager {

    public AccountManager(){
    }

    public boolean checkAccount(String mail,String password){
        Connection con = getConnection();
        StatementManager st = new StatementManager(con);
        boolean exists = st.userExists(password,mail);
        return exists;
    }

    public void addAccount(User user) {
        Connection con = null;
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
            connection = DriverManager.getConnection("jdbc:mysql://" + DBinfo.DATABASE_SERVER + DBinfo.DATABASE_NAME, DBinfo.USERNAME,
                    DBinfo.PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}