<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, common.vo.*, product.model.vo.*, attachment.model.vo.*"%>

<%
	ArrayList<Cart> cartList = (ArrayList<Cart>) request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J market</title>

<style>
/* * {border:1px solid green;} */
body {
	margin: auto;
	position: relative;
}

.content {
	width: 90%;
	/* position: absolute; 
            left: 50%; 
            transform: translateX(-50%); */
	margin-left: auto;
	margin-right: auto;
}

.cart_top {
	padding: 2rem;
}

.cart_top p {
	text-align: center;
	margin: auto;
}

.p-title {
	font-size: 2rem;
	font-weight: bold;
}

.productInCart {
	padding: 1rem;
	margin-bottom: 1rem;
}

#selectDelBtn {
	border-style: none;
	padding: 0.5rem;
	border-radius: 0.2rem;
	border: 1px solid black;
}

.cart_result {
	/* border: 1px solid red; */
	position: relative;
	margin-top: 1rem;
	margin-bottom: 1rem;
	padding: 1rem 0 1rem 0;
	overflow: hidden;
}

.cart_amount div {
	display: inline-block;
	padding: 2%;
}

.total_product_price, .delivery_price, .total_payment_amount {
	background-color: rgb(255, 228, 228);
	border: 2px solid rgb(255, 170, 170);
	float: left;
	text-align: center;
	border-radius: 0.2rem;
}

.deco {
	float: left;
	text-align: center;
	font-weight: bold;
	font-size: 1.7rem;
}

#orderBtn {
	border: none;
	width: 13rem;
	height: 3rem;
	border-radius: 0.5rem;
	background-color: rgb(170, 57, 57);
	color: white;
	font-size: 1.2rem;
}

#orderDiv {
	text-align: center;
	padding: 3rem;
}

.bottom-div {
	margin-top: 2rem;
	margin-bottom: 3rem;
	padding: 1rem;
	background-color: rgb(240, 240, 240);
}

.bottom-div p {
	text-align: center;
	font-weight: 800;
	color: rgb(128, 21, 21);
}

.proImg {
	width: 15%;
	heigh: auto;
}

.table {
	/* width:90% !important; */
	
}

.table td, .table th {
	vertical-align: middle !important;
	font-size: 1.2rem;
}

input[type=checkbox] {
	/* Double-sized Checkboxes */
	-ms-transform: scale(1.5); /* IE */
	-moz-transform: scale(1.5); /* FF */
	-webkit-transform: scale(1.5); /* Safari and Chrome */
	-o-transform: scale(1.5); /* Opera */
	margin-left: 2rem;
}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/bootstrap.jsp"%>

	<section class="content">
		<div class="container-fluid">
			<div class="cart_top">
				<p class="p-title">장바구니</p>
				<p>주문하실 상품명 및 수량 정보를 정확히 확인해 주세요.</p>
			</div>
			<div class="productInCart">
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th scope="col" style="width: 20%"><input type="checkbox"
								id="allCheck">&nbsp;&nbsp;&nbsp;전체 선택</th>
							<th scope="col" style="width: 40%">상품 정보</th>
							<th scope="col" style="width: 15%">수량</th>
							<th scope="col" style="width: 25%">상품 금액</th>
						</tr>
					</thead>
					<tbody>
							<%
								if (cartList.size() == 0) {
							%>
							<tr>
								<td colspan="4" style="text-align: center">장바구니에 담은 상품이
									없습니다.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < cartList.size(); i++) {
										Cart c = cartList.get(i);
										int price = c.getpPrice() * c.getQuantity();
							%>
							<!-- 장바구니의 상품ID와 상품리스트의 상품ID를 비교하여 상품정보 가져오기 -->

							<tr>
								<th scope="row"><input type="checkbox" name="checkRow"
									value="<%=c.getpId()%>"> <input type="hidden"
									name="checkPrice" value="<%=price%>"> <input
									type="hidden" name="checkQuantity"
									value="<%=c.getQuantity()%>"></th>
								<td><img
									src="<%=contextPath%>/resources/product/<%=c.getCateInId()%>/<%=c.getfName()%>"
									class="proImg">&nbsp;&nbsp;&nbsp;<%=c.getpName()%></td>
								<td><%=c.getQuantity()%></td>
								<td><%=price%>&nbsp; 원</td>
							</tr>

							<%
								}
							%>
							<%
								}
							%>
					</tbody>
				</table>
				<!-- <input type="checkbox"><p>전체 선택</p> -->
				<button type="button" class="btn btn-outline-dark" id="selectDelBtn")>선택
					삭제</button>
			</div>

			<div class="bottom-div">
				<p style="text-align: center">주문 하는 상품들의 총 금액이 7만원 이상 시 배송비 무료
					(그 외 배송비 3,000원)</p>
			</div>

			<div class="cart_result">
				<div class="cart_amount row align-items-center">
					<div class="col-1"></div>
					<div class="total_product_price col-3">
						<!-- 총 상품 금액-->
						<p style="font-weight: 700">총 상품 금액</p>
						<span><span id="tt"></span>원</span>
					</div>
					<div class="deco deco_plus col-1">
						<!-- 더하기 -->
						+
					</div>
					<div class="delivery_price col-2">
						<!-- 배송비-->
						<p style="font-weight: 700">배송비</p>
						<span><span id="delivery">3,000</span>원</span>
					</div>
					<div class="deco deco_equal col-1">
						<!-- 등호-->
						=
					</div>
					<div class="total_payment_amount col-3">
						<!-- 총 결제 예정 금액 -->
						<p style="font-weight: 700">총 결제 예정 금액</p>
						<span><span id="ttt"></span>원</span>
					</div>
					<div class="col-1"></div>
				</div>
				<div class="col" id="orderDiv">
					<input type="submit" name="Submit" id="orderBtn" value="주문하기" />
				</div>

			</div>


		</div>
	</section>
	<form id="pidsFrm" action="ordersheet" method="post">
		<input type="hidden" name="pids" id="pids">
	</form>
	<script>
		$(function() {
			var sum = 0;
			/* 체크박스 전체선택, 전체해제 */
			$("#allCheck").click(function() {
				sum = 0;
				if ($(this).is(":checked")) {
					$("input[name=checkRow]").prop("checked", true);
					$("input[name=checkRow]:checked").each(function() {
						sum = sum + parseInt($(this).next().val());
					});

					$("#tt").text(sum);
				} else {
					$("input[name=checkRow]").prop("checked", false);
					sum = 0;
					$("#tt").text(sum);
				}

				if (sum > 70000) {
					$("#delivery").text(0);
					$("#ttt").text(sum);
				} else {
					$("#delivery").text("3,000");
					var ttt = sum + 3000;
					$("#ttt").text(ttt);
				}

			});

			// 체크한 상품 가격 합 계산하기 -> 총 상품 금액

			$("input[name=checkRow]").click(function() {
				if ($(this).prop('checked')) {
					// $(this).next().val() -> 가격
					sum = sum + parseInt($(this).next().val());
					$("#tt").text(sum);
				} else {
					sum = sum - parseInt($(this).next().val());
					$("#tt").text(sum);
				}

				if (sum > 70000) {
					$("#delivery").text(0);
					$("#ttt").text(sum);
				} else {
					$("#delivery").text("3,000");
					var ttt = sum + 3000;
					$("#ttt").text(ttt);
				}
			});

			$("#selectDelBtn").click(function() {
				// 선택 삭제 버튼 클릭 했을 때 선택 상품 삭제하기

				// 체크박스 체크한 값 가져오기				
				$("input[name=checkRow]:checked").each(function() {
					var test = $(this).val();

					$.ajax({
						url : "delCart.pr",
						data : {
							pId : test
						},
						type : "post",
						success : function(re) {
							console.log(re);
						},
						error : function() {
							alert('ajax 에러');
						}

					}); /* ajax 끝부분 */
				});

				alert('해당 상품을 장바구니에서 삭제 했습니다.');
				location.reload();

			});

			// 주문하기 버튼 클릭 시 체크된 상품정보 보내기
			$("#orderBtn").click(function(){
				// 장바구니 데이터에서 일부 데이터만 주문서로 넘기려면?
				var num = 0;
				var str = "";
				$("input[name=checkRow]:checked").each(function() {
					var pId = $(this).val();
					if(num == 0){
						str += pId;
						num++;
					}else {
						str += "," +pId;
					}
				});
				
				$("#pids").val(str);
				$("#pidsFrm").submit();
				
			});
			

		});
	</script>


	<%@ include file="../common/footer.jsp"%>
</body>
</html>