<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Login</title>
      
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		// Newly Added by STKim. 
		// The following code is for submitting the form data to server and redirect to another page. 
		$("#login_form_id").on('submit', function (e) {
			$.post('${pageContext.request.contextPath}/login', 
				{
					userName : $("#name_id").val(),
					password : $("#passwd_id").val(),
					rememberMe: $("#rememberMe_id").val()
				},function(data) 
					{
						// move another page
						var win = window.open();
 						win.document.write(data);
					}
			);
		});
	})
	</script>
	
	
   </head>
   <body>
      <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
 
      <h3>Login Page</h3>
      <p style="color: red;">${errorString}</p>
 
	<!--  new code --> 
	<form id="login_form_id" method="POST">
         <table border="0">
            <tr>
               <td>User Name</td>
               <td><input type="text" id = "name_id" name="userName" value= "${user.userName}" /> </td>
            </tr>
            <tr>
               <td>Password</td>
               <td><input type="text" id = "passwd_id" name="password" value= "${user.password}" /> </td>
            </tr>
            <tr>
               <td>Remember me</td>
               <td><input type="checkbox" id = "rememberMe_id" name="rememberMe" value= "Y" /> </td>
            </tr>
            <tr>
               <td colspan ="2">
                  <a href="${pageContext.request.contextPath}/home">Cancel</a>
               </td>
            </tr>
            <tr>
				<td colspan="1"><input type="submit" value="로그인"/></td>
			</tr>
         </table>
      </form>
      <a href="${pageContext.request.contextPath}/recoveringID">아이디 찾기</a>
      <a href="${pageContext.request.contextPath}/recoveringPW">비밀번호 찾기</a>                 
      <a href="${pageContext.request.contextPath}/registration">회원가입</a>

      <p style="color:blue;">User Name: tom, password: tom001 or jerry/jerry001</p>
 
      <jsp:include page="_footer.jsp"></jsp:include>
   </body>
</html>