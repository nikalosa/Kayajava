package servletPack;


import functionalPack.Quiz;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AfterQuizServlet", urlPatterns = {"/AfterQuizServlet"})
public class AfterQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Quiz quiz = (Quiz)request.getSession().getAttribute("quiz");
        int len = quiz.numbOfQuestions();
        for(int i=0;i<len;i++){

           /* if(quiz.getQuestion(i).getType().equals("Multiple Choice")){
                for(int j=0;j<quiz.getQuestion().getPossibleAnswersLen();j++){
                    if(request.getParameter("checkbox"+Integer.toString(i)+"#"+Integer.toString(j))!=null){
                        if(quiz.getQuestion(i).checkAnswer(""+(char)(j+'A'))){
                            quiz.incScore();
                        }
                    }
                }
            }else{*/
                String ans = request.getParameter("Answer"+Integer.toString(i+1));
                //System.out.println(ans +" ///////// "+ quiz.getQuestion(i).getCorrectAnswer());
                if(quiz.getQuestion(i).checkAnswer(ans)){
                    quiz.incScore();
                }
            //}
        }
        quiz.incNumPlayed();
        quiz.incSumPoints();
        String time = quiz.addDoneQuiz();

        request.setAttribute("score",Integer.toString(quiz.getScore()));
        request.setAttribute("place",quiz.getPlace());
        request.setAttribute("time",time);
        request.setAttribute("ID",quiz.getID());
        request.setAttribute("dateTime",quiz.getDateTime());
        RequestDispatcher dispatch = request.getRequestDispatcher("afterQuiz.jsp");
        request.getSession().removeAttribute("quiz");
        dispatch.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
