<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@   page import="java.io.*, java.util.Date, java.util.Enumeration"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.0.custom.css" rel="stylesheet" type="text/css">
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sessionCheck.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
<script type="text/javascript">

Modernizr.load({
	test: Modernizr.inputtypes.date,
	nope: "${pageContext.request.contextPath}/resources/js/jquery-ui.custom.js",
	callback: function() {
	  $("input[type=date]").datepicker();
	}
  });


$(document).ready(function(){
   //폼작성 다한 후에 확인 버튼 누를 시
   $("#btnSubmit").click(function(){
      if(confirm("글을 작성 완료 하시겠습니까?")){

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
     

         document.formBoardwrite.action="${path}/board/writeList.do";
         document.formBoardwrite.submit();
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
      <form class="form-horizontal" name="formBoardwrite"
         style="width: 600px;" method="post">

         <fieldset>
            <legend style="float: left;">Write</legend>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label"
                  style="float: left; width: 100px; margin-right: 20px">제목</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="title" name="title"
                     type="text">
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingDate"
                  style="float: left; width: 100px; margin-right: 20px;">만날날짜</label>
               <div style="width: 200px; float: left; margin-right: 2px;">
                  <input class="form-control" id="tour_date" name="tour_date" type="date" max="2017-12-31">
               </div>
               
               <label class="control-label" for="inputMeetingTime"
                  style="float: left; width: 100px; margin-right: 20px;">만날시간</label>
               <div class="input-group clockpicker" data-placement="right"
                  data-autoclose="true" style="width: 180px; float: left;">
                  <input type="text" class="form-control " id="tour_time"
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
                     type="text">
               </div>
               <button class="btn btn-primary" type="button" id="btnMap"
                  style="padding: 12px 26px; margin-bottom: -5px; margin-left: -30px;">지도</button>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">장소명</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="place_name" name="place_name"
                     type="text">
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputCost"
                  style="float: left; width: 100px; margin-right: 20px">비용</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="cost" name="cost" type="text">
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputContent"
                  style="float: left; width: 100px; margin-right: 20px">본문</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <textarea class="form-control" id="contents" name="contents"
                     rows="4"></textarea>
               </div>
            </div>


            <div class="form-group" style="display: none">
               <label class="col-lg-2 control-label" for="inputWriter">작성자</label>
               <div class="col-lg-10">
                  <input class="form-control" id="member_id" name="member_id"
                     type="text" value="${sessionScope.member_id}">
               </div>
            </div>


            <div class="form-group">
               <div class="col-lg-10 col-lg-offset-2">
                  <button class="btn btn-default" type="reset">취소</button>
                  <button class="btn btn-primary" type="button" id="btnSubmit">확인</button>
               </div>
            </div>

         </fieldset>
      </form>

      <%-- <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2> --%>

   </div>

</body>
</html>