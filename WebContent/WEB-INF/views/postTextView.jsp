<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>postText</title>
		
		<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
		
	</head>
	<body>
	
		<jsp:include page="_header.jsp"></jsp:include>
    	<jsp:include page="_menu.jsp"></jsp:include>
    	
    	<form name="frame" method="post" action="posting_test.jsp">
    	
			<textarea name="contents" id="inputPost" class="ckeditor"></textarea>
			
			<input type="submit" value= "post" />
			<input type="reset" value= "clear2" />
			
		</form>
	</body>
</html>