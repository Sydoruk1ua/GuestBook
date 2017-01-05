<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:forEach var="user" items="${userList}">
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
    <%--For displaying Previous link except for the 1st page --%>
    <c:if test="${requestScope.currentPage != 1}">
        <td><a href="view?page=${requestScope.currentPage - 1}">Previous</a></td>
    </c:if>

    <%--For displaying Page numbers.
    The when condition does not display a link for the current page--%>
    <table border="1" cellpadding="5" cellspacing="5">
        <tr>
            <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                <c:choose>
                    <c:when test="${requestScope.currentPage eq i}">
                        <td>${i}</td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="view?page=${i}">${i}</a></td>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tr>
    </table>

    <%--For displaying Next link --%>
    <c:if test="${requestScope.currentPage lt requestScope.noOfPages}">
        <td><a href="view?page=${requestScope.currentPage + 1}">Next</a></td>
    </c:if>
</div>
<br>
<p>
<a href="/">1</a>
<a href="view">2</a>
</p>

</body>

</html>
