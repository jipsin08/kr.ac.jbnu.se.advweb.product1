<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<title>회원 관리</title>
 	<link type="text/css" rel="stylesheet" href="<c:url value="/css/validation.css" />" media="screen"/>
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

      var sample = document.getElementById('gender');

      for(var i=0; i<sample.length; i++){
			if(sample[i].checked == true){
				str = sample[i].value;
				str = str.trim();
		        if(!str) {
		            alert("\n성별을 입력하세요. ");
		            f.gender.focus();
		            return;
		        }
		        f.gender.value = str;
			}
          }

//       str = f.gender.value;
//       str = str.trim();
//         if(!str) {
//             alert("\n성별을 입력하세요. ");
//             f.gender.focus();
//             return;
//         }
//       f.gender.value = str;

      str = f.nickName.value;
      str = str.trim();
        if(!str) {
            alert("\n닉네임을 입력하세요. ");
            f.nickName.focus();
            return;
        }
      f.nickName.value = str;

      str = f.emailAddress.value;
      str = str.trim();
        if(!str) {
            alert("\n이메일 주소를 입력하세요. ");
            f.emailAddress.focus();
            return;
        }
      f.emailAddress.value = str;

      str = f.answer.value;
      str = str.trim();
        if(!str) {
            alert("\n문제에 대한 답변 입력하세요. ");
            f.answer.focus();
            return;
        }
      f.answer.value = str;
    }
    
</script>


 
<body>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="<c:url value="/js/validation.js" />"></script>   
	 <div>
	   <h1>회원 관리</h1>
      <p style="color: red;">${errorString}</p>
	   <hr>
	 </div>
	   <br>
		<form method="POST" name="signupform"
			action="${pageContext.request.contextPath}/createUserAccount">
			<table border="0">
				<tr>
					<td>USER_NAME =></td>
					<td><input type="text" name="userName" class="form-control" value="${useraccount.userName}" /></td>
				</tr>
				<tr>
					<td><strong>===========</strong></td>
				</tr>
				<tr>
					<td>Email_Address =></td>
					<td><input type="text" name="emailAddress" class="form-control" value="${useraccount.emailAddress}" /></td>
				</tr>
				<tr>
					<td><strong>===========</strong></td>
				</tr>
				<tr>
					<td>NICKNAME =></td>
					<td><input type="text" name="nickName" class="form-control" value="${useraccount.nickName}" /></td>
				</tr>
				<tr>
					<td><strong>===========</strong></td>
				</tr>
				
                <!-- **!!this gender attribute should be checked by radio button -->
				<tr>
					<td>GENDER =></td>
<%-- 					<td><input type="text" name="gender" class="form-control" value="${useraccount.gender}" /></td> --%>
					<td>
<!--   							<p>Please select your preferred contact method:</p> -->
  							<div>
   							 	<input type="radio" id="genderChoice1" name="gender" class="form-control" value="M"/>
    							<label for="genderChoice1">M</label>

    							<input type="radio" id="genderChoice2" name="gender" class="form-control" value="F"/>
    							<label for="genderChoice2">F</label>

    							<input type="radio" id="genderChoice3" name="gender" class="form-control" value="X"/>
    							<label for="genderChoice3">X</label>
  							</div>
					</td>
				</tr>
				<tr>
					<td><strong>===========</strong></td>
				</tr>
				<tr>
					<td>PASSWORD =></td>
					<td><input type="password" name="password" class="form-control" value="${useraccount.password}" /></td>
				</tr>
				<tr>
					<td><strong>===========</strong></td>
				</tr>
				<tr>
					<td><em>What's your favorite Football Club in the world?</em></td>
				</tr>
				<tr>
					<td>ANSWER =></td>
					<td><input type="text" name="answer" class="form-control" value="${useraccount.answer}" /></td>
				</tr>
				<tr>
					<td colspan="1"><input type="submit" value="완료" class="form-control" onclick="sendIt()"/><a href="login">취소</a></td>
				</tr>
			</table>
		</form>
		
		<b>You can use <strong>English only for ID content.</strong></b>
		<div class = "container">
			<div class = "row">
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
         	</div>
         </div> 
		<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>