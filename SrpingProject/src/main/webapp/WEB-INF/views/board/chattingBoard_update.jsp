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
<script type="text/javascript">
$(document).ready(function(){
   //수정 버튼
   $("#btnWriteUpdate").click(function(){
      if(confirm("수정하시겠습니까?")){
         document.formchatUpdate.action="${path}/board/updateForm.do";
         document.formchatUpdate.submit();
      }
      
   });
   
   $("#btnMap").click(function(){
      var newwindow;
      newwindow = window.open("${path}/board/googlemap.do", "window", "width=600, height=700");
      

   });
   
});
</script>
</head>
<body>
   
   <%@ include file="../include/menu.jsp"%>
   
   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" style="width: 40%; text-align: center;" name="formchatUpdate" method="post">

         <fieldset>
            <legend>상세보기  </legend>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputTitle">제목</label>
               <div class="col-lg-10">
                  <input type="hidden" id=board_num name="board_num" value="${dto.board_num}">
                  <input class="form-control" id="title" name="title" type="text"
                     value="${dto.title}" >
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingDate" style="font-size: 13px;">만날날짜</label>
               <div class="col-lg-10">
                  <input class="form-control" id="tour_date" name="tour_date" type="text"
                     value="${dto.tour_date}" >
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingTime" style="font-size: 13px;">만날시간</label>
               <div class="col-lg-10">
                  <input class="form-control" id="tour_time" name="tour_time" type="text"
                     value="${dto.tour_time}" >
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingPlace" style="font-size: 13px;">장소명</label>
               <div class="col-lg-10">
                  <input class="form-control" id="place_name" name="place_name" type="text"
                     value="${dto.place_name}" >
               </div>
            </div>
            
            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingPlace" style="font-size: 13px;">상세주소</label>
               <div class="col-lg-8">
                  <input class="form-control" id="location" name="location" type="text" value="${dto.location}">
               </div>
               <button class="btn btn-primary" type="button" id="btnMap" style="margin-bottom: -5px; margin-left: -30px;">지도</button>
            </div>


            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputCost">비용</label>
               <div class="col-lg-10">
                  <input class="form-control" id="cost" name="cost" type="text"
                     value="${dto.cost}" >
               </div>
            </div>
            
            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputContent">본문</label>
               <div class="col-lg-10">
                   <textarea class="form-control" id="contents" name="contents"rows="3" >${dto.contents}</textarea>
               </div>
            </div>


            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputWriter">작성자</label>
               <div class="col-lg-10">
                  <input class="form-control" id="member_id" name="member_id" type="text"
                     value="${dto.member_name}" >
               </div>
            </div>
            
            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputWriteDate" style="font-size: 13px;">작성날짜</label>
               <div class="col-lg-10">
                  <input class="form-control" id="board_datetime" name="board_datetime" type="text"
                     value="${dto.board_datetime}" >
               </div>
            </div>
            
            <c:if test="${sessionScope.member_id == dto.member_id}">
            <div class="form-group">
               <div class="col-lg-10 col-lg-offset-2">
                  <button class="btn btn-primary" type="button" id="btnWriteUpdate">수정완료</button>
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