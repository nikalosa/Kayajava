<jsp:include page="header.jsp">
    <jsp:param name="title" value="NutsaNutsa - Profile"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<!-- Finish -->

<div class="container">
    <div class="row achievements">
        <h2>Welcome to NutsaNutsa Profile</h2>
        <div class="alert alert-info">
            <span style="line-height:34px;">Add NutsaNutsa as your friend and challenge each other.</span>
            <a href="#" class="btn btn-info" style="float:right">Add Friend</a>
        </div>
        <div class="col-md-8">
            <h3>Recent History <span style="font-size:15px;"><a href="#">See More ></a></span></h3>
            <div class="history">
                <p><a href="#">NutsaNutsa</a> added <a href="#">BeqaKD</a> as friend. <em>(12 Jun 2018)</em></p>
                <p><a href="#">NutsaNutsa</a> achieved Amateur Author <em>(12 Jun 2018)</em></p>
                <p><a href="#">NutsaNutsa</a> completed <a href="#">What kind of human are you?</a> quiz. <em>(12 Jun 2018)</em></p>
                <p><a href="#">NutsaNutsa</a> created quiz <a href="#">What kind of beqa are you?</a> <em>(12 Jun 2018)</em></p>
            </div>
            <hr>
            <h3>My Created Quizzies</h3>
            <div class="history">
                <p><a href="#">What kind of beqa are you?</a><em>(12 Jun 2018)</em></p>
                <p><a href="#">What kind of human are you?</a><em>(12 Jun 2018)</em></p>
            </div>
        </div>
        <div class="col-md-4">
            <h3>My Achievements</h3>
            <p><a href="#" data-toggle="tooltip" title="The user created a quiz">Amateur Author</a></p>
            <p><a href="#" data-toggle="tooltip" title="The user created five quizzes">Prolific Author</a></p>
            <hr>
            <h3>Friend List</h3>
            <p><a href="#">bnMikheili</a></p>
            <p><a href="#">BekaKD</a></p>
            <p><a href="#">nikalosa</a></p>
            <p><a href="#">KayaJava</a></p>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>