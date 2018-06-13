
<html>
<head>
<title>Quiz Website</title>
</head>
<link rel = "stylesheet" type="text/css" href = "css/bootstrap.css">
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

<!-- lets make slide with sign up button using bootstrap css -->

<div class="carousel-inner" role="listbox">
        <div class="item active">
        <img src= "store-images/shell.jpg" id="main">
          <div class="carousel-caption d-none d-md-block">
        
        <h1>Check your general knowledge</h1>
        	<a class = "btn btn-lg btn-primary" > Sign Up</a>
        </div>
        </div>        
</div>

<div class="container marketing">
	<div class= "row"> 
		<div class= "rowImage" >
			<img src = "data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" class="img-circle"  width="140" height="140">
		<div class="caption"> 
			<h4>Heading</h4>
			<p> blablabla</p>
		</div>
		</div>
		
		<div class= "rowImage" >
			<img src = "data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="  class="img-circle" width="140" height="140">
		
		<div class="caption"> 
			<h4>Heading</h4>
			<p> blablabla</p>
		</div>
		</div>
		
		
		<div class= "rowImage" >
			<img src = "data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" class="img-circle" width="140" height="140">
		
		<div class="caption"> 
			<h4>Heading</h4>
			<p> blablabla</p>
		</div>
		</div>
		
		
	</div>
</div>



<!-- Footer -->

<div class="col-md-12 col-sm12 col-xs-12" > <hr></div>
<footer class="page-footer bla">
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