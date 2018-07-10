package functionalPack;


//import javafx.util.Pair;

import javafx.util.Pair;

import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User {

    private static MessageDigest messageDigest;
    private String mail;
    private String password;
    private String userName;
    private String confirmPass;

    public User(String mail, String password, String userName,String confirmPass){
        this.mail = mail;
        this.password = password;
        this.userName = userName;
        this.confirmPass = confirmPass;
    }

    public boolean  checkPassword(String pass){
        return pass.equals(this.password);
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



    public String getUserName(){
        return userName;
    }
    public String getMail(){
        return mail;
    }
    public String getPassword() {return password; }

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
            Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public ArrayList<String> validUser(){
        ArrayList<String> arr = new ArrayList<>();
        String password = this.password;
        if(password.length()<8){
            arr.add("Too short password");
        }
        boolean numb=false, bigLetters=false, smallLetters=false;
        for(int i=0;i<password.length();i++){
            char ch = password.charAt(i);
            if(ch>='a' && ch<='z'){
                smallLetters = true;
            }else if(ch>='A' && ch<='Z'){
                bigLetters = true;
            }else if(ch>='0' && ch<='9'){
                numb = true;
            }
        }
        if(!numb){

            arr.add("No numbers in your password, use them for your safety");
        }
        if(!bigLetters){
            arr.add("No big letters in your password, use them for your safety");
        }
        if(!smallLetters){
            arr.add("No small letters in your password, use them for your safety");
        }
//      ///////////mail

        if(mail ==null || mail.isEmpty()|| !VALID_EMAIL_ADDRESS_REGEX.matcher(mail).matches()) {
            arr.add("No small letters in your password, use them for your safety");
        }


        ///confirm pass.
        if(!confirmPass.equals(this.password)) {
            arr.add("Password does not matches.");

        }
        ///username
        if(this.userName.equals("")) {
            arr.add("Empty username, please enter.");
        }
        return arr;
    }



    ///inner class of Achievements.
    private class Achievements {
        HashMap<String, Pair<String, Boolean>> map;
        String [] arr = {"Amateur Author","Prolific Author","Prodigious Author",
                "Quiz Machine","I am the Greatest","Practice Makes Perfect"};
        String [] arrDisc = {"The user created a quiz.","The user created five quizzes.",
                    "The user created ten quizzes","The user took ten quizzes.",
                    "The user had the highest score on a quiz."};

        Boolean[] boolArr;
        public Achievements() {
            map = new HashMap<String, Pair<String, Boolean> >();
            boolArr = new Boolean[arr.length];
            defaultArr();
            fillHashMap();
        }

//        Pair<Integer, String> pair = new Pair<>(1, "One");
//        Integer key = pair.getKey();
//        String value = pair.getValue();

        public void AchievementDone(String AchievementName) {
            Pair<String, Boolean> pair = map.get(AchievementName);
            if (pair != null) {
                Pair<String, Boolean> newPair = new Pair<>(pair.getKey(), true);
                map.replace(AchievementName, newPair);
            }
        }

        private void fillHashMap() {
            for(int i =0;i<arr.length;i++) {
                Pair<String, Boolean> pair = new Pair<>(arrDisc[i], false);
                map.put(arr[i],pair);
            }
        }
        private void defaultArr() {
            for(int i =0; i <boolArr.length;i++) {
                boolArr[i] = false;
            }
        }


    }






}
