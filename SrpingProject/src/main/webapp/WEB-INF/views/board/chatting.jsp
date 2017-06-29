<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sessionCheck.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ko.js" type="text/javascript"></script>
<style>

		.message-bubble {
			width:80%;
            padding: 10px 0 10px 0;
            text-align: center;
        }
 
        .message-bubble:nth-child(even) {
            background-color: #F5F5F5;
        }
 
        .message-bubble > * {
            padding-left: 10px;
        }
        
        .message-bubble1 {
        	margin-left : 
            padding: 10px 0 10px 40px;
            text-align: right;
            background-color: #F5F5F5;
        }
 
        /* .message-bubble1:nth-child(even) {
            background-color: #F5F5F5;
        } */
 
        .message-bubble1 > * {
            padding-left: 10px;
        }
 
 		.message-bubble2 {
            padding: 10px 0 10px 0;
            text-align: left;
        }
 
        /* .message-bubble2:nth-child(even) {
            background-color: #F5F5F5;
        } */
 
        .message-bubble2 > * {
            padding-left: 10px;
        }
        
        .panel-body {
            padding: 0;
        }
 
        .panel-heading {
            background-color: #3d6da7 !important;
            color: black !important;
        }
 
        .chat-panel {
            height: 400px;
            overflow: auto;
        }
        
        
    </style>

</head>

<body>
   <%@ include file="../include/menu.jsp"%>

   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" style="width: 60%; text-align: center;" name="chatting" >

         <fieldset>
            <legend>실시간 +${map.board_num} + ${map.member_id}  </legend>
         </fieldset>
      </form>
      
      
      
      <div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Chat Example</div>
            <div class="panel-body">
                <div class="chat-panel container">
                </div>
                <div>
                	<input type="text" class="messageText form-control" id="messageText" style="float: left; width: 900px;">
                   	<button class="sendBtn btn btn-default" type="button" id="sendBtn"  style="float: right;">Send</button>
                   	<input type="hidden" id=board_num name="board_num" value="${map.board_num}">
          			<input type="hidden" id=board_num name="board_num" value="${map.board_num}">
                   	<input type="hidden" id=member_id name="member_id" value="${sessionScope.member_id}">
                   	<input type="hidden" id=member_name name="member_name" value="${sessionScope.member_name}">
                    <input type="hidden" id=indate name="indate" value=" ">       	
                </div>
            </div>
        </div>
    </div>
</div>

 </div>
<script src="https://www.gstatic.com/firebasejs/4.1.2/firebase.js"></script>
<script>
/* var room_num = ${map.board_num};
var member_id = ${map.member_id}; */

$(document).ready(function() {

var room_num = ${map.board_num};
var chat_member_id = $("#member_id").val();


$.ajax({
    type : "post",
    url: "${path}/chattingMember/confirm.do",  
    data : "room_num="+room_num+"&chat_member_id="+chat_member_id,
    success : function(message) {
       if (message) // LOGIN OK?
        { 
    	   alert('존재');
        } else {
        	alert('존재x');
       	    center();
       	    //location.href="${path}/chattingMember/insert.do?room_num="+room_num+"&chat_member_id="+chat_member_id;  	  
        } 
    }
 });
return false;	

});

var config = {
		  apiKey: "AIzaSyDFKg5XQ96_GlzvZ94jDN8REec--EHqLfU",
		  authDomain: "testproject-63e17.firebaseapp.com",
		  databaseURL: "https://testproject-63e17.firebaseio.com",
		  projectId: "testproject-63e17",
		  storageBucket: "testproject-63e17.appspot.com",
		  messagingSenderId: "396844116514"
		};
		firebase.initializeApp(config);


		var messageRef = firebase.database().ref('${map.board_num}');
		var offsetRef = firebase.database().ref(".info/serverTimeOffset");
		var estimatedServerTimeMs; 
messageRef.on('value', function () {
    var chat = '';
    messageRef.on('child_added', function (snapshot) {
    
    		 if(snapshot.val().message == ""){
    			 chat += "<div class='row message-bubble'><span>";
	             chat += snapshot.val().memberName;
	             chat += "님 입장 ";
    		 }
    	    	
    	       	if(($("#member_id").val() == snapshot.val().memberId)){
    	        	  chat += "<div class='row message-bubble1'><span>";
    	             chat += snapshot.val().memberName;
    	             chat += " : ";
    	             chat += snapshot.val().message;
    	             chat += "</span></div>"; 
    	         }else{
    	       	  chat += "<div class='row message-bubble2'><span>";
    	             chat += snapshot.val().memberName;
    	             chat += " : ";
    	             chat += snapshot.val().message;
    	             chat += "</span></div>";
    	         }
        
    });
    // console.log(chat);
    $('.chat-panel').html(chat);
    // 스크롤을 마지막으로 내려줌
    $('.chat-panel').scrollTop($('.chat-panel')[0].scrollHeight);
});

function center(){
	 messageRef.push().set({
	       	  message : $("#messageText").val(),
	       	  memberId : $("#member_id").val(),
	       	  memberName : $("#member_name").val(),
	       	  time : firebase.database.ServerValue.TIMESTAMP
	         });
}

  //엔터키를 입력했을때 
 $("#messageText").on('keydown', function (event) {
	  if (event.keyCode == 13) {
		  if($("#messageText").val() == ''){
			  alert('내용을 입력하세요');
		  }else{
			  messageRef.push().set({
		       	  message : $("#messageText").val().trim(),
		       	  memberId : $("#member_id").val(),
		       	  memberName : $("#member_name").val(),
		       	  time :firebase.database.ServerValue.TIMESTAMP
		         });
		      
		         $(this).val('');
		     }
		  }  
 });

 // Send Button 에 클릭이벤트 적용
 $("#sendBtn").on('click', function () {
     // push() 로 넣을 경우 key 값을 임의로 생성해줌
	  if($("#messageText").val() == ''){
		  alert('내용을 입력하세요');
	  }else{
		  messageRef.push().set({
	       	  message : $("#messageText").val(),
	       	  memberId : $("#member_id").val(),
	       	  memberName : $("#member_name").val(),
	       	  time : firebase.database.ServerValue.TIMESTAMP
	         });
		  $("#messageText").val(' ');
	     } 
 });

 
 
</script>
      

      <%-- <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2> --%>


</body>
</html>