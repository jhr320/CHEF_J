<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,post.model.vo.Post, reply.model.vo.*, java.text.SimpleDateFormat"%>


<%
	int type = Integer.parseInt(request.getParameter("typeOfBoard"));
	Post p = (Post) request.getAttribute("post");
	ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("commentList");
	int index = list.size();
	Member userID = (Member) session.getAttribute("loginUser");
	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
	String newDateFormat = simple.format(p.getpDateWritten());
	String writer = "Na";
	String id = "noIDNA";
	if (userID != null) {
		writer = p.getpWriter();
		id = userID.getmNo();
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../common/quillAPI.jsp"%>
<style>
.board-post {
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: 500px;
	padding-top: 5%;
	padding-left: 25%;
	padding-right: 25%
}

.btnColor {
	background-color: rgb(170, 57, 57) ! important;
}

.board-post-list {
	width: 100%;
	float: left;
	margin-top: 10px;
}

.board-postnav-side {
	width: 20%;
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
	padding-left: 10%;
	padding-right: 10%;
}

.commentBox {
	width: 100%;
}

.th {
	background-color: lightblue;
}

tbody>tr:nth-child(2) {
	box-shadow: 0 0 0 1px lightgrey;
	border-radius: 3px;
}

tfoot>tr {
	box-shadow: 0 0 0 1px lightgrey;
	border-radius: 3px;
}

.commentShow {
	display: none !important;
}

.profilePic {
	width: 150px;
	height: 150px;
}

.login_form {
	width: 100% !important;
	height: 300px;
	/* background:green; */
	margin: auto;
	padding: 10px;
	/* border:1px solid black; */
}

.sub_title {
	font-size: 20px;
	font-weight: 900;
}

.inputform {
	width: 100% !important;
	height: 50px;
	border-radius: 3px;
	width: 280px;
	padding: 0 10px 0 10px;
	border: 1px solid lightgrey;
	font-size: 12px;
}

.find_txt {
	text-decoration: none;
	font-size: 12px;
	text-align: right;
	color: black;
}

.find_txt:hover {
	text-decoration: none;
	color: black;
}

.line {
	font-size: 10px;
	color: black;
}

.login_btn {
	width: 100% !important;
	height: 50px;
	border-radius: 3px;
	border: none;
	background: rgb(170, 57, 57);
	color: white;
}

.join_btn {
	width: 100% !important;
	height: 50px;
	border-radius: 3px;
	border: none;
	border: 1px solid rgb(170, 57, 57);
	background: white;
	color: rgb(170, 57, 57);
}

.media-body {
	height: 96px !important;
}
</style>
<body>

	<%@ include file="../common/bootstrap.jsp"%>
	<%@ include file="../common/menubar.jsp"%>

	<input type="hidden" id="writer" value="<%=writer%>">
	<input type="hidden" id="type" value="<%=type%>">
	<input type="hidden" id="pId" value="<%=p.getpId()%>">
	<%
		if (userID != null) {
	%>
	
	<input type="hidden" id="writerName" value="<%=userID.getmName()%>">
	<%
		}
	%>


	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		id="modalBTN" data-target="#loginAlert"
		style="opacity: 0; z-index: -1; position: absolute;">Launch
		demo modal</button>

	<!-- Modal -->
	<div class="modal fade" id="loginAlert" tabindex="-1" role="dialog"
		aria-labelledby="loginAlertLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginAlertLabel">로그인 필요</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" placeholder="아이디를 입력해주세요" class="inputform"
						name="userId" id="userId"> <input type="password"
						placeholder="비밀번호를 입력해주세요" class="inputform" name="userPwd"
						id="userPwd" style="margin-top: 10px;"> <input
						type="button" value="로그인" class="login_btn two_btn"> <input
						type="button" value="회원가입" class="join_btn two_btn">

					<div class="row text-center" style="width: 100%;">
						<a style="padding-left: 68%;" href="#" class="find_txt find_id">아이디
							찾기</a><span class="line"> | </span> <a href="#"
							class="find_txt find_pw">비밀번호 찾기</a>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>










	<div class="board-post">
		<div class="col-xs-8">



			<p style="font-size: 2em; text-align: center; font-weight: bold;"><%=p.getpTitle()%></p>



			<button class="btn btnColor" type="button"
				style="width: 100%; color: white" data-toggle="collapse"
				data-target="#moerinfo" aria-expanded="false"
				aria-controls="moerinfo">추가정보 보기</button>

			<div class="collapse" id="moerinfo">
				<div class="card card-body">
					<div class="row">
						<div class="col-sm">작성자:</div>
						<div class="col-sm"><%=p.getpWriter()%></div>
						<div class="col-sm">조회수:</div>
						<div class="col-sm"><%=p.getpCount() %></div>
						<div class="col-sm"></div>
					</div>
					<div class="row">
						<div class="col-sm">작성일자:</div>
						<div class="col-sm"><%=newDateFormat%></div>
						<div class="col-sm"></div>
						<div class="col-sm"></div>
						<div class="col-sm"></div>
					</div>

				</div>
			</div>
			<div id="contentfromQuill" style="height: 500px;"></div>
			<div class="commentBox">


				<div style="height: 238px;">

					<div style="height: 38px">
						<button class="btn" type="button" 
							style="float: right; background-color: rgb(170, 57, 57); color: white"
							id="restComment">댓글 숨기기</button>
						<button class="btn" type="button"
							style="float: right; background-color: rgb(170, 57, 57); color: white"
							id="ListMenu">목록으로</button>
						<%
							// 사용자가 로그인시
							if (userID != null) {
						%>
						<button class="btn" type="button"
							style="float: right; background-color: rgb(170, 57, 57); color: white"
							id="CreateNew">글쓰기</button>
						<%
							}
						%>
						<%
							// 사용자가 작성자일시 
							if (writer.equals(id)) {
						%>
						<button class="btn" type="button"
							style="float: right; background-color: rgb(170, 57, 57); color: white"
							id="EditList">수정하기</button>
						<%
							}
						%>
					</div>

					<div style="height: 150px;">
						<div id="commentTextArea"></div>
						<button class="btn" type="button" onclick="addComment()"
							style="width: 100%; float: right; background-color: rgb(170, 57, 57); color: white">댓글달기</button>
					</div>

				</div>
				<br> <br> <br>
				<div id="addCommentBTN"></div>
				<%
					if (list != null) {
						for (int i = 0; i < index; i++) {
				%>
				<%
					if (i < 5) {
				%>
				<div class="media">
					<%
						} else {
					%>
					<div class="media commentShow">
						<%
							}
						%>
						<img class="mr-3" src="" onError='ImgErrorVideo(this);'>

						<div class="media-header">
							<h5 class="mt-0 mb-1"><%=list.get(i).getName()%></h5>
							<%=list.get(i).getWrittenDate()%>
						</div>

						<div class="media-body" style="overflow: auto;">
							<%=list.get(i).getContent()%>
						</div>
					</div>

					<%
						}
					%>
					<button class="btn" type="button"
						style="background-color: rgb(170, 57, 57); width: 100%; color: white"
						id="moreID">더보기</button>
					<%
						}
					%>



				</div>
			</div>
		</div>
	</div>
	<script>
	
		$('#restComment').click(function(){
			$('.media').each(function(){
				$(this).addClass("commentShow");
			})
			for( i = 0; i < 5;i++){
					$(".commentShow").first().removeClass("commentShow");	
					if($(".commentShow").length == 0)
					{	
						$("#moreID").remove();
						break;
					}
				}
		});
		$(function(){
			var contenst =   document.getElementById('contentfromQuill');
			contenst.innerHTML = '<%=p.getpCotent()%>';
			$(".join_btn").click(function(){
				location.href="<%=request.getContextPath()%>/views/member/memberJoinForm.jsp";
			});
			$(".login_btn").click(function(){
				var idu = $('userId').val();
				var passs =$('userPwd').val();
				location.href = '<%=request.getContextPath()%>/login.me';
			});
		})
		
		function addComment()
		{	var wo = $('#writer').val();
			console.log(wo);
			if(wo != 'Na' ){
				acceptRequest(wo);
			}
			else
			{	$("#modalBTN").click();
				
			}
			
		}
		function acceptRequest(wo)
		{	var quill_object = quill.container.firstChild.innerHTML;
	   		
	    	var to = $('#type').val();
	    	var io = $('#pId').val();
	    	var wno	=$('#writerName').val();
			$.ajax({
				url : "reply.add",
				data:{
					quillDAO: quill_object,
					writer: wo ,
					type:  to,
					pId: io,
					name : wno
				},
				success : function(obj){	
				
					var add_comment = "<div class=\"media\">"+
					"<img class=\"mr-3\" src=\"\" onError='ImgErrorVideo(this);'>"+
						"<div class=\"media-header\">"+
							"<h5 class=\"mt-0 mb-1\">"+obj.name+"</h5>" +
								obj.date+
						"</div>"+
							"<div class=\"media-body\" style=\"overflow: auto;\">"+
								obj.content+
							"</div></div>"
								console.log(add_comment);
							$('#addCommentBTN').prepend(add_comment);
				},
				error : function(){
					console.log('Ajax 통신 실패...');
				},
				
				// complete : 통신 성공 실패 여부와 상관 없이 실행
				complete : function(){
					console.log('통신 완료');
				}
				
			});
		}
				var quill = new Quill('#commentTextArea', {
				modules : {
					imageResize : {
						displaySize : true
					},
					toolbar : [
							[ {
								header : [ 1, 2, false ]
							} ],
							[ 'bold', 'italic', 'underline' ],
							[
									{
										color : [ "#000000", "#e60000",
												"#ff9900", "#ffff00",
												"#008a00", "#0066cc",
												"#9933ff", "#ffffff",
												"#facccc", "#ffebcc",
												"#ffffcc", "#cce8cc",
												"#cce0f5", "#ebd6ff",
												"#bbbbbb", "#f06666",
												"#ffc266", "#ffff66",
												"#66b966", "#66a3e0",
												"#c285ff", "#888888",
												"#a10000", "#b26b00",
												"#b2b200", "#006100",
												"#0047b2", "#6b24b2",
												"#444444", "#5c0000",
												"#663d00", "#666600",
												"#003700", "#002966",
												"#3d1466", 'custom-color' ]
									},
									{
										background : [ "#000000", "#e60000",
												"#ff9900", "#ffff00",
												"#008a00", "#0066cc",
												"#9933ff", "#ffffff",
												"#facccc", "#ffebcc",
												"#ffffcc", "#cce8cc",
												"#cce0f5", "#ebd6ff",
												"#bbbbbb", "#f06666",
												"#ffc266", "#ffff66",
												"#66b966", "#66a3e0",
												"#c285ff", "#888888",
												"#a10000", "#b26b00",
												"#b2b200", "#006100",
												"#0047b2", "#6b24b2",
												"#444444", "#5c0000",
												"#663d00", "#666600",
												"#003700", "#002966",
												"#3d1466", 'custom-color' ]
									} ], [ 'image' ]

					]
				},

				theme : 'snow' // or 'bubble'
			});
		function ImgErrorVideo(source){
	        source.src = "<%=request.getContextPath()%>/resources/icon/baseline_account_box_black_48dp.png";
	        source.onerror = "no_image"; 
	        return true; 
		}
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
  				location.href = "<%=request.getContextPath()%>/post.update?pId=<%=p.getpId()%>&typeOfBoard=<%=type%>";
  			})
  			$("#ListMenu").click(function(){
  				location.href = "<%=request.getContextPath()%>/board.list?currentPage=1&typeOfBoard=<%=type%>";
  			})
  			$("#CreateNew").click(function(){
  				var link = "<%=request.getContextPath()%>/";
				location.href = link
			})
		})
	</script>
</body>
</html>