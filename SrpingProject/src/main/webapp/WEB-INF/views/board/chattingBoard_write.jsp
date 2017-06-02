<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@	page import="java.io.*, java.util.Date, java.util.Enumeration" %> 
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
	//폼작성 다한 후에 확인 버튼 누를 시
	$("#btnSubmit").click(function(){
		if(confirm("글을 작성 완료 하시겠습니까?")){
			document.formBoardwrite.action="${path}/board/writeList.do";
			document.formBoardwrite.submit();
		}
		
	});
	
	$("#btnMap").click(function(){
		var newwindow;
		newwindow = window.open("${path}/board/googlemap.do", "window", "width=600, height=700");
		

	});
	
	
});
</script>
</head>
	<%
		Date today = new Date();
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		
		String yyyyMMddToday =  DATE_FORMAT.format(today);
	%>
<body>
	
	<%@ include file="../include/menu.jsp"%>
	
	<div align="center" style="margin-top: 30px;">
		<form class="form-horizontal" style="width: 40%; text-align: center;" name="formBoardwrite">

			<fieldset>
				<legend>Write</legend>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputTitle">제목</label>
					<div class="col-lg-10">
						<input class="form-control" id="botitle" name="botitle" type="text">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputMeetingDate" style="font-size: 13px;">만날날짜</label>
					<div class="col-lg-10">
						<input class="form-control" id="bomeetdate" name="bomeetdate" type="date" min=<%=yyyyMMddToday%> max="2017-12-31">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputMeetingTime" style="font-size: 13px;">만날시간</label>
					<div class="col-lg-10">
						<input class="form-control" id="bomeettime" name="bomeettime" type="time"  >
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputMeetingTime" style="font-size: 13px;">장소명</label>
					<div class="col-lg-10">
						<input class="form-control" id="boplace" name="boplace" type="text"  >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputMeetingPlace" style="font-size: 13px;">상세주소</label>
					<div class="col-lg-8">	
						<input class="form-control" id="boaddress" name="boaddress" type="text">
					</div>
					<button class="btn btn-primary" type="button" id="btnMap" style="margin-bottom: -5px; margin-left: -30px;">지도</button>
				</div>


				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputCost">비용</label>
					<div class="col-lg-10">
						<input class="form-control" id="bocost" name="bocost" type="text">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputContent">본문</label>
					<div class="col-lg-10">
						 <textarea class="form-control" id="bocontent" name="bocontent"rows="3"></textarea>
					</div>
				</div>


				<div class="form-group" style="display: none">
					<label class="col-lg-2 control-label" for="inputWriter">작성자</label>
					<div class="col-lg-10">
						<input class="form-control" id="bouname" name="bouname" type="text"
							value="${sessionScope.uname}">
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