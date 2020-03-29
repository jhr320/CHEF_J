<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>

<%
	Member m = (Member) session.getAttribute("loginUser");

	String userId = m.getmId();
	String userPwd = m.getmPwd();
	String userName = m.getmName();
	String phone = m.getPhone();
	String email = m.getEmail();
	String address = m.getAddr();
	String gender = m.getGender();

	int idx = address.indexOf(")"); 	
	String address1 = address.substring(0,idx+1);
	String address2 = address.substring(idx+2);
	
/* 	 String address0 = (m.getAddr() != null) ? m.getAddr() : "";
	   
	 String newAddr[] = address0.split("+");
	    */
/* 
		String gender="";
		if(loginUser.getGender().equals("F")){
		 			gender="여";}else if(loginUser.getGender().equals("M")) {
					gender="남";} else{ 
					 gender="선택없음";}
	 */
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/master.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/operate2.css">



</head>
<style>
.part1, .mypage-contents, .sub-container {
	diplay: inline-block;
	/* border:1px solid red; */
	height: 100%;
}

.wholewhole {
	width: 85%;
	height: 1100px;
	margin: auto;
	/* border:1px solid blue; */
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
										href="<%=request.getContextPath() %>/views/myPageUpdate/myProfile.jsp">프로필
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
									<li><a href="<%=request.getContextPath() %>/recipelist.mp">
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
										href="<%=request.getContextPath() %>/myBoardlist.mp"> 나의
											게시글 </a></li>

									<li><a href="<%=request.getContextPath() %>/myQnalist.mp">
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
										href="<%=request.getContextPath() %>/views/myPageUpdate/deleteMember.jsp">
											회원탈퇴 </a></li>
								</ul>
							</dd>
						</dl>
		</div>
		<div class="mypage-contents">
			<section class="wrap-shopping-info">
				<h2 class="hidden">회원 쇼핑정보</h2>
				<div class="shopping-info">
					<div class="area info01">
						<p>
							안녕하세요.
							<%=loginUser.getmName() %>님<br> chef J를 이용해주셔서 감사합니다.
						</p>
					</div>



				</div>
			</section>
			<%--여기서부터 시작 자리 --%>
			<div class="wrap-profile">
				<h2>회원정보 수정</h2>
				<p class="desc">고객님들의 회원정보 수정을 처리해드립니다.</p>



				<form id="updateMember" name="updateMember"
					action="<%=contextPath%>/update.me" method="post">
					<table class="common-write">
						<caption>회원정보 입력</caption>
						<colgroup>
							<col width="15%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">아이디<span class='main-color'>*</span></th>
								<td><input type="text" name="userId"
									value="<%=loginUser.getmId()%>" style="width: 183px;" readonly></td>
							</tr>

							<tr>
								<th scope="col">패스워드<span class='main-color'>*</span></th>
								<td><input type="hidden" name="userPwd"> <a
									href="#"
									onclick='window.open("<%=request.getContextPath()%>/views/myPageUpdate/updatePwd.jsp","_blank","height=330,width=470, status=yes,toolbar=no,menubar=no,location=no");return false'
									rel="facebox" class='main_ks_buttom buttom_ss'
									style='width: 183px;'>비밀번호 변경</a></td>

							</tr>

							<tr>
								<th scope="col">이름<span class='main-color'>*</span></th>
								<td><input type="text" name="userName"
									value="<%=loginUser.getmName()%>" style="width: 183px;"
									readonly></td>
							</tr>
							<tr>
								<th scope="col">이메일<span class='main-color'>*</span></th>
								<td><input type="text" name="email"
									value="<%=loginUser.getEmail()%>" style="width: 183px;"></td>
							</tr>
							<tr>
								<th scope="col">휴대전화<span class='main-color'>*</span></th>
								<td><input type="text" name="phone"
									value="<%=loginUser.getPhone()%>" style="width: 183px;"></td>
							</tr>



							<tr>
								<th scope="col">배송주소<span class='main-color'></span></th>
								<td><input type="button" value="주소검색"
									class="juso_btn s_btn main_ks_buttom buttom_ss"
									onclick="goPopup();"> <span class="sect"> <input
										type="text" class="roadFullAddr" name="roadFullAddr"
										id="roadFullAddr" style="width: 350px;" value="<%=address1%>"
										readonly></span> <span class="sect"> <input
										type="text" id="addrDetail" name="addrDetail" id="addrDetail"
										class="addrDetail" style="width: 350px;"
										value="<%=address2 %>" readonly>
								</span></td>
							</tr>
							<tr>


								<th scope="col">성별</th>
								<%-- <% if(loginUser.getGender().equals("F")){ %>
								<% String gender="여";}else if(loginUser.getGender().equals("M")){%>
								<% String gender="남";}else{ %>
								<% String gender="선택없음";} %> --%>
								<td>
									<%=gender %>
								</td>


							</tr>






							<tr>
								<th scope="col">생년월일</th>

								<td class="memberCols2">

									<div class="birth_day">
										<input type="text" name="birth_year" id="birth_year"
											pattern="[0-9]*"
											value="<%=loginUser.getBirth().substring(0, 4)%>"
											label="생년월일" size="4" maxlength="4" placeholder="YYYY"
											style="width: 130px;">&nbsp; <input type="text"
											name="birth[]" id="birth_month" pattern="[0-9]*"
											value="<%=loginUser.getBirth().substring(5, 7)%>"
											label="생년월일" size="2" maxlength="2" placeholder="MM"
											style="width: 130px;"> &nbsp; <input type="text"
											name="birth[]" id="birth_day" pattern="[0-9]*"
											value="<%=loginUser.getBirth().substring(8, 10)%>"
											label="생년월일" size="2" maxlength="2" placeholder="DD"
											style="width: 130px;">
									</div>
									<p class="guide_txt">
										<span style="display: none;" class="txt">태어난 월을 정확하게
											입력해주세요</span>
										<!-- <span style="display: none;" class="txt">태어난 일을 정확하게 입력해주세요</span> -->
										<!-- <span style="display: none;" class="txt">태어난 년도를 정확하게 입력해주세요</span> -->
									</p>
								</td>

							</tr>







						</tbody>
					</table>
					<div class="btn-area">
						<button id="updateBtn" onclick="goToSubmit()"
							class="buttom_m main_k_buttom">수정하기</button>

						<button id="toMain" onclick="returnToMain()" type="button"
							class="buttom_m sub_k_buttom">취소</button>

					</div>
					<input type="hidden" id="test1" name="test1">
				</form>
			</div>
		</div>



	</div>



	<script language="javascript">
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

function returnToMain(){
	location.href="<%=request.getContextPath()%>/views/myPageUpdate/myProfile.jsp";
		}

		function goToSubimt() {

			$("#updateForm").submit();
		}

		/* $(function(){
		 var userId = $("input[name=userId]").val();
		 console.log('아이디 : ' + userId);
		 var test1 = '넘어가자';
		 $("#updateBtn").click(function(){
		 $("input[name=test1]").val(test1);
		 $("input[name=userId]").val(userId);
		 $("#updateMember").submit();
		 });
		 }); */
	</script>






	<%@include file="../common/footer.jsp"%>
</body>

</html>