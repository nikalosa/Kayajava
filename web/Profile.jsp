<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>

<!-- Finish -->

<%
    boolean bol = true;

    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    String mail = null;
    mail = request.getParameter("mail");
    if(mail == null) {
        bol= false;
        mail = (String) request.getSession().getAttribute("email");
        if(st.checkFriend(request.getParameter("mail"),mail)) {
            bol = false;
        }
    }else {
        System.out.println("adsdsadsa");
        String str = (String) request.getSession().getAttribute("email");;
        if(st.checkFriend(str,mail)) bol = false;
    }

    ///friendebi ra.
    ArrayList<String> friendArr = st.getFriends(mail);

    //////History

    ////sets amovigeb resultis ra

    /////my created quizes.
    ///////chemi qvizebis result ra.
%>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Profile"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>

<div class="container">
    <div class="row achievements">
        <h2>Welcome to <%= mail%> Profile</h2>
        <% if(bol){%>
        <div class="alert alert-info">
            <span style="line-height:34px;">Add <%=mail %> as your friend and challenge each other.</span>
            <a href="sendRequest.jsp?mail=<%=mail%>" class="btn btn-info" style="float:right">Add Friend</a>
        </div>
        <%}%>
        <div class="container">
            <div class="search">
                <div class="col-sm-6 col-sm-offset-3">
                    <form action="users.jsp" method="get">
                        <div class="input-group search-input-group">
                            <input type="text" class="form-control" name="search" placeholder="Search friend" >
                            <span class="input-group-addon">
                                <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <br><br>
        <div class="col-md-8">
            <h3>Recent History <span style="font-size:15px;"><a href="history.jsp">See More ></a></span></h3>
            <div class="history">
                <%     ResultSet historySet = st.getHistory(mail);
                    while(historySet.next()){%>
                <p>    <%=historySet.getString(2)%>  </p>
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
            <p><a href="Profile.jsp?mail=<%=friendArr.get(i)%>"> <%=friendArr.get(i)%></a></p>
            <% }%>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>