
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .sale_rate{
        width: 40px;
        height: 40px;
        background: rgba(170, 57, 57, 0.85);
        position: absolute;
        left: 81%;
        text-decoration: none;
        color: white;
        text-align: center;
        line-height: 2.5;   
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
    background:red;
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
    background:green;
    width: 400px;
    height: 100px;
    margin:auto;
    /* position: absolute; */

    /* 텍스트박스 3 좌표 */
    /* top: 60%;
    left: 10%; */

}
.head_txt1, .head_txt2, .head_txt3{
    position:absolute;
    font-weight: 900;
    font-size: 20px;
    padding: 0;
    margin:0;
    
}
.head_small_txt1{
    font-size: 15px;
}

</style>
</head>
<body>
<script>
	window.onload = function(){
		location.href = 'main.do';
		
	}
</script>
</body>

</html>