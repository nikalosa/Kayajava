<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="User Page"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>

<%
    String str= (String) request.getSession().getAttribute("email");
    boolean logged= false;
    if(str != null) logged = true;

    /////////////////////////
    boolean trend = false;
    boolean recent = false;
    boolean search = false;
    ////////////////////////
    String trending = request.getParameter("trending");
    String recenting = request.getParameter("recent");
    String searchStr = request.getParameter("search");

    if(trending!= null && trending.equals("true")) {
        trend = true;
    }
    if(recenting!=null && recenting.equals("true")) {
        recent = true;
    }
    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    ResultSet set = null;
    if(searchStr!=null) {
        search = true;
        set = st.searchQuizzes(searchStr);
    }else {
        if (!trend && !recent) set = st.getQuiz("title");
        if (trend) set = st.getTrendingQuizzes();
        if (recent) set = st.getRecentQuizzes();
    }
%>


<!--Search part.-->
<div class="container">
    <div class="search">
        <div class="col-sm-6 col-sm-offset-3">
            <form action="" method="get">

                <div class="input-group search-input-group">
                    <input type="text" class="form-control" name="search" placeholder="Quiz Search" >
                    <span class="input-group-addon">
                        <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
<!--End of Search part.-->

<div class="container after-login">
    <div class="row ">
        <div class="col-sm-offset-2 col-sm-8 recent-box">

            <h3>
                <div class="col-sm-6">Quizzes</div>
                <%  if(logged){%>
                <div class="col-sm-6 text-right"><a href="addQuiz.jsp"><i class="glyphicon glyphicon-plus-sign"></i> Add Quiz</a></div>
                <% }%>
            </h3>
            <%while(set.next()) {%>
            <div class="row recent-quiz">
                <div class="col-sm-4">
                    <img src="/store-images/back.jpg" class="img-responsive">
                </div>
                <div class="col-sm-8">
                    <h4><%=set.getString(2)%></h4>
                    <p><%=set.getString(3)%></p>
                    <a href="startingQuiz.jsp?id=<%=set.getString(1)%>" class="btn btn-default">Read More</a>
                    <%if(logged) {%>
                    <a href="#" class="btn btn-default">Edit</a>
                    <a href="#" class="btn btn-default">Delete</a>
                    <% }%>
                    <br>
                    <br>
                </div>
            </div>
            <% }%>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
