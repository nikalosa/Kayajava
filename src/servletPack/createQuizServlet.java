package servletPack;

import functionalPack.AccountManager;
import functionalPack.StatementManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "createQuizServlet", urlPatterns = {"/createQuizServlet"})
public class createQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountManager manager = (AccountManager)getServletContext().getAttribute("manager");
        String title = request.getParameter("title");

        String imageLink = request.getParameter("imgLink");
        String description = request.getParameter("description");

        /////////////check box
        boolean ran = false;
        boolean multiple = false;
        boolean correction = false;
        String random = request.getParameter("random");
        String mul = request.getParameter("multiple");
        String cor = request.getParameter("correction");
        if(random != null &&random.equals("random")) ran = true;
        if(mul!= null && mul.equals("multiple")) multiple = true;
        if(cor!=null && cor.equals("correction")) correction = true;

        /////////////quiz type
        String quizType = request.getParameter("quizType");

        ///add quiz information to databse
        Connection con = AccountManager.getConnection();
        StatementManager st = new StatementManager(con);

        st.insertQuiz(title,description,(String)request.getSession().getAttribute("email"),ran,multiple,correction,imageLink);
        int ID = st.getQuizID(title);

        String command = "<a href='Profile.jsp?mail="+(String)request.getSession().getAttribute("email")+"'>"+(String)request.getSession().getAttribute("email")  +"</a>"
                + " created Quiz " + "<a href='startingQuiz.jsp?id=" + ID + "'>" + title + "</a>";
        st.addToHistory((String)request.getSession().getAttribute("email"),command);

        if(quizType.equals("Question-Response")) {
            int index = 1;
            while(true) {
                String question = request.getParameter("quiz-question-" + index);
                String answer = request.getParameter("quiz-question-answer-"+ index);
                if(question == null || answer == null) break;
                index++;
                st.insertQuestion(title,quizType,question,answer,"");
            }
        }else if(quizType.equals("Fill in the Blank")) {
            int index = 1;
            while(true) {
                String before_blank = request.getParameter("before-blank-" + index);
                String blank = request.getParameter("blank-" + index);
                String after_blank = request.getParameter("after-blank-" + index);
                if(before_blank == null || blank == null || after_blank == null) break;
                index++;
                st.insertQuestion(title,quizType,before_blank+"--------" + after_blank,blank,"");
            }
        }else if(quizType.equals("Multiple Choice")) {
            int index = 1;
            while(true) {
                String question = request.getParameter("quiz-multiple-" + index);
                int answerindex = 1;
                if(question == null) break;
                int id =0;
                while(true) {
                    String answer = request.getParameter("quiz-multiple-answer-"+index+"-" +answerindex);
                    if(answer == null) break;
                    if(answerindex == 1) {
                        id = st.insertQuestion(title, quizType, question, answer, "");
                        st.insertAnswer(id, answer);
                    }else {
                        st.insertAnswer(id,answer);
                    }
                    answerindex++;
                }
                index ++;
            }
        }else if(quizType.equals("Picture-Response Questions")) {
            int index = 1;
            while(true) {
                String imgQuestion = request.getParameter("image-question-" + index);
                String imgLink = request.getParameter("image-link-"+index);
                String imgAnswer = request.getParameter("image-answer-"+index);
                if(imgQuestion==null || imgLink==null||imgAnswer==null) break;
                st.insertQuestion(title,quizType,imgQuestion ,imgAnswer,imgLink);
                index++;
            }
        }

        RequestDispatcher dispatch = request.getRequestDispatcher("AfterLogIn.jsp");
        dispatch.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
