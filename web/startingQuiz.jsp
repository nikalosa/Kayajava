<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="functionalPack.Quiz" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    String title = st.getQuizInformation(id, "title");
    String description = st.getQuizInformation(id, "description");
    String image = st.getQuizInformation(id, "picture");
    String creator = st.getQuizInformation(id, "creatorMail");

    ///////////////////////////////
    ResultSet doneQuizset = null;
    ////set = top10scorer usin done quiz
    doneQuizset = st.getTopResults(title);


    ///////////////////////////////
    String str= (String) request.getSession().getAttribute("email");
    boolean logged= false;
    if(str != null) logged = true;
    //////////////////////////////
%>
<jsp:include page="header.jsp">
    <jsp:param name="title" value='<%=title%>'/>
</jsp:include>
<div class="container-fluid quiz-background" style="background-image:url('<%=image%>');">
    <div class="quiz-container">
        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                        <h1><%=title%></h1>
                        <p>created by <a href="Profile.jsp?email=<%=creator%>"><%=creator%></a></p>
                        <div class="desc">
                            <p><%=description%></p>
                        </div>
                        <form action="startQuizServlet" method="post" >
                            <input type="hidden" name="title" value ="<%=title%>">
                            <% if(logged){%>
                            <button class="btn btn-primary btn-block" type ="submit" name="action" value="StartQuiz"> Start Quiz</button>
                            <% }else {%>
                            <a class="btn btn-primary btn-block" href="Registration.jsp"> Register</a>
                            <% }%>
                        </form>
                        <div class="top-scorers">
                            <h3>Top 10 Scorers</h3>
                            <table class="table table-responsive">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>E-Mail</th>
                                    <th>Score</th>
                                    <th>Time</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%  while(doneQuizset.next()) {
                                    int index = 1;
                                %>
                                <tr>
                                    <td><%=index%></td>
                                    <td><a href="Profile.jsp?mail=<%=doneQuizset.getString(1)%>"><%=doneQuizset.getString(1)%></a></td>

                                    <td><%=doneQuizset.getString(3)%>/</td>
                                    <td><%=doneQuizset.getString(4)%></td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"/>