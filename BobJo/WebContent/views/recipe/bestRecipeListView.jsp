<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,attachment.model.vo.*, recipe.model.vo.*"%>

<%
	ArrayList<Attachment> fList = (ArrayList<Attachment>) request.getAttribute("fList");
	ArrayList<Recipe> reList = (ArrayList<Recipe>) request.getAttribute("reList");
	//좋아요 한 애
	ArrayList<String> L_rId = (ArrayList<String>) request.getAttribute("L_rId");
	System.out.println(L_rId);
    

	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>Insert title here</title>
<style>
div {
	/*  border: 1px solid red;  */
	
}

.recipeWrap {
	width: 100%;
	/* margin: auto; */
	text-align: center;
	display: inline-block;
}

.contentsMain {
	margin-top: 4%;
	margin-bottom: 3%;
	margin-left: 10%;
	/* position: relative; */
	margin: auto;
	width: 90%;
	/* 	border: 1px solid green; */
	box-sizing: border-box;
}

.mold {
	/* width: 20%; */
	/* 	margin-left: 2%; */
	/* margin: 35px */;
	display: inline-block;
	float: left;
}

.likenum, .qnanum {
	width: 50px;
	height: 30px;
}

.name {
	width: 100%;
	height: 30%;
}

.rWriter {
	width: 100%;
	height: 70%;
}

.card-body {
	border-radius: 5px;
}

.yy {
	font-size: 12px;
	text-align: right;
	color: #999999;
}

.views {
	display: inline-block;
}

.recipe {
	display: inline-block;
}

.rName {
	height: 100%;
	width: 100%;
	display: inline-block;
	font-size: 25px;
	font-weight: bold;
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

.dropdown {
	float: left;
}

.btn {
	background-color: white;
	border: rgb(257, 157, 157) solid 1px;
	color: rgb(257, 157, 157);
}

.rowrow {
	width: 100%;
	box-sizing: border-box;
	margin-bottom: 1.5rem;
}

.rName a:link, .rName a:visited, .rWirter a:link, .rWriter a:visited {
	color: black;
	text-decoration: none;
}

.rName a:hover, .rWirter a:hover {
	color: rgb(212, 106, 106);
	text-decoration: underline;
}

.at {
	width: 100%;
	height: 100%;
}

#dropdownMenuButton {
	background-color: white;
	border: rgb(257, 157, 157) solid 1px;
	color: rgb(257, 157, 157);
}

.dropdown {
	float: right;
}

.like .heartBtn:hover {
	cursor: pointer;
}

.card:hover {
	outline: 2px solid rgb(257, 157, 157);
	opacity: 0.7;
}

.heartBtn {
	width: 30px;
	height: 30px;
	background:
		url('<%=request.getContextPath()%>/resources/images/like.png')
		no-repeat;
	background-size: 30px 30px;
	border: none;
	cursor: pointer;
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
</head>
<body>
	<%@ include file="../common/bootstrap.jsp"%>
	<%@ include file="../common/menubar.jsp"%>

	<main role="main"> 
	<br>
	<div class="contentsMain">

		<!-- <div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">정렬 기준</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">최신순</a> <a class="dropdown-item"
					href="#">좋아요순</a> <a class="dropdown-item" href="#">댓글순</a>
			</div>
		</div> -->
		<br> <br> <br>






		<div class="recipeWrap">
			<!-- 리스트 전체 테두리 -->
			<%
				for (int i = 0; i < reList.size(); i++) {
			%>
			<%
				if (i % 4 == 0) {
			%>
			<div class="row">
				<!-- 한 행(레시피 4개씩 들어갈 예정) -->
				<%
					}
				%>

				<div class="mold col-3" style="margin-top: 10px">
					<!-- 레시피 하나 -->

					<div class="card mb-3 shadow-sm">

						<div class="thumbnail" style="height: 300px;">

							<%
								for (Attachment at : fList) {
							%>
							<%
								if (reList.get(i).getrId().equals(at.getBprcId())) {
							%>
							<a
								href="<%=request.getContextPath()%>/detail.re?rId=<%=reList.get(i).getrId()%>"><img
								src="<%=contextPath%>/resources/recipe/<%=at.getfName()%>"
								style="width: 100%; height: 100%"></a>
							<%
								}
							%>
							<%
								}
							%><!-- at for문 끝 -->
						</div>

						<!-- ///////////////////////////////////////레시피 카드 -->
						<div class="card-body" style="padding: 10px;">

							<div class="d-flex justify-content-between align-items-center">

								<div class="btn-group">


									<div class="like" id="like">
										<!-- /////////////////////////////////////////// -->
										<%
											if (L_rId != null) {
										%>
										<%
											boolean flag = false;
													for (int j = 0; j < L_rId.size(); j++) {
														if (L_rId.get(j).equals(reList.get(i).getrId()))
															flag = true;
													}
										%>

										<%
											if (flag) {
										%>
										<button class="heartBtn fulllike"
											id="btn<%=reList.get(i).getrId()%>"
											style="background:url('<%=request.getContextPath()%>/resources/images/fulllike.png') no-repeat; background-size:30px">
											<!--  onclick="like(this);" -->
										</button>
										<%
											} else {
										%>
										<button class="heartBtn like"
											id="btn<%=reList.get(i).getrId()%>"
											style="background:url('<%=request.getContextPath()%>/resources/images/like.png') no-repeat; background-size:30px">
										</button>
										<%
											}
										%>
										<%
											} else {
										%>
										<button class="heartBtn like"
											id="btn<%=reList.get(i).getrId()%>"
											style="background:url('<%=request.getContextPath()%>/resources/images/like.png') no-repeat; background-size:30px"></button>
										<%
											}
										%>

										<%-- 	<form id="like_form">
										<table id="list" style="border:1px solid red;">
										<input type="hidden" name="command" value="like_it">
										<input type="hidden" name="rId" value="${rId}">
										<tr><input type="button" value="좋아요!" onclick="return like()" > </tr>
										<tr><div id="like_result"><%=rList.get(i).getr`() %></div> </tr>
										</table>
										</form> --%>

									</div>
									<!-- 좋아요 숫자 -->
									<div class="likenum" id="like<%=reList.get(i).getrId()%>"
										style="text-align: left;">
										&nbsp;

										<%=reList.get(i).getrLike()%>



									</div>
									<div class="qna" id="qna1">
										<%-- <img width=20px, height=20px,
											src="<%=request.getContextPath()%>/resources/images/speech-bubble.png"> --%>
									</div>
									<div class="qnanum" id="qnanum1"></div>
								</div>
								<div class="yy">

									<div class="date" id="date1"><%=reList.get(i).getrDate()%></div>


									<div class="views" id="views">조회수 :</div>
									<div class="views viewsnum" id="views1"><%=reList.get(i).getrCount()%></div>

								</div>

							</div>
							<!-- <hr> -->

							<div class="main" style="text-align: left;">
								<div class="rName">
									<a href=""><%=reList.get(i).getrName()%></a>
								</div>


								<div class="rWriter">
									<a href=""><%=reList.get(i).getmNo()%></a>
								</div>


							</div>

						</div>
						<%-- card-body 끝 --%>

					</div>

				</div>
				<%--mold 끝 --%>


				<%
					if (i % 4 == 3) {
				%>
			</div>
			<%
				}
			%>
			<%
				}
			%>
			<!-- 레시피 불러오는 for문 끝 -->

		</div>

		<%-- <script>
		
		

		
		state=0;
	
			$(".heart").click(function(){
				var i = $(this).attr("id").substring(5); 
				
				if(state==0){
					state=1;
					$("#heart"+i).attr('src','<%=request.getContextPath()%>/resources/images/fulllike.png');
					
					console.log(state);
				}else{
					state=0;
					$("#heart"+i).attr('src','<%=request.getContextPath()%>/resources/images/like.png');
					console.log(state);
				}
			});

		
	

		
	
		</script> --%>

		<%-- <script>
		$(function(){
			var i = $(".heart").attr("id").substring(5);
			/* var isLike = false; */
			
			$("#heart"+i).click(function(){
				var rId = $("rId");
				
				$.ajax({
					url : "<%=request.getContextPath()%>/like.re",
					type : "post",
					dae : {rId:rId},
					success : function(data){
						$(this).attr('src','<%=request.getContextPath()%>/resources/images/fulllike.png');
					}
				});
			});
			
		});
		
	
		</script> --%>
		<!-- <script>
		$(".heartBtn").click(function(){
			var i = $('.heartBtn').attr("id").subString(5);
			
			
			
			$.ajax({
				url : "like.re",
				data : {rId : rId,
						userId : userId,
						rLike : rLike},
				type : "post",
				success : function(re){
					console.log(re);
				
				}
			
			});
			
			
			
		});
		
		
		</script> -->
		<script>
		
		//rId와 특정 좋아요 버튼
	
		$("button").click(function(e){
			var rId = $(this).attr('id').substring(3);
						
			<%if (loginUser != null) {%>
			
			//var rId = e.id.substring(3);
			//console.log($("#btn"+rId).css("background"));
			if($("button[class=like]")){
				console.log("여기는 빈 하트 눌렀을때 오는곳");
				$.ajax({
				url: "like.re",
				type: "POST",
				data: {rId :rId},
				
				success:function(data){ 
					
					$(this).css({"background":"url('<%=request.getContextPath()%>/resources/images/fulllike.png') no-repeat", "background-size":"30px"})
					alert("'좋아요'가 반영되었습니다!") ;
					alert(data); 
				
					
					//하트채움
					$("#like"+rId).html("&nbsp;"+data);
					$("#btn"+rId).css({"background":"url('<%=request.getContextPath()%>/resources/images/fulllike.png') no-repeat", "background-size":"30px"});
					
					click_flag=true;
					
					
				},
				error:function (request, status, error){
					alert("ajax실패");
					
				}
				
			});
			}
			else
			if($("button[class=fulllike]")){
				console.log("여기는 클릭된 하트 다시눌렀을때 오는곳");
				$.ajax({
					url : "dislike.re",
					type : "post",
					data : {rId : rId},
					success : function(data){
						alert("'좋아요'가 취소되었습니다!");
						alert(data);
						$(this).css({"background":"url('<%=request.getContextPath()%>/resources/images/like.png') no-repeat", "background-size":"30px"});
						
						$("#like"+rId).html("&nbsp;"+data);
						$("#btn"+rId).css({"background":"url('<%=request.getContextPath()%>/resources/images/like.png') no-repeat", "background-size":"30px"});
						
					},error:function(request,status,error){
						alert("ajax 실패");
					}
				});
				
				
				
				}
			
		<%} else {%>
			alert('로그인을 해주세요');
			location.href="<%=contextPath%>
			/views/member/memberLoginForm.jsp";
		<%}%>
			});
		</script>
		<%-- <script>
		function dislike(e){
			
			var rId = e.id.substring(3);
			$.ajax({
				url: "dislike.re",
				type: "POST",
				data: {rId :rId},
				
				success:function(data){ 
					
					alert("'좋아요'가 취소되었습니다.") ;
					alert(data); 
				
					
					
					$("#like"+rId).html("&nbsp;"+data);
					$("#btn"+rId).css({"background":"url('<%=request.getContextPath()%>/resources/images/like.png') no-repeat", "background-size":"30px"});
					
					
					
					
				},
				error:function (request, status, error){
					alert("ajax실패");
					
				}
			});
			
		}
		
		
		
		</script> --%>


		
	
				<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= contextPath %>/bestList.re?&currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전 페이지로 (<) -->
			<% if(currentPage == 1){ %>
				<button disabled> &lt; </button>
			<% } else { %>
				<button onclick="location.href='<%= contextPath %>/bestList.re?&currentPage=<%= currentPage - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button style="background-color:rgb(170,57,57)" disabled> <%= p %></button>
				<% } else { %>
					<button onclick="location.href='<%= contextPath %>/bestList.re?&currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로(>) -->
			<% if(currentPage == maxPage) { %>
				<button disabled> &gt; </button>
			<% } else { %>
				<button onclick="location.href='<%= contextPath %>/bestList.re?&currentPage=<%= currentPage + 1 %>'"> &gt; </button>
			<% } %>
			
			<!--  맨 끝으로 (>>) -->
			<button onclick="location.href='<%= contextPath %>/bestList.re?&currentPage=<%= maxPage %>'"> &gt;&gt; </button>
			
		</div>
		
		<br><br>


	</div>

	</main>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<%@include file="../common/footer.jsp"%>
</body>
</html>