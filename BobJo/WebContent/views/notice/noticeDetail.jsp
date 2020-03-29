<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.Notice, java.text.SimpleDateFormat"%>
<%
	Notice n = (Notice) request.getAttribute("n");
	Member userID = (Member) session.getAttribute("loginUser");

	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	String newDateFormat = simple.format(n.getnDate());

	String writer = "Na";
	String id = "noIDNA";
	if (userID != null) {
		writer = n.getmNo();// 이거는 qna에 저장된 아이디
		id = userID.getmId(); //이거는 지금 로그인세션 아이디
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	margin: auto;
}

.outer_m {
	display: block;
	width: 1050px;
	height: auto;
	/* border: 1px solid red; */
	margin: auto;
}

.board-post {

	display:inline-block;
	width: 100%;
	height: auto;
	padding: 0px;
	margin: 0px;
	/* text-align: center; */
	/* border: 1px solid green; */
	margin: auto;
}

.board-post-list {
	width: 100%;
	float: left;
	margin-top: 10px;
}

.titles {
	width: 100px;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
	padding-left: 10%;
	padding-right: 10%;
}

.profilePic {
	width: 150px;
	height: 150px;
}

.firstCols {
	width: 100px;
}
.table-sm{
border-top: 2px solid rgb(170, 57, 57);
	border-bottom: 1px solid rgb(170, 57, 57);
	border-left: none;
	border-right: none;
	margin:0px !important;
	margin-bottom:20px !important;
		
}
.table-sm th{
background: #f9f9f9;
padding-left: 20px !important;
height: 50px;
font-size: 12px;
vertical-align:middle !important;

}
.table-sm td:not(.contentArea){
	border-left: none;
	border-right: none;
	vertical-align:middle !important;
	font-size: 12px;
	height: 35px;
padding-left: 20px !important;
}
.contentArea{
font-size: 12px;
padding: 20px !important;
}

#ListMenu{
background:rgb(170, 57, 57);
 width: 150px;
 height: 50px;
 border-radius: none !important;
}
#ListMenu:hover{
background:rgb(200, 70, 70);
 width: 150px;
 height: 50px;
}

#EditList{
background:rgb(170, 57, 57);
 width: 150px;
 height: 50px;
 border-radius: none !important;
}
#EditList:hover{
background:rgb(200, 70, 70);
 width: 150px;
 height: 50px;
}
</style>
</head>
<body>
	<%@ include file="../../views/common/bootstrap.jsp"%>
	<%@ include file="../common/menubar.jsp"%>

	<div class="outer_m" style="margin: auto !important;">

			<div class="board-post">
				<div class="sub_text_area" style="diplay:inline-block; width: 100%;/*  border:1px solid black; */">				
					<p style="font-size: 16px; font-weight: 900; text-align: left; line-height:'2';/*  border:1px solid black;  */margin-top:20px; margin-bottom:20px;">
					공지사항</p>
				</div>
				<!-- 게시판 글 -->
				<div class=" board-post-list">
					<table class="table table-sm">
						<tbody>
							<tr>
								<th class="thTitle firstCols"  style="vertical-align:middle;">제목</th>
								<td colspan="3"><%=n.getnTitle()%></td>
							</tr>

							<tr>
								<th class="thWriter">작성자</th>
								<%-- <td><%=n.getmNo() %></td> --%>
								<td colspan="3">ChefJ</td>
							</tr>

							<tr>
								<th class="thDate">작성일</th>
								<td><%=n.getnDate()%></td>
								<th class="thCount">조회수</th>
								<td><%=n.getnCount()%></td>
							</tr>
							<tr>
								<td colspan="4" class="contentArea" style="height: 500px;"><%=n.getnContent()%></td>
							</tr>
						</tbody>


						<!-- 댓글 -->
						<tfoot>

							<tr>
								<td colspan="4">
									<button class="btn" type="button"
										style="float: right; background-color: rgb(170, 57, 57); color: white"
										id="ListMenu" onclick="location.href='list.no'">목록</button>

									<%-- 									<%// 사용자가 로그인시
									if (userID != null){ %>
										<button class="btn" type="button" style="float: right; background-color: rgb(170, 57, 57); color: white"
									id="CreateNew">글쓰기</button>
									<%}%> --%> <%
 	// 로그인유저 == 글작성자일 때 
 	if (writer.equals(id)) {
 %>
									<button class="btn" type="button"
										style="float: right; background-color: rgb(170, 57, 57); color: white"
										id="EditList">수정하기</button> <%
 	}
 %>
								</td>
							</tr>

						</tfoot>
					</table>



				</div>

		</div>
	</div>




	<script>
  		
  		$(function(){	
  		// 더보기 jquery
  			$("#moreID").click(function(){
  				
  				if($(".commentShow").length == 0)
  					{	
  						$("#moreID").remove();
  					}
  				for( i = 0; i < 5;i++){
  					
  					
  					$(".commentShow").first().removeClass("commentShow");	
  					if($(".commentShow").length == 0)
  					{	
  						$("#moreID").remove();
  						break;
  					}
  				}
  			})	
  			
  			$("#EditList").click(function(){
  				location.href = "<%=request.getContextPath()%>/updateForm.no?nId="+"<%=n.getnId()%>";
  				
  			})
  			<%-- $("#ListMenu").click(function(){
  				location.href = "<%=request.getContextPath()%>/";
  			}) --%>
  			$("#CreateNew").click(function(){
  				location.href = "<%=request.getContextPath()%>/views/qna/qnaInsert.jsp"
  			})
  		})
  		
  	</script>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>