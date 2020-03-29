
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, attachment.model.vo.*"%>
<%
	/* String nickname = m.getNickname();
	String mIntro = m.getmIntro(); */

	ArrayList<Attachment> fileList = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/master.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/operate2.css">


</head>
<style>
.part1, .mypage-contents, .sub-container {
	diplay: inline-block;
	height: 100%;
}

.wholewhole {
	width: 85%;
	height: 1100px;
	margin: auto;
}

.part1 {
	width: 20%;
	height: 100%;
	float: left;
}

.mypage-contents {
	width: 80%;
	float: left;
}

.content {
	border-radius: 5px;
	width: 100%;
	height: 90%;
	border: 1px solid grey;
}

.whole {
	width: 80%;
	height: 600px;
	margin: auto;
}

.mold {
	width: 27%;
	margin-left: 5%;
	margin-top: 2%;
	display: inline-block;
}

.thumbnail {
	width: 100%;
	height: 200px;
}

.likenum, .qnanum {
	width: 50px;
	height: 30px;
	font-size: 15px;
}

.content {
	width: 100%;
	height: 30%;
	box-sizing: border-box;
	display: inline-block;
}

.name {
	width: 100%;
	height: 30%;
}

.writer {
	width: 100%;
	height: 70%;
}

.card-body {
	border-radius: 5px;
}

.yy {
	font-size: 10px;
	text-align: right;
}

.views {
	display: inline-block;
}

.name {
	height: 100%;
	width: 60%;
	display: inline-block;
	font-size: 25px;
	font-weight: bold;
	text-align: right;
}

.recipe {
	box-sizing: border-box;
	height: 100%;
	width: 20%;
	display: inline-block;
	float: right;
	font-size: 10px;
	margin-top: 20px;
}

.content {
	border-radius: 5px;
	width: 100%;
	height: 90%;
	border: 1px solid grey;
}

div {
	/* border: 1px solid red; */
	
}

.profilePic {
	width: 200px;
	height: 200px;
	border-radius: 50%;
	margin: auto;
}

.profile {
	width: 40%;
}

.nickname {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	height: 130px;
	vertical-align: middle;
	background-color: rgb(212, 106, 106);
	color: white;
}

.introduce {
	margin: auto;
	font-size: 13px;
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
									<li><a
										href="<%=request.getContextPath()%>/views/myPageUpdate/myProfile.jsp">프로필
											보기/수정 </a></li>


								</ul>
							</dd>




							<dt>나의 쇼핑 내역</dt>
							<dd>
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/myOrder"
										class=''> 주문 조회 </a></li>
									</a>
									</li>

								</ul>
							</dd>
							<dt>나의 레시피 관리</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath()%>/recipelist.mp">
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
									<li><a
										href="<%=request.getContextPath()%>/myBoardlist.mp"> 나의
											게시글 </a></li>

									<li><a href="<%=request.getContextPath()%>/myQnalist.mp">
											1:1 문의내역 </a></li>
								</ul>
							</dd>
							<dt>회원정보</dt>
							<dd>
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/views/myPageUpdate/updateMember.jsp">
											회원정보수정 </a></li>

									<li><a
										href="<%=request.getContextPath()%>/views/myPageUpdate/deleteMember.jsp">
											회원탈퇴 </a></li>
								</ul>
							</dd>
						</dl>
		</div>
		<div class="mypage-contents">
			<section class="wrap-shopping-info" style="width: 62%;">

				<div class="shopping-info">
					<div class="area info01">
						<p>
							안녕하세요.
							<%=loginUser.getmName()%>님<br> chef J를 이용해주셔서 감사합니다.
						</p>
					</div>



				</div>

			</section>
			<%--여기서부터 시작 자리 --%>
			<div class="wrap-profile">
				<h2>프로필 관리</h2>
				<p class="desc">프로필 사진과 인사말을 수정할 수 있습니다.</p>
			</div>

			<%-- <div class="profile card">

    	<% for(int i = 0; i < fileList.size(); i++) { %>
    	<% for (Attachment at : fileList) { %>
    	<br><div class="profilePic"><a href="#" onclick='window.open("updateProfile.jsp","_blank","height=360,width=300, status=yes,toolbar=no,menubar=no,location=no");return false'>
    	<img class="profilePic" src="<%=request.getContextPath() %>/resources/images/강아지.jpg"></a>

    	<% if(fileList.get(i).getBprcId().equals(m.getmId())) { %>
    	<img class="profilePic" src="<%=request.getContextPath() %>/resources/profile/<%=at.getChangeName()%>"></a>
    	</div>
    	<%} %>

    	<br><div class="nickname" ><div class="info" style="font-size:13px"><br><br> <%=loginUser.getmGrade() %></div><%=loginUser.getNickname() %></div>

    	 <div class="introduce" style="text-align:left; text-weight:normal;"><%=loginUser.getmIntro()%></div>
    	<hr>

    	<%} %>
    	<%} %>



    	</div> --%>


			<div class="profile card">


				<br>

				<%-- <% for(Attachment at : fileList){ %>
    		<% if(m.getmId() == at.getBprcId()){ %> --%>

				<div class="profilePic">
					<a href="#"
						onclick='window.open("updateProfile.jsp","_blank","height=360,width=300, status=yes,toolbar=no,menubar=no,location=no");return false'>
						<img class="profilePic"
						src="<%=request.getContextPath()%>/resources/images/useruser.png">
					</a>
					<%-- <%} %>
    	<%} %> --%>

				</div>

				<br>
				<div class="nickname">
					<div class="info" style="font-size: 13px">
						<br> <br>
						<%=loginUser.getmGrade()%></div><%=loginUser.getNickname()%></div>

				<div class="introduce"
					style="text-align: left; text-weight: normal;"><%=loginUser.getmIntro()%></div>
				<hr>





			</div>
		</div>

	</div>










	<%@include file="../common/footer.jsp"%>
</body>

</html>


