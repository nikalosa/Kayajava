<jsp:include page="header.jsp">
	<jsp:param name="title" value="Quiz Website"/>
</jsp:include>

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
				<h3>Recent Quizzes <span style="font-size:15px;"><a href="Quizzies.jsp">See More ></a></span></h3>
				<div class="row" style="margin-left:0; margin-right: 0;">
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="#">
								<img src="//placeimg.com/400/400/animals"  class="quiz-image img-responsive">
								<span class="quiz-desc">Quiz Title</span>
							</a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="#">
								<img src="//placeimg.com/400/400/animals"  class="quiz-image img-responsive">
								<span class="quiz-desc">Quiz Title</span>
							</a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="#">
								<img src="//placeimg.com/400/400/animals"  class="quiz-image img-responsive">
								<span class="quiz-desc">Quiz Title</span>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-10 col-sm-offset-1">
				<hr>
			</div>


			<div class="col-sm-10 col-sm-offset-1 recent-box trending">
				<h3>Trending Quizzes <span style="font-size:15px;"><a href="Quizzies.jsp">See More ></a></span></h3>
				<div class="row" style="margin-left:0; margin-right: 0;">
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="#">
								<img src="//placeimg.com/400/400/animals"  class="quiz-image img-responsive">
								<span class="quiz-desc">Quiz Title</span>
							</a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="#">
								<img src="//placeimg.com/400/400/animals"  class="quiz-image img-responsive">
								<span class="quiz-desc">Quiz Title</span>
							</a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="main-quizzes">
							<a href="#">
								<img src="//placeimg.com/400/400/animals"  class="quiz-image img-responsive">
								<span class="quiz-desc">Quiz Title</span>
							</a>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
</div>


<!-- Footer -->

<div class="col-md-12 col-sm12 col-xs-12" > <hr></div>
<jsp:include page="footer.jsp"/>