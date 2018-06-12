package functionalPack;

public class User {

    private String mail;
    private String password;
    private String userName;

    public User(String mail, String password, String userName){
        this.mail = mail;
        this.password = password;
        this.userName = userName;
    }

    public boolean  checkPassword(String pass){
        return pass.equals(this.password);
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
