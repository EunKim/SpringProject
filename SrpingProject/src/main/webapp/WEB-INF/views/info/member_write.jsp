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
<%
	request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript">

	$(document).ready(function() {
		//수정 버튼
		$("#btnSubmit").click(function() {
			
			//폼별로 폼의 값을 불러옴.
			var uid=$("#uid").val();
			var upw=$("#upw").val();
			var repw = $("#repw").val();
			var uname = $("#uname").val();
			var ugender = $("#ugender").val();
			var ubirth = $("#ubirth").val();
			
			//아이디 유효성 검사(6~20자리 사이로 소문자,숫자만 인식)
			var reuid = /^[a-z0-9]{6,20}$/;
			if(reuid.test(uid) == false){
				alert('아이디를 다시 작성해주세요');
				$("#uid").focus();
				return;
			}
			
			//비밀번호 유효성 검사(6~20자리 사이로 소문자,숫자만 인식)
			var reupw = /^[a-z0-9]{6,20}$/;
			if(reupw.test(upw) == false){
				alert('비밀번호를 다시 작성해주세요');
				$("#upw").focus();
				return;
			}
			
			//비밀번호와 비밀번호확인이 일치하는지 검사
			 if(upw != repw){
				alert('비밀번호가 일치하지 않습니다.');
				$("#repw").focus();
				return;
			} 
			
			//이름이 공백인지에 대한 검사
			if(uname == null){
				alert('닉네임 혹은 이름을 꼭 작성해주세요');
				$("#uname").focus();
				return;
			}
			
			//오류 : 성별 공백 검사 -> 선택을 안했는데도 제출되어지는데, db에는 쿼리문 오류
			if(ugender == null){
				alert('성별을 꼭 선택해주세요');
				$("#ugender").focus();
				return;
			}
			
		
			//생일날짜 공백일때 검사
			if(ubirth == null){
				alert('생년월일을 꼭 선택해주세요');
				$("#ubirth").focus();
				return;
			}

			//폼 내부의 데이터를 전송할 주소
			document.formwrite.action="${path}/member/insertlist.do";
			
			//제출
			document.formwrite.submit();	
		});
	});
</script>
</head>
	<!-- 오늘 날짜 구하는것 -->
	<%
		Date today = new Date();
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		
		String yyyyMMddToday =  DATE_FORMAT.format(today);
	%>
<body>

	<%@ include file="../include/menu.jsp"%>


	<div align="center" style="margin-top: 30px;">
		<form class="form-horizontal" style="width: 40%; text-align: center"
			name="formwrite">

			<fieldset>
				<legend>회원가입</legend>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputID">아이디</label>
					<div class="col-lg-10">
						<input class="form-control" id="uid" name="uid" type="text"
							placeholder="* 소문자나 숫자로 6자리~20자리 사이">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword">비밀번호</label>
					<div class="col-lg-10">
						<input class="form-control" id="upw" name="upw" type="password"
							placeholder="* 소문자나 숫자로 6자리~20자리 사이">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword"
						style="font-size: 13px;">비밀번호 확인</label>
					<div class="col-lg-10">
						<input class="form-control" id="repw" name="repw" type="password"
							placeholder="* 비밀번호를  재입력 해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputName">이름</label>
					<div class="col-lg-10">
						<input class="form-control" id="uname" name="uname" type="text"
							placeholder="*이름 or 닉네임을 15자 이내로 입력해주세요">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label">*성별</label>
					<div>
						<input id="ugender" name="ugender" type="radio" value="여성">여성
						<input id="ugender" name="ugender" type="radio" value="남성">남성
					</div>
				</div>

			
				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputBirth">*생일</label>
					<div class="col-lg-10">
						<!-- <input class="form-control" name="uname" type="text" placeholder="이름 or 닉네임을 15자 이내로 입력."> -->
						<div>
							<input type="date" id="ubirth" name="ubirth" min="1990-01-01" max=<%=yyyyMMddToday%> value=<%=yyyyMMddToday%> >
						</div>
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

	</div>


</body>
</html>