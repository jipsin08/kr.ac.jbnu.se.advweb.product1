<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="/product">My Blog</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        	
<%--         	<jsp:include page="_menu.jsp"></jsp:include> --%>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/product">Home</a>
            </li>
<!--             <li class="nav-item"> -->
<%--               <a class="nav-link" href="${pageContext.request.contextPath}/createUserAccount">Registration</a> --%>
<!--             </li> -->
<!--             <li class="nav-item"> -->
<%-- 	          <a class="nav-link" href="${pageContext.request.contextPath}/postmain">Post</a> --%>
<!-- 	         </li> -->
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('img/home-bg.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
<!--               <h1>이름</h1> -->
<!--               <span class="subheading">This is My Blog</span> -->
            </div>
          </div>
        </div>
      </div>
    </header>

