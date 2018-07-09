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

@WebServlet(name = "DuringQuizServlet")
public class DuringQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Quiz quiz = (Quiz)request.getSession().getAttribute("quiz");
        int questionNumber = Integer.parseInt((String)request.getAttribute("number"));
        Questions question =  quiz.takeQuestion(questionNumber);
        //request.removeAttribute("number");
        request.setAttribute("number",Integer.toString(questionNumber+1));
        if(question.checkAnswer(request.getParameter("Answer"))){
            response.getWriter().write("Bravoooooooo");
        }else{
            response.getWriter().write("Loooseeeeeer");
        }
        RequestDispatcher dispatch = request.getRequestDispatcher("duringQuiz.jsp");
        dispatch.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
