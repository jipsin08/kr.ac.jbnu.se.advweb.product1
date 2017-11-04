<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>postText</title>
		
		<script type="text/javascript" src="./ckeditor/ckeditor.js">
		function button1_click() {
			alert("내용 비우기.");
			CKEDITOR.instances.postEditor.setData('')
		}
		</script>
		
	</head>
	<body>
	    <!-- editor 창 clear 이벤트 -->
		<script>
			function button1_click() {
				alert("내용 비우기.");
				CKEDITOR.instances.postEditor.setData('')
			}
		</script>
	
		<jsp:include page="_header.jsp"></jsp:include>
    	<jsp:include page="_menu.jsp"></jsp:include>
    	
    	<form name="frame" method="post" action="posting_test.jsp">
    	
    		<!-- id 값은 꼭 넣어주기 -->
			<textarea id="postEditor" class="ckeditor"></textarea>
			
			<input type="submit" value= "post" />
			<input type="button" value="clear" id="button1" onclick="button1_click();"  />
			

		</form>
	</body>
</html>