<%@ page import="functionalPack.Questions" %>
<%@ page import="functionalPack.Quiz" %><%--
  Created by IntelliJ IDEA.
  User: nikal
  Date: 7/9/2018
  Time: 5:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>drakulaa</title>
</head>
<body>
<%

    Quiz quiz = (Quiz)request.getSession().getAttribute("quiz");

%>
<form action="AfterQuizServlet" method="post" >
    <div class="marg">
        <!--  create fields for login -->
        <%
            for(int i=0;i<quiz.numbOfQuestions();i++){%>
                <h4> Question <%=Integer.toString(i+1)%> </h4> <%
                Questions question = quiz.getQuestion(i);
                    String type = question.getType();
                    String answer = question.getCorrectAnswer();
                    if(type.equals("Question-Response")){%>
                        <h2>Question Response:</h2>
                        <%=question.getQuestion()%><br>
                        <input type="text" name="Answer<%=Integer.toString(i)%>"><br><br><br><br><br>
                        <%
                    }else if(type.equals("Fill in the Blank")){
                        int ind = question.getQuestion().indexOf('_');
                        %>
                        <h2>Fill in the Blank:</h2>
                        <%=question.getQuestion().substring(0,ind)%>
                        <input type="text" name="Answer<%=Integer.toString(i)%>">
                        <%=question.getQuestion().substring(ind+1,question.getQuestion().length())%><br><br><br><br><br>
                        <%
                    }else if(type.equals("Multiple Choice")){  %>
                        <h2>Multiple Choice:</h2>
                        <%=question.getQuestion()%><br>
                        <%
                            for(int j=0;j<question.getPossibleAnswersLen();i++){
                                char ch = (char)(j+'A');
                                String ans = question.getPossibleAnswer(j);
                                %>
                                <div>
                                    <input type="checkbox<%=Integer.toString(i)%>#<%=Integer.toString(j)%>" id="scales" name="Answer<%=Integer.toString(j)%>"
                                        value="scales" />
                                    <%--<label for="scales">Scales</label>--%>
                                </div><br><br>
                                <%
                            }


                    }else if(type.equals("Picture-Response")){ %>
                        <h2>Picture Response:</h2>
                        <img src="<%=question.getQuestion()%>" >
                        <input type="text" name="Answer<%=Integer.toString(i)%>"><br><br><br><br><br>
                    <%}

            }%>

        <button class="btn btn-primary btn-block" type ="submit" name="action" value="Finish Quiz"> Finish Quiz</button>
        <!-- button field -->
    </div>
</form>
</body>
</html>