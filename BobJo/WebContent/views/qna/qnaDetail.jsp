<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, qna.model.vo.Qna, order.model.vo.Order, reply.model.vo.*, java.text.SimpleDateFormat, java.sql.Date"%>
<%
  Qna q = (Qna)request.getAttribute("qna");
  ArrayList<String>  alist= q.getaContent();
  ArrayList<Date>	dlist=  q.getaDate();
  int aIndex = alist.size(); 
  Order o = (Order)request.getAttribute("o");
  Member userID = (Member)session.getAttribute("loginUser");

  //문의 날짜
  SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
  String newDateFormat = simple.format(q.getqDate());
  String writer= "Na";
  String id = "noIDNA";
  if(userID != null){
   writer = q.getmNo();// 이거는 qna에 저장된 아이디
   id = userID.getmId(); //이거는 지금 로그인세션 아이디
  } 
  	
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	box-sizing: border-box;
	
}

.outer_m {
	display: block;
	width: 1050px;
	height: auto !important;
	/* border: 1px solid red; */
	margin: auto;
}

.board-post {

	display:inline-block;
	width: 100%;
	height: auto !important;
	padding: 0px;
	margin: 0px;
	/* text-align: center; */
	/* border: 1px solid green; */
	margin: auto;
}

.board-post-list {
	width: 100%;
	float: left;
	height: auto !important;
	margin-top: 10px;
	/* border: 1px solid blue; */
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
	padding-left: 10%;
	padding-right: 10%;
}


.table-sm{
	width: 100% !important;
	border-top: 2px solid rgb(170, 57, 57);
	border-bottom: 1px solid rgb(170, 57, 57);
	border-left: none !important;
	border-right: none !important;
	margin:0px !important;
	/* margin-bottom:20px !important; */
	padding:0 !important;
		
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

.cols1{
	width: 200px !important;
}
.cols2{
	width: 500px;
}
/* .cols3{
	width: 100px;
} */
.cols4{
	width: 100px;
}
.contentArea{
	font-size: 12px;
	padding: 10px !important;
	height:300px;
}

#ListMenu{
	background:rgb(170, 57, 57)!important;
	width: 150px;
	height: 50px;
	border-radius: none !important;
	font-size: 12px !important;
}
#ListMenu:hover{
	background:rgb(200, 70, 70)!important;
	width: 150px;
	height: 50px;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
	padding-left: 10%;
	padding-right: 10%;
}

.commentBox {
	width: 100%;
	float: left;
}

.commentShow {
	display: none !important;
}

.answerBtn{
	float: right;
	height: 70px;
	font-size: 12px !important;
}

.answerBtn:hover{
background:rgb(200, 70, 70)!important;
}
.tdAnswerBtn{
	padding-right: 5px;
}


.answerDiv{
	width: 100%;
}
.answerTable1{
	width: 100%;
	
}
.answerTable1 td{
	padding-left:10px !important;
}
.regiAnswerDiv{
	width: 100%;
}

.tdWriter_a{
	width: 150px;
}
.answerTable2{
	width: 100%;
}
.td_aContent{
	width: 90%;
	padding-left:10px;

}
.aContent{
	width: 100%;
}





/* 모달..? */


.modal_select_btn, .submitBTN, .order_select_btn{
width: 80px !important;
height: 30px !important;
	background: rgb(170, 57, 57) !important;
	border: none !important;
	border-radius: 3px;
	font-size: 12px !important;
	color:white !important;
}

.orderList_div{
	width: 450px;
	/* border: 1px solid red; */
	margin: auto;
	
}
.orderList_table th{
	background: #f9f9f9;
	font-size: 15px;
}
.orderList_table{
	width: 100%;
	text-align: center;
	
}
.orderCols{
width: 20%;

}
.oDateCols{
width: 30%;
}
.priceCols{
width: 40%;
}

.chCols{
width: 10%;
}

td{
padding: 3px;
}

.qTitle{
width: 100%;
font-size: 14px;
}

.custom-select{
width: 100px !important;
border: 1px solid rgb(170, 57, 57) !important;
font-size: 14px !important;
margin-bottom:3px !important;
}

</style>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../../views/common/bootstrap.jsp"%>
	<div class="outer_m">
		<div class="board-post">
			<div class="sub_text_area" style="diplay:inline-block;/*  border:1px solid black; */">				
				<p style="font-size: 16px; font-weight: 900; text-align: left; line-height:'2';/*  border:1px solid black;  */margin-top:20px; margin-bottom:20px;">
				1:1 문의내역</p>
			</div>		
			<!-- 게시판 글 -->
			<div class=" board-post-list">
				<table class="table table-sm" border="1">
					
					<tr>
						<th class="thTitle firstCols cols1">제목</th>
						<td colspan="3"><%=q.getqTitle() %></td>
					</tr>
					<tr>
						<th class="thDate">작성일</th>
						<td class="tdDate cols2"><%=q.getqDate() %>
						<th class="thAstatus cols3">답변여부</th>
						<td class="cols4"><%=q.getaStatus()%></td>
					</tr>
					<tr>
						<th>주문번호</th>
						<!-- 주문번호 -->
						<%if(q.getOrderId()==null){ %>
							<td>주문번호 없음</td>
						<%} else{%>
							<td class="order_modal"><a><%=q.getOrderId()%></a>
							</td>
						<%} %>
						<th>카테고리</th>
						<td><%=q.getqCate()%></td>	
					</tr>
					
					<tr>
						<!-- 문의내용 -->
						<td colspan="4" class="contentArea"><%= q.getqContent()%>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button class="btn" type="button"
									style="float: right; background-color: rgb(170, 57, 57); color: white"
									id="ListMenu" onclick="location.href='<%=request.getContextPath()%>/list.qna'">목록으로</button>
						</td>
					</tr>
				</table>
					
					
					</div><!-- boardpostlist -->




<!--//////////////////////////////////////////////////////////// 답변구역 -->
					<div class="answerDiv">
					<table class="answerTable1" style="border:1px solid lightgrey;">
					
						<%System.out.println("alist.get(0) : "+alist.get(0));
						System.out.println("dlist : "+dlist);
						System.out.println("aIndex : "+aIndex);
						if(alist.get(0) != null){
                        	for (int i = 0; i < aIndex; i++) {%>
                        	<%if(i < 5){ %>
								<tr class="liComment" style="border: 1px solid lightgrey;">
								<%} else{%>
								<tr class="liComment commentShow" style="border: 1px solid lightgrey;">
							<%}%>
						
							<!-- 관리자이름 -->
							<td class="tdWriter_a"style="border:1px solid lightgrey;"><b>ChefJ</b></td>
							<!-- 답변 내용 -->
							<td rowspan="2"  colspan="3" style="vertical-align:top;"><%=alist.get(i)%></td>
						</tr>

						<!-- 답변 날짜 -->
						<tr>
							<td><%=dlist.get(i)%></td>
						</tr>
							<% } %><!-- for문 끝 -->
							
							<!-- 댓글 5개이상이면 더보기버튼 한번만 활성화 -->
							<%if(aIndex > 5 ){ %>
						<tr>
							<td>
								<button class="btn" id="moreID" type="button" style="background: rgb(170, 57, 57); color: white;">더보기</button>
							</td>
						</tr>
							<% } %>
											
						<% }else {%>
						<tr>
							<td>답변이 없습니다</td>
						</tr>
						<%}%>
					</table>
					
					
					
					</div><!-- answerDiv -->
					<div class="regiAnswerDiv">
						<!-- 관리자면 답변등록구간 -->
						<%if(loginUser.getmId().equals("admin")){ %>
					<table class="answerTable2">	
						<tr>
						<!-- 답변등록 textarea -->
							<td class="td_aContent">
							<textarea rows="3" class="aContent" name="aContent" style="resize:vertical;"></textarea>
							</td>
						
							<td class="tdAnswerBtn">
							<button class="btn answerBtn" id="answerBtn" type="button" style="background: rgb(170, 57, 57); color: white;">
								답변등록</button>
							</td>
						</tr>
						<%} %>
					</table>
				
			</div>
		</div>
	</div>

<!-- Modal -->
<div class="modal fade ttt" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">주문내역</h5>
        <button type="button" class="close modal_close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
					<div class="modal-body">
						<div class="orderList_div">
							<table class="orderList_table" border="1" border-color="lightgrey">
							<tr>
							<th class="orderCols">주문번호</th>
							<th class="oDateCols">주문일</th>
							<th class="priceCols">주문금액</th>
							<th class="ckCols">선택</th>
							</tr>

							<%if(o != null){ %>
								
									<tr>
										<td class="oId"><%=o.getOrderId() %></td>
										<td class="oDate"><%=o.getOrderDate() %></td>
										<td class="price"><%=o.getTotalPrice() %></td>
										<td class="p_name">상품</td>
									</tr>
								
							<%}else{%>
								<tr>
									<td colspan="4">주문내역이 없습니다.</td>
								</tr>
							<%} %>
							</table>
							
						</div>
					</div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
        <button type="button" class="btn btn-primary modal_select_btn">닫기</button>
      </div>
    </div>
  </div>
</div>


<script>/* 모달 */
$(function() {
	$(".order_modal").click(function(){

		// 모달 보이게 하기
		$('.ttt').modal("show");
	
		/* 
		var i = $(this).attr("id").substring(7);

		// i를 전달하기 위해...
		$('input[name=putProductId]').val(i);
		
		var pName = $('input[name=pName'+i+']').val();
		$("#putProduct").text(pName); */
		
	});
		
	
	//모달 x버튼 누르면 창 종료
	$(".modal_close").click(function(){
		// 모달 창을 닫으면 모달 안에 있는 데이터 모두 초기화해야함
		$(".ttt").modal("hide");
	});
	
	$(".modal_select_btn").click(function(){
		// 닫기버튼 누르면 닫기
		$(".ttt").modal("hide");
	});

});



	
  		$(function(){
  			/* 답변등록 */
  			$(".answerBtn").click(function(){
  				var aContent = $(".aContent").val();
  				var qId = "<%= q.getqId() %>";	
  				
  	        	if(!aContent){
  	        		alert("답변내용이 없습니다.");
  	        		aContent.focus();
  	        	}else{
  	  			$.ajax({
  					url : "insert.answer",
  					type : "post",
  					dataType : "json",
  					data : {aContent:aContent,
  							qId:qId},
  					success: function(data){
  						console.log(data);//qna객체에 답변, 날짜 리스트담겨있음.
  						$answerTable1 = $(".answerTable1").css("border","1px solid lightgrey");
  						$answerTable1.html(""); // 기존 댓글 테이블 정보 초기화
  						
  						// 새로 받아온 갱신 된 댓글 리스트 들을 for문을 통해
  						// 다시 table에 추가
  						for(var key in data.aContent){ // 배열이므로 key 값은 인덱스
  							var $tr = $("<tr>");
  							var $writerTd = $("<td class='tdWriter_a'>").text("ChefJ").css({"font-weight": "900","border":"1px solid lightgrey"});
  							var $contentTd = $("<td rowspan='2' colspan='3'>").text(data.aContent[key]).css("border","1px solid lightgrey");
  							var $tr2 = $("<tr>");
  							var $dateTd = $("<td>").text(data.aDate[key]).css("border","1px solid lightgrey");
  							
							$tr.append($writerTd);
  							$tr.append($contentTd);
  							$tr2.append($dateTd);
  							
  							$answerTable1.append($tr);
  							$answerTable1.append($tr2);
  						}
  						// 댓글 작성 부분 리셋
  						$(".aContent").val("");
  					},
  					error : function(){
  						console.log('ajax 통신 실패');
  					}
  				});
  	        	}
	        	 	        	
  	        	
  			});
  		// 더보기 jquery
  			$("#moreID").click(function(){
  				
  				if($(".commentShow").length == 0)
  					{	
  						$("#moreID").remove();
  					}
  				for( i = 0; i < 5; i++){
  					
  					
  					$(".commentShow").first().removeClass("commentShow");	
  					if($(".commentShow").length == 0)
  					{	
  						$("#moreID").remove();
  						break;
  					}
  				}
  			})	
  			
  			$("#EditList").click(function(){
  				location.href = "<%=request.getContextPath()%>/updateForm.qna?qId="+<%=q.getqId()%>;
  				
  			})
  			<%-- $("#ListMenu").click(function(){
  				location.href = "<%=request.getContextPath()%>/";
  			}) --%>
  			$("#CreateNew").click(function(){
  				location.href = "<%=request.getContextPath()%>/views/qna/qnaInsert.jsp"
  			})
  		})
  		
  	</script>
	<br><br>
     <%@ include file="../common/footer.jsp" %>
</body>
</html>