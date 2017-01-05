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

</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:if test="${noOfPages > 1}">
    <div>
        <table>
            <tr >

                <td><a href="view?page=${1}">First</a></td>
                <td><a href="view?page=${currentPage - 1}">${prev}</a></td>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <td><a href="view?page=${i}">${i}</a></td>
                </c:forEach>
             <%--   <c:forEach var="i" begin="${startPage}" end="${currentPage}">
                    <td><a href="view?page=${i}">${i}</a></td>
                </c:forEach>

              &lt;%&ndash;  <td>${currentPage+1}</td>&ndash;%&gt;

                <c:forEach var="i" begin="${currentPage+2}" end="${endPage}">
                    <td><a href="view?page=${i}">${i}</a></td>
                </c:forEach>--%>
                <td><a href="view?page=${currentPage + 1}">${next}</a></td>
                <td><a href="view?page=${noOfPages}">Last</a></td>

            </tr>

        </table>
    </div>
</c:if>
<br>
<p>
<a href="/">1</a>
<a href="view">2</a>
</p>

</body>

</html>
