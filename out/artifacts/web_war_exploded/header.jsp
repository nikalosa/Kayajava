<html>
<head>
    <title>${param.title}</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel = "stylesheet" type="text/css" href = "css/bootstrap.min.css">
    <link rel = "stylesheet" type="text/css" href = "css/mycss.css">
</head>
<body>


<nav class="navbar navbar-inverse">
    <div class= "container-fluid">
        <div class="navbar-header">
            <img alt="WebLogo" src="store-images/logo.png">
        </div>
        <a class="navbar-brand" style="color:white;" href="index.jsp"> KayaJava</a>

        <!-- lets add some information -->
        <div class="collapse navbar-collapse" id="myCollapseClass">
            <!-- Using unordered list we  add home,login and register -->
            <ul class="nav navbar-nav navbar right navig">
                <%
                    if(request.getParameter("login") != null){ %>
                <li> <a href="AfterLogIn.jsp">Home</a> </li>
                <li> <a href="Quizzies.jsp">Quizzes</a> </li>
                <li> <a href="Profile.jsp">Profile</a> </li>
                <li> <a href="logout.jsp">Log Out</a> </li>
                <%  } else { %>

                <li> <a href="index.jsp">Home</a> </li>
                <li> <a href="Quizzies.jsp">Quizzes</a> </li>
                <li> <a href="Login.jsp">Log In</a> </li>
                <li> <a href="Registration.jsp">Register</a> </li>

                <% } %>
            </ul>
        </div>

    </div>
</nav>