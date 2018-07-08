package functionalPack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class AccountManager {

    private HashMap<String, User> userMap;

    public AccountManager(){
        userMap = new HashMap<String, User>();
    }

    public boolean checkAccount(String userName, String password){
        User user = userMap.get(userName);

        if(user == null) {
            return false;
        }
        return user.checkPassword(password);
    }


//    public boolean inUse(String userName, String mail){
//        return (userMap.containsKey(userName) || userMap.contains(mail));
//    }

    public void addAccount(User user) {
        userMap.put(user.getUserName(),user);
        userMap.put(user.getMail(),user);
    }
}