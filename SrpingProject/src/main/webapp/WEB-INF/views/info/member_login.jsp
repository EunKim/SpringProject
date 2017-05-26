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
	$("#btnLogin").click(function(){
		//태그.val() 태그에 입력된 값
		//태그.val("값") 태그의 값을 변경
		var uid=$("#uid").val();
		var upw=$("#upw").val();
		
		//아이디 6자리 미만일때 오류 체크
		if(uid.length < 6 ){
			//alert("아이디는 6자 이상 입력");
			document.getElementById('idco').innerHTML = "※아이디 6자리 이상 입력";
			$("#uid").focus();
			return;
		}
		
		//비밀번호 6자리 미만일때 아닐때 오류 체크
		if(upw.length < 6){
			//alert("비밀번호는 6자 이상 입력");
			document.getElementById('pwco').innerHTML = "※비밀번호 6자리 이상 입력";
			$("#upw").focus();
			return;
		}
		
		//6자리~20자리 사이의 소문자와 숫자만 인식 (공백,대문자,특수문자 인식x)
		var reid = /^[a-z0-9]{6,20}$/;
		if(reid.test(uid) == false){
			document.getElementById('idco').innerHTML = "※아이디는  소문자와 숫자만";
			$("#uid").focus();
			return;
		}
		
		//6자리~20자리 사이의 소문자와 숫자만 인식
		var repw =/^[a-z0-9]{6,20}$/;
		if(repw.test(upw) == false){
			document.getElementById('pwco').innerHTML = "※비밀번호  소문자와 숫자만";
			$("#upw").focus();
			return;
		}
		
		//폼 내부의 데이터를 전송할 주소
		document.form2.action="${path}/member/login_check.do";
		
		//제출
		document.form2.submit();	
	
	});
	
});

</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	
	
	
	  <div class="container" id="parent" style="text-align: center; width: 80%;" >
	
		  <div class="row vertical-center-row">
			<div class="col-md-4"></div>
				<div class="col-md-4" id="child" >
				<div class="login-form" style="background-color: #FFEAEA;">
					<h1 class="form-title">WELCOME BACK </h1>
					<h2 class="form-subtitle"> Sign In</h2>
					<!-- form start -->
					
					<form name="form2" method="post">
					
					  <div class="form-group">
						<label for="exampleInputEmail1"><!--Email address--></label>
						
						<div class="input-group">
						<span class="input-group-addon email-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						<input type="text" class="form-control email " id="uid" name="uid" placeholder="아이디 ">
						</div>
						
						<label style="margin-left: -8px; margin-top: 5px;">
						 <h5 style="color: #FF5A5A;" id="idco"> </h5>
						</label>
						
					  </div>
					  
					  <div class="form-group" style="margin-top: -35px;">
						<label for="exampleInputPassword1"><!--Password--></label>
						<div class="input-group">
						<span class="input-group-addon password-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="password" class="form-control password" id="upw" name="upw" placeholder="비밀번호 ">
						<span class="input-group-addon password-addon"><a href="#">FORGET</a></span>						
					  </div>
					  
					  <label style="margin-left: -8px; margin-top: 5px;">
						 <h5 style="color: #FF5A5A;" id="pwco"></h5>
						</label>
					  </div>
					  
					  
					  <button type="button" id="btnLogin" class="btn btn-primary" style="margin-top: -30px;">LOGIN</button>
					  
					</form>
					
					<!-- // form end -->
					
					<p class="new-ac-link"><a href="${path}/member/newlogin.do"> 새로 가입하기 </a></p>	
					
				</div>
				
			</div>
			
			<div class="col-md-4"></div>
			<%-- <c:if test="${message == 'logout'}">
				로그아웃되었습니다.
			</c:if>  --%>
		  </div>
		</div>
		
	
	

</body>
</html>