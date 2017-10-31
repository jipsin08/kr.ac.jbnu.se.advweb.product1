<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>CKEditor</title>
		<script type="text/javascript" src="https://cdn.ckeditor.com/ckeditor5/1.0.0-alpha.1/classic/ckeditor.js">
		
        function clearFrm() {document.frame.reset();}
		
			
		</script>
		
	</head>
	<body>
	
		<jsp:include page="_header.jsp"></jsp:include>
    	<jsp:include page="_menu.jsp"></jsp:include>
    	
    	<form name="frame" method="post" action="posting_test.jsp">
    	
			<textarea name="content" id="editor" rows="10">왜 안되냐고ㅠㅠㅠ</textarea>
			
			<script>
				ClassicEditor.create( document.querySelector( '#editor' ) );
			</script>
			
			<input type="submit" value= "post" />
			<input type="reset" value= "clear2" />
			
		</form>
	</body>
</html>