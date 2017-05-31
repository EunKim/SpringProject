<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">
$(document).ready(function(){
	//수정 버튼
	$("#btnUpdate").click(function(){
		if(confirm("수정하시겠습까?")){
			document.formUpdate.action="${path}/member/updateuser.do";
			document.formUpdate.submit();
		}
		
	});
	
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("탈퇴하시겠습니까?")){
			document.formUpdate.action="${path}/member/deleteuser.do";
			document.formUpdate.submit();
		}
	});
	
});
</script>
</head>
<body>
	
	<%@ include file="../include/menu.jsp"%>
	
	<div align="center" style="margin-top: 30px;">
		<form class="form-horizontal" style="width: 40%; text-align: center;"
			name="formUpdate">

			<fieldset>
				<legend style="text-align:left; font-size: 30px; font-style: bold;">INFO!</legend>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputID">아이디</label>
					<div class="col-lg-10">
						<input class="form-control" id="uid" name="uid" type="text"
							value="${dto.uid}" readonly>
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword" style="font-size: 13px;">비밀번호</label>
					<div class="col-lg-10">
						<input class="form-control" id="upw" name="upw" type="password">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputName">이름</label>
					<div class="col-lg-10">
						<input class="form-control" id="uname" name="uname" type="text"
							value="${dto.uname}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label">성별</label>
					<!-- <div>
						<input id="ugender" name="ugender" type="radio" value="여성">여성
						<input id="ugender" name="ugender" type="radio" value="남성">남성
					</div> -->
					<div class="col-lg-10">
						<input class="form-control" id="ugender" name="ugender"
							type="text" value="${dto.ugender}">
					</div>
				</div>


				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputBirth">생일</label>
					<div class="col-lg-10">
						<!-- <input class="form-control" name="uname" type="text" placeholder="이름 or 닉네임을 15자 이내로 입력."> -->
						<div style="margin-top: 10px;">
							<input type="date" id="ubirth" name="ubirth"
								value="${dto.ubirth}">
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2" style="margin-top: 20px;">
						<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
						<button class="btn btn-default" type="button" id="btnDelete">회원
							탈퇴</button>
					</div>
				</div>
			</fieldset>
		</form>
		<h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
		<h2 style="text-align: center; color: red;">${messageDelete}</h2>

	</div>

</body>
</html>