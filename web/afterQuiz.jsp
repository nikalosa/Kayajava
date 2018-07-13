<jsp:include page="header.jsp">
    <jsp:param name="title" value='<%=title%>'/>
</jsp:include>
<h1> <%=request.getAttribute("score")%> </h1>
</body>
</html>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.StatementManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("name"));
    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
    String title = st.getQuizInformation(id, "title");
    String description = st.getQuizInformation(id, "description");
    String image = st.getQuizInformation(id, "picture");
    String creator = st.getQuizInformation(id, "creator");
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
                            <input type="hidden" name="name" value ="<%=title%>">
                            <button class="btn btn-primary btn-block" type ="submit" name="action" value="StartQuiz"> Start Quiz</button>
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
                                <tr>
                                    <td>1</td>
                                    <td><a href="Profile.jsp?id=1">NutsaNutsa</a></td>
                                    <td>9/10</td>
                                    <td>09:10</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="Profile.jsp?id=1">beqaKD</a></td>
                                    <td>8/10</td>
                                    <td>09:00</td>
                                </tr>
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