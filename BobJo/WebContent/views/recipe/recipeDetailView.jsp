<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="recipe.model.vo.*" import="attachment.model.vo.*, recipe.model.vo.*, java.util.ArrayList, member.model.vo.*"%>
<%
	ArrayList<Recipe> rlist = (ArrayList<Recipe>)request.getAttribute("rlist");

	Attachment thumbnail = (Attachment)request.getAttribute("thumbnail");
	/* Attachment recipeStep = (Attachment)request.getAttribute("recipeStep"); */
	
	ArrayList<Attachment> rStepList = (ArrayList<Attachment>)request.getAttribute("rStepList");
	

	ArrayList<Attachment> imgList = (ArrayList<Attachment>)request.getAttribute("imgList");
	
	/* Member member = request.getAttribute("member"); */
	
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/master.css"> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/operate2.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
div , td, tr{
 	/*  border: 1px solid red;  */
}



/* .rImage {
	margin-left: 30%;
	width: 500px;
	height: 300px;
} */

.userImage {
	border-radius: 50px;
	width: 100px;
	height: 100px;
	margin-left: 46%;
	margin-top: -5%;
}

.hole {
	float: left;
	margin-left: 34%;
}

.11 {
	float: left;
}



.test3 {
	text-align: right;
}

.introduce {
	width: 100%;
	height: 20%;
	vertical-align:middle;
	text-align:center;
	font-size:20px;
}

.ex {
	display: inline-block;
}

.ex1 {
	margin-left: 34%;
}

.ex2 {
	margin-left: 10%;
}

.ex3 {
	margin-left: 10%;
}

.img {
	width: 70px;
	height: 50px;
}

.exe {
	width: 70px;
	height: 50px;
	text-align: center;
}

.div3 {
	width: 100%;
	height: 40%;
	margin: auto;
}

.second {
	width: 80%;
	margin: auto;
}

.third {
	display: inline-block;
	width: 200px;
	height: 40px;
}

.ep {
	color: grey;
}
/* 
.recipe {
	width: 50%;
	height: 200px;
	display: inline-block;
	float: left;
} */

/* .step {
	display: inline-block;
	width: 80%;
} */

.recipe {
	display: inline-block;
	width: 350px;
	height: 200px;
}

.num {
	width: 50px;
	height: 50px;
	font-size: 30px;
	color: green;
}

.pic {
	width: 100px;
	height: 100px;
	border-radius: 50px;
}

.dddd {
	display: inline-block;
	width: 200px;
	height: 200px;
}

.aaaa {
	dislay: inline-block;
	width: 100%;
	height: 50%;
}

.dog {
	width: 150px;
	height: 150px;
	border-radius: 100px;
}

.ssss {
	display: inline-block;
	width: 200px;
	height: 100px;
}

.pp {
	font-weight: bold;
}

.card {
	display: inline-block;
}

.card-img {
	width: 100%;
	height: 100%;
}

.reply {
	display: inline-block;
}

.rep {
	font-size: 20px;
	font-weight: bold;
}

.picture {
	display: inline-block;
}

.plus {
	width: 100px;
	height: 120px;
	float: left;
}

#pluspic {
	width: 100%;
	height: 100%;
	float: left;
}


.card {
display:inline-block;
float:left;
}


.rPic{
width:100px;
height:100px;
}


.stepImg{
width:100%;
height:100%;
}


.rStep{
height:300px;
display:inline-block;





}


.stepNo{
font-size:2em;
color: rgb(170, 57, 57);
vertical-align:top;
text-align:right;
}


.stepSeq{

vertical-align:top;
text-align:center;

}

td,tr,th{
/* border:1px solid red; */
}



.comcom{
height:100px;
display:inline-block;
width:6%;

}

.comout{
width:34%;
display:inline-block;
height:15px;
}

.com1{
height:70%;margin:auto;
}

.com2{
height:30%;
margin:auto;
}


.gd{
width:100%;
height:100%;
margin:auto;
}


.ab{
display:inline-block;
margin:auto;
}




.com2{
text-align:center;
}


.first{
font-size:20px;
font-weight:bold;
}




/* .sPic{
width:100px;
height:100px;
} */

.rstep{
float:left;
border-spacing: 50px;
  border-collapse: separate;
  margin-top:20px;


}

.rstep2{
/* float:right; */
 border-spacing: 50px;
  border-collapse: separate;


}




.rstepPic{
width:400px;
height:250px;
border-radius:10px;
}

div{
/* border:1px solid red; */
}

.stepNo{
height:250px;
}


.mainPic {

width:100%;
height:100%;
}


.rstep{
margin-left:50px;



}

/* td,tr{
border: 1px solid red;
} */



</style>

<!-- <script>
	$("#imgfile").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.readAsDataURL(this.files[0]);

			reader.onload = function() {
				console.log(reader.result);
				$("#imgArea").html("<img src=" + reader.result + ">");
			}

		}
	});
</script> -->

</head>
<body>

	<%@include file="../common/menubar.jsp" %>
	<%@include file="../common/bootstrap.jsp" %>
	<br>
	
	<br><br>
	<div class="wholewhole" style="width:70%; margin:auto;">
	
	<div class="wraps" style="width:100%; height: 300px">
		<div class="thumbnail" style="width:40%; height:100%; margin:auto; " >
			
		
				
				
				
				<img class="mainPic" src="<%=request.getContextPath()%>/<%=thumbnail.getfPath()%>/<%=thumbnail.getfName()%>">
				
                </div>
		</div>
		<div class="user">
			<img class="userImage"src="<%=request.getContextPath() %>/resources/images/강아지.jpg">
		</div>
		<%for (int i = 0; i < rlist.size(); i++ ) {%>
	

		<%if(rlist.get(i).getsStep()==1){ %>
		<div class="rWriter" ><h3 align="center"><%=rlist.get(i).getmNo()%></h3></div>
		<div class="rName" ><h1 align="center"><%= rlist.get(i).getrName()%></h1></div>
		
		
		
		<hr>

		<div class="introduce" >
		
					<br><br>
				
					<%=rlist.get(i).getrInfo() %>
					<%} %>
				<%} %>
					<br><br><br><hr>

			
		</div>

		<br>
		<div class="div2" >

			<%-- <div class="complex">
				<div class="ex ex1">
					<img class="img img1" src="<%= request.getContextPath() %>/resources/images/인분.PNG">
					<div class="exe exe1">1인분</div>
				</div>
				<div class="ex ex2">
					<img class="img img2" src="<%= request.getContextPath() %>/resources/images/소요시간.PNG">
					<div class="exe exe2"><%=rlist.get(0).getrCookTime() %></div>
				</div>
				<div class="ex ex3">
					<img class="img img3" src="<%= request.getContextPath() %>/resources/images/난이도.PNG">
					<div class="exe exe3"><%=rlist.get(0).getrCookLevel() %></div>
				</div>
			</div> --%>
			
			
			
			
			<!-- <div class="wow" > -->
			<!-- <div class="col-5 ad" style="border:1px solid black;"></div> -->
			<div class="col-1 ab" style="margin-left:37%;" >
				<div class="com1"><img class="gd" src="<%=request.getContextPath()%>/resources/images/user (2).png"></div>
				<div class="com2">1인분</div>
			</div>
			<div class="col-1 ab" >
				<div class="com1"><img class="gd" src="<%=request.getContextPath()%>/resources/images/time-left.png"></div>
				<div class="com2"><%=rlist.get(0).getrCookTime() %>분</div>
			</div>
			<div class="col-1 ab" >
				<div class="com1"><img class="gd" src="<%=request.getContextPath()%>/resources/images/star.png"></div>
				<div class="com2"><%=rlist.get(0).getrCookLevel() %></div>
			</div>
			
			
			
			<!-- <div class="col-4 ad"></div> -->
		<!-- </div> -->
		</div>

		<hr>

		<div class="div3">
		<br>
			<div class="first">
				재료
			</div>
			<br>
				
				
 				
 				<table style="margin: 30px" >
 				<tr>
 					<th class="eee" width="200">재료명</th>
 					<th class="eee"width="200">수량/중량</th>
 				</tr><%for(int i = 0; i < rlist.size(); i++){ %>
 				<tr>
 				
 				<%
 				String ing = rlist.get(i).getrInName();
 				
 				String ingre[] = ing.split(",");
 				
 				%>
 					<td width="200"><%=ingre[i]%></td>
 					<td><%=rlist.get(i).getrWeight()%></td>
 				</tr>
 				<%} %>
 				</table>
 				
 				
 				
 			<br>	
			<hr>
			
<br>
		</div>
		
	<%-- 	<div class="div4">
			<div class="first">
				연관상품
			</div>
			<div class="boots" style= "display:inline-block; box-sizing:border-box;">
				<div class="card" style="width: 18rem;">
					<img class="card-img" src="<%= request.getContextPath() %>/resources/images/갈빗살.jpg"
						alt="...">
					<div class="card-body">
						<h5 class="card-title">갈빗살</h5>
						<p class="card-text">1kg</p>
						<p class="card-price">60,000원</p>
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
				


			</div>




		</div> --%>

		
		<!-- <hr> -->
		
	
		<div class="div5" >
		<div class="first">
		조리순서
		</div>
		<br><br>
		<div class="mainStep" >
			
				
				<div class="meme">
				<table class="rstep" >
				
				<tr class="trtr"><% for(int i = 0; i < rlist.size(); i++){ %>
					<td class="stepNo">
					<%=rlist.get(i).getsStep() %></td>
					<td class="stepSeq" width="300" height="260" >&nbsp;&nbsp;
					<%=rlist.get(i).getsDesc() %></td>
				</tr><% }%>
					
					
				</table>
				
				<table class="rstep2" >
				
					<tr class="trtr" ><% for (int i = 0; i < rStepList.size(); i++) {%>
						<td class="rsteppicwrap"> <%-- <% if(rStepList.get(i).getBprcId().equals(rlist.get(i).getrId()) { %> --%>
						<%if(rStepList.get(i).getBprcId().equals(rlist.get(i).getrId())){ %>
						<img class="rstepPic" src="<%=request.getContextPath()%>/<%=rStepList.get(i).getfPath()%>/<%=rStepList.get(i).getfName()%>">
						<%-- <%} %> --%>
						<%} %>
						</td>
					</tr>
				<%} %>
				
				</table>
				</div>
				
				
			
				
			<!-- </div> -->
		
		</div>
	
		<hr>

		<div class="div6">
		<br>
			<div class="first">
				레시피 작성자
			</div>
			<br>
			<div class="writer" style="margin-left:50px;">
				<div class="dddd">
					<img class="dog" src="<%=request.getContextPath()%>/resources/images/강아지.jpg">
				</div>
				<div class="ssss">
					<div class="aaaa">
					<% for(int i = 0 ; i <rlist.size(); i++){ %>
						<%if(rlist.get(i).getsStep()==1){ %>
						<h2><%=rlist.get(i).getmNo() %></h2>
						<%} %>
						<%} %>
					</div>
					<div class="aaaa">
						<h5>집밥 짱~~</h5>
					</div>
				</div>

			</div>


		</div>
	<!-- 	
		<button id="deleteBtn" onclick="returnToMain();" class="main_k_buttom buttom_m" type="button">이전으로</button> -->
		
	

		
	</div>
</div>


	<%@include file="../common/footer.jsp" %>
</body>
</html>