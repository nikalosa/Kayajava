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
import java.util.ArrayList;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountManager manager = (AccountManager)getServletContext().getAttribute("manager");

        String name = request.getParameter("name");
        String mail = request.getParameter("mail");
        String pass = request.getParameter("password");
        String conPass = request.getParameter("conpass");
        User user = new User(mail,pass,name,conPass);
        ArrayList<String> arr = user.validUser();


        if(arr.size()==0) {
            manager.addAccount(user);
            RequestDispatcher dispatch = request.getRequestDispatcher("AfterLogIn.jsp");
            dispatch.forward(request, response);
        }else {
            for(int i =0; i <arr.size();i++) {
                request.setAttribute("pass" + i, arr.get(i));
            }
                RequestDispatcher dispatch = request.getRequestDispatcher("Registration.jsp");
                dispatch.forward(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}