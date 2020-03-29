<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 실패 메세지(아이디가 안맞거나, 비번이 안맞거나 둘다 틀릴 경우)
	String loginFailMsg = (String)session.getAttribute("loginFailMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
box-sizing:border-box;}
	
	.outer{
	/* display: inline-block; */
	width: 800px;
	height:auto;
	margin: auto;
	/* border:1px solid black; */
	padding: 100px 0 100px 0;
	}
.login_form{
        width: 400px;
        height: 300px;
        /* background:green; */
        margin: auto;
        padding: 10px;
        /* border:1px solid black; */
    }

	.sub_title{
	font-size:20px;
	font-weight: 900;
	}
    .inputform{
        width: 300px !important;
        height: 50px;
        border-radius:3px;
        width:280px;
        padding: 0 10px 0 10px;
        border:1px solid lightgrey;
        font-size: 12px;
    }

    .find_txt{
        text-decoration: none;
        font-size: 12px;
        text-align: right;
        color:black;
    }
    
    .find_txt:hover{
    text-decoration:none;
    color:black;
    }

    .line{
        font-size:10px;
        color: black;
    }

    .login_btn{
            width: 300px;
        height: 50px;
        border-radius:3px;
        border:none;
        background: rgb(170, 57, 57);
        color:white;
    }
    
    .join_btn{
            width: 300px;
        height: 50px;
        border-radius:3px;
        border:none;
        border:1px solid rgb(170, 57, 57);
        background: white;
        color: rgb(170, 57, 57);
    }

    form{
        text-align:middle;
    }
</style>
</head>
<body>
<%@ include file="../common/bootstrap.jsp" %>
<%@ include file="../common/menubar.jsp" %>
	<script>
	var loginFailMsg = "<%= loginFailMsg %>";
	$(function(){
		if(loginFailMsg != "null"){
			alert(loginFailMsg);
			<% session.removeAttribute("loginFailMsg"); %>
		}
		console.log(loginFailMsg);
		
	});
</script>
	
   <div class="outer">
    <p align="center" class="sub_title">로그인</p>
    <div class="login_form" align="center">
        <form id="login_form" action="<%=request.getContextPath()%>/login.me"  method="post">
            <table style="width:300px;">
                <tr>
                    <td colspan="3">
                        <input type="text" placeholder="아이디를 입력해주세요" class="inputform" name="userId" id="userId">
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="password" placeholder="비밀번호를 입력해주세요" class="inputform" name="userPwd" id="userPwd" style="margin-top:10px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right">
                    <a href="#" class="find_txt find_id">아이디 찾기</a><span class="line"> | </span>
                    <a href="#" class="find_txt find_pw">비밀번호 찾기</a>
                    </td>
                </tr>
                <tr height="25px"></tr>
                <tr align="center">
                    <td colspan="3">
                   
                        <input type="submit" value="로그인" class="login_btn two_btn">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="3">
                        <input type="button" value="회원가입" class="join_btn two_btn">
                    </td>
                </tr>
            </table>
            
        </form>
    </div><!--login_form-->
    
    </div><!-- outer -->
    
    
    
    
    <script>
	$(function(){
		
		$("#userId").focus();
		$(".join_btn").click(function(){
			location.href='<%=request.getContextPath()%>/before.email';
		});
	
	/*                     $(".input_form").change(function(){
                $(this).css({"border":"1px solid black;"});
            });
            
            // 유효성검사
            // 한글입력안되게 해야하는지..?회원가입에 있는 아이디 유효성 가져다쓰기 
            $("#login_form").submit(function(){

                if($('#userId').val()==""){
                    alert("아이디를 입력해주세요.");
                    return false;
                }
                if($('#userPwd').val()=="")
                alert("비밀번호를 입력해주세요.");
                return false;
            });*/
            
        });
    </script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>