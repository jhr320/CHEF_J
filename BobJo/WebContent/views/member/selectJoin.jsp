<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        *{
            box-sizing: border-box;
        }
        body {
            background: #f9f9f9;
        }
		
		.sub_title{
			font-size:20px;
			font-weight: 900;
		}
		.sub_title2{
			font-size:16px;
			font-weight: 200;
		}
        .outer {
            width: 620px;
            height: 500px;
            background: white;
            margin: auto;
            padding: 10px;
            /* border: 1px solid black; */
        }

        .buttons_div {
            margin: auto;
            width: 400px;
            /* border: 1px solid blue; */
        }


        .button_table {
            width: 300px;
            text-align: center;
            margin:auto;
            
        } 

        
        .btnn {
            width: 100%;
            height: 50px;
            border-radius: 3px;
            border-style: none;
            margin: auto;
            text-align: center;

        }
        tr{
            height: 60px;
        }

        .kakao_join_btn{
            background:rgb(247, 230, 0);
            color:black;
            font-weight: 700;
            letter-spacing: -0.3px;
            /* padding-left:30%; */
        }
        .naver_join_btn{
            background: #1EC800;
            color:white;
            font-weight: 700;
            letter-spacing: -0.3px;
            /* padding-left:30%; */
        }
        .face_join_btn{
            background:rgb(55, 92, 171);
            color:white;
            font-weight: 700;
            letter-spacing: -0.3px;
            /* padding-left:30%; */
        }

        .chefj_join_btn{
            background:rgb(170, 57, 57);
            color:white;
            font-weight: 700;
            letter-spacing: -0.3px;         
        }

        /* 아이콘 */
        .chefj_icon{
            background-size:45px;
            display: inline-block;
            background-image: url("<%=request.getContextPath()%>/resources/icon/로고_반전.png");
            width: 40px;
            height: 40px;
            background-position: 0px 0px;
        }
        .kakao_icon{
            display: inline-block;
            background-image: url("<%=request.getContextPath()%>/resources/icon/카카오 아이콘.png");
            width: 45px;
            height: 45px;
            background-position: 0px 0px;
        }

        .naver_icon{
            /*테두리있어서 자르기*/
            background-size:47px;
            display: inline-block;
            background-image: url("<%=request.getContextPath()%>/resources/icon/네이버 아이콘.PNG");
            width: 45px;
            height: 45px;
            background-position: -1px -1px;
        }

                .face_icon{
            /*테두리있어서 자르기*/
            background-size:47px;
            display: inline-block;
            background-image: url("<%=request.getContextPath()%>/resources/icon/페이스북 아이콘.png");
            width: 45px;
            height: 45px;
            background-position: -1px -1px;
        }

        .btxt{
            /* border:1px solid black; */
            /* line-height: 3.5; */
        }
        button .icon{
            /* border: 1px solid black; */
            float:left;
            margin: auto;
            margin-left:50px;
        }
        .bbb{
            display: inline-block;
            width: 100%;
            height: 100%;
            /* border:1px solid black; */
            /* padding: 1% 20% 1% 20%; */

        }

        p{

        }
    </style>
</head>
<body>
<%@ include file="../common/bootstrap.jsp" %>
<%@ include file="../common/menubar.jsp" %>



    <div class="outer">
    <br>
    <br>
    <p align="center" class="sub_title">회원가입</p>
        <p align="center" class="sub_title sub_title2">회원가입 방법을 선택해주세요.</p><br>
        <div class="buttons_div">
            <table align="center" class="button_table">
                <tr>
                    <td>
                        <button class="chefj_join_btn btnn" onclick="location.href='<%= request.getContextPath() %>/views/member/memberJoinForm.jsp'"><div class="bbb"><span class="chefj_icon icon"></span><span class="btxt">Chef J 회원가입</span></div></button><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="kakao_join_btn btnn"><span class="kakao_icon icon"></span><p class="btxt">카카오로 가입</p></button><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="naver_join_btn btnn"><span class="naver_icon icon"></span><span class="btxt">네이버로 가입</span></button><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button class="face_join_btn btnn"><span class="face_icon icon"></span><span class="btxt">페이스북으로 가입</span></button>
                    </td>
                </tr>

            </table>

        </div>
    </div>



<%@ include file="../common/footer.jsp" %>

<script>
	function goJoinForm(){
		location.href = "<%=contextPath%>/login.me"
	};
</script>
</body>
</html>