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
         location.href = "${path}/board/chatting.do?board_num=${dto.board_num}";
      });


   });
</script>

</head>
<body>
   <%@ include file="../include/menu.jsp"%>

   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" style="width: 600px;" method="post"
         name="chattingForm">
         <fieldset>
            <legend style="float: left;">상세보기</legend>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label"
                  style="float: left; width: 100px; margin-right: 20px">제목</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input type="hidden" id=bonumber name="bonumber"
                     value="${dto.board_num}"> <input class="form-control"
                     id="botitle" name="botitle" type="text" value="${dto.title}"
                     readonly>
               </div>
            </div>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingDate"
                  style="float: left; width: 100px; margin-right: 20px;">만날날짜</label>
               <div style="width: 190px; float: left; margin-right: 2px;">
                  <input class="form-control" id="bomeetdate" name="bomeetdate"
                     type="text" value="${dto.tour_date}" readonly>
               </div>
               <label class="control-label" for="inputMeetingTime"
                  style="float: left; width: 100px; margin-right: 20px;">만날시간</label>
               <div style="width: 190px; float: left;">
                  <input class="form-control" id="bomeettime" name="bomeettime"
                     type="text" value="${dto.tour_time}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">상세주소</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="boaddress" name="boaddress"
                     type="text" value="${dto.location}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px;">
               <label class="control-label" for="inputMeetingPlace"
                  style="float: left; width: 100px; margin-right: 20px">장소명</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="boplace" name="boplace"
                     type="text" value="${dto.place_name}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputCost"
                  style="float: left; width: 100px; margin-right: 20px">비용</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="bocost" name="bocost" type="text"
                     value="${dto.cost}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputContent"
                  style="width: 100px; float: left; margin-right: 20px;">본문</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <textarea class="form-control" id="bocontent" name="bocontent"
                     rows="4" readonly>${dto.contents}</textarea>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputWriter"
                  style="width: 100px; float: left; margin-right: 20px;">작성자</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="bouname" name="bouname"
                     type="text" value="${dto.member_id}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputWriteDate"
                  style="width: 100px; float: left; margin-right: 20px;">작성날짜</label>
               <div style="width: 500px; float: left; margin-right: 20px;">
                  <input class="form-control" id="boregdate" name="boregdate"
                     type="text" value="${dto.board_datetime}" readonly>
               </div>
            </div>

            <c:if test="${sessionScope.member_name == dto.member_id}">
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

            <c:if test="${sessionScope.member_name != dto.member_id}">
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