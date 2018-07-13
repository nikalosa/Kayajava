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

    <%
    String str= (String) request.getSession().getAttribute("email");
    System.out.println(str);
    boolean logged= false;
    if(str != null) logged = true;
%>
<nav class="navbar navbar-inverse">
    <div class= "container-fluid">
        <div class="navbar-header">
            <img alt="WebLogo" src="store-images/logo.png">
        </div>
        <%if(!logged) {%>
        <a class="navbar-brand" style="color:white;" href="index.jsp"> KayaJava</a>
        <% }else {%>
        <a class="navbar-brand" style="color:white;" href="AfterLogIn.jsp"> KayaJava</a>
        <%}%>
        <!-- lets add some information -->
        <div class="collapse navbar-collapse" id="myCollapseClass">
            <!-- Using unordered list we  add home,login and register -->
            <ul class="nav navbar-nav navbar right navig">
                <%
                    if(logged){ %>
                <li> <a href="AfterLogIn.jsp">Home</a> </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        Notifications <span class="badge green">5</span> <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <p><a href="">NikaLosa</a> wants to be your friend</p>
                            <div class="addreject">
                                <a href="#" class="btn btn-info">Add Friend</a> <a href="#" class="btn btn-danger">Decline</a>
                            </div>
                            <hr>
                        </li>
                        <li>
                            <p><a href="">NikaLosa</a> Challenged you on <a href="">What kind of beqa are you?</a></p>
                            <div class="addreject">
                                <a href="#" class="btn btn-info">Accept</a> <a href="#" class="btn btn-danger">Reject</a>
                            </div>
                            <hr>
                        </li>
                        <li><a href="#">See full history</a></li>
                    </ul>
                </li>
                <li> <a href="Quizzies.jsp">Quizzes</a> </li>
                <li> <a href="Profile.jsp">Profile</a> </li>
                <li> <a href="logout.jsp"  type ="submit">Log Out</a> </li>
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