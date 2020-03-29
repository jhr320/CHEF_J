
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, common.vo.*, product.model.vo.*, attachment.model.vo.*, recipe.model.vo.*"
    %>
    <%
	ArrayList<Product> pList = (ArrayList<Product>) request.getAttribute("pList");
	System.out.println("pList : " + pList);
	ArrayList<Attachment> p_fList = (ArrayList<Attachment>) request.getAttribute("p_fList");
	System.out.println("p_fList : " + p_fList);
	ArrayList<Recipe> rList = (ArrayList<Recipe>) request.getAttribute("rList");
	System.out.println("rList : " + rList);
	ArrayList<Attachment> r_fList = (ArrayList<Attachment>) request.getAttribute("r_fList");
	System.out.println("r_fList : " + r_fList);
	
	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chef J</title>
<style>
    *{
        box-sizing: border-box;
    }

    .sale_list {
        width: 1050px;
        height: 400px;
        /* border: 1px solid purple; */
        margin: auto;
    }
    .sale_item {
        /* 상품하나 */
        float: left;
        /* border: 1px solid green; */
        width: 20%;
        height: 80%;
        margin: 20px;
    }

    .sale_thumb {
        /* 상품 하나 이미지 div */
        width: 100%;
        height: 70%;
        /* border: 1px solid tan; */
        position: relative;
    }

    .thumb_img{
        width:100%;
        height: 100%;

    }
    .sale_info{
        /* border:1px solid red; */
        text-decoration: none;
        padding: 5px;
        height:30%;
        width: 100%;
        display:block;
    }
    .sale_info:hover{
    text-decoration:none !important;
    }

    .p_txt{        
        width: 100%;
        padding:2px;
        margin:0px !important;
    }
    .p_name{
        /* text-decoration: none; */
        font-weight: bold;
        color:black;
    }
    .p_price{
        font-weight: bold;
        color: rgb(170, 57, 57);
        font-size: 15px;
    }
    
    .p_price_origin{
        color:lightgray;
    }
    .main_type1 .list_goods .thumb_goods {
        width: 100%;
        height: 370px;
        background-repeat: no-repeat;
        background-position: 50% 50%;
        background-size: 100% auto;
        font-size: 0;
        line-height: 0; 
        text-indent: -9999px;
    }

    .list_goods .thumb_goods {
        display: block;
        overflow: hidden;
    }


    /* 텍스트박스 1 */
    .R_textbox1{
        width: 300px;
        height: 100px;
        background: rgba(0, 0, 0, 0.5);
        color: white;
        position: absolute;
        
        /* 텍스트박스 1 좌표 */
        top: 60%;
        left: 10%;
    }


/* 텍스트박스 2 */
.R_textbox2{
    background:rgba(0, 0, 0, 0.5);
    width: 300px;
    height: 100px;
    margin:auto;
    /* position: absolute; */

    /* 텍스트박스 3 좌표 */
    /* top: 60%;
    left: 10%; */

}

/* 텍스트박스 3 */
.R_textbox3{
    background:rgba(0, 0, 0, 0.5);
    width: 400px;
    height: 100px;
    margin:auto;
    /* position: absolute; */
    /* 텍스트박스 3 좌표 */
    /* top: 60%;
    left: 10%; */

}
.head_txt1{
    position:absolute;
    font-weight: 900;
    font-size: 20px;
    padding-left: 20px;
    margin:0;
/*     border:1px solid black; */
    
}
.head_txt2{
	width: 100%;
    position:absolute;
    font-weight: 900;
    font-size: 20px;
    padding-left: 20px;
    margin:0;
/*     border:1px solid black; */
    
}
.head_txt3{
	width: 100%;
    position:absolute;
    font-weight: 900;
    font-size: 20px;
    padding-left: 20px;
    margin:0;
   /*  border:1px solid black; */
    
}
.head_small_txt1{
    font-size: 15px;
    
}

</style>
</head>
<body>
<%@ include file="bootstrap.jsp" %>
<%@ include file="menubar.jsp" %>

<div id="carouselExampleCaptions" class="carousel slide main_type1" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
    
    
    <!-- 추천레시피 -->
        <div class="carousel-inner list_goods">
          
            <div class="carousel-item active">
<%
if(rList != null && r_fList != null){%>
	<%
	if (rList.get(0).getrId().equals(r_fList.get(0).getBprcId())) {
	%>
            <a href="<%=request.getContextPath()%>/detail.re?rId=<%=rList.get(0).getrId()%>"
            class="d-block w-100 thumb_goods"
            style="background-image: url('<%=contextPath%>/resources/recipe/r1.jpg')">메인배너</a>
 	<%}%>    
	<!-- 리스트불러오지못하면 -->
<%}else{%>
<a href="#"
            class="d-block w-100 thumb_goods"
            style="background-image: url('<%=contextPath%>/resources/main/아침식사.PNG')">메인배너</a>

<%} %>
            <div class="carousel-caption d-md-block R_textbox1">
              <p class="head_txt1 head_txt">제이의 레시피 추천 하나,</p><br>
              <p class="head_small_txt1">1인 가구 자취생의 도전, 갈비찜</p>
            </div>
          </div>
    
    
          <div class="carousel-item">

<%

if(rList != null && r_fList != null){%>
	<%
	if (rList.get(1).getrId().equals(r_fList.get(1).getBprcId())) {
	%>
            <a href="<%=request.getContextPath()%>/detail.re?rId=<%=rList.get(1).getrId()%>"
            class="d-block w-100 thumb_goods"
            style="background-image: url('<%=contextPath%>/resources/recipe/r2.jpg')">메인배너</a>
	 <%}
	%>
<%}else {%>
	<a href="#"
     class="d-block w-100 thumb_goods"
     style="background-image: url('<%=contextPath%>/resources/main/아침식사2.PNG')">메인배너</a>

<%} %>
            
            <div class="carousel-caption d-none d-md-block R_textbox2">
              <p class="head_txt2 head_txt">제이의 레시피 추천 둘,</p><br>
              <p class="head_small_txt2">아침 든든 된장찌개</p>
            </div>
          </div>
    
    
          <div class="carousel-item">
<%
if(rList != null){
if (rList.get(2).getrId().equals(r_fList.get(2).getBprcId())) {
%>
            <a href="<%=request.getContextPath()%>/detail.re?rId=<%=rList.get(2).getrId()%>"
            class="d-block w-100 thumb_goods"
            style="background-image: url('<%=contextPath%>/resources/recipe/r3.jpg')">메인배너</a>
 <%}
}else{
%>    

<a href="#"
     class="d-block w-100 thumb_goods"
     style="background-image: url('<%=contextPath%>/resources/main/파스타_2160x2160.jpg')">메인배너</a>



<%}%>      
            <div class="carousel-caption d-none d-md-block R_textbox3">
              <p class="head_txt3 head_txt">제이의 레시피 추천 셋,</p><br>
              <p class="head_small_txt3">국민반찬 계란말이!</p>
            </div>
          </div>
        </div><!--carousel-inner-->
        
        
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
    
    
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div><!-- carouselExampleCaptions -->

<br both="clear">

  
<br>
<hr>
<br>

<!-- 추천상품 -->
<h2 align="center">이 상품 어때요?</h2>
<br>

<div class="sale_list">

<%
for (int i = 0; i < pList.size(); i++) {
	Product product = pList.get(i);
%>
    <%for (Attachment at : p_fList) {
 		if (pList.get(i).getpId().equals(at.getBprcId())) {%> 
    
        <%}
 	}
}%>

<div class="sale_item">

        <div class="sale_thumb">
            <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(0).getpId()%>">
           
                <img src="<%=request.getContextPath()%>/resources/product/<%=pList.get(0).getCateInId()%>/<%=p_fList.get(0).getfName()%>"
                alt="추천상품1" class="thumb_img">
                
            </a>
        </div>
        <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(0).getpId()%>" class="sale_info">
            <p class="p_name p_txt"><%=pList.get(0).getpName()%></p>
            <p class="p_price p_txt"><%=pList.get(0).getpPrice()%>원</p>
        </a>
    </div>
    <div class="sale_item">

        <div class="sale_thumb">
            <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(1).getpId()%>">
           
                <img src="<%=request.getContextPath()%>/resources/product/<%=pList.get(1).getCateInId()%>/<%=p_fList.get(1).getfName()%>"
                alt="추천상품1" class="thumb_img">
                
            </a>
        </div>
        <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(1).getpId()%>" class="sale_info">
            <p class="p_name p_txt"><%=pList.get(1).getpName()%></p>
            <p class="p_price p_txt"><%=pList.get(1).getpPrice()%>원</p>
        </a>
    </div>
    <div class="sale_item">

        <div class="sale_thumb">
            <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(2).getpId()%>">
           
                <img src="<%=request.getContextPath()%>/resources/product/<%=pList.get(2).getCateInId()%>/<%=p_fList.get(2).getfName()%>"
                alt="추천상품1" class="thumb_img">
                
            </a>
        </div>
        <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(2).getpId()%>" class="sale_info">
            <p class="p_name p_txt"><%=pList.get(2).getpName()%></p>
            <p class="p_price p_txt"><%=pList.get(2).getpPrice()%>원</p>
        </a>
    </div>
    <div class="sale_item">

        <div class="sale_thumb">
            <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(3).getpId()%>">
           
                <img src="<%=request.getContextPath()%>/resources/product/<%=pList.get(3).getCateInId()%>/<%=p_fList.get(3).getfName()%>"
                alt="추천상품1" class="thumb_img">
                
            </a>
        </div>
        <a href="<%=request.getContextPath()%>/detail.pr?pId=<%=pList.get(3).getpId()%>" class="sale_info">
            <p class="p_name p_txt"><%=pList.get(3).getpName()%></p>
            <p class="p_price p_txt"><%=pList.get(3).getpPrice()%>원</p>
        </a>
    </div>
</div>


<br>
<br>
<hr>
<br>
<br>
<h2 align="center">제이의 핫! 레시피!!</h2>
<br>

<div class="sale_list">

	<div class="sale_item">
		<div class="sale_thumb">
			<a href="#">
				
				<img src="<%=contextPath %>/resources/images/로제파스타.jpg" alt="세일상품1" class="thumb_img">
            </a>
       	</div>
        <a href="#" class="sale_info">
        	<p class="p_name p_txt">맛있는 로제 파스타</p>
			<p class="p_price p_txt">user98</p>
	            <p class="p_price_origin p_txt">2019-12-22</p>
        </a>
    </div>
    
	
	
		<div class="sale_item">
			<div class="sale_thumb">
				<a href="#">
					
					<img src="<%=contextPath %>/resources/images/갈비찜.jpg" alt="세일상품1" class="thumb_img">
            	</a>
       		</div>
        	<a href="#" class="sale_info">
	        	<p class="p_name p_txt">갈비찜</p>
	        	<p class="p_price p_txt">user98</p>
	            <p class="p_price_origin p_txt">2019-12-19</p>
        	</a>
    	</div>
    	
    		<div class="sale_item">
			<div class="sale_thumb">
				<a href="#">

					<img src="<%=contextPath %>/resources/recipe/r10.jpg" alt="세일상품1" class="thumb_img">
            	</a>
       		</div>
        	<a href="#" class="sale_info">
	        	<p class="p_name p_txt">맛있다 떡볶이</p>
	        	<p class="p_price p_txt">레시피킹</p>
	            <p class="p_price_origin p_txt">2019-12-24</p>
        	</a>
    	</div>

		<div class="sale_item">
			<div class="sale_thumb">
				<a href="#">
					
					<img src="<%=contextPath %>/resources/recipe/r14.jpg" alt="세일상품1" class="thumb_img">
            	</a>
       		</div>
        	<a href="#" class="sale_info">
	        	<p class="p_name p_txt">제이의 일품 육회</p>
	        	<p class="p_price p_txt">happiness</p>
	            <p class="p_price_origin p_txt">2019-12-26</p>
        	</a>
    	</div>
    	<br>

    	
    	
	</div>
	
	    	
    	
    	
    			<div class="special_item" style="margin:auto; display: block; width: 1050px; height: 600px; border:1px solid black;">
			<div style="width:50%; float:left">
				<p style="font-size: 35px; font-weight:900; padding-left:20px; margin-top:20px; margin-bottom:20px;">특가중의 특가<br>
				MARKET J 특가</p>
			
				<div id="newcountdown"style="font-size: 30px; font-weight:200; padding-left:20px;"></div>
				<div style="font-size: 30px; font-weight:200; padding-left:20px;">2019년 마지막까지 화이팅</div>			
			</div>
			<div class="sale_thumb" style="width:50%; height: 100%; float:left;">
				<a href="#">
					<img src="<%=contextPath %>/resources/product/2/P39.PNG" alt="세일상품1" class="thumb_img" width="100%" height="600px">
            	</a>
       		</div>
    	</div>
    	
    	
   
    	<div id="countdown"></div>

    	
    	   

    	    <script>
    	    //CountDownTimer('01/01/2017', 'countdown'); // 2017년 1월 1일까지
    	    CountDownTimer('01/01/2020 00:00 AM', 'newcountdown'); // 2018년 1월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용합니다.
    	    

    	    function CountDownTimer(dt, id)
    	    {
    	    var end = new Date(dt);

    	    var _second = 1000;
    	    var _minute = _second * 60;
    	    var _hour = _minute * 60;
    	    var _day = _hour * 24;
    	    var timer;

    	    function showRemaining() {
    	    var now = new Date();
    	    var distance = end - now;
    	    if (distance < 0) {

    	    clearInterval(timer);
    	    document.getElementById(id).innerHTML = 'EXPIRED!';

    	    return;
    	    }
    	    var days = Math.floor(distance / _day);
    	    var hours = Math.floor((distance % _day) / _hour);
    	    var minutes = Math.floor((distance % _hour) / _minute);
    	    var seconds = Math.floor((distance % _minute) / _second);

    	    document.getElementById(id).innerHTML = days + 'DAY ';
    	    document.getElementById(id).innerHTML += hours + ' : ';
    	    document.getElementById(id).innerHTML += minutes + ' : ';
    	    document.getElementById(id).innerHTML += seconds;
    	    }

    	    timer = setInterval(showRemaining, 1000);
    	    }
    	        		
	</script>




<br>
<br>
<br>


<%@ include file="footer.jsp" %>
</body>

</html>