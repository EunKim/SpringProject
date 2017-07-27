<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WITH BEA</title>
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
	margin-bottom: 2px;
	margin-left: 9px;
}

.chat-otherTime {
	font-size: 10px;
	padding-top: 50px;
	margin-left: 9px;
}

.chat-meTime {
	font-size: 10px;
	padding-top: 50px;
	margin-right:9px;
	text-align: right;
}


/* .chat{
	width:100%;
	height:600px;
	overflow: hidden;

} */
 .ins{
	height: 480px;
	overflow: auto;
}
 
 
 .message-bubble {
	width:100%;
    padding: 10px 0 10px 0;
    text-align: center;
 }
 
 .message-bubble-chat {
	width:100%;
	height: 25%;
    
 }
 
.container1 .right1 .bubble {
  font-size: 16px;
  position: relative;
  display: inline-block;
  clear: both;
  margin-bottom: 8px;
  padding: 8px 14px;
  vertical-align: top;
  border-radius: 5px;
 
}
.container1 .right1 .bubble:before {
  position: absolute;
  top: 19px;
  display: block;
  width: 8px;
  height: 6px;
  content: '\00a0';
  -webkit-transform: rotate(29deg) skew(-35deg);
          transform: rotate(29deg) skew(-35deg);
}

.container1 .right1 .bubble.you {
  float: left;
  color: #1a1a1a;
  margin-left:9px;
  background-color:  #BDBDBD;
  -ms-flex-item-align: start;
      align-self: flex-start;
  /* -webkit-animation-name: slideFromLeft;
  animation-name: slideFromLeft; */
}
.container1 .right1 .bubble.you:before {
 
  left: -3px;
  background-color: #BDBDBD;
}
.container1 .right1 .bubble.me {
  float: right !important;
  color:  #fff;
  margin-right:9px;
  background-color: #5DC9BC;
  -ms-flex-item-align: end;
      align-self: flex-end;
 /*  -webkit-animation-name: slideFromRight;
  animation-name: slideFromRight; */
}
.container1 .right1 .bubble.me:before {
  right: -3px;
  background-color: #5DC9BC;
}

.delete{
	width: 95px;
	text-align:right;
	margin-top: 30px;
	margin-left: 165px;
	
}

.container1 .left1 .people .person .delete{
	color: #000000;
}


</style>

</head>
<script src="https://www.gstatic.com/firebasejs/4.1.2/firebase.js"></script>
<script type="text/javascript">
var config = {
		apiKey: "AIzaSyBypmjVqTjRDUHHnys_lqrY1t8RGNtVs2Q",
	    authDomain: "btest8-a7c48.firebaseapp.com",
	    databaseURL: "https://btest8-a7c48.firebaseio.com",
	    projectId: "btest8-a7c48",
	    storageBucket: "btest8-a7c48.appspot.com",
	    messagingSenderId: "984348937282"
		};
		firebase.initializeApp(config);
		
	
function center(){
		    input();
		 	
}

var xmlHttp;
function srvTime(){
    if (window.XMLHttpRequest) {//분기하지 않으면 IE에서만 작동된다.
        xmlHttp = new XMLHttpRequest(); // IE 7.0 이상, 크롬, 파이어폭스 등
        xmlHttp.open('HEAD',window.location.href.toString(),false);
        xmlHttp.setRequestHeader("Content-Type", "text/html");
        xmlHttp.send('');
        return xmlHttp.getResponseHeader("Date");
    }else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
        xmlHttp.open('HEAD',window.location.href.toString(),false);
        xmlHttp.setRequestHeader("Content-Type", "text/html");
        xmlHttp.send('');
        return xmlHttp.getResponseHeader("Date");
    }
}

     var st = srvTime();
     var date = new Date(st);
     var today = date.getFullYear()+ "년 "+ addZero(date.getMonth()+1)+ "월 "+ addZero(date.getDate()) + "일 " + date.getHours() + "시" + date.getMinutes() +"분" + date.getSeconds() +"초"  ;

 

      function addZero(n){
          return n < 10 ? "0" + n : n;
      }
      
      
   function chatTime (x){
	   
	   var date2 = new Date(x);
	   inserTime = date2.getFullYear()+ "년 "+ addZero(date2.getMonth()+1)+ "월 "+ addZero(date2.getDate()) + "일 " + date2.getHours() + "시" + date2.getMinutes() +"분" ;

	   return inserTime;
   }  


</script>


<script type="text/javascript">
$(document).ready(function(){
	
	
	var chat_member_id = $('#memberId').val();
	var messageRef;
	
	
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
            		var str = value.title;
            		var title = str.substring(0,8);
            		var re = title + "····";
            		chat += "<li class='person' id='liboard_num' data-chat='person";
            		chat += value.board_num;
            		chat += "' value='";
            		chat += value.board_num;
            		chat += "'><span class='name chatspan'>";
            	 	chat += re;
            	 	chat += "</span><span class='time chatspan'>";
            		chat += value.tour_date;
            		chat += "</span><span class='delete'>채팅방 나가기</span></li>";
            	});
            	
            	$('.people').html(chat);
            	
            	//엔터키를 입력했을때 
		  	     $('#chatinputid').on('keydown', function (event) {
		  	          	 if (event.keyCode == 13) {
		  	          		//alert("2321"+$('#board_number').val());
		  	          		 if($('#chatinputid').val() == ''){
		  	          			  alert('내용을 입력하세요');
		  	          		  }else{
		  	          			 	enter();
		  	          		    }
		  	         	}  
		  	     });
		      		
		  	   // Send Button 에 클릭이벤트 적용
		     	$(".send").on('click', function () {
		        // push() 로 넣을 경우 key 값을 임의로 생성해줌
		     	  if($("#chatinputid").val() == ''){
		     		  alert('내용을 입력하세요');
		     	  	}else{
		     		  click();
		     	 	} 
		     	});
		  	   
		    
		     	/* alert("pesrson"+$('#dto_board_number').val());
            	alert($('.left1 .person').attr('data-chat') == "pesrson"+$('#dto_board_number').val());
            	if("pesrson"+$('#dto_board_number').val() == $('.left1 .person').attr('data-chat') ){
        			alert("^^들어왔다");
        			var personName = $('.left1 .person').find('.name').text();
        			$('.right1 .top2 .name').html(personName);
        			$('.left1 .person').addClass('active');
        		} */

            	
            	
            	$('.left1 .person').click(function(){
            		//alert($(this).val());
            		var findChat
    				$('#board_number').val($(this).val());
    				//firebase($(this).val());
    				
    				findChat = $(this).attr('data-chat');
  		      		var personName = $(this).find('.name').text();
  		      		$('.right1 .top2 .name').html(personName);
  		      		$('.left1 .person').removeClass('active');
  		      		$(this).addClass('active');
  		      	 	
  		      		//채팅방 나가기 버튼 눌렀을시
  			     	$('.delete').click(function(){
  			     		if (confirm("채팅방을 나가시겠습니까?")) {
  			     			//alert($('#board_number').val() +"@@");
  			     			//alert($('#memberId').val() +"@@");
  			     			location.href = "${path}/chattingList/deleteChat.do?board_number=" + $('#board_number').val() + "&chat_member_id=" + $('#memberId').val();
  			                function_delete();
  			             }
  			     	
  			     	});
  		      		
  		      		
    			$.ajax({
    				  type :"post",
 			          url  :"${path}/chattingList/room_number.do", 
 			          data :"board_number="+ $('#board_number').val() + "&chat_member_id=" + $('#memberId').val(),
 			          async : false,
 			          success : function(map) {
 			        	//alert("789"+board_number);
 			        	$('#board_number').val(map.board_number);
 			        	$('#snapshot_time').val(map.insertTime);
 			        	
		        	messageRef = firebase.database().ref($('#board_number').val());
		        	var offsetRef = firebase.database().ref(".info/serverTimeOffset");
		        	var estimatedServerTimeMs;
		        	offsetRef.on("value", function(snap) {
		        		estimatedServerTimeMs = new Date().getTime() + snap.val();
		        	});
		        	
		        	messageRef.on('value', function () {
		    			 var chatin = '';
		    		  	 var chatmessage = '';
		    		  	 chatin += "<div class='chat' style='position:relative; overflow: scroll;' data-chat='person";
		    			 chatin += $('#board_number').val();
		    			 chatin += "'>";
		    		$('.chat[data-chat='+findChat+']').addClass('active-chat');
  		    			
  		    		messageRef.on('child_added', function (snapshot) {
  		    			 //alert(findChat+"@@@@@7777");
  		    			
  		    			if(snapshot.val().time >= $('#snapshot_time').val()){
  		    				
  		    				if((snapshot.val().member_id == "info") ){
  	  	  		    			chatmessage += "<div class='message-bubble'><span class='chatspan'>";
  	  	  		    			chatmessage += snapshot.val().member_name;
  	  	  		    			chatmessage += "</span></div>"
  	  	  		    		}else{

  		  	  		    			if($("#memberId").val() == snapshot.val().member_id){
  		  	  		    				chatmessage += "<div class='message-bubble-chat'>"
  		  	  		    				chatmessage += "<div class='bubble me'>";
  		  	  		    				chatmessage += snapshot.val().message;
  		  	  		    				chatmessage += "</div>"
  		  	  		    				chatmessage += "<div class='chat-meTime'>"
  	  		  	  	  	  		    	chatmessage += chatTime(snapshot.val().time);
  	  		  	  	  	  		    	chatmessage += "</div></div>"; 
  		  	  		    			}else{
  		  	  		    				chatmessage += "<div class='message-bubble-chat'>"
  		  	  		    				chatmessage += "<div class='chat-otherName'>"
  		  	  		    				chatmessage += snapshot.val().member_name;
  		  	  		    				chatmessage += "</div>"
  		  	  		    				chatmessage += "<div class='bubble you'>";
  		  	  		    				chatmessage += snapshot.val().message;
  		  	  	  		    			chatmessage += "</div>"
  		  	  	  		    			chatmessage += "<div class='chat-otherTime'>"
  		  	  	  		    			chatmessage += chatTime(snapshot.val().time);
  		  	  		    				chatmessage += "</div></div>"; 
  		  	  		    		 	 } 
  		  	  		    			
  		  	  		    			
  		  	  		    	}
  		    			}
  		    			 
  		    			
		    			
  		    		
  		    	});
					chatin += "</div>";
  		    		
  		    		$('.ins').html(chatin);
					$('.ins').html(chatmessage);
  		    		$('.chat[data-chat='+findChat+']').addClass('active-chat');
  		    		//$('.chat').html(chatmessage);
  		    		// 스크롤을 마지막으로 내려줌
  		    		$('.ins').scrollTop($('.ins')[0].scrollHeight);
  		    		
  		    		
  		    		
  		    		
  		    	});
		        	
		        	
  		        	
         		}
    			    
   			       
   				});
    			
    			
            
          	 });
            	 
            	
            	 
            	 function enter(){
	         			 messageRef.push().set({
	               				  align : 0,
	               				  board_num :$('#board_number').val(), 
	               				  message : $("#chatinputid").val().trim(),
	               		       	  member_id : $("#memberId").val(),
	               		       	  member_name : $("#member_name").val(),
	               		       	  time :firebase.database.ServerValue.TIMESTAMP
	               		         });
	               		      
	               		   $('#chatinputid').val('');
	   		}
           	
            	 
            	function click(){
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
            	
            	function function_delete(){
            		messageRef.push().set({
		     			  align : 2,
		     			  board_num : $('#board_number').val(),
		     			  message : $("#chatinputid").val(),
		     	       	  member_id : "info",
		     	       	  member_name : $("#delete_name").val(),
		     	       	  time : firebase.database.ServerValue.TIMESTAMP
		     	         });
	    			
            	}
            	
            	
            	
          		 
            }
            
    	
            
    	
         });
    	
    	
    	
    	
        return false;
        
        
       
    });
    

   
    
    	
});


</script>

   <button class="w3-button w3-xlarge w3-circle w3-card-4 float-button" id="floatChat">
      <img
         src="${pageContext.request.contextPath}/resources/images/chat1.png"
         height="35" width="35">
   </button>
   <div class="wrapper" id = "hi" style="z-index: 100;">
    <div class="container1">
        <div class="left1">
            <div class="top1">
                <input type="text" class="chatinput"/>
                <input type="hidden" id=memberId name="memberId" value="${sessionScope.member_id}">
                <input type="hidden" id=member_name name="member_name" value="${sessionScope.member_name}">
                <input type="hidden" id=insert_name name="insert_name" value="────────${sessionScope.member_name}님 입장 ────────">
                <input type="hidden" id=delete_name name="delete_name" value="────────${sessionScope.member_name}님 퇴장 ────────">
                <input type="hidden" id=board_number name="board_number" value="">
                <input type="hidden" id=dto_board_number name="dto_board_number" value="${dto.board_num}">
                <input type="hidden" id=snapshot_time name="snapshot_time" value="">
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
        	
        	<c:if test="${sessionScope.member_id == null}">
				<div class="top2"><span class="chatspan"><span class="name chatspan">로그인후 이용해주세요!</span></span></div>
			</c:if>
			<c:if test="${sessionScope.member_id != null}">
				<div class="top2"><span class="chatspan">제목 : <span class="name chatspan">채팅 목록을 선택해 주세요!</span></span></div>
			</c:if>
			
            
           	
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

function input(){
	var messageRef = firebase.database().ref($('#dto_board_number').val());
	
	messageRef.push().set({
		  align : 2,
		  board_num : $("#dto_board_number").val(),
		  message : $("#chatinputid").val(),
     	  member_id : "info",
     	  member_name : $("#insert_name").val(),
     	  time : firebase.database.ServerValue.TIMESTAMP
   });
		
}

			 
			
	</script>
</html>

