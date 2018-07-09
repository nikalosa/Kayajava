<jsp:include page="header.jsp">
	<jsp:param name="title" value="User Page"/>
	<jsp:param name="login" value="logged"/>
</jsp:include>
<!-- Finish -->
<%@ page import="functionalPack.User" %>
<div id="myCarousel" class="carousel slide" data-ride="carousel">

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<div class="item active">
			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>
		</div>

		<div class="item">
			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>
		</div>

		<div class="item">
			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>

			<div class="col-xs-5 col-md-3">
				<a href="#" class="thumbnail">
					<img src="/store-images/back.jpg" alt="...">
				</a>
			</div>
		</div>
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
			 <div class="row recent-quiz">
				 <div class="col-sm-4">
					 <img src="/store-images/back.jpg" class="img-responsive">
				 </div>
				 <div class="col-sm-8">
					 <h4>Quiz Title</h4>
					 <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					 <a href="#" class="btn btn-default">Read More</a>
				 </div>
			 </div>
			 <div class="row recent-quiz">
				 <div class="col-sm-4">
					 <img src="/store-images/back.jpg" class="img-responsive">
				 </div>
				 <div class="col-sm-8">
					 <h4>Quiz Title</h4>
					 <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					 <a href="#" class="btn btn-default">Read More</a>
				 </div>
			 </div>
			 <div class="row recent-quiz">
				 <div class="col-sm-4">
					 <img src="/store-images/back.jpg" class="img-responsive">
				 </div>
				 <div class="col-sm-8">
					 <h4>Quiz Title</h4>
					 <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
					 <a href="#" class="btn btn-default">Read More</a>
				 </div>
			 </div>
		 </div>
		<div class="col-sm-3 col-sm-offset-1 trending-box">
			<h3>Trending Quizies</h3>
			<div class="trending-container">
				<a href="#"><i class="glyphicon glyphicon-fire"></i> Trending 1</a>
				<a href="#"><i class="glyphicon glyphicon-fire"></i> Trending 2</a>
				<a href="#"><i class="glyphicon glyphicon-fire"></i> Trending 3</a>
				<a href="#"><i class="glyphicon glyphicon-fire"></i> Trending 4</a>
				<a href="#"><i class="glyphicon glyphicon-fire"></i> Trending 5</a>
			</div>
			<br/><br/>
			<h3>Recently Taken Quizies</h3>
			<div class="trending-container">
				<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Recent 1</a>
				<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Recent 2</a>
				<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Recent 3</a>
				<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Recent 4</a>
				<a href="#"><i class="glyphicon glyphicon-chevron-right"></i> Recent 5</a>
			</div>
		</div>
	</div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>