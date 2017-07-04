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
<script type="text/javascript">
   $(document).ready(function() {

	   //    
       
	   
      //수정 버튼
      $("#btnWriteUpdate").click(function() {
         location.href = "${path}/board/updateBoard.do?board_num=${dto.board_num}";

      });

      //삭제 버튼
      $("#btnWriteDelete").click(function() {
         if (confirm("삭제하시겠습니까?")) {
            document.chattingForm.action = "${path}/board/deletchat.do";
            document.chattingForm.submit();
         }
      });

      //채팅방 들어갈시
      $("#btnStartChat").click(function() {
         //location.href = "${path}/board/chatting.do?board_num=${dto.board_num}&member_id=${sessionScope.member_id}";
           var room_num = ${dto.board_num};
           /*alert(room_num); */
          var chat_id = $('#test1').val();
		  //alert(room_num + chat_id);
       	   
    	 $.ajax({
    	      type : "post",
    	      url: "${path}/chattingMember/confirm.do",  
    	      data : "room_num="+room_num+"&chat_member_id="+chat_id,
    	      success : function(message) {
    	         if (message) // LOGIN OK?
    	          { 
    	      	   alert('존재');
    	      	 	$("#hi").toggle();
    	      	 	//$("#hi").toggle();
    	          } else {
    	          	alert('존재x');
    	          	$("#hi").toggle();
    	         	center();
    	         	//test();
    	         	
    	           	  
    	         }
    	         
    	      }
    	
    	   });
    	 
      }); 
	
      
      function center(){
  		alert('33333');
  		
  		messageRef.push().set({
	 		  align : 0,
			  board_num : $('#board_number').val(),
			  message : $("#chatinputid").val(),
	       	  member_id : $("#memberId").val(),
	       	  member_name : $("#member_name").val(),
	       	  time : firebase.database.ServerValue.TIMESTAMP
	     });
  	 	
  	}
      
      function test(){
    	  alert('22222');
      }

   });
</script>

</head>
<body>
   <%@ include file="../include/menu.jsp"%>
   <%@ include file="../board/chatpage.jsp"%>

   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" style="width: 600px;" method="post"
         name="chattingForm">
         <fieldset>
            <legend style="float: left;">상세보기</legend>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label"
                  style="float: left; width: 100px; margin-right: 20px">제목</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
               <input type="hidden" id=test1 name="test1" value="${sessionScope.member_id}">
                <input type="hidden" id=test2 name="test2" value="">  
                 <input type="hidden" id=board_num name="board_num"
                     value="${dto.board_num}"> <input class="form-control"
                     id="botitle" name="botitle" type="text" value="${dto.title}"
                     readonly>
               </div>
            </div>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingDate"
                  style="float: left; width: 100px; margin-right: 20px;">만날날짜</label>
               <div style="width: 190px; float: left; margin-right: 2px;">
                  <input class="form-control" id="tour_date" name="tour_date"
                     type="text" value="${dto.tour_date}" readonly>
               </div>
               <label class="control-label" for="inputMeetingTime"
                  style="float: left; width: 100px; margin-right: 20px;">만날시간</label>
               <div style="width: 190px; float: left;">
                  <input class="form-control" id="tour_time" name="tour_time"
                     type="text" value="${dto.tour_time}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">상세주소</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="location" name="location"
                     type="text" value="${dto.location}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px;">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">장소명</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="place_name" name="place_name"
                     type="text" value="${dto.place_name}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputCost"
                  style="float: left; width: 100px; margin-right: 20px">비용</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="cost" name="cost" type="text"
                     value="${dto.cost}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputContent"
                  style="width: 100px; float: left; margin-right: 20px;">본문</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <textarea class="form-control" id="contents" name="contents"
                     rows="4" readonly>${dto.contents}</textarea>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputWriter"
                  style="width: 100px; float: left; margin-right: 20px;">작성자</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="member_id" name="member_id"
                     type="text" value="${dto.member_name}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputWriteDate"
                  style="width: 100px; float: left; margin-right: 20px;">작성날짜</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="board_datetime" name="board_datetime"
                     type="text" value="${dto.board_datetime}" readonly>
               </div>
            </div>

            <c:if test="${sessionScope.member_id == dto.member_id}">
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

            <c:if test="${sessionScope.member_id != dto.member_id}">
               <div class="form-group">
                  <div class="col-lg-10 col-lg-offset-2">
                     <button class="btn btn-primary" type="button" id="btnStartChat">채팅방
                        들어가기</button>
                  </div>
               </div>
            </c:if>

         </fieldset>
        
      </form>
		  
		 
      <%-- <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2> --%>

   </div>

</body>
</html>