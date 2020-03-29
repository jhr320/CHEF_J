<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

 	
<!-- bootstrap  -->

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file = "../common/bootstrap.jsp" %>
<style>
.sidemenuButtonColor
{
  width: 100%;
  height: 50px;
  background-color: rgb(170,57,57);
  color:white;
}
.sidemenuSize
{
  width: 200px;
  height: 50px !important;
  background-color: red;
}
.cart-box
{
  
  
  height: 300px;
  background-color: grey;

}
.mydiv {
  position: fixed;
  z-index: 9;
  background-color: #f1f1f1;
  text-align: center;
  border: 1px solid #d3d3d3;
}

.mydivheader {
  padding: 10px;
  cursor: move;
  z-index: 10;
  background-color: #2196F3;
  color: #fff;
}





.nextContent>img
{
  height: 30px;
  width: 30px;
  
}
.nextContent:hover
{
  background:  #f1f1f1;;
}



.list-group-item
{
  padding: 0px;
  margin:0px;
}

.list-group-item>button
{
  width:100%;
  height: 100%;
}
.list-group-item>button:hover
{
  background-color:  rgb(170,57,57);
  color:white;
  
}

.list-group-item>a
{
  text-decoration: none;
}

.checkoutBtn {
  width:100%; 
   height: 50px; 
   color:white;  
   background-color: 
    green; font-size:1.2em;
   position: absolute;
   bottom: 0;
   right: 0;
}
.checkoutBtn:hover
{
  background-color:  white;
  color:black;
}
.quantitiy-box>button:hover
{
  
  background-color:  #f1f1f1;
  color:black;
}

.backgroundRed{background-color:  red;}
.itemSelected:hover{background-color:  red;}
.highlightBag { background-color: #f1f1f1; }
</style>


</head>

<body>
<div class="mydiv ui-widget-content sidemenuSize" >
  <div class="mydivheader">메뉴바</div>
  <div style="margin: 0px; padding: 0px;">
    <button class="btn nextContent" style="width:40%">   
        <img src="<%=request.getContextPath()%>/resources/icon/icons8-back-24.png" >

    </button>
 
    &nbsp;&nbsp;&nbsp;
    <button class="btn nextContent" style="width:40%">

      <img src="<%=request.getContextPath()%>/resources/icon/icons8-forward-24.png" >
  
  </button>
  </div>

  <hr style="margin: 0px; padding: 0px;" >
 

 <button class="btn sidemenuButtonColor" type="button" data-toggle="collapse" data-target="#boardList" aria-expanded="false" aria-controls="boardList">
 
     <p >게시판</p>
  </button>
  <div class="collapse" id="boardList">
    <div class="card card-body">
        <ul class="list-group">
            <li class="list-group-item "><button class="btn" onclick="redirectTo('/admin.view')">공지사항</button></li>
            <li class="list-group-item"><button class="btn" onclick="redirectTo('')">레시피 게시판</button></li>
            <li class="list-group-item"><button class="btn" onclick="redirectTo('')">자유 게시판</button></li>
            <li class="list-group-item"><button class="btn" onclick="redirectTo('')">요리 게시판</button></li>
            <li class="list-group-item"><button class="btn" onclick="redirectTo('')">J-Market</button></li>
          </ul>
    </div>
  </div>
  <hr style="margin: 0px; padding: 0px;" >
  <button class="btn sidemenuButtonColor" type="button" data-toggle="collapse" data-target="#ingridentHelper" aria-expanded="false" aria-controls="ingridentHelper">
 
      <p >재료 리스트</p>
   </button>
   <div class="collapse" id="ingridentHelper">
        
        <table>
          <tbody>
            
          </tbody>
        </table>
        <div class="ingridentBox">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                재료리스트 보기
              </button>
        </div>
   </div>
  <hr style="margin: 0px; padding: 0px;" >
  <button class="btn sidemenuButtonColor " type="button" data-toggle="collapse" data-target="#cart_bag" aria-expanded="false" aria-controls="cart_bag">

      장바구니
      </button>
      <div class="collapse" id="cart_bag">
        <div class="card card-body cart-box" style="padding: 0px;margin:0px">
            <div class="quantitiy-box" style="width:100%;  background-color: rgba(225, 236, 218, 0.932);">
                 
                      <button class="btn  minus" style="width:30%; ">-</button>
                      <input type="text" name="quantity" id="quantity"style="width:30%; text-align:center">
                      <button class="btn  plus" style="width:30%;">+</button>
                 
            </div>
           <div id="itemListBox"class="cartDrop" style="width:100%; height:200px; background-color:skyblue;overflow: auto;">
                <table >
                  <tbody >
                
                  </tbody>
                </table>
           </div>
            <button class="btn checkoutBtn"  >결제하기</button>
        </div>
      </div>
</div>





<div  class= "itemAddable" style= "height: 50px; width:50px ;">

 
    

</div>

</body>



<script>
  var selectedItem = -1;
  var changeNull = false;
  var c = {};
  var idNum ;
  $(function(){

    $(".itemAddable tr").draggable({
    
        helper: "clone",
        start: function(event, ui) {
                c = $(this).clone();
                c.helper = ui.helper;
                idNum = $(this).find(".getVal").val();
                $(c).addClass('itemSelected')
              
            },
        revert : function(event , ui)
        {

          if(event){

            var noMatch = true;
           $("#itemListBox  tr>input").each(function(){
              
              if($(this).val() == idNum)
              {
                noMatch = false;
              }
           })

           if(noMatch)
           $("#itemListBox tbody").append(c);
           noMatch = true;
          
                  
           
            return event;
          }
          else
          { 
           
            return !event;
          }
           
        }
    });

    $(".mydiv").draggable();
    $(".cartDrop").droppable(

 
    );
    $(document).on('click','.itemSelected',function(){
      $("tr").removeClass('highlightBag');
      $(this).addClass('highlightBag');
      selectedItem= $(this).index();
      var num =  $(this).find(".currentQuan").text();
      if(changeNull == false)
      $("#quantity").val(num);
      else
      $("#quantity").val(null);
      
       changeNull = false;
    })


    // remove from box
    $(document).on('click','.removeBTN',function(){
      changeNull = true;
     $(this).closest('tr').remove();
     
    })

    // add quantitiy
    $(document).on('click','button',function(){
    
        if($(this).hasClass("plus"))
        {
      
          var num =  $(".itemSelected").eq(selectedItem).find(".currentQuan").text();
          $("#quantity").val(parseInt(num)+1)
          $(".itemSelected").eq(selectedItem).find(".currentQuan").text(parseInt(num)+1);
        }
        if($(this).hasClass("minus"))
        {
          var num =  $(".itemSelected").eq(selectedItem).find(".currentQuan").text();
          $("#quantity").val(parseInt(num)-1)
          $(".itemSelected").eq(selectedItem).find(".currentQuan").text(parseInt(num)-1);
        }
    })


  })


  function redirectTo(url)
  {
    location.href = "<%=request.getContextPath()%>"+url;
  }
</script>

</html>