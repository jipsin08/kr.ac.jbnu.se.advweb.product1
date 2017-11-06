<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
		<title>Post Single 이름 이상해</title>	
		<script>
			<!-- 정말 삭제할래? -->
			function validate() {
				if (confirm("이 게시물을 삭제하시겠습니까?") == true) {
					location.href='deletePost?postNum=${postboard.postNum}'
			    }
			}
			
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
		

			$(document).ready(function() {
				// Newly Added by STKim. 
				// The following code is for submitting the form data to server and redirect to another page.
				$("#Comment_form_id").on('submit', function (e) {
					$.post('${pageContext.request.contextPath}/CreateCommentServlet', 
						{
							comment : $("#comment_id").val(),
							postnum : $("#postnum_id").val(),
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
		<jsp:include page="_header_logined.jsp"></jsp:include>
    	<jsp:include page="_menu.jsp"></jsp:include>
    	
    	<p style="color: red;">${errorString}</p>
    			
		<!-- 세로로 리스트 보이게 -->	
		
		<table border="5" width ="70%" cellspacing="10">

	        <c:if test="${not empty postboard}">
	        	<input type="hidden" name="postNum" value="${postboard.postNum}" />
		        	<tr>
				    	<th>${postboard.postSubject}</th>			
				    </tr>		    
				    <tr>
				    	<td height="200">${postboard.postContent}</td>			
				    </tr>
				    <tr>
				    	<td>${postboard.postDate}</td>			
				    </tr>     
	        </c:if>
	        
        	<tr align="center" valign="middle">
	            <td>
					<input type="button" value="edit" onclick ="location.href='editPost?postNum=${postboard.postNum}'"/>
					<input type="button" value="delete" onclick ="validate()"/>
         			<input type="button" id ="back" value= "back" onclick ="location.href='postMain'"/>
	            </td>
	            <br>
	        </tr>
	        <tr align="center" valign="middle">
	            <td>
	            	<form id="Comment_form_id" method="POST">
	            		
	            		<c:if test="${not empty postboard}">
				        	<input type="hidden" id ="postnum_id" name="postum" value="${postboard.postNum}"/>    	
							<input type="text" id ="comment_id" name="comment" placeholder= "댓글내용을 입력하세요." />
							<input type="submit" value="댓글달기"/>
						</c:if>
					</form>
	            </td>
	            
	            <br>
	        </tr>
	        <c:forEach items="${commentList}" var="comment" >
	        <tr align="center" valign="middle">
	            	<td>
						<p>${comment.userName}</p>
						<p>${comment.comment}</p>
	            	</td>
	            <br>
	        </tr>
 			</c:forEach>
		</table>
		
	</body>
</html>