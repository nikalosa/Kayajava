package functionalPack;

import javax.xml.transform.Result;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class AccountManager {
    private static MessageDigest messageDigest;

    public AccountManager(){
    }

    public static String hexToString(byte[] bytes) {
        StringBuffer buff = new StringBuffer();
        for (int i=0; i<bytes.length; i++) {
            int val = bytes[i];
            val = val & 0xff;  // remove higher bits, sign
            if (val<16) buff.append('0'); // leading 0
            buff.append(Integer.toString(val, 16));
        }
        return buff.toString();
    }
    private static void makeDigest() {
        try {
            messageDigest = MessageDigest.getInstance("SHA");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }


    // this method takes string and using messageDigest generates hash code and  returns it as string
    private static String makeHashCode(String str) {
        makeDigest();
        String s = "";
        byte[] arr = str.getBytes();
        arr = messageDigest.digest(arr);
        s = hexToString(arr);
        return s;
    }

    public boolean checkAccount(String mail,String password){
        Connection con = getConnection();
        StatementManager st = new StatementManager(con);
        boolean exists = st.userExists(makeHashCode(password),mail);
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
        st.insertUser(user.getUserName(),makeHashCode(user.getPassword()),user.getMail());
    }

    public static Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://" + DBinfo.DATABASE_SERVER + DBinfo.DATABASE_NAME
                    +"?allowPublicKeyRetrieval=true&useSSL=false", DBinfo.USERNAME,
                    DBinfo.PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}