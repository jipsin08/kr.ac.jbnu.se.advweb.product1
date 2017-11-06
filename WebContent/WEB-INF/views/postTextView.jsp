<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>postText</title>
		<!-- ckEditor -->
		<script type="text/javascript" src="./ckeditor/ckeditor.js"></script>
	    <!-- editor 창 clear 이벤트 -->
		<script>
			function button1_click() {
				alert("내용 비우기.");
				CKEDITOR.instances.postEditor.setData('');
			}
			
			function inputCkData() {
				var ckData = CKEDITOR.instances.postEditor.getData();

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
                		<input type="text" name="postSub" size="70" maxlength="100" value="${postboard.postSub}"/>
            		</td>        
       			</tr>
		        <tr align="center" valign="middle">
		            <td>
		            	<textarea id="postEditor" class="ckeditor"></textarea>
		            	<!-- ckEditor 값은 CKEDITOR.instances.postEditor.getData()으로 얻어옴 -->
		            	<input type="text" name="postCont" class ="postCont" value="${postboard.postCont}">
		            </td>        
		        </tr>
        
<!-- 		        <tr>
		            <td>
		                <input type="file" name="board_file" />
		            </td>    
		        </tr> -->
 
		        <tr align="center" valign="middle">
		            <td>
						<input type="submit" value= "post" onclick="inputCkData();"/>
						<input type="button" value="clear" id="button1" onclick="button1_click();"  />          
		            </td>
		        </tr>
    </table>
			

		</form>
	</body>
</html>