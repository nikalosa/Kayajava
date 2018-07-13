<jsp:include page="header.jsp">
    <jsp:param name="title" value="Search through users"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<!-- Finish -->
<div class="container search-users">
    <div class="row">
        <div class="search">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="input-group search-input-group">
                    <input type="text" class="form-control" name="search" placeholder="Search friend" >
                    <span class="input-group-addon">
                            <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2">
            <h2>Search users: BeqaKD</h2>
            <br>

            <br>
            <ul>
                <li><a href="">BeqaKD_34@mail.ru</a> <a href="" class="btn btn-default" style="float:right">Add Friend</a> </li>
                <hr>
                <li><a href="">losa123@aiaia.com</a> <a href="" class="btn btn-default" style="float:right">Add Friend</a></li>
                <hr>
                <li><a href="">admin@kayajava.com</a> <a href="" class="btn btn-default" style="float:right">Add Friend</a></li>
                <hr>
                <li><a href="">mnazg16@freeuni.edu.ge</a> <a href="" class="btn btn-default" style="float:right">Add Friend</a></li>
                <hr>
            </ul>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>