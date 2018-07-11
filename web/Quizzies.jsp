<jsp:include page="header.jsp">
    <jsp:param name="title" value="User Page"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<div class="container">
    <div class="search">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="input-group search-input-group">
                <input type="text" class="form-control" name="search" placeholder="Quiz Search" >
                <span class="input-group-addon">
                    <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
    </div>
</div>
<div class="container after-login">
    <div class="row ">
        <div class="col-sm-offset-2 col-sm-8 recent-box">
            <h3><div class="col-sm-6">Quizzes</div><div class="col-sm-6 text-right"><a href="addQuiz.jsp"><i class="glyphicon glyphicon-plus-sign"></i> Add Quiz</a></div> </h3>
            <div class="row recent-quiz">
                <div class="col-sm-4">
                    <img src="/store-images/back.jpg" class="img-responsive">
                </div>
                <div class="col-sm-8">
                    <h4>Quiz Title</h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                    <a href="#" class="btn btn-default">Read More</a> <a href="#" class="btn btn-default">Edit</a> <a href="#" class="btn btn-default">Delete</a>
                </div>
            </div>
            <div class="row recent-quiz">
                <div class="col-sm-4">
                    <img src="/store-images/back.jpg" class="img-responsive">
                </div>
                <div class="col-sm-8">
                    <h4>Quiz Title</h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                    <a href="#" class="btn btn-default">Read More</a> <a href="#" class="btn btn-default">Edit</a> <a href="#" class="btn btn-default">Delete</a>
                </div>
            </div>
            <div class="row recent-quiz">
                <div class="col-sm-4">
                    <img src="/store-images/back.jpg" class="img-responsive">
                </div>
                <div class="col-sm-8">
                    <h4>Quiz Title</h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been  the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                    <a href="#" class="btn btn-default">Read More</a> <a href="#" class="btn btn-default">Edit</a> <a href="#" class="btn btn-default">Delete</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
