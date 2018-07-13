<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="NutsaNutsa - Profile"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<!-- Finish -->

<%
    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    String mail = (String) request.getSession().getAttribute("email");
    ///friendebi ra.
    ArrayList<String> friendArr = st.getFriends(mail);

    //////History

    ////sets amovigeb resultis ra

    /////my created quizes.
    ///////chemi qvizebis result ra.
%>

<div class="container">
    <div class="row achievements">
        <h2>Welcome to NutsaNutsa Profile</h2>
        <div class="alert alert-info">
            <span style="line-height:34px;">Add NutsaNutsa as your friend and challenge each other.</span>
            <a href="#" class="btn btn-info" style="float:right">Add Friend</a>
        </div>
        <div class="container">
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
        </div>
        <br><br>
        <div class="col-md-8">
            <h3>Recent History <span style="font-size:15px;"><a href="history.jsp">See More ></a></span></h3>
            <div class="history">
                <%     ResultSet historySet = st.getHistory(mail);
                    while(historySet.next()){%>
                <p> <%= historySet.getString(1) %>     <%=historySet.getString(2)%>  </p>
                <% }%>
            </div>
            <hr>

            <h3>My Created Quizzies</h3>
            <div class="history">
                <%
                    ResultSet myQuizSet = st.getMyQuizzes(mail);
                    while(myQuizSet.next()){%>
                <p><a href="startingQuiz.jsp?id=<%=myQuizSet.getString(1)%>"> <%=myQuizSet.getString(2)%></a></p>
                <%}%>
            </div>
        </div>


        <div class="col-md-4">
            <h3>My Achievements</h3>
            <p><a href="#" data-toggle="tooltip" title="The user created a quiz">Amateur Author</a></p>
            <p><a href="#" data-toggle="tooltip" title="The user created five quizzes">Prolific Author</a></p>
            <hr>
            <h3>Friend List</h3>
            <% for(int i =0; i < friendArr.size();i++) {%>
            <p><a href="Profile.jsp?email = <%=friendArr.get(i)%>"> <%=friendArr.get(i)%></a></p>
            <% }%>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>