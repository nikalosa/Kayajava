<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mail = (String) request.getSession().getAttribute("email");
    if(mail == null) response.sendRedirect("index.jsp");
    int id = (int) request.getAttribute("ID");
    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    String title = st.getQuizInformation(id, "title");
    String description = st.getQuizInformation(id, "description");
    String image = st.getQuizInformation(id, "picture");
    String creator = st.getQuizInformation(id, "creatorMail");

    ResultSet doneQuizset = null;
    ////set = top10scorer usin done quiz
    doneQuizset = st.getTopResults(title);
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
                        <h3>Quiz Done!</h3>
                        <h4>You are <%=request.getAttribute("place")%> in top scorers.</h4>
                        <h4>Score :<%=request.getAttribute("score")%> Time: <%=request.getAttribute("time")%></h4>
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