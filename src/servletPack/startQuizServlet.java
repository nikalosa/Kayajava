package servletPack;

import functionalPack.AccountManager;
import functionalPack.DBinfo;
import functionalPack.Quiz;
import functionalPack.StatementManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "startQuizServlet", urlPatterns = {"/startQuizServlet"})
public class startQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = AccountManager.getConnection();
        StatementManager st = new StatementManager(con);
        boolean shuffle;
        if (request.getParameter("shuffle") != null) {
            shuffle = true;
        } else {
            shuffle = false;
        }
        Quiz quiz = new Quiz("Quiz1", st, shuffle);
        request.getSession().setAttribute("quiz", quiz);
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatch = request.getRequestDispatcher("duringQuiz.jsp");
        dispatch.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
