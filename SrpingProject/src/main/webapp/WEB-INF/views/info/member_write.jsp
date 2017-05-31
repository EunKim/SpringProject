<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@	page import="java.io.*, java.util.Date, java.util.Enumeration" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 성별 박스 style효과 -->
<style type="text/css">
.my_button {
   background-color: #f44336;
   color: white;
   padding: 7px 32px;
   width: 38%;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 2px;
}

.button1 {
   background-color: white;
   color: #777777;
   border: 2px solid #cccccc;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">

//성별 효과 함수
function f1(x) {
    m = document.getElementById('male');
    f = document.getElementById('female');
    input = document.getElementById('ugender');

    // 남자선택시 여자는 선택 x, 여자선택시 남자는 선택x
    if (typeof f1.mtoggle == 'undefined'
          && typeof f1.ftoggle == 'undefined') {
       f1.mtoggle = true;
       f1.ftoggle = true;
    }

    if (x.id == 'male') {
       f1.mtoggle = x.classList.toggle('button1');
       input.value = '남성';
    //   m.innerHTML = f1.mtoggle + " " + f1.ftoggle;

       if (f1.ftoggle == false) {
          f1.ftoggle = f.classList.toggle('button1');
       }

    } else if (x.id == 'female') {
       f1.ftoggle = x.classList.toggle('button1');
       input.value = '여성';
    //   f.innerHTML = f1.mtoggle + " " + f1.ftoggle;

       if (f1.mtoggle == false) {
          f1.mtoggle = m.classList.toggle('button1');
       }
    }
 }
 
	//비밀번호 실시간 유효성 검사 : 비밀번호를 입력하면서 실시간으로 유효 한지 안한지확인
	$(function(){
		$("#upw").keyup(function(){
			var upwcon = $("#upw").val();
			var reupw = /^[a-z0-9]{6,20}$/;
			if(reupw.test(upwcon) == false){
				//alert('비밀번호를 다시 작성해주세요');
				document.getElementById('errorUpw').innerHTML='* 비밀번호가 유효하지 않습니다.';
				$("#upw").focus();
				return;
			}else{
				document.getElementById('errorUpw').innerHTML=' ';
			}
		});
		
		//비밀번호 확인 실시간으로 검사 : 비밀번호와  실시간으로 일치한지 확인
		$("#repw").keyup(function(){
			
			var upwcon = $("#upw").val();
			var repwcon = $("#repw").val();
			
			if(upwcon != repwcon){
				document.getElementById('errorReUpw').innerHTML='* 비밀번호가 일치 하지 않습니다.';
				$("#repw").focus();
				return;
			}else{
				document.getElementById('errorReUpw').innerHTML=' ';
			}
		});
	});


	$(document).ready(function() {
		//확인 버튼 누를시
		$("#btnSubmit").click(function() {
			
			//폼별로 폼의 값을 불러옴.
			var ugender = $("#ugender").val();
			var ubirth = $("#ubirth").val();
			
			//아이디 중복검사를 했는지 안했는지 확인
			if($("#isCheckedId").val() == "N"){
				alert("ID 중복검사를 먼저 해주세요.");
				$("#uid").focus();
				return;
			}
			
			//이름(닉네임)중복 검사를 했는지 안했는지 확인
			if($("#isCheckedName").val() == "N"){
				alert("이름(닉네임)중복검사를 먼저 해주세요.");
				$("#uname").focus();
				return;
			}
			
			//성별 선택을 안했을시
			if(ugender == " "){
				alert('성별을 꼭 선택해주세요');
				//document.getElementById('errorUgender').innerHTML='* 성별을 선택하세요.';
				$("#ugender").focus();
				return;
			}
			

			//폼 내부의 데이터를 전송할 주소
			document.formwrite.action="${path}/member/insertlist.do";
			
			//제출
			document.formwrite.submit();	
		});
		
		//아이디 중복 확인
		$("#btnConfirmId").click(function(){
			
		
			var reuid = /^[a-z0-9]{6,20}$/;
			var uid = $("#uid").val();
			
			//아이디 유효성 검사(6~20자리 사이로 소문자,숫자만 인식)
			if(reuid.test(uid) == false){
				//alert('아이디를 다시 작성해주세요');
				document.getElementById('errorUid').innerHTML='* 아이디를 다시 작성해 주세요.';
				$("#uid").focus();
				return;
			}else{//유효성 검사에서 통과하면 아이디 중복 체크
				var url = "${path}/member/selectId.do";
				$.post(url, {uid : uid}, function(json){
					console.log(json);
					alert(json.msg);
					document.getElementById('errorUid').innerHTML='	';
					//ID를 사용할수 있으면 isCheckedId : Y -> 확인버튼 누를시 중복확인 했으면 회원가입가능하고, 아니면 불가능하게 하려고 사용
					if(json.code == 99){
						$("#isCheckedId").val("Y");
					}
				});
			}
		});
		
		//이름(닉네임) 중복 확인
		$("#btnConfirmName").click(function(){
			var uname =$("#uname").val();
			var blank_pattern = /^\s+|\s+$/g;
			var blank_pattern2 = /[\s]/g;
			
			//공백 처리
			if(uname == "" || uname == " " || uname==null || (blank_pattern.test(uname) == true) || (blank_pattern.test(uname) == true) ){
				//alert('이름(닉네임)을 다시 작성해주세요.');
				document.getElementById('errorUname').innerHTML='* 이름(닉네임)을 다시 작성하세요.';
				$("#uname").focus();
				return;
				
			}else{//이름 내역 성공시
				var url="${path}/member/selectName.do";
				$.post(url, {uname:uname}, function(json){
					
					console.log(json);
					alert(json.msg);
					document.getElementById('errorUname').innerHTML=' ';
					if(json.code == 99){
						$("#isCheckedName").val("Y");
					}
				});
			}
			
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
				<legend style="text-align:left; font-size: 30px; font-style: bold;">JOIN!</legend>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputID">아이디</label>
					<div class="col-lg-8">
						<input class="form-control" id="uid" name="uid" type="text"
							placeholder="* 소문자나 숫자로 6자리~20자리 사이">
						<input type="hidden" name="isCheckedId" id ="isCheckedId" value="N"/>
					</div>
					<button class="btn btn-primary" type="button" id="btnConfirmId" style="margin-bottom: -5px; margin-left: -30px;">중복 확인</button>
					<p id="errorUid" style="color: red; margin-top: 15px; margin-bottom: -20px; margin-left: -270px;" ></p>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword">비밀번호</label>
					<div class="col-lg-10">
						<input class="form-control" id="upw" name="upw" type="password"
							placeholder="* 소문자나 숫자로 6자리~20자리 사이">
					</div>
					<p id="errorUpw" style="color: red; margin-top: 20px; margin-bottom: -25px; margin-left: -260px;" ></p>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword"
						style="font-size: 13px;">비밀번호 확인</label>
					<div class="col-lg-10">
						<input class="form-control" id="repw" name="repw" type="password"
							placeholder="* 비밀번호를  재입력 해주세요">
					</div>
					<p id="errorReUpw" style="color: red; margin-top: 20px; margin-bottom: -25px; margin-left: -260px;" ></p>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputName">이름</label>
					<div class="col-lg-8">
						<input class="form-control" id="uname" name="uname" type="text"
							placeholder="*이름 or 닉네임을 15자 이내로 입력해주세요">
						<input type="hidden" name="isCheckedName" id ="isCheckedName" value="N"/>
					</div>
					<button class="btn btn-primary" type="button" id="btnConfirmName" style="margin-bottom: -5px; margin-left: -30px;">중복 확인</button>
					<p id="errorUname" style="color: red; margin-top: 15px; margin-bottom: -20px; margin-left: -250px;" ></p>
				</div>

				<!-- <div class="form-group">
					<label class="col-lg-2 control-label">*성별</label>
					<div>
						<input id="ugender" name="ugender" type="radio" value="여성">여성
						<input id="ugender" name="ugender" type="radio" value="남성">남성
					</div>
				</div> -->

			<div class="form-group">
               <label class="col-lg-2 control-label">* 성별</label>
               <input type="hidden" id ="ugender" name="ugender" value =" ">
               <div class="my_button button1" id="male" onclick="f1(this)">남          성</div>
               <div class="my_button button1" id="female" onclick="f1(this)">여          성</div>
               <p id="errorUgender" style="color: red; margin-top: 10px; margin-bottom: -20px; margin-left: -280px;" ></p>
            </div>
				
			
				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputBirth">* 생일</label>
					<div class="col-lg-10">
						<!-- <input class="form-control" name="uname" type="text" placeholder="이름 or 닉네임을 15자 이내로 입력."> -->
						<div style="margin-top: 10px;">
							<input type="date" id="ubirth" name="ubirth" min="1950-01-01" max=<%=yyyyMMddToday%> value=<%=yyyyMMddToday%> >
						</div>
					</div>
				</div>


				<div class="form-group" >
					<div class="col-lg-10 col-lg-offset-2" style="margin-top: 20px;">
						<button class="btn btn-default" type="reset">취소</button>
						<button class="btn btn-primary" type="button" id="btnSubmit">확인</button>
					</div>
				</div>
			</fieldset>
		</form>

	</div>


</body>
</html>