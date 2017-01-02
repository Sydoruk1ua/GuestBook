<%--
  Created by IntelliJ IDEA.
  User: Oleksandr
  Date: 31.12.2016
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  $END$
  <form id="frm">
    <table>
      <tr>
        <td>
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr style="text-align: center;">
              <td>방명록 작성</td>
          </table>
          <table>
            <tr height="1" bgcolor="#dddddd">
              <td colspan="4"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td align="center"><b>이메일</b></td>
              <td><input type="text" name="EMAIL" id="EMAIL" size="50"
                         maxlength="50"></td>
              <td>&nbsp;</td>
            </tr>
            <tr height="1" bgcolor="#dddddd">
              <td colspan="4"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td align="center"><b>비밀번호</b></td>
              <td><input type="password" name="PWD" id="PWD" size="50"
                         maxlength="50"></td>
              <td>&nbsp;</td>
            </tr>
            <tr height="1" bgcolor="#dddddd">
              <td colspan="4"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td align="center"><b>내용</b></td>
              <td><textarea name="CONTENTS" id="CONTENTS" cols="50"
                            rows="13"></textarea></td>
              <td>&nbsp;</td>
            </tr>
            <tr height="1" bgcolor="#dddddd">
              <td colspan="4"></td>
            </tr>
            <tr height="1" bgcolor="#82B5DF">
              <td colspan="4"></td>
            </tr>
            <tr align="center">
              <td>&nbsp;</td>
              <td colspan="2"><input type="button" value="등록" id="write">
                <input type="button" value="취소" id="cancel"></td>
              <td>&nbsp;</td>
            </tr>
          </table>

        </td>
      </tr>
    </table>
  </form>

  <form id="commonForm" name="commonForm"></form>

  <script type="text/javascript">
      $(document).ready(function() {
          $("#cancel").click(function() {
              bn_cancelRegister();
          });
          $("#write").on("click", function() {
              bn_registerGuestbook();
          });
      });
      function bn_cancelRegister() {
          var comSubmit = new ComSubmit();
          comSubmit.setUrl("/guestbook/guestbookList");
          comSubmit.submit();
      }
      function bn_registerGuestbook() {
          var comSubmit = new ComSubmit("frm");
          comSubmit.setUrl("/guestbook/guestbookAdd");
          comSubmit.submit();
      }
      function gfn_isNull(str) {
          if (str == null)
              return true;
          if (str == "Nan")
              return true;
          var chkStr = new String(str);
          if (chkStr.valueOf() == "undefined")
              return true;
          if (chkStr == null)
              return true;
          if (chkStr.toString.length() == 0)
              return true;
          return false;
      }
      function ComSubmit(opt_formId) {
          this.formId = gfn_isNull(opt_formId) == true ? "commonForm"
              : opt_formId;
          this.url = "";
          if (this.formId == "commonForm") {
              $("#commonForm")[0].reset();
          }
          this.setUrl = function setUrl(url) {
              this.url = url;
          }
          this.addParam = function addParam(key, value) {
              $("#" + this.formId)
                  .append(
                      $("<input type='hidden' name='"+key+"'id='"+key+"' value='"+value+"' >"));
          }
          this.submit = function submit() {
              var frm = $("#" + this.formId)[0];
              frm.action = this.url;
              frm.method = "post";
              frm.submit();
          }
      }
  </script>

  </body>
</html>
