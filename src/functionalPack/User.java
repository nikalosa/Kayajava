package functionalPack;


import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;
public class User {

    private static MessageDigest messageDigest;
    private String mail;
    private String password;
    private String userName;

    public User(String mail, String password, String userName){
        this.mail = mail;
        this.password = makeHashCode(password);
        this.userName = userName;
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

    public String validUser(){
        String password = this.password;
        if(password.length()<8){
            return "Too short password";
        }
        boolean numb=false, sign=false, bigLetters=false, smallLetters=false;
        for(int i=0;i<password.length();i++){
            char ch = password.charAt(i);
            if(ch>='a' && ch<='z'){
                smallLetters = true;
            }else if(ch>='A' && ch<='Z'){
                bigLetters = true;
            }else if(ch>='0' && ch<='9'){
                numb = true;
            }else{
                sign = true;
            }
        }
        if(!numb){
            return "No numbers in your password, use them for your safety";
        }
        if(!sign){
            return "No sign symbols in your password, use them for your safety";
        }
        if(!bigLetters){
            return "No big letters in your password, use them for your safety";
        }
        if(!smallLetters){
            return "No small letters in your password, use them for your safety";
        }
        return "valid";
    }
}
