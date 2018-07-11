<%--
  Created by IntelliJ IDEA.
  User: nikal
  Date: 7/9/2018
  Time: 5:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Start Quiz</title>
</head>
<body>

<form action="startQuizServlet" method="post" >
    <div class="marg">
        <!--  create fields for login -->
        <div class=" form-group">
            <input type="checkbox" name="shuffle" > Shuffle Quiz Questions

        </div> <!--  mail field -->

        <button class="btn btn-primary btn-block" type ="submit" name="action" value="StartQuiz"> Start Quiz</button>
        <!-- button field -->
    </div>
</form>


</body>
</html>
