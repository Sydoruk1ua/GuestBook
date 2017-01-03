<%@ page import="ua.in.sydoruk.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="obj" class="ua.in.sydoruk.User"/>

<jsp:setProperty property="*" name="obj"/>

<%
    try {

        UserDAO.addUser(obj);
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("Great!!! You have " + e.getMessage());
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
</body>
</html>
