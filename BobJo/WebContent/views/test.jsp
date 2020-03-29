<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">사진 게시판 작성</h2>
		
		<!-- 파일 업로드를 위해 enctype="multipart/form-data"를 반드시 지정 -->
		<form action="<%= request.getContextPath() %>/upload" method="post" enctype="multipart/form-data">
			
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" ">
					<input type="file" id="thumbnailImg2" name="thumbnailImg2" ">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" ">
					<input type="file" id="thumbnailImg4" name="thumbnailImg4" ">
				</div>
				<div class="btnArea">
					<button type="button" onclick="javascript:history.back();">취소하기</button>
					<button type="submit">작성완료</button>
				</div>
		</form>
		
	</div>












</body>
</html>