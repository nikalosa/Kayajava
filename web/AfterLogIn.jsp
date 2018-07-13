<jsp:include page="header.jsp">
	<jsp:param name="title" value="Home"/>
	<jsp:param name="login" value="logged"/>
</jsp:include>
<!-- Finish -->
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String mail = (String) request.getSession().getAttribute("email");
	if(mail == null) response.sendRedirect("index.jsp");

	Connection con = AccountManager.getConnection();
	StatementManager st = new StatementManager(con);
	ResultSet set = st.getRecentQuizzes();
	String [][] arr = new String [3][4];
	int index = 0;
	while(set.next()) {
		arr[index][0] = set.getString(2);
		arr[index][1] = set.getString(3);
		arr[index][2] = set.getString(10);
		arr[index][3] = set.getString(1);
		index++;
	}
	set = st.getTrendingQuizzes();
	String[][] trendArr = new String[5][2];
	index =0;
	while(set.next()) {
		trendArr[index][0] = set.getString(1);
		trendArr[index][1] = set.getString(2);
		index++;
	}

	set = st.getRecentlyPlayedQuizzes((String)request.getSession().getAttribute("email"));

%>

<!-- this is slide show bar code-->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<% for(int i =0; i <3;i++) {%>
		<% if(i==0) { %>
		<div class="item active">
			<%}else { %>
			<div class="item">
				<%}%>
				<% for(int j =0; j <4;j++) {%>
				<div class="col-xs-5 col-md-3">
					<a href="#" class="thumbnail">
						<img src="/store-images/back.jpg" alt="...">
					</a>
				</div>
				<%}%>
			</div>
			<%}%>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>


	<div class="container after-login">
		<div class="row ">
			<div class="col-sm-8 recent-box">
				<h3>Recent Quizes</h3>
				<% for(int i =0; i <3;i++){ %>
				<div class="row recent-quiz">
					<div class="col-sm-4">
						<img src="<%=arr[i][2]%>" class="img-responsive">
					</div>
					<div class="col-sm-8">
						<h4><%=arr[i][0]%></h4>
						<p><%=arr[i][1]%></p>
						<a href="startingQuiz.jsp?id=<%=arr[i][3]%>" class="btn btn-default">Read More</a>
					</div>
				</div>
				<%}
				%>
			</div>

			<div class="col-sm-3 col-sm-offset-1 trending-box">
				<h3>Trending Quizies</h3>
				<div class="trending-container">
					<% for(int i =0; i <5;i++) { %>
					<a href="startingQuiz.jsp?id=<%=trendArr[i][0]%>"><i class="glyphicon glyphicon-fire"></i> <%=trendArr[i][1]%></a>
					<%}
					%>

				</div>

				<br/><br/>
				<h3>Recently Taken Quizies</h3>
				<div class="trending-container">
					<%while(set.next()){ %>
						<a href="startingQuiz.jsp?id=<%=set.getString(1)%>"><i class="glyphicon glyphicon-chevron-right"></i> <%=set.getString(2)%></a>
					<% }%>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>