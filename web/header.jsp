<html>
<head>
    <title>${param.title}</title>
</head>
<link rel = "stylesheet" type="text/css" href = "css/bootstrap.min.css">
<link rel = "stylesheet" type="text/css" href = "css/mycss.css">
<body>


<nav class="navbar navbar-inverse">
    <div class= "container-fluid">
        <div class="navbar-header">
            <img alt="WebLogo" src="store-images/logo.png">
        </div>
        <a class="navbar-brand" style="color:white;" href="MainPage.jsp">KayaJava</a>

        <!-- lets add some information -->
        <div class="collapse navbar-collapse" id="myCollapseClass">
            <!-- Using unordered list we  add home,login and register -->
            <ul class="nav navbar-nav navbar right navig">
                <li> <a href="MainPage.jsp"> Home</a> </li>
                <li> <a href="Login.jsp"> Log In</a> </li>
                <li> <a href="Registration.jsp"> Register</a> </li>
            </ul>

            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            </form>
        </div>

    </div>
</nav>