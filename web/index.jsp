<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:include page="header.jsp">
	<jsp:param name="title" value="Quiz Website"/>
</jsp:include>

<% 	Connection con = AccountManager.getConnection();
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
	String[][] trendArr = new String[5][3];
	index =0;
	while(set.next()) {
		trendArr[index][0] = set.getString(1);
		trendArr[index][1] = set.getString(2);
		trendArr[index][2] = set.getString(10);
		index++;
	}
%>

<!-- lets make slide with sign up button using bootstrap css -->
<div class="main">
	<div class="cover">
		<div class="description">
			<h1>CHALLENGE YOUR BRAIN</h1>
			<br><br>
			<a href="Quizzies.jsp" class="btn btn-info">See Quizzes</a>
			<a href="Registration.jsp" class="btn btn-default">Sign Up</a>
		</div>
	</div>

	<div class="container recents">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1 recent-box">
				<h3>Recent Quizzes <span style="font-size:15px;"><a href="Quizzies.jsp?recent=true">See More ></a></span></h3>
				<div class="row" style="margin-left:0; margin-right: 0;">
					<% for(int i =0;i <3;i++) {%>
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="startingQuiz.jsp?id=<%=arr[i][3]%>">
								<img src="<%=arr[i][2]%>"  class="quiz-image img-responsive">
								<span class="quiz-desc"><%= arr[i][0]%></span>
							</a>
						</div>
					</div>
					<% }%>
				</div>
			</div>

			<div class="col-sm-10 col-sm-offset-1">
				<hr>
			</div>


			<div class="col-sm-10 col-sm-offset-1 recent-box trending">
				<h3>Trending Quizzes <span style="font-size:15px;"><a href="Quizzies.jsp?trending=true">See More ></a></span></h3>
				<div class="row" style="margin-left:0; margin-right: 0;">
					<% for(int i =0;i<3;i++) {%>
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="startingQuiz.jsp?id=<%=trendArr[i][0]%>">
								<img src="<%=trendArr[i][2]%>"  class="quiz-image img-responsive">
								<span class="quiz-desc"><%=trendArr[i][1]%></span>
							</a>
						</div>
					</div>
					<% }%>
				</div>

			</div>

		</div>

	</div>
</div>


<!-- Footer -->

<hr>
<jsp:include page="footer.jsp"/>