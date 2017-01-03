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

        .right {
            float: right;
            width: 250px;
        }

        .buttonForAdd {
            padding: 12px 23px;
            border-radius: 3px;
            border: 2px solid #dcddde;
            border-bottom-color: #c9cacb;
            background: #f5f6f7;
            background: -moz-linear-gradient(top, #fcfdfe 0%, #f5f6f7 100%);
            background: -webkit-linear-gradient(top, #fcfdfe 0%, #f5f6f7 100%);
            background: -o-linear-gradient(top, #fcfdfe 0%, #f5f6f7 100%);
            box-shadow: inset 0 0 0 1px #fff;
            text-shadow: 0 1px 0 #fff;
            border-color: #68a8f7;

        }

        .bottom {
            position: fixed;
            bottom: 0;
        }
        .button {
            padding: 4px 23px;
            border-radius: 3px;
            border: 1px solid #dcddde;
            border-bottom-color: #c9cacb;
            background: #f5f6f7;
            background: -moz-linear-gradient(top, #fcfdfe 0%, #f5f6f7 100%);
            background: -webkit-linear-gradient(top, #fcfdfe 0%, #f5f6f7 100%);
            background: -o-linear-gradient(top, #fcfdfe 0%, #f5f6f7 100%);
            box-shadow: inset 0 0 0 1px #fff;
            text-shadow: 0 1px 0 #fff;
        }

        .sizePage {
            font-size: 19pt;
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
            <th width="200px">Region</th>
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
