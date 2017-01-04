<%@ page import="ua.in.sydoruk.model.User" %>
<%@ page import="java.sql.Date" %>
<%@ page import="ua.in.sydoruk.model.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    User user = new User();
    user.setFirstName(request.getParameter("firstName"));
    user.setLastName(request.getParameter("lastName"));
    user.setBirthday(Date.valueOf(request.getParameter("birthday")));
    user.setPhoneNumber(request.getParameter("phoneNumber"));
    user.setEmail(request.getParameter("email"));
    user.setCountry(request.getParameter("country"));
    user.setRegion(request.getParameter("region"));

    try {
        UserDAO.addUser(user);
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("Great!!! You have " + e.getMessage());
    }

%>
<html>
<head>
    <title>Guest Book</title>
</head>
<body>
<jsp:forward page="viewAllUsers.jsp"></jsp:forward>
</body>
</html>
