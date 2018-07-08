<jsp:include page="header.jsp">
	<jsp:param name="title" value="Login"/>
</jsp:include>

<!-- This is to create opening till center point -->

<div class="bg"> </div>
<!--  this is to add -->
<div class="container-fluid">
	<div class="row  ">
	<div class="form-container">
		<div class="col-md-3 col-sm3 col-xs-3 login_box">

			<form action="LoginServlet" method="post">
			<div class="test" >
				<!--  Lets give him chance to register too -->
				<button class="btn btn-primary btn-block" type ="submit" name="action"  value="signup"> Sign Up</button>
				<hr class="line1" align="right">
				<hr class="line2" align="left">
				<!-- added lines to devide sign and log in part from each other-->
			</div>
			</form>
			<form action="LoginServlet" method="post"  id="loginjs">
					<%
					boolean isSet = (request.getAttribute("error") == null);
					if(!isSet) { %>
						<div class="alert alert-danger" role="alert">
							<%= request.getAttribute("error")%> is not valid.
						</div>
					<%
						}
					%>
				<div class="marg">
					<!--  create fields for login -->
					<div class=" form-group">
						<!-- label -->
						<label>Mail</label>
						<!-- validation input -->
						<div class="input-group">
							<!-- group addon class controls to stick icon and field togheter. learned from bootstrap components page. -->
							<span class="input-group-addon"><strong class="glyphicon glyphicon-envelope"></strong> </span>
							<input type="text" class="form-control" placeholder="Your Mail" name="my_email">
						</div>
					</div> <!--  mail field -->

					<div class=" form-group">

						<label>password</label>
						<div class="input-group">
							<span class="input-group-addon"><strong class="glyphicon glyphicon-home"></strong> </span>
							<input type="password" class="form-control" placeholder="password" name="my_password">
						</div>
					</div><!-- password field -->

					<button class="btn btn-primary btn-block" type ="submit" name="action" value="login"> Log In</button>
					<!-- button field -->
				</div>
			</form>
		</div>
	</div>
</div>
</div>

<!--  -->



<!-- Footer -->
<jsp:include page="footer.jsp"/>