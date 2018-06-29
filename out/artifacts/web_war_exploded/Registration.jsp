<jsp:include page="header.jsp">
	<jsp:param name="title" value="Registration"/>
</jsp:include>

<!-- This is to create opening till center point -->
<div class="bg"> </div>




<!-- Right Box -->
<div class="container-fluid" >
	<div class="row  ">

	<div class="form-container">




		<!--  -->



		<!--  Lets add the part where they will be able to log in while registering -->




		<!--	This is part to add register theme.  -->

		<div class="col-md-4 col-sm4 col-xs-4 col-md-offset-1" >



			<!--  -->
			<form  class="marg"   id="registrationjs" action="RegisterServlet" method="post" >
				<fieldset>

					<!-- Form Name -->
					<legend> Account Information </legend>


					<!-- Mail field -->
					<div class=" form-group">
						<label>Mail</label>
						<div class="input-group">
							<!-- group addon class controls to stick icon and field togheter. learned from bootstrap components page. -->
							<span class="input-group-addon"><strong class="glyphicon glyphicon-envelope"></strong> </span>
							<input type="text" class="form-control" placeholder="Your Mail" name="email">
						</div>
					</div>





					<!-- password Field -->
					<div class=" form-group">
						<span>password</span>
						<div class="input-group">
							<!-- group addon class controls to stick icon and field togheter. learned from bootstrap components page. -->
							<span class="input-group-addon"><strong class="glyphicon glyphicon-home"></strong> </span>
							<input type="password" class="form-control" placeholder="Password" name="password" required>
						</div>
					</div>




					<!-- Confirm Password Field -->
					<div class=" form-group">
						<span>Confirm Password</span>
						<div class="input-group">
							<!-- group addon class controls to stick icon and field togheter. learned from bootstrap components page. -->
							<span class="input-group-addon"><strong class="glyphicon glyphicon-home"></strong> </span>
							<input type="password" class="form-control" placeholder="Confirm Password" name="conpass" required>
						</div>
					</div>

					<!-- Username -->
					<div class=" form-group">
						<span>Username</span>
						<div class="input-group">
							<!-- group addon class controls to stick icon and field togheter. learned from bootstrap components page. -->
							<span class="input-group-addon"><strong class="glyphicon glyphicon-user"></strong> </span>
							<input type="password" class="form-control" placeholder="Username"  name="name">
						</div>
					</div>

					<button class="btn btn-primary btn-block" type ="submit" >Register</button>
				</fieldset>
			</form>
		</div>

		<div class="col-md-4 col-sm4 col-xs-4 col-md-offset-2 col-md-pull-1 inf" >
			<div class="row" >
				<legend> Sign up at KayaJava </legend>

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
						<div >
							Save your scores and see how you rank.
						</div>
					</li>
				</ul>


				<!-- This lines just are to add information. -->
				<ul class="list-group">
					<li class="list-group-item">
						<span class="	glyphicon glyphicon-envelope"  aria-hidden="true"> </span>
						<strong>Join the Discussion</strong>
						<div >
							Engage in some nerdy talk with a community of trivia-loving folks like you!
						</div>
					</li>
				</ul>

				<!-- This lines just are to add information. -->
				<ul class="list-group">
					<li class="list-group-item">
						<span class="glyphicon glyphicon-user"  aria-hidden="true"> </span>
						<strong>Challenge Friends</strong>
						<div >
							May the best brain win.
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>
</div>
</div>

<!--  -->

<!-- Footer -->
<jsp:include page="footer.jsp"/>