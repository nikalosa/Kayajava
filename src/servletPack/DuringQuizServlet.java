package servletPack;

import functionalPack.Questions;
import functionalPack.Quiz;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DuringQuizServlet", urlPatterns = {"/DuringQuizServlet"})
public class DuringQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Quiz quiz = (Quiz)request.getSession().getAttribute("quiz");
        RequestDispatcher dispatch;
        if(quiz.isEnd()){
            dispatch = request.getRequestDispatcher("afterQuiz.jsp");
        }else {
            Questions question = quiz.getQuestion();
            quiz.nextQuestion();
            if (question.checkAnswer(request.getParameter("Answer"))) {
                quiz.incScore();
                request.setAttribute("status","correct");
            } else {
                request.setAttribute("status", "incorrect");
            }
            dispatch = request.getRequestDispatcher("duringQuiz.jsp");
        }
        dispatch.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
