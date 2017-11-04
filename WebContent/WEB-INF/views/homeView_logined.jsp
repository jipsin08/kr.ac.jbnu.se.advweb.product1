<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginedView</title>


	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
	<script>
		$(document).ready(function() {
		});
	
		function showUserInfo()
		{
			$.get("${pageContext.request.contextPath}/userInfo", 
				{
					more : "Yes"
				}, function(data) {
				$('#additioalUserInfo').html(data);
			});
		}
	</script>
	
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu_logined.jsp"></jsp:include>

	<h3><strong>Title</strong></h3>
	
		<a href="javascript:void(0);" onclick="javascript:showUserInfo();">타인 검색</a>
		<div id="additioalUserInfo"></div>

	<em>This scene has a logined_user Attribute in it's request.</em> &amp; Jdbc.
	<br>
	<br>
	<b>LoginedView</b>
	<ul>
		<li>Login/Logout functions in proper situation.</li>
		<li>Storing user information in cookies with session.</li>
		<li>Blog Post List</li>
		<li>Create Post</li>
		<li>Edit Post</li>
		<li>Delete Post</li>
		<li>Add favorite<em>(other Blog)</em></li>
	</ul>

	<jsp:include page="_footer.jsp"></jsp:include>

</body>
</html>