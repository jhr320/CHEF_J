<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
	
<%
Member m = (Member)session.getAttribute("loginUser");

String nickname = m.getNickname();
String mIntro = m.getmIntro();
/* String mId = m.getmId(); */

String msg = (String)request.getAttribute("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/master.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/operate2.css">
<script>
	var msg = "<%= msg %>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		
		if(msg == "프로필 변경에 성공했습니다."){
			window.close();
		}
	});
</script>
<style>
#preview, #imgArea {
	border: 1px solid red;
	min-width: 300px;
	min-height: 300px;
	border-radius: 50%;
}

.thumbnail {
	border: 1px solid green;
	width: 300px;
	height: 300px;
	border-radius: 50%;
	display: inline-block;
	background:
		url('<%=request.getContextPath()%>/resources/images/useruser.png');
	background-size: cover;
	cursor:pointer;
}

#imgfile1{
margin-left:50px;
}


</style>
</head>
<body>


	<form action="<%=request.getContextPath()%>/insert.pr" method="post" enctype="multipart/form-data">
		<div id="thumbnail1" class="thumbnail"></div>



		<div id="files">
			<input type="file" id="imgfile1" name="imgfile1"
				onchange="preview(this,1)">

		</div>
		<div class="te" style="margin-left:10px;">
		<input name="nickname" type="text" style="width: 300px; height:30px; "  placeholder="닉네임을 작성해 주세요" value="<%=nickname%>"><hr>
		<br> <input name="mIntro" type="text" style="width: 300px; height:30px;" placeholder="간단한 자기 소개를 해주세요" value="<%=mIntro%>">
		<%-- <input name="mId" type="hidden" values="<%=mId%>"> --%>
		</div>

		<br>
	
	<script>
		// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$("#files").hide();

			$("#thumbnail1").click(function() {
				$("#imgfile1").click();
			});

		});

		function preview(value, num) {
			// value => input type="file"
			// num => 조건문으로 각 번호에 맞춰서 위의 미리보기 img에 적용시킬것

			// file이 존재하는지 조건문
			if (value.files && value.files[0]) {
				// 파일을 읽어들일 FileReader 객체 생성
				var reader = new FileReader();

				// 파일 내용을 읽어들여 dataURL 형식의 문자열로 설정
				reader.readAsDataURL(value.files[0]);

				// 파일 읽기가 다 완료되었을 때 실행되는 메소드
				reader.onload = function(e) {
					$("#thumbnail" + num)
							.html(
									"<img src=" + reader.result + " width=300 height=300>")
							.css({
								"width" : "300",
								"height" : "300",
								"border-radius" : "50%"
							});
				}
			}
		}
	</script>
		<div align="center">
		
			
			<input type="submit" value="등록하기" alt="등록하기" class="buttom_m main_k_buttom">
			<button class="buttom_m sub_k_buttom" onclick="window.close();">취소</a>
		</div>


	</form>


</body>
</html>