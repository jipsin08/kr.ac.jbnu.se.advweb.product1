<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
		<title>postMain</title>		
			
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script>
		$(document).ready(function() {
			// Newly Added by STKim. 
			// The following code is for submitting the form data to server and redirect to another page. 
			$("#check_form_id").on('submit', function (e) {
			//	$('input:checkbox[id="checkbox_id"]').each(function()
					//	{
				//	if(this.checked) {
					//	(alert(this.value));}});
				$.post('${pageContext.request.contextPath}/postmain', 
					{
						checked_id : $("#check_id").val()
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
		
		
		
<!-- 		태규형 -->
		
		<script>
			<!-- 정말 삭제할래? -->
			function validate() {
				$('input:checkbox[id="checkbox_id"]').each(function() {
					if(this.checked) {
						//alert(this.value);
						if (confirm("선택한 게시물을 삭제하시겠습니까?") == true) {
							//alert("deletePost?postNum=$("#check_id").val()");
							location.href='deletePost?postNum='+(this.value);
					    }
					}
				});
			}
			
		</script>
		
		
<!-- 		태규형끝  밑은 성한이의 태규형-->
		      <script>
      
		      $(document).ready(function() {
		         $("#check_form_id").on('submit', function (e) {
		            $('input:checkbox[id="checkbox_id"]').each(function() {
		               if(this.checked) {
		                  alert("스크랩 하겠습니다.");
		                  
		               }
		            })
		            
		         })
		      });
		            
		
		      </script>

		
		
				
		<script type="text/javascript">
			function sendIt() {
			      
			      //var f = document.signupform;
			        f = document.searchform;
			
			        //userName는 <input> 태그에서 name 속성의 이름
			        //var str = f.userName.value;
			        
			        //<input> 태그를 객체로 접근하는 방법1
			        //name 속성 이용 -> BOM
			        //var str = document.signupform.userName.value;
			        
			        //<input> 태그를 객체로 접근하는 방법2
			        //id 속성 이용 -> DOM (권장)
			        //var str = document.getElementById("userName").value;
			        
			      str = f.search.value;
			      str = str.trim();
			        if(!str) {
			            alert("\n검색내용을 입력하세요. ");
			            f.search.focus();
			            return;
			        }
			      f.search.value = str;
			
			      var sample = document.getElementById('option');
			
			      for(var i=0; i<sample.length; i++){
						if(sample[i].checked == true){
							str = sample[i].value;
							str = str.trim();
					        if(!str) {
					            alert("\n검색옵션을 선택하세요. ");
					            f.option.focus();
					            return;
					        }
					        f.option.value = str;
						}
			      }
			}
		</script>
	</head>
	<body>
		<jsp:include page="_header_logined.jsp"></jsp:include>
<%--     	<jsp:include page="_menu.jsp"></jsp:include> --%>
    	
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

		<form method="post" name ="searchform" action="${pageContext.request.contextPath}/postmain">
			<table border="5" width ="50%" cellspacing="10">
	       		<tr>
	       			<th>Post searching List</th>		
		        </tr>
		    	<tr>
               		<td colspan="1">
               			<div>
			 				<input type="radio" id="optChoice1" name="option" class="" value="username" checked="checked"/>
							<label for="optChoice1">작성자</label>

							<input type="radio" id="optChoice2" name="option" class="" value="subject"/>
							<label for="optChoice2">제목</label>

							<input type="radio" id="optChoice3" name="option" class="" value="content"/>
							<label for="optChoice3">내용</label>
							
							<input type="text" id="search_id" name="search" class="" /> 
							<input type="submit" class="" value="검색"/>
						</div>
               		</td>
            	</tr>
           	</table>
           	</form>
           	
           	<!-- 세로로 리스트 보이게 -->	
<!--            	<form id="check_form_id" method="post"> -->
<!--       			<input type="submit" class="" value="Please"/> -->
      		
<!-- 			    <table border="5" width ="50%" cellspacing="10">     -->
			    
<%-- 			        <c:forEach items="${postList}" var="postObject" > --%>
<!-- 					    <tr> -->
<!-- 					    	클릭 이벤트 넣을 것 -->
<!-- 					    	<th><input type="checkbox" id="check_id" class=""  -->
<%-- 					    	value="${postObject.postNum}">${postObject.postSubject}</th>			 --%>
<!-- 					    </tr>		     -->
<!-- 					    <tr> -->
<!-- 					    	<td height="200"> -->
<!-- 					    	제목이 공사당해서, 글 내용 클릭하면 postSingle 이동하게 임시 수정 -->
<%-- 					    	<a href="postSingle?postNum=${postObject.postNum}">${postObject.postContent}</a> --%>
<!-- 					    	</td>			 -->
<!-- 					    </tr> -->
<!-- 					    <tr> -->
<%-- 					    	<td>${postObject.postDate}</td>			 --%>
<!-- 					    </tr> -->
					    
<!-- 					    css 전 임시 -->
<!-- 					    <tr></tr> -->
<!-- 					    <tr></tr> -->
<!-- 					    <tr></tr> -->
<!-- 					    <tr></tr> -->
<!-- 					    <tr></tr> -->
<!-- 					    <tr></tr> -->
					    
<%-- 		       		</c:forEach> --%>
<!-- 				</table> -->
<!-- 			</form> -->
<%-- 			action="${pageContext.request.contextPath}/postmytable" --%>
				<!-- 세로로 리스트 보이게 -->	
           	<form id="check_form_id" method="post" action="${pageContext.request.contextPath}/postmytable">
           		<!-- doPost -->
      			<input type="button" class="form-control" value="Checked item DELETE" onclick="validate()" />
      			
      			<input type="submit" class="form-control" value="Scrapping"/>
      			
			    <table border="5" width ="50%" cellspacing="10">
			    
			        <c:forEach items="${postList}" var="postObject" >
					    <tr>
					    	<!-- 체크 박스 부분 -->
					    	<th>
					    	<input type="checkbox" name="postNum" id="checkbox_id" class="form-control" value="${postObject.postNum}">
					    		<a href="postSingle?postNum=${postObject.postNum}">제목: ${postObject.postSubject}</a>
					    		</th>			
					    </tr>		    
					    <tr>
					    	<td height="200">${postObject.postContent}</td>			
					    </tr>
					    <tr>
					    	<td><strong>작성시간:</strong> ${postObject.postDate} <strong>작성자:</strong> ${postObject.postId} 
					    	 <strong>닉네임:</strong> ${postObject.postNickname}</td>			
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
			</form>
	</body>
</html>