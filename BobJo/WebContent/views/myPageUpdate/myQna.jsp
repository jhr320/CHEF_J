<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.ArrayList, qna.model.vo.*, common.vo.* ,java.text.SimpleDateFormat"%>

<% 


ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
System.out.println(list);
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();


SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
String newDateFormat= "";

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
	width: 50%;
	float: left;
}

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
	<%@include file ="../common/menubar.jsp" %>
<%@include file="../common/bootstrap.jsp" %>

<br><br>
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
		<div class="mypage-contents">
			<section class="wrap-shopping-info" >
				
				<div class="shopping-info">
					<div class="area info01">
						<p>
							안녕하세요.
							<%=loginUser.getmName() %>님<br> chef J를 이용해주셔서 감사합니다.
						</p>
					</div>



				</div>
			</section>
			<%--여기서부터 시작 자리 --%>
			
			<div class="wrap-profile" >
				<h2>1:1 문의내역</h2>
				<p class="desc">1:1 문의 내역을 조회할 수 있습니다.</p>
			<div class="">
				<form name="list_frm">
					<table class="common-table2">
						<caption>공지사항</caption>
						<colgroup>
							<col width="73">
							<col width="110" />
							<col width="*">
							<col width="120">
							<col width="95">
						</colgroup>
						<thead>
							<tr>
								<br>
								<br>
								<th scope="col"><strong>번호</strong></th>
								<th scope="col"><strong>카테고리</strong></th>
								<th scope="col"><strong>제목</strong></th>
								<th scope="col"><strong>작성자</strong></th>
								<th scope="col"><strong>작성일</strong></th>
								<th scope="col"><strong>답변여부</strong></th>
							</tr>
						</thead>
						
						
						<%-- <%
							for(int i = 0; i < list.size(); i++){
							%> --%>
						
						
						<tbody>
							<% for(int i = 0; i <list.size();i++){
                        			newDateFormat = simple.format(list.get(i).getqDate());
                        			int num = list.size() - i;%>
								

							<tr>
							
							
							<%
							if(list.get(i).getmNo().equals(loginUser.getmNo())) {
							%>
								<td><%=num %></td>
								
								<td><%=list.get(i).getqCate() %></td>
								<td class="subject">
									<div class="nobr" style="margin-left: 10px;">
										<a href=""><%=list.get(i).getqTitle()%></a>

									</div>
								</td>
								<td class="size_12"><%=list.get(i).getmNo()%></td>
								<td class=" size_12"><%=newDateFormat %></td>
								<td class=" size_12"><%=list.get(i).getaStatus()%></td>
								
								
								<%} %>
							</tr><%} %>
							
							
						</tbody>
					</table>
				</form>
			
			
			</div>
			
			<br>



			<!--페이징 [S]-->
			<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= contextPath %>/myBoardlist.mp?&currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
				<button disabled> &lt; </button>
			<% } else { %>
				<button onclick="location.href='<%= contextPath %>/myBoardlist.mp?&currentPage=<%= currentPage - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button style="background-color:rgb(170,57,57)" disabled> <%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= contextPath %>/myBoardlist.mp?&currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage == maxPage) { %>
				<button disabled> &gt; </button>
			<% } else { %>
				<button onclick="location.href='<%= contextPath %>/myBoardlist.mp?&currentPage=<%= currentPage + 1 %>'"> &gt; </button>
			<% } %>
			
			<!--  맨 끝으로 (>>) -->
			<button onclick="location.href='<%= contextPath %>/myBoardlist.mp?&currentPage=<%= maxPage %>'"> &gt;&gt; </button>
			
		</div>
		</div>

		
		<!-- 메인 컨텐츠 [E] -->
	</div>
	</section>
	</article>
	
	


		</div>

		</div>




	


		<%@include file="../common/footer.jsp"%>
</body>

</html>