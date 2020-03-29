<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList, order.model.vo.Order"%>
<%

// 문의 시 해당 주문번호 조회 모달을 눌렀을때 뿌려줄 주문리스트를 가져올 것.
	//System.out.println("list");
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	//System.out.println(list);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<%-- <%@ include file="../common/quillAPI.jsp"%> --%>
    <!-- Main Quill library -->
    <link href="resources/API/quill/quill.snow.css" rel="stylesheet">
    <script src="resources/API/quill/quill.min.js"></script>
    <script src="resources/API/quill/quill.js"></script>
    <script src ="resources/API/quill/image-resize.min.js"></script>
<title>Insert title here</title>


<style>
.board-post {
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: 500px;
	text-align: center;
	padding-left: 25%;
	padding-right: 25%
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
	/* border: 1px solid black; */
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
	display: none;
}

.submitBTN {
	float: right;
}

.updateBox {
	width: 80%;
	padding-left: 10%;
	padding-right: 10%;
	padding-top: 3%;
	margin: auto;
}




.qna_table{
width: 1050px;

height: 700px;
}

.sub_cols{
width: 80px !important;
text-align: center;
background: #f9f9f9;
}
/* td :first-child{
width: 40px;
} */

.warning_txt{
font-size:12px;
padding: 3px;
}


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
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/bootstrap.jsp"%>

	<form action="<%=request.getContextPath()%>/insert.qna" method="post"
		id="postInsert">
		<div class="updateBox">
		<%-- <input type="hidden" name="mId" value="<%=loginUser.getmId() %>"> --%>
		<input type="hidden" name="quillData" value="11">
			<table border="1" class="qna_table">
				<tr>
					<th class="sub_cols">제목</th>
					<td>
						<select class="custom-select" name="qCate">
  							<option value="없음" selected>--선택--</option>
							  <option value="결제">결제</option>
							  <option value="교환">교환</option>
						</select>
												
						<!-- 제목 쓰는 칸 -->
						<input class="qTitle" type="text" name="qTitle" required>
					</td>
				</tr>				
				<tr>
					<th class="sub_cols">
						주문번호
					</th>
					<td>
						<input type="text" class="oId" name="oId" id="oIdInput" style="font-size:14px">
						<button type="button" class="order_select_btn btn-primary">주문조회</button>
					</td>
				</tr>
				<tr>
				<th class="sub_cols">이메일</th>
				<td><input type="text" value="<%= loginUser.getEmail()%>" style="font-size:14px" readonly>
					<input type="checkbox" name="chk_email_answer"><label style="font-size:12px">답변수신을 문자메세지로 받겠습니다.</label>
				</td>
				
				</tr>
				<tr>
				<th class="sub_cols">내용</th>
				<td>
					<pre class="warning_txt">
<b>1:1 문의 작성 전 확인해주세요!</b>

반품 / 환불
- 제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.

주문취소
- 배송단계별로 주문취소 방법이 상이합니다.
[입금확인]단계 : [마이페이지 > 주문내역 상세페이지]에서 직접 취소 가능
[입금확인] 이후 단계 : 고객행복센터로 문의

- 생산이 시작된[상품 준비중]이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.
- 비회원은 모바일 App 또는 모바일 웹사이트에서 [마이페이지 > 비회원 주문 조회 페이지]에서 취소가 가능합니다.
- 일부 예약상품 배송 3~4일 전에만 취소 가능합니다.
- 주문상품의 부분취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요

배송
- 주문완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.
- 배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)
* 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.
				
					</pre>
			<!-- Include the Quill library -->
			<div id="editor-container" style="height: 500px;"></div>
			<div style="width: 100%;">
			
				<button class="btn submitBTN" onclick="getQuill()">작성하기</button>
		
			</div>

			<div id="testBox"></div>
				
				</td>
				</tr>
			</table>
			
			
			<div class="form-group">

				<input type="hidden" name="writer" value="">
				<input type="hidden" name="quillData" value="11">

			</div>
			</div>
	</form>


<!-- Modal -->
<div class="modal fade ttt" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">내 주문번호 조회하기</h5>
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

							<%if(list != null){ %>
								<% for(int i = 0; i < list.size(); i++){ %>
									<tr>
										<td class="oId"><%=list.get(i).getOrderId() %></td>
										<td class="oDate"><%=list.get(i).getOrderDate() %></td>
										<td class="price"><%=list.get(i).getTotalPrice() %></td>
										<td><input type="radio" id="check_oId" value="<%=list.get(i).getOrderId() %>"></td>
									</tr>
								<%} %>
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
        <button type="button" class="btn btn-primary modal_select_btn">선택하기</button>
      </div>
    </div>
  </div>
</div>


<script>/* 모달 */
$(function() {
	$(".order_select_btn").click(function(){

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
		// 선택하기 버튼을 누르면 radio value값 주문번호 인풋에 전달
		
		$("#oIdInput").val($("#check_oId:checked").val());
		$(".ttt").modal("hide");
	});

});



/* <!-- Initialize Quill editor --> */
	var quill = new Quill('#editor-container', {
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
	function getQuill() {
		var quill_object = quill.container.firstChild.innerHTML;
		$("input[name=quillData]").val(quill_object);
		//insert 폼 제출
		$("#postInsert").submit();
	}
	
	function update() {
		var quill_object = quill.container.firstChild.innerHTML;
		$("input[name=quillData]").val(quill_object);

		$("#postInsert").submit();
	}
	</script>
	
     <%@ include file="../common/footer.jsp" %>
</body>
</html>