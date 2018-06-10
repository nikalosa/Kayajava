package servletPack;

import functionalPack.AccountManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountManager manager = (AccountManager)getServletContext().getAttribute("manager");
        String name = request.getParameter("name");
        String pass = request.getParameter("password");
        if(manager.checkAccount(name,pass)) {
            RequestDispatcher dispatch = request.getRequestDispatcher("MainPage.jsp");
            dispatch.forward(request,response);
        }else {
            RequestDispatcher dispatch = request.getRequestDispatcher("Registration.html");
            dispatch.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
