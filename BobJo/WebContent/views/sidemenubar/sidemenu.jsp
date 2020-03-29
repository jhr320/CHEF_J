<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  jquery -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	 <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


    <!--부트스트랩-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>    
 
 
</head>

  <style>
.question_link{
background: #f9f9f9;
}



        .board-postnav-side
        {   
            width:200px;
            height: 350px;
            float: left;
            margin: 10px;
            background-color: white;
            border: 1px solid lightgrey;
        }
    
        
        
        .board-postnav-side > ul>li>a
        {
            color:black;
            
        }
        .board-postnav-side > ul>li>a:hover
        {
            color:rgb(170,57,57);
        }
        .board-postnav-side > ul> li:hover
        {
            background-color: lightgrey;
         
        }

    </style>

<body>
<%@ include file="../common/bootstrap.jsp"%>
<%@ include file="../common/menubar.jsp"%>

 <div class="board-postnav-side">
      <ul class="nav flex-column " id ="sidebar">
           <li class="nav-item  border border-light">
                <a class="nav-link active" href="#">공지사항</a>
           </li>
           
           <% if(loginUser != null && loginUser.getmId().equals("admin")){ %>
       
           <li class="nav-item border border-light">
              <a class="nav-link" href="#">회원관리</a>
           </li>
           <li class="nav-item border border-light">
              <a class="nav-link" href="#">매출관리</a>
           </li>
           <%} %>
           <li class="nav-item border border-light question_link">
              <a class="nav-link question_a" onclick="goQnaList();">1:1문의 내역</a>
           </li>         
      </ul>
</div>

<script>
	function goQnaList(){
		if(<%=loginUser%>!= null){
			location.href="<%=request.getContextPath()%>/list.qna";
			
		}else{
			alert("로그인하셔야 본 서비스를 이용할 수 있습니다.");
			location.href="<%=request.getContextPath()%>/views/member/MemberLoginForm.jsp";
		}
		
	};
</script>
</body>
</html>