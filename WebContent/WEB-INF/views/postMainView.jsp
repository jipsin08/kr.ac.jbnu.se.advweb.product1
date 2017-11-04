<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>postMain</title>			
	</head>
	<body>
		<jsp:include page="_header.jsp"></jsp:include>
    	<jsp:include page="_menu.jsp"></jsp:include>
    	
    	<p style="color: red;">${errorString}</p>
    	
    	<!-- post button 설정 -->
    	  	
		<nav id="post_buttons">
		
			<!-- <a href="postText">텍스트</a>
			<a href="postText">사진</a>
			<a href="postText">링크</a> -->
			
			<h1>
				<a href="postText">
					<span class="new_post_text">텍스트</span>
				</a>
				<a href="postText">
					<span class="new_post_photo">사진</span>
				</a>
				<a href="postText">
					<span class="new_post_link">링크</span>
				</a>
			</h1>
		
		</nav>

		
		<!-- 세로로 리스트 보이게 -->	
		
		<table border="5" width ="70%" cellspacing="10">
       		<tr>
       			<th>Post List</th>		
	        </tr>
	        
	        <c:forEach items="${postList}" var="postboard" >
			    <tr>
			    	<th>${postboard.postSubject}</th>			
			    </tr>		    
			    <tr>
			    	<td height="400">${postboard.postContent}</td>			
			    </tr>
			    <tr>
			    	<td>${postboard.postDate}</td>			
			    </tr>
			    
			    <!-- css 전 임시 -->
			    <tr></tr>
			    <tr></tr>
			    <tr></tr>
			    <tr></tr>
			    <tr></tr>
			    <tr></tr>
			    
       		</c:forEach>
		</table>
		
	</body>
</html>