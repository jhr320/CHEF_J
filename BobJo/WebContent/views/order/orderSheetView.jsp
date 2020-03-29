<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, common.vo.*, product.model.vo.*, attachment.model.vo.*"%>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");
	String[] pIdArr = (String[])request.getAttribute("pIdArr");
	String pids = (String)request.getAttribute("pids");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아임포트(결제 시스템) 라이브러리 -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<title>CHEF J</title>
<style>
body {
	margin: auto;
	position: relative;
}

.content {
	width: 80%;
	/* position: absolute; 
            left: 50%; 
            transform: translateX(-50%); */
	margin-left: auto;
	margin-right: auto;
}

.order_top {
	padding: 2rem;
}

.order_top p {
	text-align: center;
	margin: auto;
}

.top-title {
	font-size: 2rem;
	font-weight: bold;
}

.proImg {
	width: 15%;
	heigh: auto;
}

#productInfoBtn {
	width: 100%;
	border: none;
	border-radius: 0.5rem;
	background-color: rgb(255, 235, 235);
	color: rgb(170, 57, 57);
	font-size: 1.2rem;
	font-weight: 600;
}

#paymentDiv {
	text-align: center;
	/* margin-top: 2rem; */
	margin-bottom: 3rem;
}

#paymentBtn {
	border: none;
	width: 13rem;
	height: 3rem;
	border-radius: 0.5rem;
	background-color: rgb(170, 57, 57);
	color: white;
	font-size: 1.2rem;
}

.order_info, .delivery_info, .coupon, .payment {
	margin-bottom: 2.5rem;
}

.order_info p, .delivery_info p, .coupon p, .payment p {
	font-size: 1.2rem;
	font-weight: bold;
	margin-left: 0.5rem;
}

.info_table {
	width: 90%;
	border-top: 2px solid rgb(170, 57, 57);
	border-bottom: 2px solid rgb(170, 57, 57);
	margin-bottom: 1rem;
}

.info_table td {
	border-top: 1px solid gray;
	padding: 0.8rem 1rem 0.8rem 1rem;
}

.info_table tr td:first-child {
	width: 30%;
}

#payment_method_table, #total_price_table {
	width: 100%;
	border-top: 2px solid rgb(170, 57, 57);
	border-bottom: 2px solid rgb(170, 57, 57);
	margin-bottom: 1rem;
}

#payment_method_table td, #total_price_table td {
	border-top: 1px solid gray;
	padding: 0.8rem 1rem 0.8rem 1rem;
}

#payment_method_table td:first-child, #total_price_table td:first-child
	{
	width: 35%;
}

.total_price {
	width: 60%;
}

.juso_btn {
	width: 150px;
	height: 40px;
	color: white;
	background: rgb(170, 57, 57);
	border-style: none;
	border-radius: 0.5rem;
	font-size: 1rem;
	margin-bottom:5px;
}
</style>

</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/bootstrap.jsp"%>

	<section class="content">
		<div class="container-fluid">
			<div class="order_top">
				<p class="top-title">주문서</p>
				<p>주문하실 상품명 및 수량 정보를 정확히 확인해 주세요.</p>
			</div>

			<div class="order_middle">
				<div class="products_info">
					<p>
						<button class="btn btn-primary" type="button"
							data-toggle="collapse" id="productInfoBtn"
							data-target="#collapseExample" aria-expanded="false"
							aria-controls="collapseExample">상품 정보 열기 ▼</button>
					</p>
					<div class="collapse" id="collapseExample"
						style="margin-bottom: 1rem">
						<div class="card card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr>
										<th scope="col" style="width: 50%">상품 정보</th>
										<th scope="col" style="width: 20%">수량</th>
										<th scope="col" style="width: 30%">상품 금액</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr>
										<td><img src="" alt="상품이미지">상품명 1</td>
										<td>1</td>
										<td>2000 원</td>
									</tr>
									<tr>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<td>Larry</td>
										<td>the Bird</td>
										<td>@twitter</td>
									</tr> -->
									<% for(int i = 0; i < pIdArr.length; i++){ %>
										<% for(Cart c : cartList) {%>
											<% if(c.getpId().equals(pIdArr[i])) {
												int price = c.getpPrice() * c.getQuantity();
											%>
											<tr>
												<td><img src="<%=contextPath%>/resources/product/<%=c.getCateInId()%>/<%=c.getfName()%>"
									class="proImg">&nbsp;&nbsp;&nbsp;<span id="pName"><%=c.getpName()%></span></td>
												<td><span><%=c.getQuantity()%></span></td>
												<td><span class="pp"><%=price%></span>&nbsp; 원</td>
											</tr>
											<% } %>
										<% } %>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
				
	<form id="pidsFrm" action="orderPay" method="post">
				<div class="order_info">
					<!-- 주문자 정보-->
					<p>주문자 정보</p>
					<table class="info_table">
						<tr>
							<td>이 름</td>
							<td id="b_name"><%= loginUser.getmName() %></td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td id="b_phone"><%= loginUser.getPhone() %></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td id="b_email"><%= loginUser.getEmail() %></td>
						</tr>
					</table>
				</div>

				<div class="delivery_info">
					<!-- 배송 정보-->
					<p>배송 정보</p>
					<table class="info_table">
						<!-- <tr>
							<td>배송지 선택 *</td>
							<td><input type="radio" name="address" id="defaultAddress"
								checked="checked"><label for="defaultAddress">&nbsp;기본
									배송지</label>&nbsp;&nbsp; <input type="radio" name="address"
								id="newAddress"><label for="newAddress">&nbsp;새로운 배송지</label>
							</td>
						</tr> -->
						<tr>
							<td>배송지(주소) *</td>
							<td>
							<input type="button" value="주소검색" class="juso_btn" onclick="goPopup();"><br>
							<input type="text" class="address roadFullAddr" name="roadFullAddr"  id="roadFullAddr" size="50" disabled style="margin-bottom:5px"><br>
							<input type= "text" name= "addrDetail"  id="addrDetail" class="addrDetail" size="50" disabled/>
							</td>
							
						</tr>
						<tr>
							<td>수령인 이름 *</td>
							<td><input type="text" name="r_name" id="r_name"></td>
						</tr>
						<tr>
							<td>휴대폰(연락처) *</td>
							<td><input type="text" name="r_phone" id="r_phone" placeholder="'-'없이 숫자만 입력해주세요"></td>
						</tr>
						<tr>
							<td>배송시 요청사항</td>
							<td><textarea rows="2" cols="50" name="r_please" id="r_please"></textarea></td>
						</tr>
					</table>
				</div>

				<div class="coupon">
					<!-- 쿠폰-->
					<p>쿠폰</p>
					<table class="info_table">
						<tr>
							<td>쿠폰 사용여부</td>
							<td><input type="radio" name="coupon" id="noCoupon"
								checked="checked"><label for="noCoupon">&nbsp;사용 안함</label>&nbsp;&nbsp;
								<input type="radio" name="coupon" id="useCoupon" disabled><label
								for="useCoupon">&nbsp;쿠폰 사용</label></td>
						</tr>
					</table>
				</div>

				<div class="payment row">
					<!-- 결제 수단-->
					<div class="payment_method col-6">
						<p>결제 수단</p>
						<table id="payment_method_table">
							<tr>
								<td>일반 결제</td>
								<td><input type="radio" name="payment" id="payment1" checked="checked">
								<label for="payment1">&nbsp;신용카드</label></td>
							</tr>
							<tr>
								<td>네이버 페이</td>
								<td><input type="radio" name="payment" id="payment2">
								<label for="payment2">&nbsp;네이버 페이</label></td>
							</tr>
							<tr>
								<td>카카오 페이</td>
								<td><input type="radio" name="payment" id="payment3">
								<label for="payment3">&nbsp;카카오 페이</label></td>
							</tr>
							<tr>
								<td>에스크로 결제</td>
								<td><input type="radio" name="payment" id="payment4">
								<label for="payment4">&nbsp;계좌이체</label></td>
							</tr>
						</table>
					</div>
					<div class="col-1"></div>
					<!-- 최종 결제 금액-->
					<div class="total_price col-5">
						<p>최종 결제 금액</p>
						<table id="total_price_table">
							<tr>
								<td>상품 금액</td>
								<td><span id="spanProduct"></span>&nbsp;원</td>
							</tr>
							<tr>
								<td>배송비 (+)</td>
								<td><span id="spanDelivery"></span>&nbsp;원</td>
							</tr>
							<tr>
								<td>쿠폰 (-)</td>
								<td><span id="spanCoupon">0</span>&nbsp;원</td>
							</tr>
							<tr style="background-color: rgb(255, 235, 235)">
								<td>총 결제 금액</td>
								<td><span id="spanTotal"></span>&nbsp;원</td>
							</tr>
						</table>
					</div>
				</div>

				<br>

				<div id="paymentDiv">
					<button type="button" id="paymentBtn">결제 하기</button>
				</div>
			</div>

		</div>
			<input type="hidden" name="chong" id="chong">
			<input type="hidden" name="pids" id="pids" value="<%= pids%>">
			<input type="hidden" name="addr" id="addr">
		</form>
		
	</section>
	
<script language= "javascript" >
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
// (＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
//경로는 시스템에 맞게 수정하여 사용
//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를
//호출하게 됩니다.
var pop = window.open("<%=request.getContextPath()%>/views/member/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd,
rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm,
buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
// 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
	document.getElementById("roadFullAddr").value = roadFullAddr;
	document.getElementById("addrDetail").value = addrDetail;

} 
</script>

	<script>
		$(function(){
			// 상품정보 열기 버튼 클릭 시 
			var flag = 1;
			$("#productInfoBtn").click(function(){
				if(flag == 1){
					$(this).text("상품 정보 닫기 ▲");
					flag = 0;
				}else{
					$(this).text("상품 정보 열기 ▼");
					flag = 1;
				}
			});
			
			// 상품정보에 따른 결제 예정 금액
			var spanProduct = 0;
			$(".pp").each(function(){
				spanProduct = spanProduct + Number($(this).text());
			});
			$("#spanProduct").text(spanProduct);
			var total = 0;
			if(spanProduct < 70000){
				$("#spanDelivery").text("3,000");
				total = spanProduct + 3000;
				$("#spanTotal").text(total);
			}else {
				$("#spanDelivery").text(0);
				total = spanProduct;
				$("#spanTotal").text(spanProduct);
			}
			
			// 결제창
			var pName = $("#pName").text();	// 상품 가격
			IMP.init('imp22290051'); // 아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
			$("#paymentBtn").click(function(){
				
				// 입력정보가 비어있지 않을 때 결제창 이동
				if($("#roadFullAddr").val() == ""){
					alert("주소 검색을 통해 배송지를 입력해주세요");
				}else if($("#r_name").val() == ""){
					alert("수령인 이름 입력해주세요");
				}else if($("#r_phone").val() == ""){
					alert("수령인 연락처를 입력해주세요");
				}else{
					IMP.request_pay({
					    pg : 'html5_inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : pName +' 외',
					    amount : 100,
					    buyer_email : $("#b_email").text(),
					    buyer_name : $("#b_name").text(),
					    buyer_tel : $("#b_phone").text(),
					    buyer_addr : $("#roadFullAddr").val(),
					    buyer_postcode : '123-456'
					}, function(rsp) {
						var ch = 0;
					    if ( rsp.success ) {
					        var msg = '결제가 완료되었습니다.';
					        //ch = 1;
					        $("#chong").val(total);
					        var addr = $("#roadFullAddr").val();
							addr += ' ';
							addr += $("#addrDetail").val();
							$("#addr").val(addr);
					        $("#pidsFrm").submit();
					        
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					    }

					    alert(msg); 
					    
					    <%-- if(ch == 1){
					    	// 결제 성공 시 성공 화면으로 이동
					    	location.href="<%= contextPath %>/views/order/orderSuccessView.jsp";
					    } --%>
					});
				}
				
			});
			
			$("#testBtn").click(function(){
				var ch = 0;
				$("#chong").val(total);
				var addr = $("#roadFullAddr").val();
				addr += ' ';
				addr += $("#addrDetail").val();
				$("#addr").val(addr);
		        $("#pidsFrm").submit();
		        <%-- location.href="<%= contextPath %>/orderPay"; --%>
			});
			
		});
	
	</script>
	
	

	<%@ include file="../common/footer.jsp"%>

</body>
</html>