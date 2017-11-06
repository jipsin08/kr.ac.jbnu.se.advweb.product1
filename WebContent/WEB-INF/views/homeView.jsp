<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
			<title>Insert title here</title>
	
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		    <meta name="description" content="">
		    <meta name="author" content="">
		
		    <title>My Blog</title>
		
		    <!-- Bootstrap core CSS -->
		    <link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
		
		    <!-- Custom fonts for this template -->
		    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		    
			<!-- Bootstrap core JavaScript -->
			<script src="<c:url value="/js/validation.js" />"></script>
			
			<!--user_info-->
<!-- 			<script src="https://code.jquery.com/jquery-3.1.0.js"></script> -->
				
	</head>
	<body>
	    <!-- Navigation -->
	    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	      <div class="container">
	        <a class="navbar-brand" href="/product">My Blog</a>
	        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	          Menu
	          <i class="fa fa-bars"></i>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarResponsive">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item">
	              <a class="nav-link" href="/product">Home</a>
	            </li>
<!-- 	            <li class="nav-item"> -->
<%-- 	              <a class="nav-link" href="${pageContext.request.contextPath}/createUserAccount">Registration</a> --%>
<!-- 	            </li> -->
<!-- 	            <li class="nav-item"> -->
<%-- 	              <a class="nav-link" href="${pageContext.request.contextPath}/postmain">Post</a> --%>
<!-- 	            </li> -->
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/login">login</a>
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
	              <h1>Your Name</h1>
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
	    <!-- Footer -->
	    <footer>
	      <div class="container">
	        <div class="row">
	          <div class="col-lg-8 col-md-10 mx-auto">          
	            <p class="copyright text-muted">Copyright &copy; Your Website 2017</p>
	          </div>
	        </div>
	      </div>
	    </footer>
	</body>
</html>