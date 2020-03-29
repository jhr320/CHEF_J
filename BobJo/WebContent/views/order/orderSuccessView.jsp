<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String orderId = (String)request.getParameter("orderId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>J market</title>
<style>
body {
	margin: auto;
	position: relative;
}

.container-fluid {
	position: relative;
	text-align: center;
}

.order-success {
	text-align: center;
	background-color: rgb(207, 207, 207);
	width: 70%;
	margin-top: 2rem;
	margin-bottom: 2rem;
	padding: 3rem;
}

.order-success p:first-child {
	font-weight: bold;
	font-size: 2rem;
}

.order-success button {
	border: none;
	width: 10rem;
	height: 3rem;
	border-radius: 0.5rem;
	background-color: rgb(170, 57, 57);
	color: white;
	font-size: 1.2rem;
}

.order-success .button-div {
	width: 90%;
	margin: 1rem;
}

.button-div button {
	margin: 1rem;
}

.button-div button a {
	text-decoration:none !important;
	color : white;
}
</style>

</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/bootstrap.jsp"%>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-3"></div>
				<div class="order-success col-6">
					<p>주문 완료</p>
					<%-- <p>주문 번호 : <%= orderId %>; --%>
					<p>주문이 완료되었습니다. 마이페이지에서 주문을 확인하세요.</p>
					<div class="button-div">
						<button><a href="<%= contextPath %>/myOrder">주문 조회</a></button>
						<button><a href="<%= contextPath %>">홈으로</a></button>
					</div>
				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</section>


	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

</body>
</html>