<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="functionalPack.StatementManager" %>


<%
    String str = (String) request.getSession().getAttribute("email");
    String friendStr = request.getParameter("mail");
    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);
//    st.addFriend(str,friendStr);

    String command = "<p><a href=\"# \"> " +str + "</a> wants to be your friend </p>" +
    " <div class=\"addreject\"> " +" <a href=\"addFriend.jsp?mail=" +friendStr +"&result=accept\" class=\"btn btn-info\">Add Friend</a>" +
            " <a href=\"addFriend.jsp?mail=\" +friendStr +\"&result=reject\"" +
            " class=\"btn btn-danger\">Decline</a>\n" +
            "    </div>\n" +
            "    <hr>";
    st.addNotification(friendStr,str,command);

    response.sendRedirect("AfterLogIn.jsp");
%>