<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Member m = (Member)session.getAttribute("loginUser");

String userPwd = m.getmPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/master.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/operate2.css">
</head>
<style>
div {
	/* border:1px solid red; */
	
}

.part1, .mypage-contents, .sub-container {
	diplay: inline-block;
	/* border:1px solid red; */
	height: 100%;
}

.wholewhole {
	width: 85%;
	height: 1100px;
	margin: auto;
	/* border:1px solid blue; */
}

.part1 {
	width: 20%;
	height: 100%;
	float: left;
}

.mypage-contents {
	width: 50%;
	float: left;
}
</style>
<body>
	<%@include file="../common/menubar.jsp"%>
	<%@include file="../common/bootstrap.jsp"%>

	<br>
	<br>
	<div class="wholewhole">
		<div class="part1">
			<article id="container" class='sub-container'>
				<div class='site-sub-top'>
					<!-- 추가 컨텐츠 [S] -->
					<!-- 추가 컨텐츠 [E] -->
				</div>
	
				<section class='site-sub-layout'>
					<nav class="lnb-area">
						<h1 class="subtit-heading">
							<span class="font-en">MY PAGE</span>
							
						</h1>

							<dl class="menu-sub-left">
							<!-- <dt>
								<a href="myProfile.jsp">프로필 관리</a>
							</dt> -->
							
								<dt>프로필 관리</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath() %>/views/myPageUpdate/myProfile.jsp">프로필 보기/수정 </a></li>


								</ul>
							</dd>
							
							


							<dt>
								
								나의 쇼핑 내역
							</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath()%>/myOrder" class=''> 주문 조회 </a></li>
									</a></li>

								</ul>
							</dd>
							<dt>나의 레시피 관리</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath() %>/recipelist.mp">
											나의 레시피 </a></li>


								</ul>
							</dd>
						<!-- 	<dt>댓글 관리</dt>
							<dd>
								<ul>
									<li><a href="myReply.jsp"> 나의 댓글 </a></li>
									<li><a href="getReply.jsp"> 내가 받은 댓글 </a></li>

								</ul>
							</dd> -->
							<dt>나의 커뮤니티</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath() %>/views/myPageUpdate/myBoard.jsp"> 나의 게시글 </a></li>


								</ul>
							</dd>
							<dt>
								회원정보
							</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath()%>/views/myPageUpdate/updateMember.jsp"> 회원정보수정 </a></li>

									<li><a href="<%=request.getContextPath() %>/views/myPageUpdate/deleteMember.jsp"> 회원탈퇴 </a></li>
								</ul>
							</dd>
						</dl>
						</nav>
						
		</section>
		</article>
		</div>
		
		<div class="mypage-contents">
			<section class="wrap-shopping-info">
				
				<div class="shopping-info">
					<div class="area info01" style="width: 100%;">
						<p style="font-size: 20px">
							정말로 탈퇴하시겠습니까?<br>
						<p style="color: rgb(170, 57, 57); font-size: 25px">회원탈퇴전 다음
							사항을 꼭 숙지하시기 바랍니다.</p>
						<br>

						<ul>
							<li>진행중인 구매내역이 있을 경우 회원 탈퇴가 불가능하며, 거래 완료 후 탈퇴 하실 수 있습니다.</li>
							<li>회원탈퇴시 적립된 적립금은 모두 즉시 소멸되며 재가입시에도 재적립 되지 않습니다.</li>
						</ul>
						
					</div>



				</div>
			</section>

			<%--여기서부터 시작 자리 --%>
			<br>
			<form id="updateForm" name="updateForm"  type="post">
			<div class="secession-check-member">
				<table class="common-write">
					<caption>회원 정보 입력</caption>
					<colgroup>
						<col width='20%'>
						<col width='*'>
					</colgroup>
					<tbody>
						<tr>
							<th scope="col">아이디</th>
							<td><input type="text" name="id" validation="true" value='<%=m.getmId() %>'
								title="아이디" style="width: 200px;"  readonly></td>
						</tr>
						<tr>
							<th scope="col">비밀번호</th>
							<td><input type="password" name="pass" id="pass1"
								style="width: 200px;"></td>
						</tr>
				</table>
			</div>
			<div class='btn-area'>
			
				<button id="deleteBtn" onclick="deleteMember();" class="main_k_buttom buttom_m" type="button">탈퇴하기</button>
				<button id="toMain" class='sub_k_buttom buttom_m' type="button" onclick="returnToMain();">취소</button>
			</div>
			
			</form>
		</div>
	</div>
	
	<script>
	function returnToMain(){
		location.href="<%= request.getContextPath() %>/views/myPageUpdate/myProfile.jsp";
	}
	
	function deleteMember(){
		var pwd = $("#pass1").val();
		
		if("<%= userPwd %>" == pwd){
			var bool = confirm("정말로 탈퇴하시겠습니까?");
			
			if(bool){
				// updateForm 속성 변경
				$("#updateForm").attr("action", "<%= request.getContextPath() %>/delete2.me");
				// 그리고 submit 실행
				$("#updateForm").submit();
			}
		}else{
			alert("비밀번호를 잘못 입력하였습니다.");
		}
		
		
	}
	</script>
	
	

	<%@include file="../common/footer.jsp"%>
</body>

</html>