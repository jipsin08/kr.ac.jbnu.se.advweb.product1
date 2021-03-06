<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	HttpSession session2 = request.getSession(false);

	String n = (String)session2.getAttribute("id");
// 	String p = (String)session2.getAttribute("pw");
	Long start = (Long)session2.getAttribute("ti");
	
	long current = System.currentTimeMillis();
	long dur = current - start.longValue();
	long dura_min = (dur/1000)/60;
	long dura_sec = (dur/1000)%60;
	String session_dur = "" +dura_min+ "분" +dura_sec+"초";
	
	//59초 후, 자동으로 로그아웃이 된다.
// 	if(dura_sec == 59.0){
// 		session2.invalidate();
// 	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 	<title>로그인 후</title>
	 	<link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
	 	
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
		<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="<c:url value="/js/validation.js" />"></script>
		
		<!-- Navigation -->
	    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	      <div class="container">
	        <a class="navbar-brand" href="/product/LoginedHome">My Blog</a>
	        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          Menu
	          <i class="fa fa-bars"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link" href="/product/LoginedHome">Home</a>
	            </li>
<!-- 	            <li class="nav-item"> -->
<%-- 	              <a class="nav-link" href="${pageContext.request.contextPath}/createUserAccount">xxxx</a> --%>
<!-- 	            </li> -->
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/postmain">Post</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </nav>

	    <!-- Page Header -->
	    <header class="masthead" style="background-image: url('img/home-bg.jpg');height: 550px;">
	      <div class="overlay"></div>
	      <div class="container">
	        <div class="row">
	          <div class="col-lg-8 col-md-10 mx-auto">
	            <div class="site-heading">
	              <h1><%=n %></h1>
	              <span class="subheading"></span>
	              <span class="subheading">로그인 시간 : <%=session_dur %></span>
<!-- 	              <a href="javascript:void(0);" onclick="javascript:showUserInfo();">Show More</a> -->
<!-- 	              <div id="additioalUserInfo"></div> -->
	            </div>
	          </div>
	        </div>
	      </div>
	    </header>
		<!-- Main Content -->
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-8 col-md-10 mx-auto">
	          <div class="post-preview">
	            <a>
	              <h2 class="post-title" align="center">
	                	Expand your dreams
	              </h2>
	              <h3 class="post-subtitle">
	                	<p align="center">with My blog</p>
	              </h3>
	            </a>
	            <p class="post-meta" align="center">
	              <a>(tel)</a>
	              010-6641-8732</p>
	          </div>
	          <hr>
	        </div>
	      </div>
	    </div>
	    <hr>
<!-- 		<div id="additioalUserInfo"></div> -->
	
<!-- 			<br> -->
		
<!-- 		<ul> -->
<!-- 			<li>Login/Logout functions in proper situation.</li> -->
<!-- 			<li>Storing user information in cookies with session.</li> -->
<!-- 			<li>Blog Post List</li> -->
<!-- 			<li>Create Post</li> -->
<!-- 			<li>Edit Post</li> -->
<!-- 			<li>Delete Post</li> -->
<!-- 			<li>Add favorite<em>(other Blog)</em></li> -->
<!-- 		</ul> -->
	
		<jsp:include page="_footer.jsp"></jsp:include>
	</body>
</html>