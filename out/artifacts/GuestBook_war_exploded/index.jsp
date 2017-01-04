<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Guest Book</title>
    <style type="text/css">
        div {
            border: 2px;
        }

        .bottom {
            position: fixed;
            bottom: 0;
        }

    </style>
</head>
<body>

<form action="process.jsp" method="post" >
    First Name:<br>
    <input type="text" name="firstName" required/><br/>
    Last Name:<br>
    <input type="text" name="lastName" required/><br/>
    Birthday:<br>
    <input type="date" name="birthday" required/><br/>
    Phone number:<br>
    <input type="tel" pattern='[\(]\d{3}[\)]\d{3}[\-]\d{4}' value="(***)***-****" name="phoneNumber" required/><br/>
    Email:<br>
    <input type="email" name="email" required/><br/>
    Country:<br>
    <input type="text" name="country" required/><br/>
    Region:<br>
    <input type="text" name="region" required/><br/>
    <input type="submit"/>
    <input type="reset">
</form>

<div class="bottom" align="center">
    <a href="index.jsp">1</a>
    <a href="viewAllUsers.jsp">2</a>
</div>

</body>
</html>
