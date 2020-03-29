<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, common.vo.*, product.model.vo.*, attachment.model.vo.*, order.model.vo.*"%>
<%
	ArrayList<OrderDetail> orderList = (ArrayList<OrderDetail>) request.getAttribute("oList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="views/myPageUpdate/css/master.css">
<link rel="stylesheet" href="views/myPageUpdate/css/operate.css">



</head>
<style>
ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

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

.pName a{
	color:black;
	font-size:1.5rem;
	font-weight:700;
}
</style>
<body>
	<%@include file="../common/menubar.jsp"%>
	<%@include file="../common/bootstrap.jsp"%>

	<br>
	<br>
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
									<li><a
										href="<%=request.getContextPath()%>/views/myPageUpdate/myProfile.jsp">프로필
											보기/수정 </a></li>


								</ul>
							</dd>




							<dt>나의 쇼핑 내역</dt>
							<dd>
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/myOrder"
										class=''> 주문 조회 </a></li>
									</a>
									</li>

								</ul>
							</dd>
							<dt>나의 레시피 관리</dt>
							<dd>
								<ul>
									<li><a href="<%=request.getContextPath()%>/recipelist.mp">
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
									<li><a
										href="<%=request.getContextPath()%>/myBoardlist.mp"> 나의
											게시글 </a></li>

									<li><a href="<%=request.getContextPath()%>/myQnalist.mp">
											1:1 문의내역 </a></li>
								</ul>
							</dd>
							<dt>회원정보</dt>
							<dd>
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/views/myPageUpdate/updateMember.jsp">
											회원정보수정 </a></li>

									<li><a
										href="<%=request.getContextPath()%>/views/myPageUpdate/deleteMember.jsp">
											회원탈퇴 </a></li>
								</ul>
							</dd>
						</dl>
		</div>
		<div class="mypage-contents">
			<section class="wrap-shopping-info" style="width: 62%;">

				<div class="shopping-info">
					<div class="area info01">
						<p>
							안녕하세요.
							<%=loginUser.getmName()%>님<br> chef J를 이용해주셔서 감사합니다.
						</p>
					</div>



				</div>

			</section>
			<%--프로필 자리 --%>
			<div class="contents">
				<!-- <div class="wrap-order-overview">
		<h2>한눈에 보는 나의 주문 현황</h2>
		<p class="desc">최근 3개월 주문현황입니다최근 3개월 주문현황입니다</p>
	</div>
	<form name="searchform2">
		<table class="order-search">
			<caption>한눈에 보는 나의 주문 현황</caption>
			<colgroup>
				<col width="15%">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">주문일자</th>
					<td class="order-day">
						
		<span>
			<span>
				<input type='text' id='sDate' name='sDate' value="" style='width:65px;' class='date-pick inputbox_05 font-en' />
			</span>
			<span>
				<input type='text' id='eDate' name='eDate' value="" style='width:65px;' class='date-pick inputbox_05 font-en' />
			</span>
		</span>
		
	
				<div class='calrenda_btns'>
					<a href="javascript:sDate('2019-12-12','2019-12-12',1);" onFocus='this.blur();'class='btn_date today'>오늘</a>
					<a href="javascript:sDate('2019-12-05','2019-12-12',1);" onFocus='this.blur();'class='btn_date'>1주일</a>
					<a href="javascript:sDate('2019-11-13','2019-12-12', 1);" onFocus='this.blur();'class='btn_date'>1개월</a>
					<a href="javascript:sDate('2019-06-13','2019-12-12',1);" onFocus='this.blur();'class='btn_date'>6개월</a>
					<a href="javascript:sDate('2018-12-13','2019-12-12',1);" onFocus='this.blur();' class='btn_date'>1년</a>

					
				</div>
<script>

		function sDate(FromDate,ToDate,dType) {
			
			
			var frm = document.search_frm;
			$('#sDate').val(FromDate);
			$('#eDate').val(ToDate);
		}
		
</script>
	
					</td>
				</tr> -->
				<!-- 	<tr>
					<th scope="row">주문상태</th>
					<td>
						<input type="checkbox" id="order_status_IR" name="order_status[]" value="IR" > <label for="order_status_IR">입금예정</label>
						<input type="checkbox" id="order_status_IC"  name="order_status[]" value="IC" ><label for="order_status_IC">입금확인</label>
						<input type="checkbox" id="order_status_DR" name="order_status[]" value="DR" > <label		for="order_status_DR">배송준비중</label>
						<input type="checkbox" id="order_status_DD" name="order_status[]" value="DD" > <label for="order_status_DD">배송지연</label>
						<input type="checkbox" id="order_status_DI" name="order_status[]" value="DI" > <label for="order_status_DI">배송중</label>
						<input type="checkbox" id="order_status_DC" name="order_status[]" value="DC" > <label for="order_status_DC">배송완료</label>
						<input type="checkbox" id="order_status_BF" name="order_status[]" value="BF" > <label for="order_status_BF">구매확정</label>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="od_search_text">상품명</label></th>
					<td>
						<input type="text" id="od_search_text" name="od_search_text" value="" style='width:343px;' title="">
					</td>
				</tr>
			</tbody>
		</table>

		<div class="mypage-sub-btn">
			<input type="submit" value="선택조건검색" title="선택조건검색" alt="선택조건검색" class='main_k_buttom buttom_m'>
			<a href="javascript:void(0);" id="check_all" class='sub_k_buttom buttom_m'>선택 해제하기</a>
		</div>
	</form> -->
				<div class="wrap-recently-order">
					<h2>주문 리스트</h2>
					<table class="common-table2">
						<caption>주문 리스트</caption>
						<colgroup>
							<col width="20%">
							<col width="*">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">주문일자/주문번호</th>
								<!-- <th scope="col">상품사진</th> -->
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
								<th scope="col">상품 금액</th>
								<th scope="col">주문상태</th>
							</tr>
						</thead>
						<tbody>
							<%-- <tr>
								<td class="cart_td_list option">
								<span class="option-info bl-color">2019-12-13<br>20191213-0000001<br></span>
								</td>


								<td class="first" rowspan="1">
									<div class="cart-goods-info">

										<span class="thumb"> <a href=''> <img
												src="<%=request.getContextPath()%>/resources/images/마늘.jpg">
										</a>
										</span>

									</div>
								</td>

								<!-- 옵션 -->

								<!-- //옵션 -->

								<td class="cart_td_list"><strong>마늘 200g</strong></td>
								<td class="cart_td_list"><span class="bg-sum2 ">1</span></td>



								<td class="cart_td_list"><span class="bg-sum2 "><strong>13,200</strong>원</span>
								</td>

								<!--묶음배송 1.착불은 무조건 개별-->
								<td class="cart_td_list">결제완료</td>

							</tr> --%>
							<% if(orderList.size() > 0) {%>
								<% for(int i = 0; i<orderList.size(); i++) {
									OrderDetail order = orderList.get(i);
								%>
									<tr>
										<td class="cart_td_list"><%= order.getOrderDate() %><br><%= order.getOrderId() %>-<%= order.getOrderDetailId() %></td>
										<td class="cart_td_list pName"><a href="<%=request.getContextPath()%>/detail.pr?pId=<%=order.getpId()%>"><%= order.getpName() %></td>
										<td class="cart_td_list"><%= order.getQuantity() %></td>
										<td class="cart_td_list"><%= order.getdPrice()%> 원</td>
										<td class="cart_td_list">결제완료</td>
									</tr>
								<%} %>
							<%}else{ %>
							<tr>
								<td colspan="5" class="no-content">
									정보가 존재하지 않습니다.
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>

			</div>


		</div>

	</div>


	</div>

	</div>


	<%@include file="../common/footer.jsp"%>
</body>

</html>