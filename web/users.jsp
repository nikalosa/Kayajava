<%@ page import="java.sql.ResultSet" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Search through users"/>
    <jsp:param name="login" value="logged"/>
</jsp:include>
<%
    String mail = (String) request.getSession().getAttribute("email");
    if(mail == null) response.sendRedirect("index.jsp");

    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    String keyword = request.getParameter("search");
    ArrayList<String> set = st.searchFriends(keyword);

%>

<!-- Finish -->
<div class="container search-users">
    <div class="row">
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
        <div class="col-md-8 col-md-offset-2">
            <h2>Search users: BeqaKD</h2>
            <br>

            <br>
            <ul>
                <%for(int i=0; i< set.size();i++){
                    if(!set.get(i).equals(mail)){
                        System.out.println(set.get(i)+"SAdsadsadsa");
                %>
                    <li><a href="Profile.jsp?mail=<%=set.get(i)%>"><%=set.get(i)%></a> <a href="" class="btn btn-default" style="float:right">Add Friend</a> </li>
                    <hr>
                <%}
                }%>
            </ul>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>