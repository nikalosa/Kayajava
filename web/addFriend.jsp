<%@ page import="java.sql.Connection" %>
<%@ page import="functionalPack.AccountManager" %>
<%@ page import="functionalPack.StatementManager" %>


<%
    String result = request.getParameter("result");
    String mail = request.getParameter("mail");
    String firstmail = (String)request.getSession().getAttribute("email");
    Connection con = AccountManager.getConnection();
    StatementManager st = new StatementManager(con);

    if(result.equals("accept")) {
        st.addFriend(firstmail,mail);
        st.removeNotifications(firstmail,mail);

        String command = "<a href='Profile.jsp?mail="+firstmail+"'>"+firstmail  +"</a>"
                + " added " + "<a href='Profile.jsp?mail="+mail+"'>" + mail + "</a> as friend";
        String command1 = "<a href='Profile.jsp?mail="+mail+"'>"+mail+"</a>"
                + " added " + "<a href='Profile.jsp?mail="+firstmail+"'>" + firstmail+ "</a> as friend";

        String str1 = "";

        st.addToHistory(firstmail,command);
        st.addToHistory(mail,command1);
        response.sendRedirect("Profile.jsp");
    }else {
        st.removeNotifications(firstmail,mail);
        response.sendRedirect("Profile.jsp");
    }


%>