<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/master.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/operate2.css">
<script>
	var msg = "<%= msg %>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		
		if(msg == "비밀번호 변경에 성공했습니다."){
			window.close();
		}
	});
</script>


<style>
tr, td{
/* border:1px solid red; */
}

td{
width:100px !important;
}

/* table{
border:1px solid lightgrey;

} */




</style>
</head>


<body>

	<br><br>
	<div class="update" style="margin-left:50px;">
	<p style="font-size:20px; font-weight:bold">비밀번호 변경</p>
	<br><form id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwd.me" method="post" onsubmit="return checkPwd();">
	
	<p>비밀번호를 입력해 주세요.</p>
	<div class="tb" style="width:400px;">
	<table class="common-write">
	<colgroup>
				<col width="30%">
				<col width="*">
			</colgroup>
			<tbody>
			
	<tr>
		<td>현재 비밀번호</td>
		<td><input type="password" name="userPwd" id="userPwd"></td>
	</tr>
	<tr>
		<td>변경할 비밀번호</td>
		<td><input type="password" name="newPwd" id="newPwd"></td>
	</tr>
	<tr>
		<td>새로운 비밀번호 재입력</td>
		<td><input type="password" name="newPwd2" id="newPwd2"></td>
	</tr>
	</tbody>
	</table>
	<div class="btn-area">
			<input type="submit" value="수정하기" alt="수정하기" class="buttom_m main_k_buttom">
			<button class="buttom_m sub_k_buttom" onclick="window.close();">취소</a>
		</div>
</div>
</form>
</div>

<script>
		function checkPwd(){
			var userPwd = $("#userPwd");
			var newPwd = $("#newPwd");
			var newPwd2 = $("#newPwd2");
			
			// 1. input 태그(3개) 안에 값이 없으면 return false
			if(userPwd.val().trim() == "" || newPwd.val().trim() == "" || newPwd2.val().trim() == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			// 2. 비밀번호와 확인란의 값의 다르면 return false
			if(newPwd.val() != newPwd2.val()){
				alert("비밀번호가 다릅니다.");
				newPwd2.select();
				return false;
			} 
			
			// 둘 다 통과하면 return true;
			return true;
			
		}
	
	
	</script>
	

</body>
</html>