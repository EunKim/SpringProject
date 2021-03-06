<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WITH BEA</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sessionCheck.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
$(document).ready(function(){
   
   
   //수정 버튼 누를시
   $("#btnWriteUpdate").click(function(){
      if(confirm("수정하시겠습니까?")){

         //제목 입력 검증
          if($("#title").val() == ""){
             alert("제목을 입력하세요.");
             $("#title").focus();
             return;
          }
         
          //만날 날짜 검증
          if($("#tour_date").val() == ""){
             alert("만날 날짜를 입력하세요.");
             $("#tour_date").focus();
             return;
          }else {
             var compare;
              
              var now = new Date();
              
              var tour_date = $("#tour_date").val();
              var tour_dateArray = tour_date.split("-");
              var meetdate = new Date(tour_dateArray[0], tour_dateArray[1]-1, tour_dateArray[2]);
                     
              if(now.getTime() > meetdate.getTime()){
                 alert("만날 날짜는 오늘 날짜보다 크거나 같아야 합니다.");
                 $("#tour_date").focus();
                 return ;
              }   
          }
          
          //만날 시간 검증
          if($("#tour_time").val() == ""){
              alert("만날 시간를 입력하세요.");
              $("#tour_time").focus();
              return;
           }
          
          //만날 상세주소 검증
          if($("#location").val() == ""){
              alert("상세주소를 입력하세요.");
              $("#location").focus();
              return;
           }
          
          //장소명 검증
          var checkAddress = /[~!@\#$%<>^&*\()\-=+_\’]/gi;
          if(checkAddress.test($("#place_name").val())){
             alert("장소명에는 특수문자를 입력할 수 없습니다.");
             $("#place_name").focus();
              return;
          }
          
          //비용 검증
          if($("#cost").val() == ""){
             alert("비용을 입력하시오.");
             $("#cost").focus();
             return ;
          }else{
          
          var checkCost  = /[0-9]$/;
          if(checkCost.test($("#cost").val()) != true){
             alert("비용은 숫자만 입력가능합니다.");
            $("#cost").focus();
               return;
          }
          }
     

          document.formchatUpdate.action="${path}/board/updateForm.do";
          document.formchatUpdate.submit();
      }
   });
   
   $("#btnMap").click(function(){
	      var newwindow;
	      newwindow = window.open("${path}/board/googlemap.do", "window", "width=600, height=700");
	      

	  });
   
   //시간 input태그
   $('.clockpicker').clockpicker(); 
   
});
</script>
</head>
<body>
   
  <%@ include file="../include/menu.jsp"%>

   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" name="formchatUpdate"
         style="width: 600px;" method="post">

         <fieldset>
            <legend style="float: left;">모임 글 수정</legend>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label"
                  style="float: left; width: 100px; margin-right: 20px">제목</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
               	  <input type="hidden" id=board_num name="board_num" value="${dto.board_num}">
                  <input class="form-control" id="title" name="title"
                     type="text" value="${dto.title}">
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingDate"
                  style="float: left; width: 100px; margin-right: 20px;">만날날짜</label>
               <div style="width: 200px; float: left; margin-right: 2px;">
                  <input class="form-control" id="tour_date" name="tour_date" type="date" max="2017-12-31"  value="${dto.tour_date}">
               </div>
               
               <label class="control-label" for="inputMeetingTime"
                  style="float: left; width: 100px; margin-right: 20px;">만날시간</label>
               <div class="input-group clockpicker" data-placement="right"
                  data-autoclose="true" style="width: 180px; float: left;">
                  <input type="text" class="form-control " id="tour_time" value="${dto.tour_time}"
                     name="tour_time" readonly> <span
                     class="input-group-addon"> <span
                     class="glyphicon glyphicon-time"></span>
                  </span>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">상세주소</label>
               <div style="width: 400px; float: left; margin-right: 20px;">
                  <input class="form-control" id="location" name="location"
                     type="text"  value="${dto.location}">
               </div>
               <button class="btn btn-primary" type="button" id="btnMap"
                  style="padding: 12px 26px; margin-bottom: -5px; margin-left: -30px;">지도</button>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">장소명</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="place_name" name="place_name"
                     type="text"  value="${dto.place_name}">
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputCost"
                  style="float: left; width: 100px; margin-right: 20px">비용</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="cost" name="cost" type="text" value="${dto.cost}">
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputContent"
                  style="float: left; width: 100px; margin-right: 20px">본문</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <textarea class="form-control" id="contents" name="contents"
                     rows="4">${dto.contents}</textarea>
               </div>
            </div>


            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" 
                  style="float: left; width: 100px; margin-right: 20px">작성자</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="writer" name="writer"
                     type="text"  value="${dto.member_name}" readonly>
               </div>
            </div>
            
             <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputWriteDate" 
                  style="float: left; width: 100px; margin-right: 20px">작성날짜</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="board_datetime" name="board_datetime"
                     type="text"  value="${dto.board_datetime}" readonly>
               </div>
            </div>


            <div class="form-group">
               <div class="col-lg-10 col-lg-offset-2">
                  <button class="btn btn-default" type="reset">취소</button>
                  <button class="btn btn-primary" type="button" id="btnWriteUpdate">수정완료</button>
               </div>
            </div>

         </fieldset>
      </form>
	
      <%-- <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2> --%>

   </div>

</body>
</html>