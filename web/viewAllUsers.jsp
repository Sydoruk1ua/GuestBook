<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ua.in.sydoruk.User" %>
<%@ page import="ua.in.sydoruk.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Guest Book</title>
    <style type="text/css">
        div {
            border: 2px;
        }
        .left {
            position: absolute;
            float: left;
            width: 1000px;
            left: 50px;
        }

        .bottom {
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body>
<div class="left" align="center">
    <table border="1px" cellpadding="0" cellspacing="0">
        <%
            List<User> users = null;
            try {
                users = UserDAO.getAllUsers();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            pageContext.setAttribute("users", users);
        %>
        <thead>
        <tr>
            <th width="100px">Firs Name</th>
            <th width="100px">Last Name</th>
            <th width="150px">Birthday</th>
            <th width="180px">Phone number</th>
            <th width="300px">Email</th>
            <th width="200px">Country</th>
            <th width="200px">City (region)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${pageScope.users}">
            <tr>
                <td align="center"><c:out value="${user.firstName}"></c:out></td>
                <td align="center"><c:out value="${user.lastName}"></c:out></td>
                <td align="center"><c:out value="${user.birthday}"></c:out></td>
                <td align="center"><c:out value="${user.phoneNumber}"></c:out></td>
                <td align="center"><c:out value="${user.email}"></c:out></td>
                <td align="center"><c:out value="${user.country}"></c:out></td>
                <td align="center"><c:out value="${user.region}"></c:out></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="bottom" align="center">
<a href="index.jsp">1</a>
<a href="viewAllUsers.jsp">2</a>
</div>

</body>

</html>
