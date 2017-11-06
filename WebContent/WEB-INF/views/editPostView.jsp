<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Edit Post</title>	
			
		<!-- ckEditor -->
		<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>	
		

	</head>
	<body>
		<jsp:include page="_header.jsp"></jsp:include>
    	<jsp:include page="_menu.jsp"></jsp:include>
    	
    	<p style="color: red;">${errorString}</p>
    			
		<!-- 세로로 리스트 보이게 -->	
		
		<form method="POST" action="${pageContext.request.contextPath}/editPost">
		
		<table border="5" width ="70%" cellspacing="10">
	        
	        <c:if test="${not empty postboard}">
	        	<input type="hidden" name="postNum" value="${postboard.postNum}" />
		        	<tr>
				    	<th><input type="text" name="postSubject" size="70" maxlength="100" value="${postboard.postSubject}"/></th>			
				    </tr>		    
				    <tr>
				    	<td height="200">
					    	<textarea id="postEditor" name="postContent" class="ckeditor">${postboard.postContent}</textarea>			
	 		            	<% String str = request.getParameter("postContent"); %>		
	 		            	<input type="hidden" name="postContent" class ="postContent" value=<%= str %>>
 		            	</td>
				    </tr><%-- 
				    <tr>
				    	<td>${postboard.postDate}</td>			
				    </tr>     
	         --%></c:if>
	        
        	<tr align="center" valign="middle">
	            <td>
					<input type="submit" value="Submit" />
         			<input type="button" value= "back" onclick ="location.href='postSingle?postNum=${postboard.postNum}'"/>
	            </td>
	        </tr>

		</table>
		
		</form>
		
	</body>
</html>