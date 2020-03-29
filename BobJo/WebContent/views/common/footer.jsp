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
        
        .outer_f{
        	width: 100%;
        	/* border: 1px solid black; */
        	border-top:1px solid lightgrey;
        	border-bottom:1px solid lightgrey;
        }
        
    	.footer{
        	max-width: 1050px;
        	height: 300px;
        	/* background: rgb(242, 242, 242); */
        	/* border: 1px solid red; */
        	margin: auto;
    }

    .left_f{
        /* border:1px solid green; */
        height: 100%;
        float:left;
        width:40%;
        padding: 15px;
    }
    
    .right_f{
        /* border:1px solid red; */
        float:left;
        width: 60%;
        height: 100%;
        padding: 15px;
    }
    .cs_txt{
        font-size:23px;
        font-weight: 500;
    }
    .cs_num_txt{
        font-size:23px;
        font-weight: bolder;
    }
    .qna_btn{
        border: 1px solid lightgray;
        background: white;
        width: 120px;
        height: 40px;
        font-weight: bold;
        border-radius: 3px;
    }

	.desc2{
    	color:grey;
	}
	.Ldesc{
    	font-size: 11px;
	}

	.right_f_top{
	    text-decoration: none;
	    color: black;
	    font-size: 12px;
	    font-weight: bold;
	}

	.Rdesc{
    	font-size: 12px;
    	color: grey;

	}
	.Rdesc a{
    	text-decoration: none;
    	color:rgb(170, 57, 57);
	}

	.cpr_txt{
 		font-weight: bolder;
 		font-size:13px;
	}

	table{
    	height: 50px;
    	/* border: 1px solid black; */
	}
	td{
    	padding: 3px;
	}
</style>
</head>
<body>
<div class="outer_f">
    <div class="footer">
        <div class="left_f">
            <span class="cs_txt">고객행복센터<br></span>
            
            <table>
                <tr>
                    <td>
                        <span class="cs_num_txt">1588-8282</span>
                    </td>
                    <td>
                        <span class="Ldesc desc1">365고객센터</span>
                        <span class="Ldesc desc2">오전 7시 - 오후 7시</span>
                    </td>
                </tr>
                <tr>
                    <td>
                            <button class="qna_btn" onclick="location.href='<%=request.getContextPath()%>/list.qna'">1:1 문의</button>
                    </td>
                    <td>
                            <span class="Ldesc desc1">24시간 접수가능<br></span>
                            <span class="Ldesc desc2">고객센터 운영시간에 따라 순차적으로 답변해드리겠습니다.</span>
                    </td>
                </tr>

            </table>
            
            
        </div>
        <div class="right_f">
            <a href="#" class="right_f_top">제이소개</a>&nbsp;&nbsp;<a href="#" class="right_f_top">제이소개영상</a>&nbsp;&nbsp;
            <a href="#" class="right_f_top">이용약관</a>&nbsp;&nbsp;<a href="#" class="right_f_top">개인정보처리방침</a>&nbsp;&nbsp;<a href="#" class="right_f_top">이용안내</a>
            <br>
            <br>
            <span class="Rdesc">법인명(상호) : 주식회사 셰프제이 | 사업자등록번호 : 261-81-00000 <a href="#">사업자정보 확인</a><br>
                    통신판매업 : 제 2019-서울강남-012345 호 | 개인정보보호책임자 : 제이<br>
                    주소 : 서울시 강남구 테헤란로10길 9, KH빌딩 7F CLASS L | 대표이사 제이<br>
                    입점문의 : <a href="#">입점문의하기</a> | 제휴문의 : <a href="#">business@chefj.com</a><br>
                    채용문의 : <a href="#">recruit@chefj.com</a><br>
                    팩스 : 070-7500-8282 | 이메일 : <a href="#">help@chefj.com</a><br>
                    <br>
                   <br>
            </span>
            <span class="cpr_txt">
                    COPYRIGHT © CHEFJ.ALL RIGHTS RESERVED<br>
            </span>

        </div>
    </div>
    </div>
</body>
</html>