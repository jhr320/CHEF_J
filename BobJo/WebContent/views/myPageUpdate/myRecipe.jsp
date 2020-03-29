<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="attachment.model.vo.*, recipe.model.vo.*,java.util.ArrayList, recipe.model.vo.* "%>
<%
	ArrayList<Attachment> fList = (ArrayList<Attachment>) request.getAttribute("fList");
	ArrayList<Recipe> mrList = (ArrayList<Recipe>) request.getAttribute("mrList");
	
	
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	
/* 	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
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
.mold {
	margin: 10px;
}

.part1, .mypage-contents, .sub-container {
	diplay: inline-block;
	height: 100%;
}

.wholewhole {
	width: 85%;
	height: 1200px;
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

.recipeWrap {
	width: 100%;
	/* margin: auto; */
	text-align: center;
	display: inline-block;
}

.mold {
	/* width:27%;
margin-left:5%;
margin-top:2%;
display:inline-block; */
	display: inline-block;
	float: left;
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



.rWriter {
	width: 100%;
	height: 70%;
	text-align:left;
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

.rName {
	
	width:100%;
	display: inline-block;
	font-size: 25px;
	font-weight: bold;
	text-align:left;
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

.h2 {
	font-weight: 100;
}

/* div {
	border: 1px solid red;
}
 */

.rName a:link, .rName a:visited, .rWirter a:link, .rWriter a:visited {
	color: black;
	text-decoration: none;
}

.rName a:hover, .rWirter a:hover {
	color: rgb(212, 106, 106);
	text-decoration: underline;
}


.contents{
border: 1px solid black;
font-size:15px;
}

.shopping-info{
width:50%;
}


/* 페이징//////////////////// */

.pagingArea {
	margin:1rem;
}

.pagingArea button {
	border-style:none;
	border-radius:0.5rem;
	padding:10px;
	font-weight:700;
	background-color:rgb(212,106,106);
	/* border:1px solid rgb(170,57,57); */
	color:white;
}
</style>
<body>
	<%@include file="../common/menubar.jsp"%>
	<%@include file="../common/bootstrap.jsp"%>

	<br>
	<br>
	<div class="wholewhole">
		<%--메뉴바 포함한 전체 컨텐츠 --%>
		<div class="part1">
			<%--메뉴바 --%>
			<article id="container" class='sub-container' >

				<section class='site-sub-layout'  >
					<nav class="lnb-area">
						<h1 class="subtit-heading" >
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
									<li><a href="<%=request.getContextPath() %>/myBoardlist.mp"> 나의 게시글 </a></li>

									<li><a href="<%=request.getContextPath() %>/myQnalist.mp"> 1:1 문의내역 </a></li>
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
		</div>
		
		<div class="shopping-info" style="float:left; ">
				<div class="area info01" style="float:left; ">
					<p>
						안녕하세요.
						<%=loginUser.getmName()%>님<br> chef J를 이용해주셔서 감사합니다.
					</p>
				</div>

				

			</div>
			
			
			<div class="mainCon" style="float:left; display:inline-block; width:80%; height:90%;">
			<div class="infod" style="float:left;">
			<div class="wrap-profile">
			<h2 class="h2">나의 레시피</h2>
			<p class="desc">내가 작성한 레시피를 볼 수 있습니다.</p>
			
			
			
			
			
			</div>
			
			<div class="recipeWrap" style="float:left;">

					<%
						for (int i = 0; i < mrList.size(); i++) {
					%>
					<%
						if (i % 3 == 0) {
					%>
					<!-- <div class="rowrowrow" style="float:left;"> -->
						<%
							 } 
						%>
						<div class="mold">
							<div class="card shadow-sm">
								<div class="thumbnail" style="height: 200px; width: 300px;">
									<%
										for (Attachment at : fList) {
									%>
									<%
										if (mrList.get(i).getrId().equals(at.getBprcId())) {
									%>

									<a
								href="<%=request.getContextPath()%>/detail.re?rId=<%=mrList.get(i).getrId()%>">
									
									
									<img width=100%, height=100%,
										src="<%=contextPath%>/resources/recipe/<%=at.getfName()%>"></a>

									<%
										}
									%>
									<%
										}
									%>

								</div>
								<div class="card-body">

									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">

											<div class="like">
												<img width=20px, height=20px,
													src="<%=request.getContextPath()%>/resources/images/like.png">
											</div>
											<div class="likenum">&nbsp;</div>
											
										</div>
										<div class="yy">

											<div class="date" id="date1"><%=mrList.get(i).getrDate()%></div>


											<div class="views views" id="views">조회수 :</div>
											<div class="views viewsnum" id="views1"><%=mrList.get(i).getrCount()%></div>

										</div>



									</div>
									<!-- <div class="card shadow-s"></div> -->

									<div class="main">
										<div class="rName">
											<a
								href="<%=request.getContextPath()%>/detail.re?rId=<%=mrList.get(i).getrId()%>"><%=mrList.get(i).getrName()%></a>
										</div>


										<div class="rWriter">
											<a href=""><%=loginUser.getNickname()%></a>
										</div>
										

									</div>

								</div>
							</div>
						</div>


						<%
							if (i % 3 == 2) {
						%>
					<!-- </div> -->
					<%
						}
					%>


					<%
						}
					%>
				</div>
			
			
			
			</div>
			
			</div>
			
			
			
			
		
			
			

	</div>


				<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= contextPath %>/recipelist.mp?&currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
				<button disabled> &lt; </button>
			<% } else { %>
				<button onclick="location.href='<%= contextPath %>/recipelist.mp?&currentPage=<%= currentPage - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button style="background-color:rgb(170,57,57)" disabled> <%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= contextPath %>/recipelist.mp?&currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage == maxPage) { %>
				<button disabled> &gt; </button>
			<% } else { %>
				<button onclick="location.href='<%= contextPath %>/recipelist.mp?&currentPage=<%= currentPage + 1 %>'"> &gt; </button>
			<% } %>
			
			<!--  맨 끝으로 (>>) -->
			<button onclick="location.href='<%= contextPath %>/recipelist.mp?&currentPage=<%= maxPage %>'"> &gt;&gt; </button>
			
		</div>
		
		<br><br>







	<%@include file="../common/footer.jsp"%>
</body>

</html>