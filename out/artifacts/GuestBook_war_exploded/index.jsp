<%@ page import="ua.in.sydoruk.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>


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

  <form action="process.jsp" method="post">
      First Name:<br>
      <input type="text" name="firstName" /><br/>
      Last Name:<br>
      <input type="text" name="lastName" /><br/>
      Birthday:<br>
      <input type="date" name="birthday"  /><br/>
      Phone number:<br>
      <input type="text" name="phoneNumber" /><br/>
      Email:<br>
      <input type="text" name="email" /><br/>
      Country:<br>
      <input type="text" name="country" /><br/>
      Region:<br>
      <input type="text" name="region" /><br/>
      <input type="submit" value="register"/>
  </form>

  <div class="bottom" align="center">
      <a href="index.jsp">1</a>
      <a href="viewAllUsers.jsp">2</a>
  </div>

  </body>
</html>
