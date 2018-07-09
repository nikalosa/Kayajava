package servletPack;

import functionalPack.DBinfo;
import functionalPack.Quiz;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "startQuizServlet")
public class startQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://" + DBinfo.DATABASE_SERVER, DBinfo.USERNAME, DBinfo.PASSWORD);
            Statement st = (Statement) con.createStatement();
            boolean shuffle;
            if(request.getParameter("shuffle")!=null){
                shuffle = true;
            }else{
                shuffle = false;
            }
            Quiz quiz = new Quiz("Quiz1",st,shuffle);
            request.getSession().setAttribute("quiz",quiz);
            request.setAttribute("number","0");
            RequestDispatcher dispatch = request.getRequestDispatcher("duringQuiz.jsp");
            dispatch.forward(request,response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
