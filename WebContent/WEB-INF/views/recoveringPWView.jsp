<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recovering_PW</title>
</head>

<body>
	<h3>RecoveringPW Page</h3>

	This is where clients ask us to find their PW were forgotten. &amp; Jdbc.
	<br>
	<br>
	<b>We need to carry out such things.</b>
	<ul>
		<li>validating information were given by client to find their private information.</li>
		<li>User_information DB persistence</li>
		<li>Using Ajax to show results up in front of screen.</li>
	</ul>
	
	<form method="POST" action="${pageContext.request.contextPath}/recoveringPW class="loginForm">
			<div class="input-group">
				<a href="${pageContext.request.contextPath}/">Back to Home</a><br/>
				<a href="${pageContext.request.contextPath}/recoveringID">Recovering ID</a><br/>
			</div>
	</form>

</body>
</html>