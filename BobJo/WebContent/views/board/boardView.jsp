<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,post.model.vo.Post, common.vo.* ,java.text.SimpleDateFormat"%>


<%
	ArrayList<Post> list = (ArrayList<Post>) request.getAttribute("list");
	int typeOfBoard = Integer.parseInt(request.getParameter("type"));

	String boardTitle = "";
	if (typeOfBoard == 1) {
		boardTitle = "자유 게시판";
	} else if (typeOfBoard == 2) {
		boardTitle = "요리 게시판";
	} else {
		boardTitle = "공지사항";
	}
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
<%@ include file="../../views/common/bootstrap.jsp"%>

<style>
.board-post {
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: 500px;
	text-align: center;
	padding-right: 20%;
	padding-left: 20%;
}

.board-post-list {
	float: left;
	margin-top: 10px;
}

.board-postnav-side {
	width: 10%;
	height: 350px;
	float: left;
	margin: 10px;
	background-color: rgb(255, 243, 239);
	border: 1px solid black;
}

.board-postnav-side>ul>li>a {
	color: black;
}

.board-postnav-side>ul>li>a:hover {
	color: red;
}

.board-postnav-side>ul>li:hover {
	background-color: lightgrey;
}

.mycolSize {
	width: 70%;
}

.mycolSize2 {
	width: 10%;
}

.titles {
	width: 100px;
}

.boardTItle {
	display: inline-block;
	font-size: 1.5em;
}

.text-left {
	text-align: left;
	width: 20%;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
}

.postRow:hover {
	background-color: rgb(255, 243, 239);
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="../common/menubar.jsp"%>
<body>

	<div class="board-post">




		<!-- 게시판 & 네비게이션 -->
		<div style="width: 100%;">

			<!-- 게시판이 있다면  -->
			<%
				if (list != null) {
			%>
			<!-- 네비게이션 -->



			<!-- 게시판 글 -->
			<div class=" board-post-list table-responsive"">
				<table class="table table-sm" border="1">
					<caption id="boardTypeTitle"><%=boardTitle%></caption>
					<thead>
						<tr>
							<th colspan="4" id="boardTypeTitle"><%=boardTitle%></th>
						</tr>
						<tr>
							<th scope="col" style="width: 7%;">번호</th>
							<th class="mycolSize" scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < list.size(); i++) {
									newDateFormat = simple.format(list.get(i).getpDateWritten());
									int num = i + ((currentPage - 1) * 10) + 1;
						%>
						<tr class="postRow">
							<td style="width: 7%;" id="<%=list.get(i).getpId()%>"><%=num%></td>
							<td class="mycolSize"><%=list.get(i).getpTitle()%></td>
							<td class="mycolSize2"><%=list.get(i).getpWriter()%></td>
							<td class="mycolSize2"><%=newDateFormat%></td>
						</tr>
						<%
							}
						%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">

								<nav aria-label="..." style="display: inline-block;">

									<ul class="pagination pagination-sm  justify-content-center"
										style="margin: 0;">



										<!-- 이전 페이지로 (<) -->
										<%
											if (startPage == 1) {
										%>
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1">Previous</a></li>
										<%
											} else {
										%>
										<li class="page-item"><a class="page-link"
											href='<%=request.getContextPath()%>/board.list?currentPage=<%=startPage - 1%>&typeOfBoard=<%=typeOfBoard%>'
											tabindex="-1">Previous</a></li>

										<%
											}
										%>
										<!-- 이전 페이지로  끝 -->




										<!--  페이지 목록 -->
										<%
											for (int p = startPage; p <= endPage; p++) {
										%>
										<%
											if (p == currentPage) {
										%>
										<li class="page-item active pageNum"><a
											class="page-link pageList"
											href='<%=request.getContextPath()%>/board.list?currentPage=<%=p%>&typeOfBoard=<%=typeOfBoard%>'><%=p%></a>
										</li>
										<%
											} else {
										%>
										<li class="page-item pageNum"><a
											class="page-link pageList"
											href='<%=request.getContextPath()%>/board.list?currentPage=<%=p%>&typeOfBoard=<%=typeOfBoard%>'><%=p%></a>
										</li>
										<%
											}
										%>
										<%
											}
										%>
										<!--  페이지 목록 끝 -->




										<!-- 다음 페이지로(>) -->
										<%
											if (endPage == maxPage) {
										%>
										<li class="page-item disabled"><a class="page-link "
											href="#" tabindex="-1">Next</a></li>
										<%
											} else {
										%>
										<li class="page-item"><a class="page-link "
											href='<%=request.getContextPath()%>/board.list?currentPage=<%=endPage + 1%>&typeOfBoard=<%=typeOfBoard%>'>Next</a>
										</li>

										<%
											}
										%>
										<!-- 다음페이지 끝 -->

									</ul>
								</nav> <%
 	if (loginUser != null) {
 %>
								<button class="btn" type="button"
									style="float: right; background-color: rgb(170, 57, 57); color: white"
									onclick="location.href = '<%=request.getContextPath()%>/views/post/postUpdate.jsp?pId=create&typeOfBoard=<%=typeOfBoard%>'">글쓰기</button>
								<%
									}
								%>
							</td>

						</tr>
					</tfoot>
				</table>
			</div>
			<!-- 게시판이 없다면  -->
			<%
				} else {
			%>
			<p>게시글 없음</p>
			<%
				}
			%>
		</div>

	</div>

	<script>
     	
    	  $(function(){
    		$(".pageList").click(function(){
    			var page = $(this).text();
             
    		})	
    		
    		 $(".postRow").click(function(){
                   $(this).each(function() {
                         var index = $(this).children().first().attr('id'); 
                         console.log(index);
                        goPost(index)
                    });
    		})	
    		
    	})
    	function goPost(index){
      		  location.href="<%=request.getContextPath()%>/post.view?typeOfBoard=<%=typeOfBoard %>&pId="+index;

		}
	</script>
</body>
</html>