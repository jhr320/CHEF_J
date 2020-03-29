

function searchGoodsFlow(delivery_company, invoice_no){
	if(delivery_company != "" && invoice_no != ""){
		window.frames['act'].location.href = '/mypage/searchGoodsFlow.php?act=search&delivery_company='+delivery_company+'&invoice_no='+invoice_no;
	}else{
		alert(_LANGUAGE['2e6e61ed290791deda0d1590c9ae4b11']);
		//諛곗넚�뺣낫媛� �뺥솗�섏� �딆뒿�덈떎
	}
}

var initBody ;
function beforePrint() {
	initBody = $('body').html(); $('body').html($('#print_area').html()); 
} 
function afterPrint() {
	$('body').html(initBody); 
} 

function printArea() { 
	window.print(); 
	document.location.reload();
} 

window.onbeforeprint = beforePrint; window.onafterprint = afterPrint; 

function select_statescancel(oid,atype,utype,product_type){

	var check_bool=false;
	var check_cancel_bool=false;
	var check_ra_bool=false;
	var check_com_bool=false;
	var company_id="";
	var arr_num=0;
	

	if(atype=="all") {
		$("input[name^=order_check_"+oid+"]").each(function() {
			check_bool=true;

			if(arr_num==0) {
				$("#select_update_form>input").remove();
				$("#select_update_form").append("<input type='hidden' name='act' value='select_status_update' />");
			}
			arr_num++;
			$("#select_update_form").append("<input type='hidden' name='arr_od_ix[]' value='"+$(this).val()+"' />");
			$("#select_update_form").append("<input type='hidden' name='arr_bstatus[]' value='"+$(this).attr("bstatus")+"' />");
			$("#select_update_form").append("<input type='hidden' name='arr_status[]' value='"+$(this).attr("status")+"' />");
		});
	} else {
		
		if(utype !="C" && utype !="UC"){
			$("input[name^=order_check_"+oid+"]").each(function() {
				if($(this).is(":checked")){
					if(company_id!="" && company_id!=$(this).attr('company_id')){
						alert(_LANGUAGE['3b1506d6b985a5782fb4035f34714c5b']);
						//�쒕줈 �ㅻⅨ �낆껜�� �곹뭹�� �좏깮�섏뀲�듬땲��. �낆껜蹂꾨줈 �좏깮痍⑥냼媛� 媛��ν빀�덈떎 
						check_com_bool=true;
						return false;
					}
					company_id = $(this).attr('company_id');
				}
			});
			
			if(check_com_bool){
				return;
			}
		}else{
			company_id = $("input[name^=order_check_"+oid+"_]:checked:first").attr("company_id");
		}

		$("input[name=order_check_"+oid+"_"+company_id+"]").each(function() {
			if($(this).is(":checked")){
				check_bool=true;
				if($(this).attr("bstatus")=="IC") check_cancel_bool=true;
				if($(this).attr("bstatus")=="DC") check_ra_bool=true;

				if(arr_num==0) {
					$("#select_update_form>input").remove();
					
				}
				arr_num++;
				$("#select_update_form").append("<input type='hidden' name='arr_od_ix[]' value='"+$(this).val()+"' />");

				if($(this).attr("set_od")=="first") {
					$("input[name=order_check_"+oid+"_"+company_id+"]").each(function() {
						if($(this).attr("set_od")=="orders") {
							$("#select_update_form").append("<input type='hidden' name='arr_od_ix[]' value='"+$(this).val()+"' />");
						}
					});
				}
			}
		});
	}

	var possible_act=true;
	switch(utype) {
		case "C" : 
			var status_text=_LANGUAGE['ae40e1145b953b9684ab2215d2fb193e'];//痍⑥냼
			var action_text="/mypage/order_cancel.php?oid="+oid;
			if(check_ra_bool) possible_act=false;
		break;
		case "E" : 
			var status_text=_LANGUAGE['858f37a0f20badd3f2511d0cbedcaa98'];//援먰솚
			var action_text="/mypage/order_status_popup.php?bstatus=DC&status=EA&oid="+oid;
			if(check_cancel_bool) possible_act=false;
		break;
		case "R" : 
			var status_text=_LANGUAGE['f0b4e019bf96b509c775535c3d2ef02c'];//諛섑뭹
			var action_text="/mypage/order_status_popup.php?bstatus=DC&status=RA&oid="+oid;
			if(check_cancel_bool) possible_act=false;
		break;
		case "UC" : 
			var status_text=_LANGUAGE['ae40e1145b953b9684ab2215d2fb193e'];//痍⑥냼
			var action_text="/member/order_nonmember_cancel.php?oid="+oid+"&bname="+$("#select_update_form").attr("bname");
			if(check_ra_bool) possible_act=false;
		break;
		case "UE" : 
			var status_text=_LANGUAGE['858f37a0f20badd3f2511d0cbedcaa98'];//援먰솚
			var action_text="/member/order_nonmember_status_popup.php?bstatus=DC&status=EA&oid="+oid+"&bname="+$("#select_update_form").attr("bname");
			if(check_cancel_bool) possible_act=true;
		break;
		case "UR" : 
			var status_text=_LANGUAGE['f0b4e019bf96b509c775535c3d2ef02c'];//諛섑뭹
			var action_text="/member/order_nonmember_status_popup.php?bstatus=DC&status=RA&oid="+oid+"&bname="+$("#select_update_form").attr("bname");
			if(check_cancel_bool) possible_act=false;
		break;
	}

	if(check_bool) {
		if(atype=="all") {
			var language = _LANGUAGE['8fcfe0b22c5b590582553a414f5ed5cf'].replace('[status_text]',status_text);
			var con_text=language+"?";
			//�대떦 二쇰Ц �꾩껜瑜� "+status_text+"�섏떆寃좎뒿�덇퉴 
		} else {
			if(!possible_act) {
				var language2 = _LANGUAGE['371bc58535d6b459752c317b4756bd3b'].replace('[status_text]',status_text);
				//�좏깮�� 二쇰Ц 以� "+status_text+"�� �� �녿뒗 二쇰Ц�� �덉뒿�덈떎. 
				alert(language2);
				return;
			}
			var language3 = _LANGUAGE['3a8054f56edb0a28e5bfcef56bb535b0'].replace('[status_text]',status_text);
			var con_text=language3+"?";
			$("#select_update_form").attr("action",action_text);
			//�좏깮�� 二쇰Ц�� "+status_text+"�섏떆寃좎뒿�덇퉴? 
		}

		$("#select_update_form").submit();

	} else {
		if(utype == 'E'){
			if(product_type == '99'){
				alert("珥덉씠�� 諛뺤뒪 諛� �명듃 �곹뭹�� 吏곸젒 援먰솚/諛섑뭹�섏떎 �� �놁뒿�덈떎. 怨좉컼�쇳꽣 1577.0626 �� 臾몄쓽諛붾엻�덈떎.");
			}else{
				var language = _LANGUAGE['281ef6952b410cb352528a285d303318'].replace('[status_text]',status_text);
				alert(language);
				//�낆껜蹂꾨줈 "+status_text+"�� 二쇰Ц�� �좏깮�� 二쇱꽭�� 
			}
		}else{
			var language = _LANGUAGE['281ef6952b410cb352528a285d303318'].replace('[status_text]',status_text);
			alert(language);
			//�낆껜蹂꾨줈 "+status_text+"�� 二쇰Ц�� �좏깮�� 二쇱꽭�� 
		}
	}
}


function update_order_status(history_od_ix,history_status,gn){
	
	if(history_status=="DC"){
		message = _LANGUAGE['2d6202bd2fd277ec245e6352c25fd0c6']; 
		//諛곗넚�꾨즺
	}else if(history_status=="BF"){
		//message = _LANGUAGE['5b53982a4870fe8f36a886ed568d8a3d'];
		message = _LANGUAGE['450a240ed34c98468154b670ada06f53'];
		//嫄곕옒�뺤젙
	}else{
		message = _LANGUAGE['a2022e441e576af5cabdf8eb804bf829'];
		//�곹깭蹂�寃�
	}

	var language = _LANGUAGE['a07796c99bb7dcdcfb3523a5697c5f8c'].replace('[message]',message);

	if(confirm("\'"+gn+"\' \r "+language+"?")){
		//�곹뭹�� "+message+" �섏떆寃좎뒿�덇퉴? 
		
		$.post("/mypage/order_history.act.php", {
		  status: history_status,
		  od_ix: history_od_ix,
		  act: "status_update",
		  submit_mode: "jquery"
		}, function(data){
			console.log(data)
			//alert(data);
			if(data == "Y") {
				alert(_LANGUAGE['18dd6725d42d02ee2095941030463534']);
				//�뺤긽�곸쑝濡� 泥섎━�섏뿀�듬땲��
				location.reload();
			} else {
				alert("system error.");
				return false;
			}
		});
	}
}



function cancel_order_status(oid,od_ix,pid,status) {
	if(confirm(_LANGUAGE['167d686997951f0f519ca6891c66f47c']+"?")) {
		//�대떦 二쇰Ц�� ���� �좎껌�� 痍⑥냼�섏떆寃좎뒿�덇퉴 
		$.post("/mypage/order_history.act.php", {
		  oid: oid,
		  od_ix: od_ix,
		  pid: pid,
		  bstatus: status,
		  act: "select_cancel_status",
		  submit_mode: "jquery"
		}, function(data){
			if(data == "Y") {
				alert(_LANGUAGE['18dd6725d42d02ee2095941030463534']);
				location.reload();
			} else if(data=="X") {
				alert("system error.");
				return false;
			}
		});
	}
}

function check_set_product(obj){
	var checkbox_id= $(obj).attr("id").replace("tick_img_","");
	var set_group=$("#"+checkbox_id).attr("set_group");
	if(set_group!="") {
		var set_uniq_id = $('#'+checkbox_id).attr('set_uniq_id');

		if($('#'+checkbox_id).is(":checked")){
			$("input[set_uniq_id^="+set_uniq_id+"]").attr("checked",true);
			//$("#tick_img_"+checkbox_id).attr("src",$("#tick_img_"+checkbox_id).attr("src").replace("checkbox.gif","checkbox_on.gif"));
		}else{
			$("input[set_uniq_id^="+set_uniq_id+"]").attr("checked",false);
			//$("#tick_img_"+checkbox_id).attr("src",$("#tick_img_"+checkbox_id).attr("src").replace("checkbox_on.gif","checkbox.gif"));
		}

	}
}

/*
function statescancel(history_od_ix,gn){

	if(confirm("\'"+gn+"\' \r二쇰Ц�� 痍⑥냼 �섏떆寃좎뒿�덇퉴?")){
		$.post("/mypage/order_history.act.php", {
		  bstatus: $("#bstatus_"+history_od_ix).val(),
		  status: $("#status_"+history_od_ix).val(),
		  od_ix: $("#od_ix_"+history_od_ix).val(),
		  act: "status_update_single",
		  submit_mode: "jquery"
		}, function(data){
			if(data == "Y") {
				alert("�뺤긽�곸쑝濡� 泥섎━�섏뿀�듬땲��.");
				location.reload();
			} else {
				alert("�쒖뒪�� �먮윭.");
				return false;
			}
		});
	}
}

function statesapproval(history_od_ix,gn){
	if(confirm("\'"+gn+"\' \r�곹뭹�� 援щℓ�뱀씤�섏떆寃좎뒿�덇퉴?")){
		
		$.post("/mypage/order_history.act.php", {
		  bstatus: $("#bstatus_"+history_od_ix).val(),
		  status: $("#status_"+history_od_ix).val(),
		  od_ix: $("#od_ix_"+history_od_ix).val(),
		  act: "status_update_single",
		  submit_mode: "jquery"
		}, function(data){
			if(data == "Y") {
				alert("�뺤긽�곸쑝濡� 泥섎━�섏뿀�듬땲��.");
				location.reload();
			} else {
				alert("�쒖뒪�� �먮윭.");
				return false;
			}
		});
	}
}
*/