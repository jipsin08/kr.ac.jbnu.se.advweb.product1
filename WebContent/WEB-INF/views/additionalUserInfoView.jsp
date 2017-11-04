<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="userInfo" name="userInfo" title="Example Div Element" 
	style="color: #0900C4; font: Helvetica 12pt;border: 1px solid black;">
  <h5>${user.userName}</h5>
  <p>타인 검색 창입니다.</p>
  
  <input type = "text" name="" placeholder="검색할 이름을 쓰세요." onKeyDown="Search_from_enter();">
  <button onclick="Search_from_click();">검색</button>
  <br>
  <br>
  <a href="javascript:void(0);" onclick="javascript:hideUserInfo();">검색 창 숨기기</a>
</div>

<script lang="javascript">
	
	function hideUserInfo()
	{
		$('#userInfo').hide();
	}
</script>


<script>
	function Search_from_click()
	{
     		alert('클릭으로 검색했다.');    	
	}
</script>

<script>
	function Search_from_enter()
	{
     	if(event.keyCode == 13)
     	{
     		alert('엔터로 검색했다.');
     	}
	}
</script>