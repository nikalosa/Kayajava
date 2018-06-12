package servletPack;

import functionalPack.AccountManager;
import functionalPack.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountManager manager = (AccountManager)getServletContext().getAttribute("manager");
        String mail = request.getParameter("mail");
        String pass = request.getParameter("password");
        String conPass = request.getParameter("conpass");
        String name = request.getParameter("name");
        System.out.println(mail);
        System.out.println(pass);
        System.out.println(conPass);
        System.out.println(name);

        if(pass.equals(conPass) == false){
            // aq unda vutxrat ro gaawitlos confirmi da utxras ro arasworad gaimeoreo
            // responses unda gavatanot es informacia da iqidan javascriptit vizavt jigrulad

            RequestDispatcher dispatch = request.getRequestDispatcher("Registration.jsp");
            dispatch.forward(request,response);
            return;
        }
        if(manager.inUse(name,mail)){
            // aq unda vutxrat ro daweros mail/username already in use

            RequestDispatcher dispatch = request.getRequestDispatcher("Registration.jsp");
            dispatch.forward(request,response);
            return;
        }

        User user = new User(mail,pass,name);

        String validityMessage = user.validUser();

        if(validityMessage.equals("valid")) {
            manager.addAccount(user);
            RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
            dispatch.forward(request, response);
        }else{
            RequestDispatcher dispatch = request.getRequestDispatcher("Registration.jsp");
            dispatch.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
