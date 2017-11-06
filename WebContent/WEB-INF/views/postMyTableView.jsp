<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


   
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
      <title>postMyTable</title>         
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script>
      $(document).ready(function() {
         // Newly Added by STKim. 
         // The following code is for submitting the form data to server and redirect to another page. 
         $("#check_form_id").on('submit', function (e) {
         //   $('input:checkbox[id="checkbox_id"]').each(function()
               //   {
            //   if(this.checked) {
               //   (alert(this.value));}});
            $.post('${pageContext.request.contextPath}/deletePost', 
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
   </head>
   <body>
      <jsp:include page="_header_logined.jsp"></jsp:include>
<%--        <jsp:include page="_menu.jsp"></jsp:include> --%>
       
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
              <form id="check_form_id" method="post">
               <input type="submit" class="" value="Please"/>
             <table border="5" width ="50%" cellspacing="10">    
                 <c:forEach items="${postList}" var="postObject" >
                       <tr>
                          <!-- 체크 박스 부분 -->
                          <th>
                          <input type="checkbox" name="postNum" id="checkbox_id" class="" value="${postObject.postNum}">
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