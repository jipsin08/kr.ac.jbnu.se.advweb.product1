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
			<script>
// 				$(document).ready(function() {
// 				});
				
// 				function showUserInfo()
// 				{
// 					$.get("${pageContext.request.contextPath}/userInfo", 
// 						{
// 							more : "Yes"
// 						}, function(data) {
// 						$('#additioalUserInfo').html(data);
// 					});
// 				}
			</script>
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
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/createUserAccount">Registration</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/postmain">Post</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
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
	              <h1>이름</h1>
	              <span class="subheading">This is My Blog</span>
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
	            <a href="post.html">
	              <h2 class="post-title">
	                Man must explore, and this is exploration at its greatest
	              </h2>
	              <h3 class="post-subtitle">
	                Problems look mighty small from 150 miles up
	              </h3>
	            </a>
	            <p class="post-meta">Posted by
	              <a href="#">Start Bootstrap</a>
	              on September 24, 2017</p>
	          </div>
	          <hr>
	          <div class="post-preview">
	            <a href="post.html">
	              <h2 class="post-title">
	                Failure is not an option
	              </h2>
	              <h3 class="post-subtitle">
	                Many say exploration is part of our destiny, but it’s actually our duty to future generations.
	              </h3>
	            </a>
	            <p class="post-meta">Posted by
	              <a href="#">Start Bootstrap</a>
	              on July 8, 2017</p>
	          </div>
	          <hr>
	          <!-- Pager -->
	          <div class="clearfix">
	            <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
	          </div>
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