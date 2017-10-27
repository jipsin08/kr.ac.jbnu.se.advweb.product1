<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Recovering_PW</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			// Newly Added by STKim. 
			// The following code is for submitting the form data to server and redirect to another page. 
			$("#recovering_pw_id").on('submit', function (e) {
				$.post('${pageContext.request.contextPath}/recoveringPW', 
					{
						userName : $("#name_id").val(),
						gender : $("#gender_id").val()
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
	<h3>RecoveringPW Page</h3>
	
	<p style="color: red;">${errorString}</p>
	
	<jsp:include page="_menu_recoveringPW.jsp"></jsp:include>

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
              	 <td>User Name</td>
              	 <td><input type="text" id = "name_id" name="userName" value= "${user.userName}" /> </td>
                </tr>
                <tr>
               		<td>Gender</td>
               		<td><input type="text" id = "gender_id" name="gender" value= "${user.gender}" /> </td>
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

</body>
</html>