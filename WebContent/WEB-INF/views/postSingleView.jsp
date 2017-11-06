<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Post Single 이름 이상해</title>	
		<script>
			<!-- 정말 삭제할래? -->
			function validate() {
				if (confirm("이 게시물을 삭제하시겠습니까?") == true) {
					location.href='deletePost?postNum=${postboard.postNum}'
			    }
			}
			
		</script>
	</head>
	<body>
		<jsp:include page="_header.jsp"></jsp:include>
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
					<input type="button" value= "edit" onclick ="location.href='editPost?postNum=${postboard.postNum}'"/>
					<input type="button" value="delete" onclick ="validate()"/>
         			<input type="button" id = "back" value= "back" onclick ="location.href='postMain'"/>
	            </td>
	        </tr>

		</table>
		
	</body>
</html>