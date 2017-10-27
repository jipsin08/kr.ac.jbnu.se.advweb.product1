<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Logout Success View</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
			// Newly Added by STKim. 
			// The following code is for submitting the form data to server and redirect to another page. 
			$("#logout_form_id").on('submit', function (e) {
				$.post('${pageContext.request.contextPath}/logout', 
				{
					
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
   		<form id="logout_form_id" method="POST">
      		<input type="submit" value="로그아웃"/>
   		</form>
	</body>
</html>