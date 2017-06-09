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
         location.href = "${path}/board/updateBoard.do?bonumber=${dto.bonumber}";

      });

      //삭제 버튼
      $("#btnWriteDelete").click(function() {
         if (confirm("삭제하시겠습니까?")) {
            document.chattingForm.action = "${path}/board/deletchat.do";
            document.chattingForm.submit();
         }
      });


   });
</script>

</head>
<body>
   <%@ include file="../include/menu.jsp"%>

   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" style="width: 40%; text-align: center;"
         name="chattingForm" >

         <fieldset>
            <legend>상세보기</legend>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputTitle">제목</label>
               <div class="col-lg-10">
                  <input type="hidden" id=bonumber name="bonumber"
                     value="${dto.bonumber}"> <input class="form-control"
                     id="botitle" name="botitle" type="text" value="${dto.botitle}"
                     readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingDate"
                  style="font-size: 13px;">만날날짜</label>
               <div class="col-lg-10">
                  <input class="form-control" id="bomeetdate" name="bomeetdate"
                     type="text" value="${dto.bomeetdate}" readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingTime"
                  style="font-size: 13px;">만날시간</label>
               <div class="col-lg-10">
                  <input class="form-control" id="bomeettime" name="bomeettime"
                     type="text" value="${dto.bomeettime}" readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingPlace"
                  style="font-size: 13px;">장소명</label>
               <div class="col-lg-10">
                  <input class="form-control" id="boplace" name="boplace"
                     type="text" value="${dto.boplace}" readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputMeetingPlace"
                  style="font-size: 13px;">상세주소</label>
               <div class="col-lg-10">
                  <input class="form-control" id="boaddress" name="boaddress"
                     type="text" value="${dto.boaddress}" readonly>
               </div>
            </div>


            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputCost">비용</label>
               <div class="col-lg-10">
                  <input class="form-control" id="bocost" name="bocost" type="text"
                     value="${dto.bocost}" readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputContent">본문</label>
               <div class="col-lg-10">
                  <textarea class="form-control" id="bocontent" name="bocontent"
                     rows="3" readonly>${dto.bocontent}</textarea>
               </div>
            </div>


            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputWriter">작성자</label>
               <div class="col-lg-10">
                  <input class="form-control" id="bouname" name="bouname"
                     type="text" value="${dto.bouname}" readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputWriteDate"
                  style="font-size: 13px;">작성날짜</label>
               <div class="col-lg-10">
                  <input class="form-control" id="boregdate" name="boregdate"
                     type="text" value="${dto.boregdate}" readonly>
               </div>
            </div>

            <c:if test="${sessionScope.uname == dto.bouname}">
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