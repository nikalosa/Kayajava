
<html>
<head>
<title>Registration</title>

</head>

<link rel = "stylesheet" type="text/css" href = "css/bootstrap.css">
<link rel = "stylesheet" type="text/css" href = "css/bootstrap.min.css">
<link rel = "stylesheet" type="text/css" href = "css/mycss.css">
<body>
<nav class="navbar navbar-inverse">
	<div class= "container-fluid">
		<div class="navbar-header">
			<img alt="WebLogo" src="store-images/logo.png">
		</div>
		<a class="navbar-brand" style="color:white;" href="#">KayaJava</a>
		
		
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
	
<!-- This is to create opening till center point -->
<div class="bg"> </div>




<!-- Right Box -->
<div class="row  "> 
	<div class="form-container">		
		<div class="row inf" >
			<h3> Sign up to KayaJava </h3>
			
			<!-- This lines just are to add information. -->
			<ul class="list-group"> 
				<li class="list-group-item">
					<span class="glyphicon glyphicon-pencil"  aria-hidden="true"> </span>
					<strong> Create Quizzes </strong>
					<div style="padding-right:40px;">
					 	Make and share your own mentally
					 	stimulating diversions!
					</div>
				</li>
			</ul>
			
			
			<!-- This lines just are to add information. -->
			<ul class="list-group"> 
				<li class="list-group-item">
					<span class="glyphicon glyphicon-align-right"  aria-hidden="true"> </span>
					<strong>Track Your Stats</strong>
					<div style="padding-right:40xp;">
					 	Save your scores and see how you rank.
					</div>
				</li>
			</ul>
			
			
			<!-- This lines just are to add information. -->
			<ul class="list-group"> 
				<li class="list-group-item">
					<span class="	glyphicon glyphicon-envelope"  aria-hidden="true"> </span>
					<strong>Join the Discussion</strong>
					<div style="padding-right:40xp;">
					 	Engage in some nerdy talk with a community of trivia-loving folks like you!
					</div>
				</li>
			</ul>

			<!-- This lines just are to add information. -->
			<ul class="list-group"> 
				<li class="list-group-item">
					<span class="glyphicon glyphicon-user"  aria-hidden="true"> </span>
					<strong>Challenge Friends</strong>
					<div style="padding-right:40xp;">
						May the best brain win.
					</div>
				</li>
			</ul>
		</div>
		
	
	<!--  -->
			
		
	
	<!--  Lets add the part where they will be able to log in while registering -->
	
	
			
			
			
			
	<!--	This is part to add register theme.  -->		
	<div class="col-md-1 col-sm1 col-xs-1" ></div>
	<div class="col-md-3 col-sm3 col-xs-3" >
		<form class="marg" >
			
			<!-- Mail field -->
			<div class=" form-group">
				<span>Mail</span>
				<input type="text" class="form-control" placeholder="Your Mail">
			</div>
			<!-- password Field -->
			<div class=" form-group">
				<span>password</span>
				<input type="password" class="form-control" placeholder="Password" >
			</div>
			
			<!-- Confirm Password Field -->
			<div class=" form-group">
				<span>Confirm Password</span>
				<input type="password" class="form-control" placeholder="Confirm Password" >
			</div>
			
			<!-- Username -->
			<div class=" form-group">
				<span>Username</span>
				<input type="password" class="form-control" placeholder="Username" >
			</div>
			
			<button class="btn btn-primary btn-block" type ="button" >Register</button>
		</form>		
	</div>
<div class="col-md-4 col-sm4 col-xs-4" ></div>
	</div>
</div>

<!--  -->

<!-- Footer -->
<footer class="page-footer pg">
	<div class="row" style="background-color: #1C2833;">	
		<!--  this is written to create opening before headline -->
		<div class="col-md-1 col-sm1 col-xs-1" ></div>
		
		<div class="col-md-3 col-lg-3 col-xl-3">
			<h1 style="color:white;" >KayaJava</h1>
			<p style="color:white;"> Best Free Website To Test Your General Skills</p>
		</div>
		
		<!-- this is another 3 part where we will write information -->		 
		<div class="col-md-2 col-lg-2 col-xl-2">
			<h2 style="color:white;">Information</h2>
			<hr>
			<p>  <a href="#!" style="color:white;">Home </a></p>
	        <p>  <a href="#!" style="color:white;">About us</a>  </p>
	        <p>  <a href="#!" style="color:white;">Name</a>  </p>
		</div>
			
		<div class="col-md-2 col-lg-2 col-xl-2">
			<h2 style="color:white;">Info</h2>
			
	        <hr>	
			<p>  <a href="#!" style="color:white;">Name</a>  </p>
			<p>  <a href="#!" style="color:white;">Name</a>  </p>
			<p>  <a href="#!" style="color:white;">Name</a>  </p>
		</div>
		
		<div class="col-md-2 col-lg-2 col-xl-2">
			<h2 style="color:white;">Info</h2>		
			
			<hr>
			<p>  <a href="#!" style="color:white;">Name</a>  </p>
			<p>  <a href="#!" style="color:white;">Name</a>  </p>
			<p>  <a href="#!" style="color:white;">Name</a>  </p>
		</div>
				

	</div>
</footer>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>