<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, member.model.vo.Member, order.model.vo.Order, common.vo.* ,java.text.SimpleDateFormat"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	System.out.println("회원정보 리스트 : "+list);

	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	String newDateFormat = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

/*/////////// 사이드메뉴 */
.adminMember_link {
	background: #f9f9f9;
	color: rgb(170, 57, 57) !important;
}
.adminMember_link a{
color:rgb(170, 57, 57) !important;
}
.outer_m {
	display: block;
	width: 1050px;
	height: 800px;
	/* border: 1px solid red; */
	margin: auto;
}

/*사이드메뉴 영역*/
.content1 {
	width: 25%;
	height: 100%;
	display: inline-block;
	float: left;
	/* border: 1px solid green; */
}

/*////////////본문영역*/
.content2 {
	width: 75%;
	height: 100%;
	display: inline-block;
	float: left;

	/* border:1px solid black; */
}

.memberAdmin_txt {
	font-size: 20px;
	font-weight: 700;
}
.side_txt_div1 {
	padding: 15px 5px 5px 5px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}


.board-postnav-side {
	width: 90%;
	height: 350px;
	margin: auto;
	background-color: white;
	border: 1px solid lightgrey;
	font-size: 14px;
}

.board-postnav-side>ul li {
	height: 50px;
	border-bottom: 1px solid lightgrey !important;
	line-height: 2;
}
.board-postnav-side>ul>li>a {
	color: black;
}
.board-postnav-side>ul>li>a:hover {
	background-color: #f9f9f9 !important;	
	color: rgb(170, 57, 57);
}

.board-postnav-side>ul>li:hover {
	background-color: #f9f9f9 !important;
	color: rgb(170, 57, 57);
}


/* 게시판부분 */
.board-post {
	display: inline-block;
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: auto;
	text-align: center;
	padding-right: 5%;
	padding-left: 5%;
	/* border:1px solid blue; */
}
/* 보드포스트 안쪽 div */
.board-post-list {
	float: left;
	margin-top: 10px;
	margin-bottom: 10px;
	/* border: 1px solid red; */
}

.postRow:hover {
	background-color: rgb(255, 243, 239);
}

.side_txt_div1 {
	padding: 15px 5px 5px 5px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}

.table-sm {
	border-top: 2px solid rgb(170, 57, 57) !important;
	border-bottom: 1px solid rgb(170, 57, 57);
	border-left: none;
	border-right: none;
	/* line-height: 2; */
	padding: 0px !important;
	margin: 0px !important;
}

.table-sm th {
	background: #f9f9f9;
	border-bottom: 1px solid rgb(170, 57, 57) !important;
	border-left: none;
	border-right: none;
	font-size: 12px;
	height: 50px;
	vertical-align: middle !important;
}

.table-sm td {
	border-left: none;
	border-right: none;
	border-top: none !important;
	border-bottom: 1px solid lightgrey !important;
	font-size: 12px;
	height: 35px;
	vertical-align: middle !important;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
}
/*/////////// 페이지 스타일 */
.pagingDiv {
	display: inline-block;
	/* border: 1px solid red; */
	width: 100%;
}

.page-link {
	color: rgb(170, 57, 57) !important;
}

.page-link:toggle {
	background: rgb(170, 57, 57);
}

.page-item.active .page-link {
	background: rgb(170, 57, 57) !important;
	color: white !important;
	border: 1px solid rgb(170, 57, 57) !important;
}


</style>
</head>
<body>
	<%@ include file="../common/bootstrap.jsp"%>
	<%@ include file="../common/menubar.jsp"%>

	<!-- 전체영억 -->
	<div class="outer_m">
		<!-- 사이드메뉴 영역-->
		<div class="content1">
			<% if(loginUser == null){ %>
			<div class="side_txt_div1">
				<p class="side_txt">고객센터</p>
			</div>
			<%} else{%>
			<% if(loginUser.getmId().equals("admin")){ %>
			<div class="side_txt_div1">
				<p class="side_txt">관리센터</p>
			</div>
			<%}else{ %>
			<div class="side_txt_div1">
				<p class="side_txt">고객센터</p>
			</div>
			<%} %>
			<%} %>

			<div class="side_menu_div2">
				<div class="board-postnav-side">
					<ul class="nav flex-column " id="sidebar">
						<li class="nav-item  border border-light notice_link"
							onclick="goNoticeList()"><a class="nav-link active">공지사항</a>
						</li>
						<li class="nav-item border border-light question_link"
							onclick="goQnaList()"><a class="nav-link question_a">1:1문의
								내역</a></li>
						<%if (loginUser != null && loginUser.getmId().equals("admin")) {%>
						<!--  탈퇴, 등급변경, 회원정보세부내용확인 -->
						<li class="nav-item border border-light"><a class="nav-link"
							href="<%=request.getContextPath() %>/memberList.admin">회원관리</a></li>
							
						<%-- <li class="nav-item border border-light"><a class="nav-link"
							href="<%=request.getContextPath() %>/OrderList.admin">주문관리</a>
							</li><!-- 주문내역확인, 월별 매출확인 --> --%>
							<li class="nav-item border border-light"><a class="nav-link"
							href="<%=request.getContextPath() %>/views/admin/orderAdmin.jsp">주문관리</a>
							</li><!-- 주문내역확인, 월별 매출확인 -->
							
							
						<li class="nav-item border border-light"><a class="nav-link"
							href="#">상품관리</a></li><!-- 상품등록(사진필요),삭제 재고변경, 추천상품선택 -->
							
						<li class="nav-item border border-light"><a class="nav-link"
							href="#">게시글관리(자유, 후기, 레시피)</a></li>

						<%}%>

					</ul>
				</div>
			</div>
		</div>

		<script>
	function goQnaList(){
		<%if(loginUser!= null){%>
			location.href="<%=request.getContextPath()%>/list.qna";
			
		<%}else{%>
			alert("로그인하셔야 본 서비스를 이용할 수 있습니다.");
			location.href="<%=request.getContextPath()%>/views/member/memberLoginForm.jsp";
		<%}%>
	};
	
	function goNoticeList(){
			location.href="<%=request.getContextPath()%>/list.no";
	};
</script>


		<!-- content2 -->
		<div class="content2">

			<div class="board-post">
				<div class="sub_text_area"
					style="diplay: inline-block; width: 100%;">
					<p
						style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
						회원관리</p>
				</div>

				<div>
					<select>
						<option>회원번호순</option>
						<option>가입일순</option>
						<option>등급순</option>
						<option>구매금액순</option>
					</select>

				</div>
				<!-- 게시판 헤더 -->
				<div class=" board-post-list table-responsive" style="margin: 0px;">
					<form method="get">
						<table class="table table-sm" border="1">

							<thead>
								<tr>
									<th class="thNum" scope="col">회원번호</th>
									<th class="thTitle" scope="col">아이디</th>
									<th class="thName" scope="col">이름</th>
									<th class="thWriter" scope="col">회원등급</th>
									<th class="thEntdate" scope="col">가입일</th>
									<th class="thDate" scope="col">마지막접속</th>
									<th class="thStatus" scope="col">상태</th>
									<th class="thMoney" scope="col">총구매금액</th>
									<th class="thChk">선택<input type="checkbox"
										class="AllCheck"></th>
									<!-- (총 7열) order vo에 회원번호랑 누적금액담고 등급, 상태, 아이디는 멤버 vo에 담고..둘다가져와야됨-->
								</tr>
							</thead>
							<!-- 멤버가 있다면  -->
							<%if (list != null) {%>
							<tbody>
								<%for (int i = 0; i < list.size(); i++) {
								newDateFormat = simple.format(list.get(i).getmEntDate());
								int num = list.size() - i;
							%>
								<tr class="postRow">
									<td class="tdNum" id="<%=list.get(i).getmNo()%>"><%=list.get(i).getmNo()%></td>
									<td class="tdTitle"><%=list.get(i).getmId()%></td>
									<td class="tdmNo"><%=list.get(i).getmName()%></td>
									<%-- <td class="tdmNo"><%=list.get(i).getmNo()%></td> --%>
									<td class="tdGrade"><%=list.get(i).getmGrade()%>
									<select name="m_grade" class="m_grade">
											<option value="<%=list.get(i).getmGrade()%>">현재:<%=list.get(i).getmGrade()%></option>
											<option value="골드">골드</option>
											<option value="실버">실버</option>
											<option value="브론즈">브론즈</option>
									</select>
									</td>
									<td class="tdEntdate"><%=list.get(i).getmEntDate() %></td>
									<td class="tdOutdate"><%=list.get(i).getmOutDate() %></td>
									<%if(list.get(i).getmStatus().equals("Y")){ %>
									<td class="tdStatus">활동</td>
									<%}else{ %>
									<td class="tdStatus">탈퇴</td>
									<%} %>
									<!-- ////////////// -->
									<td class="tdCount">0</td>
									<td class="tdChk"><input type="checkbox" name="chkmNo"
										value="<%=list.get(i).getmNo()%>"
										class="<%=list.get(i).getmNo()%>"></td>
								</tr>
							</tbody>

							<%}
						}else {%>
							<!-- 게시판이 없다면 -->
							<tbody>
								<tr>
									<td colspan="5">
										<p>회원없음</p>
									</td>
								</tr>
							</tbody>
							<%}%>

							<tfoot>
								<tr>
									<td colspan="5"></td>
								</tr>
							</tfoot>
						</table>
<!-- //////////////////////////////////////////////////////////////////////////////////// -->
						<select name="status">
						<option value="N">탈퇴</option>
						<option value="Y">계정복구</option>
						</select>
						<button class="btn outBtn" type="submit"
							style="float: right; background-color: rgb(170, 57, 57); color: white"
							formaction="<%=request.getContextPath() %>/delete.admin"
							>변경</button>
							

					</form>
<script>
$(".m_grade").change(function(){
	var m_grade=$(this).val();
	console.log(m_grade);
	var mNo=$(this).parent().parent().children().first().attr('id');
	console.log(mNo);
	location.href="<%=request.getContextPath() %>/updateGrade.me?mNo=" + mNo+"&m_grade="+m_grade;
});
</script>

				</div>
				<!-- ///////////////////////페이징 -->
			<div class="pagingDiv">
				<!-- 페이징구역 -->
				<nav aria-label="..."
					style="display: inline-block; margin-top: 10px; margin-bottom: 10px;"
					class="paging_nav">
					<ul class="pagination pagination-sm  justify-content-center"
						style="margin: 0;">

						<!-- 이전 페이지로 (<) -->
						<%if (currentPage == 1) {%>
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1">Previous</a></li>
						<%} else {%>
						<li class="page-item"><a class="page-link"
							href='<%=request.getContextPath()%>/memberList.admin?currentPage=<%=currentPage - 5%>'
							tabindex="-1">Previous</a></li>
						<%}%>
						<!-- 이전 페이지로  끝 -->

						<!--  페이지 목록 -->
						<%for (int p = startPage; p <= endPage; p++) {%>
						<%if (p == currentPage) {%>
						<li class="page-item active"><a class="page-link pageList"
							href='<%=request.getContextPath()%>/memberList.admin?currentPage=<%=p%>'><%=p%></a>
						</li>
						<%} else {%>
						<li class="page-item "><a class="page-link pageList"
							href='<%=request.getContextPath()%>/memberList.admin?currentPage=<%=p%>'><%=p%></a>
						</li>
						<%}
							}%>
						<!--  페이지 목록 끝 -->

						<!-- 다음 페이지로(>) -->
						<%if (endPage == maxPage) {%>
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1">Next</a></li>
						<%} else {%>
						<li class="page-item"><a class="page-link"
							href='<%=request.getContextPath()%>/memberList.admin?currentPage=<%=currentPage + 5%>'>Next</a>
						</li>
						<%}%>
						<!-- 다음페이지 끝 -->
					</ul>
				</nav>
			</div>
			<!-- 페이징구역 끝-->
			</div>


			
		</div>

	</div>


	<%@ include file="../common/footer.jsp"%>
</body>
</html>