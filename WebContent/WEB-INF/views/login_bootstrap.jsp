<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Logins</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		// Newly Added by STKim. 
		// The following code is for submitting the form data to server and redirect to another page. 
		$("#login_form_id").on('submit', function (e) {
			$.post('${pageContext.request.contextPath}/logins', 
				{
					userName : $("#name_id").val(),
					password : $("#paw_id").val(),
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
<%--     <jsp:include page="_menu.jsp"></jsp:include> --%>

	<a href="${pageContext.request.contextPath}/productList">Product List</a>
	<a href="${pageContext.request.contextPath}/userInfo">My Account Info</a>
	<p style="color: red;">${errorString}</p>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 text-center">
				<div class="search-box">
					<div class="caption">
						<h3>Advance Password Validation</h3>
						<p>Get that clue to be done.</p>
					</div>
					<form method="POST" id="login_form_id" class="loginForm" action="${pageContext.request.contextPath}/logins">
						<div class="input-group">
							<input type="text" id="name_id" name="userName" value="${user.userName}" class="form-control" placeholder="Full Name"><br/>
							<input type="password" id="paw_id" name="password" value= "${user.password}" class="form-control" placeholder="Password"><br/>
							<input type="submit" id="submit" name="submit" class="form-control" value="Submit"><br/>
							<input type="checkbox" id="rememberMe_id" name="rememberMe" class="form-control" value="Y"><p>rememberMe</p>
							<a href="${pageContext.request.contextPath}/">Cancel</a><br/>
							<a href="${pageContext.request.contextPath}/recoveringID">Recovering ID</a><br/>
							<a href="${pageContext.request.contextPath}/recoveringPW">Recovering PW</a><br/>
							<a href="${pageContext.request.contextPath}/registration">Registration</a><br/>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-4">
				<div class="aro-pswd_info">
					<div id="pswd_info">
						<h4>Password must be requirements</h4>
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
	
	<p style="color:blue;">User Name: tom, password: tom001 or jerry/jerry001</p>
	
	<jsp:include page="_footer.jsp"></jsp:include>
	
</body>
</html>

