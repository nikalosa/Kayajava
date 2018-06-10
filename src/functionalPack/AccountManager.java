package functionalPack;

import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

public class AccountManager {

    private ConcurrentHashMap <String, User> userMap;

    void AccountManager(){

        userMap = new ConcurrentHashMap<String, User>();

    }

    public boolean checkAccount(String userName, String password){

        User user = userMap.get(userName);


        if(user == null){
            return false;
        }

        return user.checkPassword(password);


    }


    public boolean inUse(String userName, String mail){

        return (userMap.contains(userName) || userMap.contains(mail));

    }

    public void addAccount(User user){
        userMap.put(user.getUserName(),user);
        userMap.put(user.getMail(),user);
    }


}
