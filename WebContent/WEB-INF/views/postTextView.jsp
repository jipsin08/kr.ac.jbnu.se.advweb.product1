<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>postText</title>
		<!-- ckEditor -->
		<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
		<script>
			<!-- ckEditor 창 clear 이벤트 -->
			function clear_click() {
				if (confirm("본문 내용을 모두 지우시겠습니까?") == true) {
					CKEDITOR.instances.postEditor.setData('');
			    }
			}
			
		</script>
	</head>
	<body>

		<jsp:include page="_header_logined.jsp"></jsp:include>
<%--     	<jsp:include page="_menu.jsp"></jsp:include> --%>
    	
    	<form method="post" action="${pageContext.request.contextPath}/postText">
    	    <table>
				<tr	align="center" valign="middle">
					<td>
                		<input type="text" name="postSub" size="70" maxlength="100" value="${post.postSub}"/>
            		</td>        
       			</tr>
		        <tr align="center" valign="middle">
		            <td>
		            	<textarea id="postEditor" name="postCont" class="ckeditor"></textarea>
		            	
		            	<!-- name="postCont" 값(=ckEditor로 대체되는 textarea) 얻어와서 str에 넣고 hidden으로 넘기기 -->
 		            	<% String str = request.getParameter("postCont"); %>		
 		            	<input type="hidden" name="postCont" class ="postCont" value=<%= str %>>
 		            	

		            </td>     
		        </tr>
 
		        <tr align="center" valign="middle">
		            <td>
						<input type="submit" value= "post"/>
						<input type="button" value="clear" id="button1" onclick="clear_click();"/>           
		            </td>
		        </tr>
    </table>
			

		</form>
	</body>
</html>