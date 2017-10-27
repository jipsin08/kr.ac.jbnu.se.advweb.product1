<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>

	<h3><strong>Title</strong></h3>

	<em>This is subx2 title of this page, changing is required.</em> &amp; Jdbc.
	<br>
	<br>
	<b>This Project should includes the following functions:</b>
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