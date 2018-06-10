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
}
