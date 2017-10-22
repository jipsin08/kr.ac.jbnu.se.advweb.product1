<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 	<title>회원 관리</title>
</head>


<script type="text/javascript">
function sendIt() {
      
      //var f = document.signupform;
        f = document.signupform;

        //userName는 <input> 태그에서 name 속성의 이름
        //var str = f.userName.value;
        
        //<input> 태그를 객체로 접근하는 방법1
        //name 속성 이용 -> BOM
        //var str = document.signupform.userName.value;
        
        //<input> 태그를 객체로 접근하는 방법2
        //id 속성 이용 -> DOM (권장)
        //var str = document.getElementById("userName").value;
        
      str = f.userName.value;
      str = str.trim();
        if(!str) {
            alert("\n아이디를 입력하세요. ");
            f.userName.focus();
            return;
        }
      f.userName.value = str;
      
      str = f.password.value;
      str = str.trim();
        if(!str) {
            alert("\n패스워드를 입력하세요. ");
            f.password.focus();
            return;
        }
      f.password.value = str;
    }
    
</script>


 
<body>
	 <div>
	   <h1>회원 관리</h1>
	   <hr>
	 </div>
	   <br>
		<form method="POST" name="signupform"
			action="${pageContext.request.contextPath}/createUserAccount">
			<table border="0">
				<tr>
					<td>USER_NAME</td>
					<td><input type="text" name="userName" value="${useraccount.userName}" /></td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="text" name="password" value="${useraccount.password}" /></td>
				</tr>
				
				<tr>
					<td colspan="1"><input type="submit" value="완료" onclick="sendIt()"/><a href="login">취소</a></td>
				</tr>
			</table>
		</form>
		
		<div class="col-md-4">
            <div class="aro-pswd_info">
               <div id="pswd_info">
                  <h4>ID must be requirements</h4>
                  <ul>
                     <li id="letter" class="invalid">You can only use <strong>English for ID content.</strong></li>
                  </ul>
               </div>
            </div>
         </div>
		<div class="col-md-4">
            <div class="aro-pswd_info">
               <div id="pswd_info">
                  <h4>Password must be requirements</h4>
                  <ul>
                     <li id="letter" class="invalid">At least <strong>one letter</strong></li>
                     <li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
                     <li id="number" class="invalid">At least <strong>one number</strong></li>
                     <li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
                     <li id="space" class="invalid">be<strong> use [~,!,@,#,$,%,^,&,*,-,=,.,;,']</strong></li>
                  </ul>
               </div>
            </div>
         </div> 
		<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>