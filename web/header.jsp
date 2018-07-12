<html>
<head>
    <title>${param.title}</title>
    <link rel="apple-touch-icon" sizes="60x60" href="store-images/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="store-images/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="store-images/favicon/favicon-16x16.png">
    <link rel="manifest" href="store-images/favicon/site.webmanifest">
    <link rel="mask-icon" href="store-images/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="shortcut icon" href="store-images/favicon/favicon.ico">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="msapplication-config" content="store-images/favicon/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">
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