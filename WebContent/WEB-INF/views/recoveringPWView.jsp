<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 	<title>비밀번호 찾기</title>
	 	<link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
	 	
	 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// Newly Added by STKim. 
				// The following code is for submitting the form data to server and redirect to another page. 
				$("#recovering_pw_id").on('submit', function (e) {
					$.post('${pageContext.request.contextPath}/recoveringPW', 
						{
							userName : $("#name_id").val(),
							gender : $("#gender_id").val(),
							answer : $("#answer_id").val(),
							emailAddress : $("#emailaddress_id").val()
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
		
			<h3>RecoveringPW Page</h3>
		
			<p style="color: red;">${errorString}</p>
		
			This is where clients ask us to find their PW were forgotten. &amp; Jdbc.
			<br>
			<br>
			<b>We need to carry out such things.</b>
			<ul>
				<li>validating information were given by client to find their private information.</li>
				<li>User_information DB persistence</li>
				<li>Using Ajax to show results up in front of screen.</li>
			</ul>
		
			<%-- 	<form method="POST" action="${pageContext.request.contextPath}/recoveringPW class="loginForm"> --%>
			<!-- 			<div class="input-group"> -->
			
			<!-- 			</div> -->
			<!-- 	</form> -->
	
			<b>=====================================================</b>
			<form id="recovering_pw_id" method="POST">
		         	<table border="0">
		         		<tr>
		              	 	<td>Email Address</td>
		              	 	<td><input type="text" id = "emailaddress_id" name="emailAddress" value= "${user.emailAddress}" autofocus /> </td>
		                </tr>
		            	<tr>
		              	 	<td>User Name</td>
		              	 	<td><input type="text" id = "name_id" name="userName" value= "${user.userName}" /> </td>
		                </tr>
		                <tr>
		               		<td>Gender</td>
		               		<td><input type="text" id = "gender_id" name="gender" value= "${user.gender}" /> </td>
		                </tr>
		                <tr>
							<td>[ hint question is ]<em>What's your favorite Football Club in the world?</em></td>
						</tr>
		                <tr>
		               		<td>Answer</td>
		               		<td><input type="text" id = "answer_id" name="answer" value= "${user.answer}" /> </td>
		                </tr>
		                <tr>
							<td colspan="1"><input type="submit" value="확인"/></td>
						</tr>
		            	<tr>
		               		<td colspan ="2">
		                  	<a href="${pageContext.request.contextPath}/logout">Cancel</a>
		               		</td>
		            	</tr>
		
		         </table>
		     </form>
	      
		    <b>=====================================================</b>
		      <form id="recovered_username_id" method="GET">
		      	<table border="0">
		      		<tr>
		      			<td> discoverd_PassWord is : <em><strong>${loginedUser.password}</strong></em></td>
		      		</tr>
		      	</table>
		      </form>
			<jsp:include page="_footer.jsp"></jsp:include>
	</body>
</html>