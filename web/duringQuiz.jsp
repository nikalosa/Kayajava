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
    int questionNumber = Integer.parseInt((String) request.getAttribute("number"));
    Questions question =  quiz.takeQuestion(questionNumber);

%>
<form action="startQuizServlet" method="post" >
    <div class="marg">
        <!--  create fields for login -->
        <%=question.getQuestion()%> <br>
        <input type="text" name="Answer"><br>
        <button class="btn btn-primary btn-block" type ="submit" name="action" value="Next Question"> Next Question</button>
        <!-- button field -->
    </div>
</form>
</body>
</html>
