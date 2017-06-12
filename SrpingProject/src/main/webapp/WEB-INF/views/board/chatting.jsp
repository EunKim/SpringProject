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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
   src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
<style>
        .message-bubble1 {
            padding: 10px 0 10px 0;
            text-align: right;
        }
 
        .message-bubble1:nth-child(even) {
            background-color: #F5F5F5;
        }
 
        .message-bubble1 > * {
            padding-left: 10px;
        }
 
 		.message-bubble2 {
            padding: 10px 0 10px 0;
            text-align: left;
        }
 
        .message-bubble2:nth-child(even) {
            background-color: #F5F5F5;
        }
 
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
      <form class="form-horizontal" style="width: 40%; text-align: center;" name="chatting" >

         <fieldset>
            <legend>실시간 </legend>


           <!--  <div class="form-group">
               <label class="col-lg-2 control-label" for="inputContent">본문</label>
               <div class="col-lg-10" style="text-align: center;">
                  <textarea class="form-control" id="bocontent" name="bocontent" rows="5" ></textarea>
               </div>
            </div> -->



            <%-- <c:if test="${sessionScope.uname == dto.bouname}">
               <div class="form-group">
                  <div class="col-lg-10 col-lg-offset-2">
                     <button class="btn btn-primary" type="button" id="btnWriteUpdate">글
                        수정</button>
                     <button class="btn btn-primary" type="button" id="btnWriteDelete">글
                        삭제</button>
                     <button class="btn btn-primary" type="button" id="btnStartChat">채팅방
                        들어가기</button>
                  </div>
               </div>
            </c:if>

            <c:if test="${sessionScope.uname != dto.bouname}">
               <div class="form-group">
                  <div class="col-lg-10 col-lg-offset-2">
                     <button class="btn btn-primary" type="button" id="btnStartChat">채팅방 들어가기</button>
                  </div>
               </div>
            </c:if> --%>

         </fieldset>
      </form>
      
      
      
      <div class="container">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">Chat Example</div>
            <div class="panel-body">
                <div class="chat-panel container">
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input type="text" class="messageText form-control">
                    	<input type="hidden" id=bonumber name="bonumber" value="${sessionScope.uid}">
                        <span class="input-group-btn"><button class="sendBtn btn btn-default" type="button">Send</button></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

   </div>
<script src="https://www.gstatic.com/firebasejs/4.1.2/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyDFKg5XQ96_GlzvZ94jDN8REec--EHqLfU",
    authDomain: "testproject-63e17.firebaseapp.com",
    databaseURL: "https://testproject-63e17.firebaseio.com",
    projectId: "testproject-63e17",
    storageBucket: "testproject-63e17.appspot.com",
    messagingSenderId: "396844116514"
  };
  firebase.initializeApp(config);
  
 // var bocontent = document.getElementById('bocontent');
  //var messageRef = firebase.database().ref().child('text');
  //var bonumber = "${dto.bonumber}"
  var messageRef = firebase.database().ref('${map.bonumber}');
  //var sessionuid = ${sessionScope.uid};
  
  messageRef.on('value', function () {
      var chat = '';
      messageRef.on('child_added', function (snapshot) {
          // console.log(snapshot.val());
          if($("#bonumber").val() == snapshot.val().userid){
        	  chat += "<div class='row message-bubble1'><span>";
              chat += snapshot.val().userid;
              chat += snapshot.val().message;
              chat += "</span></div>"; 
          }else{
        	  chat += "<div class='row message-bubble2'><span>";
              chat += snapshot.val().userid;
              chat += snapshot.val().message;
              chat += "</span></div>";
          }
          
          
      });
      // console.log(chat);
      $('.chat-panel').html(chat);
      // 스크롤을 마지막으로 내려줌
      $('.chat-panel').scrollTop($('.chat-panel')[0].scrollHeight);
  });

 $('.messageText').on('keyup', function (event) {
	  if (event.keyCode == 13) {
        messageRef.push().set({
       	  message : $('.messageText').val(),
       	  userid : $("#bonumber").val()
         });
      
         $(this).val('');
     }
 });

 // Send Button 에 클릭이벤트 적용
 $('.sendBtn').on('click', function () {
     // push() 로 넣을 경우 key 값을 임의로 생성해줌
      messageRef.push().set({
      message : $('.messageText').val(),
      userid : $("#bonumber").val()
      
     }); 
   
     $(this).val('');
 });

 
 
</script>
      

      <%-- <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2> --%>


</body>
</html>