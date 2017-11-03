<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Recovering_ID</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
			// Newly Added by STKim. 
			// The following code is for submitting the form data to server and redirect to another page. 
			$("#recovering_username_id").on('submit', function (e) {
				$.post('${pageContext.request.contextPath}/recoveringID', 
					{
						password : $("#passwd_id").val(),
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
		<h3>RecoveringID Page</h3>
		
		<jsp:include page="_menu_recoveringID.jsp"></jsp:include>
		
		This is where clients ask us to find their ID were forgotten. &amp; Jdbc.
		<br>
		<br>
		<b>We need to carry out such things.</b>
		<ul>
			<li>validating information were given by client to find their private information.</li>
			<li>User_information DB persistence</li>
			<li>Using Ajax to show results up in front of screen.</li>
		</ul>
	
<%-- 		<form method="POST" action="${pageContext.request.contextPath}/recoveringID class="loginForm"> --%>
<!-- 				<div class="input-group"> -->
				
<!-- 				</div> -->
<!-- 		</form> -->
		<b>=====================================================</b>
	
		<form id="recovering_username_id" method="POST">
         	<table border="0">
                <tr>
               		<td>Email_Address</td>
               		<td><input type="text" id = "emailaddress_id" name="emailAddress" value= "${user.emailAddress}" /> </td>
                </tr>
                
<!--                 seems like don't need that condition. -->
<!--                 <tr> -->
<!--                		<td>NickName</td> -->
<%--                		<td><input type="text" id = "nickname_id" name="nickName" value= "${user.nickName}" /> </td> --%>
<!--                 </tr> -->
            	<tr>
               		<td>Password</td>
               		<td><input type="password" id = "passwd_id" name="password" value= "${user.password}" /> </td>
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
					<td><strong><p style="color: red;">${errorString}</p></strong></td>
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
      			<td> discoverd_UserName is : <em><strong>${loginedUser.userName}</strong></em></td>
      		</tr>
      	</table>
      </form>
      
</body>
</html>