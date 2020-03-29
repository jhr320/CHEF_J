<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!--차트링크-->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<title>Insert title here</title>
 
  <style>
    *{
      box-sizing: border-box;
    }
    
    
    
    
    * {
	box-sizing: border-box;
}

/*/////////// 사이드메뉴 */
.notice_link {
	background: #f9f9f9;
	color: rgb(170, 57, 57);
}

.outer_m {
	display: block;
	width: 1050px;
	height: 800px;
	/* border: 1px solid red; */
	margin: auto;
}

/*사이드메뉴 영역*/
.content1 {
	width: 25%;
	height: 100%;
	display: inline-block;
	float: left;
	/* border: 1px solid green; */
}

/*////////////본문영역*/
.content2{
	width: 75%;
	height: 100%;
	display: inline-block;
	float:left;

	/* border:1px solid black; */
}

.board-postnav-side {
	width: 90%;
	height: 350px;
	margin: auto;
	background-color: white;
	border: 1px solid lightgrey;
	font-size: 14px;
}

.board-postnav-side>ul li {
	height: 50px;
	border-bottom: 1px solid lightgrey !important;
	line-height: 2;
}
.board-postnav-side>ul>li:hover {
	background-color: #f9f9f9 !important;
	color: rgb(170, 57, 57);
}

.board-postnav-side>ul>li>a {
	color: black;
}

.board-postnav-side>ul>li>a:hover {
	color: rgb(170, 57, 57);
}


    
    
    
    
    
    .paging {
      height: 100%;
      text-align: center;
      padding: 10px;
    }

    .paging:before {
      content: "";
      display: inline-block;
      width: 1px;
      height: 100%;
      margin-right: 0;
      vertical-align: middle;
    }

    .page-nav {
      display: inline-block;
      vertical-align: middle;
    }

  .dashboard{
  display:inline-block;
    border:1px solid red;
    height: auto;
    width: 100%;
    margin: auto;
  }
    .chartDiv {
      width: 70%;
      height: 400px;
      float: left;
      border:1px solid red;
    }
    .myChart{
      height: 400px !important;
      width: 400px;
    }
    .revenueDiv {
      width: 30%;
      height: 400px;
      float: left;
      border:1px solid red;
    }
  .orderAdmin_txt{
    font-size:20px;
    font-weight: 900;
  }
  .admin_side_div {
	border: 1px solid black;
}

.side_txt_div1 {
	padding: 15px 5px 5px 5px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}
  </style>
</head>
<body>
<%@ include file="../common/bootstrap.jsp" %>
<%@ include file="../common/menubar.jsp" %>


	<div class="outer_m">
		<!-- 전체영억 -->
		<!-- 사이드메뉴 영역-->
		<div class="content1">
			<% if(loginUser == null){ %>
			<div class="side_txt_div1">
				<p class="side_txt">고객센터</p>
			</div>
			<%} else{%>
			<% if(loginUser.getmId().equals("admin")){ %>
			<div class="side_txt_div1">
				<p class="side_txt">관리센터</p>
			</div>
			<%}else{ %>
			<div class="side_txt_div1">
				<p class="side_txt">고객센터</p>
			</div>
			<%} %>
			<%} %>

			<div class="side_menu_div2">
				<div class="board-postnav-side">
					<ul class="nav flex-column " id="sidebar">
						<li class="nav-item  border border-light notice_link"
							onclick="goNoticeList()"><a class="nav-link active">공지사항</a>
						</li>
						<li class="nav-item border border-light question_link"
							onclick="goQnaList()"><a class="nav-link question_a">1:1문의
								내역</a></li>
						<%if (loginUser != null && loginUser.getmId().equals("admin")) {%>
						<!--  탈퇴, 등급변경, 회원정보세부내용확인 -->
						<li class="nav-item border border-light"><a class="nav-link"
							href="<%=request.getContextPath() %>/memberList.admin">회원관리</a></li>
							
						<%-- <li class="nav-item border border-light"><a class="nav-link"
							href="<%=request.getContextPath() %>/OrderList.admin">주문관리</a>
							</li><!-- 주문내역확인, 월별 매출확인 --> --%>
							<li class="nav-item border border-light"><a class="nav-link"
							href="<%=request.getContextPath() %>/views/admin/orderAdmin.jsp">주문관리</a>
							</li><!-- 주문내역확인, 월별 매출확인 -->
							
							
						<li class="nav-item border border-light"><a class="nav-link"
							href="#">상품관리</a></li><!-- 상품등록(사진필요),삭제 재고변경, 추천상품선택 -->
							
						<li class="nav-item border border-light"><a class="nav-link"
							href="#">게시글관리(자유, 후기, 레시피)</a></li>

						<%}%>

					</ul>
				</div>
			</div>
		</div>

		<script>
	function goQnaList(){
		<%if(loginUser!= null){%>
			location.href="<%=request.getContextPath()%>/list.qna";
			
		<%}else{%>
			alert("로그인하셔야 본 서비스를 이용할 수 있습니다.");
			location.href="<%=request.getContextPath()%>/views/member/memberLoginForm.jsp";
		<%}%>
	};
	
	function goNoticeList(){
			location.href="<%=request.getContextPath()%>/list.no";
	};
</script>


		<!-- content2 -->
		<!-- 게시판 영역 -->
		<div class="content2">
		<div class="sub_text_area" style="diplay:inline-block; width: 100%;/*  border:1px solid black; */">				
				<p style="font-size: 16px; font-weight: 900; text-align: left; line-height:'2';/*  border:1px solid black;  */margin-top:20px; margin-bottom:20px;"
				class="orderAdmin_txt">
				주문관리</p>
				</div>
				 <div class="dashboard">
    <div class="chartDiv">
      <canvas id="myChart"></canvas>
    </div>

    <div class="revenueDiv">
      <table class="table revenueTable">
        <thead class="thead-light">
          <tr>
            <th scope="col">Month</th>
            <th scope="col">Revenue</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row mon">1</th>
            <td>Mark</td>

          </tr>
          <tr>
            <th scope="row mon">2</th>
            <td>Jacob</td>

          </tr>
          <tr>
            <th scope="row mon">3</th>
            <td>Larry</td>

          </tr>
          <tr>
            <th scope="row mon">4</th>
            <td>Larry</td>

          </tr>
          <tr>
            <th scope="row mon">5</th>
            <td>Larry</td>

          </tr>
          <tr>
            <th scope="row mon">6</th>
            <td>Larry</td>

          </tr>
        </tbody>
      </table>
    </div>
  </div>
			  <div class="table_div">
    <table class="table">
      <thead class="thead-light">
        <tr>
          <th scope="col">주문번호</th>
          <th scope="col">아이디</th>
          <th scope="col">주문일</th>
          <th scope="col">등급</th>
          <th scope="col">주문액수</th>

        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row oId">1</th>
          <td>Mark</td>
          <td>Otto</td>
          <td>@mdo</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row oId">2</th>
          <td>Jacob</td>
          <td>Thornton</td>
          <td>@fat</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row oId">3</th>
          <td>Larry</td>
          <td>the Bird</td>
          <td>@twitter</td>
          <td>@mdo</td>
        </tr>
      </tbody>
    </table>
  </div>
		</div>
		</div>

 






  <script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'line',

      // The data for our dataset
      data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
          label: '최근매출', fill: false,

          borderColor: 'rgb(255, 99, 132)',
          data: [0, 10, 5, 2, 20, 30, 45]
        }]
      },

      // Configuration options go here
      options: {}
    });
  </script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>