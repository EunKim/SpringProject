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
.chat{
	 height : 701px; 
	 overflow: auto;

}
.chatbox{
	height: 600px;
	overflow: auto;
}

</style>

</head>
<script src="https://www.gstatic.com/firebasejs/4.1.2/firebase.js"></script>

<script type="text/javascript">



</script>

<script type="text/javascript">
$(document).ready(function(){
	
	
	
	var chat_member_id = $('#member_id').val();
	
	$("#hi").hide();
	
    $("#floatChat").click(function(){
    	$("#hi").toggle();
    	
    });
    
    
    
    $.ajax({
        type :"post",
        url	 :"${path}/chattingList/me.do",  
        data :"chat_member_id=" + chat_member_id,
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
        
        	
        	
        	/* $('.person').click(function(){
        		 
              		alert($(this).val());
              
              		var messageRef = firebase.database().ref('$(this).val()');
              		var offsetRef = firebase.database().ref(".info/serverTimeOffset");
              		var estimatedServerTimeMs;
              		
              		alert(1111);
              		messageRef.on('value', function () {
              			alert(3333);
              			var chatin = '';
              			alert(chatin+1);
              		});
	
             }); */
        	 
           //여기다 넣으면 되긴하나 실시간x 
      		var config = {
		  apiKey: "AIzaSyDFKg5XQ96_GlzvZ94jDN8REec--EHqLfU",
		  authDomain: "testproject-63e17.firebaseapp.com",
		  databaseURL: "https://testproject-63e17.firebaseio.com",
		  projectId: "testproject-63e17",
		  storageBucket: "testproject-63e17.appspot.com",
		  messagingSenderId: "396844116514"
		};
		firebase.initializeApp(config); 
		
var messageRef = firebase.database().ref('32');
var offsetRef = firebase.database().ref(".info/serverTimeOffset");
var estimatedServerTimeMs;

	
	
  messageRef.on('value', function () {
	  var chatin = '';
	  chatin += "<div class='chat' data-chat='person";
		chatin += 32;
		chatin += "'>";	
 messageRef.on('child_added', function (snapshot) {
  	//alert(2);
  	

  	if(snapshot.val().message == ""){
  		chatin += "<div class='conversation-start'><span class='chatspan'>";
  		chatin += snapshot.val().memberName;
  		chatin += "님 입장 ";
  		chatin += "</span></div>"
  	}
  	
  	if($("#member_id").val() == snapshot.val().memberId){
  		chatin += "<div class='bubble me'>";
  		chatin += snapshot.val().memberName;
  		chatin += " : ";
  		chatin += snapshot.val().message;
  		chatin += "</div>"; 
  	}else{
  		chatin += "<div class='bubble you'>";
  		chatin += snapshot.val().memberName;
  		chatin += " : ";
  		chatin += snapshot.val().message;
  		chatin += "</div>";
   	 }
  	
  	
  	
  });
	chatin += "</div>";
	$('.chatbox').html(chatin);
  	// 스크롤을 마지막으로 내려줌
  	$('.chat').scrollTop($('.chat')[0].scrollHeight);
	
}); 

//엔터키를 입력했을때 
$("#chatinputid").on('keydown', function (event) {
	  if (event.keyCode == 13) {
		  if($("#chatinputid").val() == ''){
			  alert('내용을 입력하세요');
		  }else{
			  messageRef.push().set({
		       	  message : $("#chatinputid").val().trim(),
		       	  memberId : $("#member_id").val(),
		       	  memberName : $("#member_name").val(),
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
	       	  message : $("#chatinputid").val(),
	       	  memberId : $("#member_id").val(),
	       	  memberName : $("#member_name").val(),
	       	  time : firebase.database.ServerValue.TIMESTAMP
	         });
		  $("#chatinputid").val('');
	 } 
});   
      		  
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
                <input type="hidden" id=member_id name="member_id" value="${sessionScope.member_id}">
                <input type="hidden" id=member_name name="member_name" value="${sessionScope.member_name}">
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
           
          
            <div class="chatbox" >
         	<!-- <div class="conversation-start">
                   <span class="chatspan">Today, 5:38 AM</span>
                </div> 
            <div class="bubble you">
                    Hello, can you hear me?
                </div>
                <div class="bubble you">
                    I'm in California dreaming
                </div>
                <div class="bubble me">
                    ... about who we used to be.
                </div>
                <div class="bubble me">
                    Are you serious?
                </div>
                <div class="bubble you">
                    When we were younger and free...
                </div>
                <div class="bubble you">
                    I've forgotten how it felt before
                </div>  
            </div> -->
           </div>
           
            <!-- <div class="chat" data-chat="person2">
         	<div class="conversation-start">
                   <span class="chatspan">Today, 5:38 PM</span>
                </div> 
            <div class="bubble you">
                    Hello, can you hear me?
                </div>
                <div class="bubble you">
                    I'm in California dreaming
                </div>
                <div class="bubble me">
                    ... about who we used to be.
                </div>
                <div class="bubble me">
                    Are you serious?
                </div>
                <div class="bubble you">
                    When we were younger and free...
                </div>
                <div class="bubble you">
                    I've forgotten how it felt before
                </div> -->  
           
            
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

