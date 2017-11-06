<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Login</title>
      <link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
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
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="<c:url value="/js/validation.js" />"></script>   
   
         <jsp:include page="_header.jsp"></jsp:include>
		 <div id="login_row">
		      <h3 id="login_title">Login Page</h3>
		      <p style="color: red;">${errorString}</p>
		      
		      
			<!--  new code --> 
			<form id="login_form_id" method="POST">
		         <table border="0">
		            <tr>
		               <td>User Name</td>
		               <td><input type="text" id = "name_id" name="userName" class="form-control" value= "${user.userName}" /> </td>
		            </tr>
		            <tr>
		               <td>Password</td>
		               <td><input type="password" id = "passwd_id" name="password" class="form-control" value= "${user.password}" /> </td>
		            </tr>
<!-- 		            <tr> -->
<!-- 		               <td>Remember me</td> -->
<!-- 		               <td><input type="checkbox" id = "rememberMe_id" name="rememberMe" value= "Y" /> </td> -->
<!-- 		            </tr> -->
		            <tr>
						<td colspan="4"><input type="submit" class="form-control" value="로그인"/></td>
					</tr>
		         </table>
		      </form>
		      	<div class="panel-footer">
				 	Don't have an account! <a href="${pageContext.request.contextPath}/registration"> Sign Up Here </a><br>
				</div>
				<div style="">
					<a href="${pageContext.request.contextPath}/recoveringID">아이디 찾기</a>
					<a href="${pageContext.request.contextPath}/recoveringPW">비밀번호 찾기</a>
				</div>
		   </div>
	      <div class="container">
	      	<div class="row">
				<div class="col-md-4">
					<div class="aro-pswd_info">
						<div id="pswd_info">
							<h4>Password must satisfy such Condition.</h4>
								<ul>
									<li id="letter" class="invalid">At least <strong>one letter</strong></li>
									<li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
									<li id="number" class="invalid">At least <strong>one number</strong></li>
									<li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
									<li id="space" class="invalid">be<strong> use [~,!,@,#,$,%,^,&,*,-,=,.,;,']</strong></li>
								</ul>
						</div>
					</div>
				</div>
			</div>
		  </div>	
<%--       <jsp:include page="_footer.jsp"></jsp:include> --%>
   </body>
</html>