<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="userInfo" name="userInfo" title="Example Div Element" 
	style="color: #0900C4; font: Helvetica 12pt;border: 1px solid black;">
  <h5>${user.userName}</h5>
  <p>Ÿ�� �˻� â�Դϴ�.</p>
  
  <input type = "text" name="" placeholder="�˻��� �̸��� ������." onKeyDown="Search_from_enter();">
  <button onclick="Search_from_click();">�˻�</button>
  <br>
  <br>
  <a href="javascript:void(0);" onclick="javascript:hideUserInfo();">�˻� â �����</a>
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
     		alert('Ŭ������ �˻��ߴ�.');    	
	}
</script>

<script>
	function Search_from_enter()
	{
     	if(event.keyCode == 13)
     	{
     		alert('���ͷ� �˻��ߴ�.');
     	}
	}
</script>