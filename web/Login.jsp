
<html>
<head>
<title>Login</title>

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
	
<!-- This is to create opening till center point -->
<div class="bg"> </div>
<!--  this is to add -->
<div class="row  "> 
	<div class="form-container">
	
	
	<!-- action="LoginServlet" method="post" -->
	
	
	<div class="col-md-4 col-sm4 col-xs-4" ></div>
	<div class="col-md-3 col-sm3 col-xs-3" >
		<div class="test" >
			<!--  Lets give him chance to register too -->
				<button class="btn btn-primary btn-block" type ="submit" name="password" > Sign Up</button>
				<hr class="line1" align="right">
				<hr class="line2" align="left">		
		</div>
		<!-- finish  -->
		
		<form action="LoginServlet" method="POST">
			<div class="marg">
				
				<!--  create fields for login -->
				<div class=" form-group">
						<div style="float:left; clear:none;"> <label> Mail </label> </div>
						<input type="text" class="form-control" placeholder="Your Mail" name="name" >
				</div> <!--  mail field -->
				
				<div class=" form-group">
					<label>password</label>
					<input type="password" class="form-control" placeholder="password" name="password" >
				</div><!-- password field -->
				
				<button class="btn btn-primary btn-block" type ="submit" name="password" > Log In</button>
				<!-- button field -->
			</div>
		</form>		
	</div>

<div class="col-md-4 col-sm4 col-xs-4" ></div>
	</div>
</div>


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
			<p>  <a href="MainPage.jsp" style="color:white;">Home </a></p>
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