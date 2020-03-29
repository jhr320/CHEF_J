<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>

<%
	String imgPath = request.getContextPath();
	imgPath += "/resources/icon/";
	Member m = (Member) session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<title>Insert title here</title>

</head>


<style>
.file {
	width: 100%;
	height: 100%;
	opacity: 0;
}

.reciepeWrapper {
	width: 80%;
	height: 1000px;
	border: 1px solid black;
	margin-left: 10%;
	margin-right: 10%;
}

.inlineImage {
	display: inline-block;
	width: 300px;
	height: 150px;
}

.inputColor {
	height: 60px;
	background-color: antiquewhite;
	text-align: center center;
}

.nameofInput {
	margin-top: 12px;
}

.inputSpacing {
	margin-top: 50px;
}

span.input-cus-title {
	font-size: 22px;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.custum-ingrident-box {
	width: 75px;
	height: 75px;
	background-color: gray;
}

.inlineView {
	display: inline-block;
}

.stepSpan {
	width: 114px;
	font-size: 22px;
}

.stepTextarea {
	width: 75% !important;
	height: 150px !important;
	float: left;
}

.stepAddImg {
	width: 150px;
	height: 150px;
	float: left;
}

.stepSubli {
	padding: 0px;
	margin: 0px;
	width: max-content;
	float: left;
}

.stepSubButton {
	width: 75px;
	height: 75px;
}

.mpzero {
	margin: 0px;
	padding: 0px;
	float: left;
}

.ingridentGroup {
	width: 150px;
	height: 75px;
	float: left;
}

.ingrHolder {
	overflow: auto;
	width: 900px;
	height: 76px;
}

.completeImgContainer {
	display: inline-block;
	width: 950px;
	height: 150px;
	overflow: auto;
	margin-left: 20px;
	float: left;
	background-color: lightgrey;
}

.completeImg {
	width: 200px;
	height: 150px;
}

.innerComCon {
	display: inline-block;
	width: 150px;
	height: 150px;
	float: left;
}

.boxImg {
	width: 100%;
	height: 100%;
}
.errorColor
{
	  border-color:red;
}
</style>

<body>


	<%
		if (m != null) {
	%>
	<div class="container">
		<!-- 제목 -->
		<div class="row ">



			<div class="input-group input-group-lg">
				<div class="input-group-prepend">
					<span class="input-group-text input-cus-title"
						id="inputGroup-sizing-lg" style="width: 114px;">제목</span>
				</div>
				<input type="text" style="margin-left: 20px;" class="form-control"
					id="reciepeTitle" name="titleName" placeholder="에) 소고기 미역국 끓이기">
			</div>

			<!--요리소개-->

		</div>
		<div class="row inputSpacing">
			<div class="input-group input-group-lg" style="height: 400px">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 114px;">요리소개</span>
				</div>
				<textarea id="reciepeIntro" class="form-control"
					style="margin-left: 20px;" aria-label="With textarea"
					name="cookDetail" placeholder="간단한 요리 설명 적어주세요."></textarea>
			</div>

		</div>
		<!-- 카테고리-->
		<div class="row inputSpacing">


			<div class="input-group input-group-lg">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 114px;">카테고리</span>
				</div>

				<div class="input-group-prepend" style="margin-left: 20px">
					<span class="input-group-text">종류별</span>
				</div>
				<select class="custom-select" id="category1">
					<option selected="selected" disabled>종류별</option>
					<option value="kor_food">한식</option>
					<option value="ch_food">중식</option>
					<option value="am_food">양식</option>
					<option value="jap_food">일식</option>
					<opiton value="etc_food">기타</opiton>
				</select>
				<div class="input-group-prepend">
					<span class="input-group-text">방법별</span>
				</div>
				<select class="custom-select" id="category2">
					<option selected="selected" disabled>방법별</option>
					<option value="1">볶음</option>
					<option value="2">끓이기</option>
					<option value="3">부침</option>
					<option value="4">조림</option>
					<opiton value="5">무침</opiton>
					<option value="6">비빔</option>
					<option value="7">찜</option>
					<option value="8">절임</option>
					<option value="9">튀김</option>
					<opiton value="10">삶기</opiton>
					<option value="11">굽기</option>
					<option value="12">데치기</option>
					<option value="13">회</option>
					<opiton value="14">삶기</opiton>
				</select>
				<div class="input-group-prepend">
					<span class="input-group-text">재료별</span>
				</div>
				<select class="custom-select" id="category3">
					<option selected="selected" disabled>재료별</option>
					<opiton value="21">정육</opiton>
					<option value="22">수산,해산,건어물</option>
					<option value="23">면,양념,오일</option>
					<option value="24">계랸,유제품</option>
					<option value="25">견과,쌀</option>
					<option value="26">채소</option>
					<option value="27">과일</option>
					<option value="28">기타</option>
				</select>
			</div>
		</div>
		<!-- 요리정보-->
		<div class="row inputSpacing">
			<div class="input-group input-group-lg">

				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 114px;">요리정보</span>
				</div>
				<div class="input-group-prepend" style="margin-left: 20px">
					<span class="input-group-text">시간</span>
				</div>
				<select class="custom-select" id="cookInfo">
					<option selected="selected" disabled>시간</option>
					<option value="10">10분 이내</option>
					<option value="30">30분 이내</option>
					<option value="60">60분 이내</option>
					<option value="60">60분 이상</option>
				</select>
				<div class="input-group-prepend">
					<span class="input-group-text">난인도</span>
				</div>
				<select class="custom-select" id="difficulty">
					<option selected="selected" disabled>난이도</option>
					<option value="1">쉬움</option>
					<option value="2">중간</option>
					<option value="3">어려움</option>
				</select>
			</div>
		</div>

		<!--재료 -->
		<div class="row inputSpacing">
			<div class="input-group input-group-lg">
				<div class="input-group-prepend">
					<span class="input-group-text" style="width: 114px;">재료/양념</span>
				</div>

				<button class="btn addIngri" type="button"
					style="width: 75px;margin-left:20px; background: url(<%=imgPath%>/add_BTN.png); background-position: -12px -10px;"
					onclick="createIngriElement() "></button>


				<div class="ingrHolder" id="ingrHolder">


					<!-- 복사할 부분 -->
					<div class="ingridentGroup" id="ingriOriginal"
						style="margin-right: 50px" data-toggle="popover"
						data-placement="top" data-content="Step:1">
						<div class=" input-group ">
							<div class="input-group-prepend">
								<span class="input-group-text">재료명</span>
							</div>
							<input type="text" class="form-control ingiList"
								aria-label="Small" aria-describedby="inputGroup-sizing-sm">
						</div>
						<div class=" input-group " style="float: left;">
							<div class="input-group-prepend">
								<span class="input-group-text text-center" style="width: 74px;">중량</span>
							</div>
							<input type="text" class="form-control weightList"
								aria-label="Small" aria-describedby="inputGroup-sizing-sm">
						</div>

						<button class="btn" type="button"
							style="position: absolute; top: 0px;"
							onclick="eraseIngriElement(this)">
							<img style="width: 25px; height: 25px;"
								src="<%=imgPath%>/eraseButton.png" alt="">
						</button>
						<div class="btn" style="position: absolute; top: 37px;">
							<img style="width: 25px; height: 25px;"
								src="<%=imgPath%>/switch.png" alt="">
						</div>
					</div>




				</div>


			</div>
		</div>


		<!-- Step-->
		<div class="row inputSpacing">
			<div class="input-group input-group-lg">

				<div class="input-group-prepend">
					<span class="input-group-text "
						style="width: 114px; padding: 0px !important; padding-left: 30px !important;">재료</span>
				</div>

				<div class="slide"
					style="margin-left: 20px; overflow-y: hidden; overflow-x: scrollh; width: 85%">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputFiles"
							multiple> <label class="custom-file-label"
							for="inputFiles">순서사진 한번에 넣기</label>
					</div>
					<ul class="list-group " id="stepholder">

						<!-- Step -->
						<li class="list-group-item stepItem" id="originalStep">

							<div class="ingridentSteps  inline-block">
								<textarea class="form-control stepTextarea"
									placeholder="Step 1 에 대한 설명"></textarea>
								<button type="button" class="stepBTN mpzero">
									<img src="<%=imgPath%>/add_button.png" class="stepAddImg">
								</button>
								<input type="file" class="stepFile" hidden>
								<button type="button" class="btn mpzero"
									onclick="createStepElement()">
									<img src="<%=imgPath%>/add_button.png" alt=""
										class="stepSubButton">
								</button>
								<button type="button" class=" btn mpzero"
									onclick="eraseStepElement(this)">
									<img src="<%=imgPath%>/eraseButton.png" alt=""
										class="stepSubButton">
								</button>
							</div> <input type="hidden" class="file_placeholder">
						</li>
						<!-- End of Step Step -->
					</ul>



				</div>

			</div>
		</div>


		<!--완성된 이미지 -->
		<div class="row inputSpacing">
			<div class="input-group input-group-lg">
				<div class="input-group-prepend">
					<span class="input-group-text "
						style="width: 114px; padding: 0px !important; padding-left: 3px !important;">완성이미지</span>
				</div>

				<div class="completeImgContainer" id="image_upload_preview"
					style="float: left"></div>
				<div>
					<button class="btn" type="button" onclick="compelteImgclick()">
						<img src="<%=imgPath%>/add_BTN.png"
							style="width: 25px; height: 25px;">
					</button>
					<br>
					<button class="btn" type="button" style="margin-top: 50px;"
						onclick="test()">
						<img src="<%=imgPath%>/eraseButton.png"
							style="width: 25px; height: 25px;">
					</button>

				</div>

				<input type="file" name="file[]" id="inputCompleteFiles" multiple
					hidden>


			</div>


		</div>

		<button style="float: right; width: 200px; margin-top: 25px;"
			class="btn btn-primary" type="submit"
			onclick="return submitRequest()">제출</button>

	</div>

	<%
		} else {
	%>
	<div style="left:50%;">
		<h1>로그인 필요</h1>
		<button class="btn btn-primary"
			onclick="location.href = '<%=request.getContextPath()%>/login.me'">로그인</button>

	</div>

	<%
		}
	%>
	<input type="hidden" id="userID" value="<%=m.getmNo() %>">
</body>
<script>
    function testExecute() {
       
    	ingriSetter();

    }
    function test() {
        formData2 = new FormData();
        console.log(formData2.getAll('files'))
        $('#image_upload_preview').empty();
    }
    function submitRequest() {
    	
		console.log(checkNull());
		if(checkNull())
		{
			requestSubmit();
		}
    }
    function requestSubmit()
    {
    	ingriSetter();
		$.ajax({
			cache: false,
			contentType: false,
			processData: false,
			enctype: 'multipart/form-data',
			type : "post",
			url :"<%=request.getContextPath()%>/upload.image1",
			data : formDataSend,  
			success :function(result){
				location.href = "<%=request.getContextPath()%>/main.do";
				
			},
			error : function(){
				console.log('Error 발생하였습니다.');
				
			},
			complete : function(){
				console.log('데이타 요청 끝');
			}
		});
    }
    $('input[type=text], textarea, select').click(function()
    {
    	$(this).removeClass("errorColor")
    });
    
    function checkNull()
    {	var check = true;
    	$('input[type=text]').each(function()
    	{	 
    		if($(this).val() =='')
    		{	console.log("check")
    			$(this).focus().addClass("errorColor");
    			check =  false;
    		
    		}
    	});
    	$('select').each(function()
    	   {
    	    	if($(this).val() == null)
    	    	{	
    	    		$(this).focus().addClass("errorColor"); 		
    	    		check =  false;
    	    	
    	    	}
    	   });
    	$('textarea').each(function()
    	   {
    	    	if($(this).val() =='')
    	    	{	
    	    		$(this).focus().addClass("errorColor"); 		
    	    		check =  false;
    	    		
    	    	}
    	  });
    	return check;
    }
    function ingriSetter() 
    {	formDataSend = new FormData();
   		 var userID = $("#userID").val();
    	console.log(reciepeTitle);
    	formDataSend.append("userID",JSON.stringify(userID))
        var reciepeTitle = $("#reciepeTitle").val();
        console.log(reciepeTitle);
        formDataSend.append("reciepeTitle",JSON.stringify(reciepeTitle))
        
        var reciepeIntro = $("#reciepeIntro").val();
        formDataSend.append("reciepeIntro",JSON.stringify(reciepeIntro))
        
        var category1 = $("#category1").val();
        formDataSend.append("category1",JSON.stringify(category1))
        
        var category2 = $("#category2").val();
        formDataSend.append("category2",JSON.stringify(category2))
        
        var category3 = $("#category3").val();
        formDataSend.append("category3",JSON.stringify(category3))

        var cookInfo = $("#cookInfo").val();
        formDataSend.append("cookInfo",JSON.stringify(cookInfo))
        
        var difficulty = $("#difficulty").val();
        formDataSend.append("difficulty",JSON.stringify(difficulty))
        //
        var dataList = []
        var datafile = [];
        // step list 추가 
        $('.stepItem').each(function () {
            dataList.push($(this).children().eq(1).val());
        })

        //현재 데이터 리스트 저장
        for (var pair of formData.entries()) {
            datafile.push(pair[1])
        }

        for (i = 0; i <= dataList.length; i++) {

            if (dataList[i] == null) {
                formDataSend.append(i, null);
            }
            else {
                for (j = 0; j < datafile.length; j++) {
                    if (datafile[j].name == dataList[i]) {
                        var stepname = i +"step"
                        formDataSend.append( stepname, datafile[j]);
                       
                    }
                }
            }
        }
        var len_step = datafile.length;

        
        var datafile2 = [];

        for (var pair of formData2.entries()) {
            datafile2.push(pair[1])
        }
   		console.log(datafile2);
        for (j = 0; j <= datafile2.length; j++) {

          var imgcom = i +"imgcom"
       
          formDataSend.append(imgcom, datafile2[j]);
         

        }
     	
        var len_step2 = datafile2.length;
        //
        textareaOf = [];
        formDataSend.append("step_size",len_step)
        formDataSend.append("com_size",len_step2)
        $(".stepTextarea").each(function () {
        	var str = $(this).val();
            textareaOf.push(str.replace(/,/g, "<c>"))
        })
        titleIn = "";
        formDataSend.append("step_text",JSON.stringify(textareaOf))
        $('.ingiList').each(function (index) {
            titleIn+= $(this).val() 
            if( $('.ingiList').length-1 >index)
            	titleIn+=", " 
        })
        weightIn= "";
     	var json = JSON.stringify(titleIn);
        formDataSend.append("inTitle", json)
		console.log(titleIn)
        $('.weightList').each(function (index) {
            weightIn+= $(this).val() 
            if( $('.weightList').length-1 >index)
            	weightIn+=", " 
        })
        console.log(weightIn)
        var json2 = JSON.stringify(weightIn);
        formDataSend.set("inWeight", json2)



    }
 
    var sizeCom = 0;
    var textareaOf = [];
    var titleIn =""
    var weightIn =""
    var formDataSend = new FormData();
    var formData = new FormData();
    var formData2 = new FormData();
    var cloned;
    var ingriClone;
    var stepIMGINDEX = -1;
    var temp;
    $(function () {
        cloned = $('#originalStep').clone(true, true);
        ingriClone = $('#ingriOriginal').clone(true, true);
        $('#originalStep').removeAttr('id')
        $('#ingriOriginal').removeAttr('id')
        cloned.removeAttr('id');
        ingriClone.removeAttr('id');


        $("#stepholder").on('DOMNodeInserted', function () {

            changePlaceholder();
        })
        $("#ingrHolder").on('DOMNodeInserted', function () {

            changePlaceholder2();
        })


        $("#stepholder").sortable();
        $("#ingrHolder").sortable();
        $('[data-toggle="popover"]').popover(
            {
                delay: {
                    "show": 500,
                    "hide": 100
                }
            }
        )
    })


    $('[data-toggle="popover"]').click(function () {

        setTimeout(function () {
            $('.popover').fadeOut('slow');
        }, 5000);

    });

    function changePlaceholder() {
        var textarea = document.getElementsByClassName('stepTextarea');


        var len = textarea.length;
        for (i = 0; i < len; i++) {
            textarea[i].placeholder = "Step " + (i + 1) + " 에 대한 설명"
        }
    }

    function changePlaceholder2() {
        var len = $(".ingridentGroup").length;
        for (i = 0; i < len; i++) {
            $(".ingridentGroup").eq(i).attr('data-content', "Step:" + (i + 1));
        }

    }





    function createIngriElement() {
        var newClone = ingriClone.clone(true, true);
        $("#ingrHolder").append(newClone);
        $('[data-toggle="popover"]').popover({

        }
        )

    }
    function createStepElement() {
        var newClone = cloned.clone(true, true);
        $("#stepholder").append(newClone);

    }
    function eraseIngriElement(index) {
        var li_index = $(index).parent();
        var size = $(".ingridentGroup").length;
        if (size > 1) {
            li_index.remove();
            changePlaceholder2();
        }
        else {
            alert("재료는 최소 1 개 이상이여합니다.")
        }
    }


    function eraseStepElement(index) {
        var li_index = $(index).parent().parent().parent().parent().index() - 1;
        var size = $(".stepItem").length;
        if (size > 1) {
            $(".stepItem").eq(li_index).remove();
            changePlaceholder();
        }
        else {
            alert("Step 최소 1 개 이상이여합니다.")
        }
    }







    // file 저장 
    function saveFormData(input, type) {
        formData.append('files', null);
        if (type == 1) {
            if (input.files && input.files[0]) {

                $(input.files).each(function (e) {
                    formData.append('files', this);

                })

            }

        }
        else if (type == 2) {
            if (input.files && input.files[0]) {

                $(input.files).each(function (e) {

                    sizeCom++;
                    formData2.append('files', this);

                })

            }


        }
    }

    function readURL(input, type) {

        saveFormData(input, type)
        temp = [];
        var i = 0;
        if (input.files && input.files[0]) {
            $(input.files).each(function (index, value) {
                filename = this.name;
                temp.push(filename);

                var reader = new FileReader();
                reader.readAsDataURL(this);
                reader.onload = function (e) {
                    if (type == 1) {

                        createStepElement()
                        var list_i = $(".stepItem").length - 1;
                        var img = $(".stepItem").eq(list_i).children().eq(0).children().eq(1).children().eq(0);
                        $(img).attr('src', e.target.result)


                        $('.stepItem').eq(list_i).children().eq(1).attr('value', temp[i++]);
                    }
                    else {
                        var box = document.createElement("div");
                        var img = document.createElement("img");
                        img.src = e.target.result
                        img.classList.add("boxImg");
                        box.appendChild(img);
                        box.classList.add("innerComCon");
                        $('#image_upload_preview').append(box);

                    }
                }
            });
        }

    }
    var temp = -1;
    $(".stepBTN").click(function () {
        $(this).next().click();
        temp = $(".stepBTN").index(this);
    })
    $(".stepFile").change(function () {
        stepIMGINDEX = $(".stepFile").index(this);
        var step = $(this).index(stepIMGINDEX);
        var file = $(this)[0].files;
        var root = $(this).parent().next();


        root.val(file[0].name);

        formData.append('files', file[0]);
        var reader = new FileReader();

        reader.readAsDataURL(file[0]);
        reader.onload = function (e) {

            $(".stepBTN").eq(temp).find('img').attr("src", e.target.result);
        }
    })

    $("#inputFiles").change(function () {
        readURL(this, 1);
    });

    $("#inputCompleteFiles").change(function () {
        readURL(this, 2);
    });




    function compelteImgclick() {
        $("#inputCompleteFiles").click();
    }
</script>
</html>