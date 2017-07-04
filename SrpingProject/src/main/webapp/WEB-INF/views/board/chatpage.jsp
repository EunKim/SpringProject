<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>


<style>
.float-button {
   position: fixed;
   right: 60px;
   bottom: 60px;
   width: 70px;
   height: 70px;
   background-color: #C63A44;
}


.chat-otherName {
	font-size: 15px; 
	margin-bottom: 5px;
}

.chat-otherTime {
	font-size: 10px;
	margin-top : -5px;
	margin-bottom: 18px; 
}

.chat-meTime {
	font-size: 10px;
	margin-top : -5px; 
	margin-bottom: 18px; 
	text-align: right;
}
/* .chat{
	width:100%;
	height:600px;
	overflow: hidden;

} */
.ins{
	height: 600px;
}


</style>

</head>
<script src="https://www.gstatic.com/firebasejs/4.1.2/firebase.js"></script>

<script type="text/javascript">



</script>

<script type="text/javascript">
$(document).ready(function(){
	
	
	var chat_member_id = $('#memberId').val();
	var in_num = $('#board_number').val();
	
	$("#hi").hide();
	
    $("#floatChat").click(function(){
    	$("#hi").toggle();
    	$.ajax({
            type :"post",
            url	 :"${path}/chattingList/me.do",  
            data :"chat_member_id="+chat_member_id,
            success : function(map) {
            	values = map.list;
            	var chat='';
            	var i = 1;
            	var board_num = 0;
            	
            	
            	$.each(values, function(index,value){
            		chat += "<li class='person' id='board_num' data-chat='person";
            		chat += value.board_num;
            		chat += "' value='";
            		chat += value.board_num;
            		chat += "'><span class='name chatspan'>";
            	 	chat += value.title;
            	 	chat += "</span><span class='time chatspan'>";
            		chat += value.tour_date;
            		chat += "</span><span class='preview chatspan'>";
            		chat += "</span></li>";
            	});
            	
            	$('.people').html(chat);
            
            	
            	
            	$('.person').click(function(){
            		//alert($(this).val());
    				$('#board_number').val($(this).val());
    				//firebase($(this).val());
                 });
            	 
               //여기다 넣으면 되긴하나 실시간x 
          		
            	 $('.left1 .person').mousedown(function(){
         		    if ($(this).hasClass('.active')) {
         		        return false;
         		    } else {
         		        var findChat = $(this).attr('data-chat');	
         		        var personName = $(this).find('.name').text();
         		        $('.right1 .top2 .name').html(personName);
         		        $('.chat').removeClass('active-chat');
         		        $('.left1 .person').removeClass('active');
         		        $(this).addClass('active');
         		        $('.chat[data-chat = '+findChat+']').addClass('active-chat');
         		    } 
         	});
            	 
            }
         });
        return false;
        
    	
    });
    

	
    
	var config = {
			apiKey: "AIzaSyBypmjVqTjRDUHHnys_lqrY1t8RGNtVs2Q",
		    authDomain: "btest8-a7c48.firebaseapp.com",
		    databaseURL: "https://btest8-a7c48.firebaseio.com",
		    projectId: "btest8-a7c48",
		    storageBucket: "btest8-a7c48.appspot.com",
		    messagingSenderId: "984348937282"
			};
			firebase.initializeApp(config); 
			
			//var re_num = $('#board_number').val();
			//$('#test').val($('#board_number').val());
			//var in_num = re_num;
			alert(in_num);
			var messageRef = firebase.database().ref('36');
			var offsetRef = firebase.database().ref(".info/serverTimeOffset");
			var estimatedServerTimeMs;
		
		
		messageRef.on('value', function () {
			alert(88888);
		  	 var chatin = '';
		  	 var chatmessage = '';
		  	 chatin += "<div class='chat' style='position:relative; overflow: scroll;' data-chat='person";
			 chatin += 36;
			 chatin += "'>";	
		messageRef.on('child_added', function (snapshot) {
		//alert(5555);

		if(snapshot.val().message == ""){
			chatmessage += "<div class='conversation-start'><span class='chatspan'>";
			chatmessage += snapshot.val().member_name;
			chatmessage += "님 입장 ";
			chatmessage += "</span></div>"
		}
		
		if($("#memberId").val() == snapshot.val().member_id){
			chatmessage += "<div class='bubble me'>";
			chatmessage += snapshot.val().member_name;
			chatmessage += " : ";
			chatmessage += snapshot.val().message;
			chatmessage += "</div>"; 
		}else{
			chatmessage += "<div class='bubble you'>";
			chatmessage += snapshot.val().member_name;
			chatmessage += " : ";
			chatmessage += snapshot.val().message;
			chatmessage += "</div>";
	 	 }
		
		
		
	});
		chatin += "</div>";
		
		$('.ins').html(chatin);
		$('.chat').html(chatmessage);
		// 스크롤을 마지막으로 내려줌
		$('.chat').scrollTop($('.chat')[0].scrollHeight);
		
	});
		
	function center(){
	  		alert('33333');
	  		
	  		messageRef.push().set({
		 		  align : 0,
				  board_num : $('#board_num').val(),
				  message : $("#chatinputid").val(),
		       	  member_id : $("#memberId").val(),
		       	  member_name : $("#member_name").val(),
		       	  time : firebase.database.ServerValue.TIMESTAMP
		     });
	  	 	
	 }
	
	/* function test3(){
		alert('되느냐 안되느냐');
	} */
    
    //엔터키를 입력했을때 
    $("#chatinputid").on('keydown', function (event) {
    	  if (event.keyCode == 13) {
    		  if($("#chatinputid").val() == ''){
    			  alert('내용을 입력하세요');
    		  }else{
    			  messageRef.push().set({
    				  align : 0,
    				  board_num :  $('#board_number').val(), 
    				  message : $("#chatinputid").val().trim(),
    		       	  member_id : $("#memberId").val(),
    		       	  member_name : $("#member_name").val(),
    		       	  time :firebase.database.ServerValue.TIMESTAMP
    		         });
    		      
    		         $(this).val('');
    		     }
    		  }  
    });

    // Send Button 에 클릭이벤트 적용
    	$(".send").on('click', function () {
       // push() 로 넣을 경우 key 값을 임의로 생성해줌
    	  if($("#chatinputid").val() == ''){
    		  alert('내용을 입력하세요');
    	  }else{
    		  messageRef.push().set({
    			  align : 0,
    			  board_num : $('#board_number').val(),
    			  message : $("#chatinputid").val(),
    	       	  member_id : $("#memberId").val(),
    	       	  member_name : $("#member_name").val(),
    	       	  time : firebase.database.ServerValue.TIMESTAMP
    	         });
    		  $("#chatinputid").val('');
    	 } 
    });
    
    	
});
</script>

   <button class="w3-button w3-xlarge w3-circle w3-card-4 float-button" id="floatChat">
      <img
         src="${pageContext.request.contextPath}/resources/images/chat1.png"
         height="35" width="35">
   </button>
   <div class="wrapper" id = "hi">
    <div class="container1">
        <div class="left1">
            <div class="top1">
                <input type="text" class="chatinput"/>
                <input type="hidden" id=memberId name="memberId" value="${sessionScope.member_id}">
                <input type="hidden" id=member_name name="member_name" value="${sessionScope.member_name}">
                <input type="hidden" id=board_number name="board_number" value="">
           		<input type="hidden" id=test name="test" value="">
                <a href="javascript:;" class="search"></a>
            </div>
            <ul class="people">
              <%--   <c:forEach var="row" items="${map.list}">
                <li class="person" data-chat="person2">
                    <span class="name chatspan">${row.title}</span>
                    <span class="time chatspan">${row.tour_date}</span>
                    <span class="preview chatspan"></span>
                </li>
             	</c:forEach> --%>
            </ul>
        </div>
        <div class="right1">
            <div class="top2"><span class="chatspan">제목: <span class="name chatspan">Dog Woofson</span></span></div>
           	
     	 	<div class="ins" ></div>
          	
            <div class="write">
                <a href="javascript:;" class="write-link attach"></a>
                <input type="text" class = "chatinput" id="chatinputid"/>
                <a href="javascript:;" class="write-link smiley"></a>
                <a href="javascript:;" class="write-link send"></a>
            </div>
        </div>
    </div>
</div>


<script>




			 
			
			 
			 
	

	 //$('.chat[data-chat=person2]').addClass('active-chat');
	 //$('.person[data-chat=person2]').addClass('active');		 
			 
	
	
	
	</script>
</html>

