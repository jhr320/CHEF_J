<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="common.vo.*, product.model.vo.*, attachment.model.vo.*"%>
<%
	Product product = (Product)request.getAttribute("product");
	Attachment thumbnail = (Attachment)request.getAttribute("thumbnail");
	/* Attachment productDesc = (Attachment)request.getAttribute("productDesc");
	Attachment productInfo = (Attachment)request.getAttribute("productInfo"); */
	
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

.content {
	width: 80%;
	/* position: absolute; 
            left: 50%; 
            transform: translateX(-50%); */
	margin-left: auto;
	margin-right: auto;
}

.nav-link {
	color:white !important;
}

.product-detail-top {
	padding: 1rem;
	overflow: auto;
	margin-top: 1.5rem;
	/* border:1px solid red; */
}

.product-detail-bottom {
	height: 2000px;
	/* background-color: wheat; */
}

.product-detail-bottom div {
	padding: 10px;
	/* border: 1px solid black; */
}

.goods {
	display: inline-table;
}

.goods-menu {
	/* background-color:rgb(255, 170, 170); */
	/* border: 3px solid rgb(170, 57, 57); */
	border-radius: 1rem;
	background-color:rgb(170, 57, 57);
}

/* .nav-link {
			color:black !important;
		} */
.thumb {
	/* background-color: aquamarine; */
	float: left;
	overflow: hidden;
	/* margin-top:2rem; */
}

.thumb img {
	width: 100%;
	height: auto;
}

.putCart {
	margin-left: 5%;
	/* width:60%; */
}

.goods_name {
	font-weight: bold;
	font-size: 2em;
	margin-bottom: 0.2%;
}

.goods_short_desc {
	color: gray;
}

.goods_price {
	font-weight: bold;
	font-size: 1.5em;
	color: rgb(170, 57, 57);
}

.goods_total_price {
	font-weight: bold;
	font-size: 1.5em;
	color: rgb(170, 57, 57);
	text-align: right;
	margin-bottom: 0rem;
}

.li_table {
	/* border: 1px solid red; */
	margin-bottom: 10px;
	position: relative;
	overflow: auto;
}

.li_table ul {
	list-style: none;
	clear: left;
	margin: 0;
	padding: 0;
}

.li_table ul li {
	float: left;
	margin: 0;
	padding: 0.5rem;
	line-height: 3.5rem;
	border-top: 1px solid gray;
}

.li_table ul li:first-child {
	color: gray;
	width: 30%;
}

.li_table ul li:last-child {
	width: 60%;
}

.last_ul li {
	border-bottom: 1px solid gray;
}

.last_ul li:last-child input {
	height: 2rem;
	width: 4rem;
	text-align: center;
	border-radius: 0.5rem;
	/* border-style: none; */
}

.last_ul li:last-child button {
	height: 2rem;
	width: 2rem;
	line-height: 0.5rem;
	font-weight: 700;
	border-radius: 0.5rem;
	background-color: rgb(250, 250, 250);
	/* border-style: none; */
}

#put_cart {
	margin: 5px;
	width: 200px;
	height: 40px;
	background-color: rgb(255, 170, 170);
	color: white;
	border-style: none;
	border-radius: 10px;
	float: right;
}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	<%@ include file="../common/bootstrap.jsp"%>


	<section class="content">
		<div class="container-fluid">
			<div class="product-detail-top row">
				<!-- 썸네일, 상품명, 설명, 가격, 수량선택, 장바구니 버튼-->
				<div class="goods thumb col-4">
					<img
						src="<%= request.getContextPath() %>/<%= thumbnail.getfPath() %>/<%= thumbnail.getfName() %>"
						alt="상품이미지">
				</div>
				<div class="goods putCart col-7">
					<p class="goods_name"><%= product.getpName() %></p>
					<p class="goods_short_desc"><%= product.getpShortDesc() %></p>
					<p class="goods_price"><%= product.getpPrice() %>
						원
					</p>
					<div class="li_table">
						<ul>
							<li>판매단위</li>
							<li><%= product.getpSaleUnit() %></li>
						</ul>
						<ul>
							<li>중량/용량</li>
							<li><%= product.getpWeight() %></li>
						</ul>
						<ul class="last_ul">
							<li>구매수량</li>
							<li>
								<button type="button" class="minus">-</button> <input
								type="number" class="numBox" min="0" value="0"
								readonly="readonly" />
								<button type="button" class="plus">+</button>
							</li>
						</ul>
					</div>
					<br>
					<p class="goods_total_price">
						총 상품 금액 : <span id="totalPrice">0</span> 원
					</p>
					<button type="button" id="put_cart">장바구니 담기</button>
				</div>
			</div>
			<div class="product-detail-bottom">
				<!-- 상품설명, 상품정보, 후기 탭 Scrollspy 이용해보기-->
				<nav id="goods-menu1" class="navbar goods-menu">
					<!-- <a class="navbar-brand" href="#">Navbar</a> -->
					<ul class="nav nav-pills">
						<li class="nav-item selected-item"><a class="nav-link"
							href="#goods-menu1">상품 설명</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu2">상품
								정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu3">고객
								후기</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu4">상품
								문의</a></li>
					</ul>
				</nav>


				<div class="product-desc">
					<p>
						<strong>상품 설명 sample</strong><br> 되려니와, 얼마나 바로 뜨고, 피다. 이상 앞이
						몸이 청춘 있다. 그들은 주며, 불러 아름답고 피가 천하를 무한한 사막이다. 용기가 구하기 희망의 풀밭에 같은 광야에서
						사막이다. 두손을 오아이스도 그들은 반짝이는 대고, 풀이 그들은 부패뿐이다. 긴지라 것은 무엇을 끓는 피가 것이다.
						꾸며 곳이 우리는 충분히 이성은 찾아다녀도, 위하여, 피어나기 인간의 이것이다. 충분히 못하다 그들은 것이다. 풍부하게
						수 만천하의 칼이다. 소금이라 아름답고 설산에서 실현에 천지는 별과 듣기만 그들은 피다. <br> 피고 생의
						그와 것이다.보라, 부패뿐이다. 열락의 옷을 청춘에서만 영락과 것은 그들의 만천하의 사랑의 때문이다. 천자만홍이 이상
						피에 두손을 불어 곳이 되는 칼이다. 현저하게 바이며, 우는 천자만홍이 많이 부패를 피에 가지에 위하여서, 봄바람이다.
						거친 동력은 내는 귀는 주는 곳으로 것이 무엇을 이성은 것이다. 살았으며, 동력은 놀이 안고, 아름다우냐? 우리는
						커다란 대고, 곳이 쓸쓸하랴? 인생을 피에 같은 피고 같지 반짝이는 때문이다. 커다란 설산에서 평화스러운 있는가?
						내려온 사랑의 새가 사막이다. <br> 천지는 무엇을 용기가 생생하며, 위하여서. 얼마나 불어 새 하였으며,
						위하여, 온갖 것이다. 뛰노는 사랑의 구하기 장식하는 용감하고 길지 트고, 칼이다. 끝까지 봄바람을 위하여, 뛰노는
						가치를 열락의 그들은 거선의 것이다. 이상이 눈에 내는 그들은 찾아 있을 우리 무한한 말이다. 청춘을 인생의 예가
						소담스러운 길을 이상의 인간의 위하여서. 가지에 보내는 따뜻한 설레는 위하여 같이, 유소년에게서 하는 창공에 것이다.
						있는 살 풀이 희망의 운다. 수 사랑의 청춘은 불어 얼마나 충분히 보배를 듣기만 황금시대다.
					</p>
				</div>

				<nav id="goods-menu2" class="navbar goods-menu">
					<!-- <a class="navbar-brand" href="#">Navbar</a> -->
					<ul class="nav nav-pills">
						<li class="nav-item selected-item"><a class="nav-link"
							href="#goods-menu1">상품 설명</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu2">상품
								정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu3">고객
								후기</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu4">상품
								문의</a></li>
					</ul>
				</nav>

				<div class="product-info">
					<p>
						<strong>상품 정보 sample</strong><br> 황금시대의 어디 그러므로 것이다. 그러므로 같이
						이것을 이상의 피가 심장은 것이다. 온갖 않는 구하지 그들을 위하여서. 그들은 꽃 따뜻한 작고 칼이다. 온갖 황금시대를
						그들의 새가 주는 주며, 것이다. 예수는 이것이야말로 우리는 그러므로 사랑의 별과 인간의 공자는 위하여서. 생의 피부가
						사라지지 인생을 안고, 이상의 반짝이는 불어 봄바람이다. 가진 가지에 두손을 새가 거선의 이것이다. 그들은 구하지 갑
						것이다.보라, 긴지라 희망의 교향악이다. 그들의 구하기 피가 이것이야말로 커다란 교향악이다. <br> 풍부하게
						위하여서, 끓는 눈이 어디 쓸쓸하랴? 뼈 많이 바이며, 그들의 끓는다. 뜨고, 가치를 할지니, 행복스럽고 있는 사라지지
						아니다. 새가 얼마나 아름답고 얼마나 청춘에서만 바로 이상은 긴지라 피에 피다. 만물은 행복스럽고 없으면, 우리는
						긴지라 피다. 눈이 맺어, 그러므로 할지니, 듣기만 새가 바로 모래뿐일 철환하였는가? 천지는 소금이라 보배를 얼마나
						영원히 그들은 우리의 위하여서 뼈 교향악이다. 청춘이 인생에 같이, 그것을 끓는다. 원대하고, 같이 어디 간에
						쓸쓸하랴? <br> 싶이 하는 없으면 얼음에 실현에 설산에서 같이, 가지에 그리하였는가? 발휘하기 사람은
						산야에 이상의 얼마나 끓는 사막이다. 이상은 몸이 무엇을 싹이 오아이스도 것이다. 미인을 크고 얼마나 청춘의 수
						듣는다. 무엇을 소리다.이것은 기쁘며, 같은 것이 것은 끓는다. 이상이 눈에 뼈 같으며, 같지 천자만홍이 이상의 그들은
						주며, 것이다. 그들의 그러므로 무엇을 사라지지 같지 대고, 철환하였는가? 새 못하다 이상은 가치를 꽃 눈에 때문이다.
						피어나기 있을 곳이 피고 미묘한 운다. 그들은 그들에게 곳이 무엇을 같이, 보는 가슴이 아니더면, 스며들어 봄바람이다.
						피가 자신과 인생의 청춘이 것이다.
					</p>
				</div>

				<nav id="goods-menu3" class="navbar goods-menu">
					<!-- <a class="navbar-brand" href="#">Navbar</a> -->
					<ul class="nav nav-pills">
						<li class="nav-item selected-item"><a class="nav-link"
							href="#goods-menu1">상품 설명</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu2">상품
								정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu3">고객
								후기</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu4">상품
								문의</a></li>
					</ul>
				</nav>

				<div class="review">
					<p>
						<strong>고객 후기 sample</strong><br> 별 새겨지는 많은 하나에 있습니다. 추억과 새워
						그러나 북간도에 잠, 있습니다. 이름과, 하나에 때 까닭입니다. 언덕 무덤 이국 까닭이요, 까닭입니다. 밤을 별 당신은
						계십니다. 속의 어머님, 오면 나의 우는 별 아스라히 북간도에 아무 까닭입니다. 멀듯이, 청춘이 마디씩 보고, 아이들의
						거외다. 다 자랑처럼 오는 토끼, 어머님, 나는 별을 그리워 계십니다. 별빛이 속의 남은 가슴속에 흙으로 봅니다. <br>
						별 추억과 청춘이 마리아 계십니다. 하늘에는 별 내 이름자 않은 북간도에 보고, 있습니다. 남은 어머님, 아침이 노새,
						쉬이 아무 이런 버리었습니다. 된 파란 별 하나에 헤일 이름과, 거외다. 부끄러운 하나에 이름자 파란 아무 청춘이 별
						듯합니다. 흙으로 동경과 묻힌 나의 봅니다. 이름자 보고, 별 어머님, 새워 계절이 북간도에 내 하나에 있습니다. 이웃
						불러 무덤 까닭입니다. 멀리 아스라히 옥 아무 하나의 봅니다. 동경과 잠, 하나 있습니다.<br> 묻힌 같이
						한 라이너 둘 봅니다. 둘 말 이름자를 이름과, 때 아름다운 이름과 까닭입니다. 어머님, 경, 별 둘 것은 계십니다.
						멀리 시인의 어머니, 가슴속에 이름을 별들을 멀듯이, 새워 계십니다. 이국 별에도 벌레는 자랑처럼 가을 동경과 시와
						봅니다. 아직 토끼, 다 밤을 멀리 이제 나는 지나가는 버리었습니다. 말 하나의 라이너 아이들의 시인의 어머니, 가을로
						내린 벌써 거외다. 이름과, 무엇인지 가을 별 이제 듯합니다. 당신은 겨울이 새겨지는 풀이 보고, 못 까닭입니다.
						청춘이 무성할 시인의 별 오면 했던 있습니다. 이국 계절이 이름자 불러 별이 노루, 덮어 이웃 속의 까닭입니다.
					</p>
				</div>

				<nav id="goods-menu4" class="navbar goods-menu">
					<!-- <a class="navbar-brand" href="#">Navbar</a> -->
					<ul class="nav nav-pills">
						<li class="nav-item selected-item"><a class="nav-link"
							href="#goods-menu1">상품 설명</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu2">상품
								정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu3">고객
								후기</a></li>
						<li class="nav-item"><a class="nav-link" href="#goods-menu4">상품
								문의</a></li>
					</ul>
				</nav>

				<div class="product-question">
					<p>
						<strong>상품 문의 sample</strong><br> 비둘기, 멀듯이, 이름을 보고, 나는 않은
						있습니다. 잔디가 무성할 못 계절이 써 봅니다. 패, 이름과, 별 보고, 까닭입니다. 이런 가을로 하나 이국 사랑과
						당신은 너무나 이름과 이름과, 있습니다. 별 이름과, 다 다하지 때 그리고 듯합니다. 가난한 시인의 별을 둘 이름과
						같이 봅니다. 마리아 말 이름을 흙으로 하나에 봄이 듯합니다. 이름과, 어머니 나는 잔디가 이름과 봅니다. 하나에 이웃
						토끼, 노새, 언덕 이름과, 멀리 청춘이 불러 까닭입니다. 멀리 별들을 멀리 까닭입니다. 나는 별이 이네들은 아무
						별들을 다 쓸쓸함과 밤을 하나에 버리었습니다. <br> 이제 하나에 것은 무성할 별빛이 까닭입니다. 무덤 내린
						우는 하나의 마리아 새워 버리었습니다. 멀듯이, 패, 쉬이 봅니다. 밤이 사람들의 나의 봄이 계십니다. 어머니, 잠,
						무엇인지 나는 까닭입니다. 별 내 다 있습니다. 걱정도 잔디가 어머니, 어머니, 밤이 별 별 않은 있습니다. 내 쉬이
						어머님, 잔디가 강아지, 노루, 이국 라이너 있습니다. 나의 나는 하나에 까닭입니다. 말 계절이 별 이름과, 지나가는
						하늘에는 밤을 거외다. <br> 새워 딴은 잠, 책상을 청춘이 나의 하나에 거외다. 다 하나에 시와 내일 봄이
						남은 별 풀이 봅니다. 않은 프랑시스 어머니, 덮어 불러 듯합니다. 별들을 잔디가 위에도 경, 이국 어머니 어머니,
						있습니다. 별 별 아침이 계절이 까닭입니다. 봄이 것은 아무 무엇인지 듯합니다. 북간도에 애기 사랑과 계십니다.
						아이들의 아무 위에 그러나 계십니다. 오면 이제 이름을 있습니다. 하나에 자랑처럼 나는 다 버리었습니다. 내 다
						북간도에 불러 가을로 가슴속에 하나에 잔디가 아직 듯합니다.
					</p>
				</div>
			</div>

		</div>
		<!-- container 끝-->

	</section>

	<script>
    	$(".plus").click(function(){
    		var num = Number($(".numBox").val());
    		var str = <%= product.getpStock()%>
    		/* console.log(str); */
    		var price = Number(<%= product.getpPrice() %>);
    		if(num<Number(str)){
        		num = num + 1;
        		var total = Number($("#totalPrice").html()) + price;
        		$("#totalPrice").html(total);
    		}
    		$(".numBox").val(num);
    	});
    	
    	$(".minus").click(function(){
    		var num = Number($(".numBox").val());
    		var price = Number(<%= product.getpPrice() %>);
    		if(num>0){
        		num = num - 1;
        		var total = Number($("#totalPrice").html()) - price;
        		$("#totalPrice").html(total);
    		}
    		$(".numBox").val(num);
    	});
    	
    	// 장바구니 버튼 클릭 시 
    	$("#put_cart").click(function(){
    		<%if (loginUser != null) {%>
    		if(Number($(".numBox").val())>0){
    			var productId = "<%=product.getpId()%>";
    			var q = $(".numBox").val();
    			var userId = "<%=loginUser.getmId()%>";
    			// 장바구니에 담기
    			$.ajax({
					url : "cart.pr",
					data : { pId : productId,
							quantity : q,
							userId : userId},
					type : "post",
					success : function(re){
						console.log(re);
						var cartPage = confirm('장바구니로 이동하시겠습니까?');
						if(cartPage){
							// 장바구니 페이지로 이동
							location.href = "<%=request.getContextPath()%>/myCart";
							
						}else {
							$(".numBox").val(0);
							$("#totalPrice").html(0);
							location.reload();
						}
						
					},
					error : function() {
						alert('장바구니에 담기 실패!!.');
					}
					
				});
    			
    		}else{
    			alert('구매 수량을 1개 이상 선택해주세요.');
    		}
    		<%} else {%>
    			alert('로그인 후 장바구니를 이용할 수 있습니다.');
				location.href="<%=contextPath%>/views/member/memberLoginForm.jsp";
	<%}%>
		});
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>