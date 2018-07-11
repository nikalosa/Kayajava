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
        String action = request.getParameter("action");

        if ("signup".equals(action)) {
            RequestDispatcher dispatch = request.getRequestDispatcher("Registration.jsp");
            dispatch.forward(request,response);

        } else if ("login".equals(action)) {
            String name = request.getParameter("my_email");
            String pass = request.getParameter("my_password");
            if(manager.checkAccount(name,pass)) {
                RequestDispatcher dispatch = request.getRequestDispatcher("AfterLogin.jsp");
                dispatch.forward(request,response);
            }else {
                request.setAttribute("error","Wrong username or password.");

                RequestDispatcher dispatch = request.getRequestDispatcher("Login.jsp");
                dispatch.forward(request,response);
            }
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
