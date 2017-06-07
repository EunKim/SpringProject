<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>
var pwd;
window.onload = function(){
	document.getElementById('uid').value = opener.document.getElementById('uid').value;
	pwd = opener.document.getElementById('CheckedPwd').value;
}



$(document).ready(function(){
	$('#btnPwdUpdate').click(function(){
		
		var bupw=$("#bupw").val();
		var uid=$("#uid").val();
		var upw=$("#upw").val();
		var conupw=$("#conupw").val();
		
		if(bupw != pwd){
			alert("기존비밀번호가 일치하지 않습니다.");
			$("#bupw").focus();
			return;
		}
		
		if(upw.length < 6){
			alert("새비밀번호를 6자 이상 입력하세요");
			$("#upw").focus();
			return;
		}
		
		var repw =/^[a-z0-9]{6,20}$/;
		if(repw.test(upw) == false){
			alert("새비밀번호를 소문자 혹은 숫자만 입력해주세요.");
			$("#upw").focus();
			return;
		}
		
		if(upw != conupw){
	        alert("비밀번호를 다시 한번 확인하세요.")
	        $("#conupw").focus();
	       return; 
	    }
		
		$.ajax({
	         type : "post",
	         url: "${path}/member/update_pwd.do",  // Send the login info to this page
	         data : "uid="+uid+"&upw="+upw,
	         success : function(message) {
	        	 if (message) // LOGIN OK?
	             {
	                alert('비밀번호를 수정하였습니다.');
	                opener.document.getElementById('upw').value = document.getElementById('upw').value;
	               
	             } else {
	            	alert('비밀번호수정을 실패하였습니다.'); 
	               
	             }
	         }
	        	
		 	
	      });
		opener.document.getElementById('upw').value = document.getElementById('upw').value;
		window.close();
		
		//document.formPwd.action="${path}/member/update_pwd.do";
		
		//제출
		//document.formPwd.submit();
		
		
		
	});
});


		

</script>

<body>

	
		<div align="center" style="margin-top: 30px;">
		<form class="form-horizontal" style="width: 40%; text-align: center;" name="formPwd">

			<fieldset>
				<legend style="text-align:center; font-style: bold;">비밀번호 수정</legend>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputID">기존비밀번호</label>
					<div class="col-lg-5">
						<input type="hidden" name="uid" id="uid" />
						<input class="form-control" id="bupw" name="bupw" type="password">
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword">비밀번호</label>
					<div class="col-lg-5">
						<input class="form-control" id="upw" name="upw" type="password">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-2 control-label" for="inputPassword">비밀번호확인</label>
					<div class="col-lg-5">
						<input class="form-control" id="conupw" name="conupw" type="password">
					</div>
				</div>  

				<button class="btn btn-primary" type="button" id="btnPwdUpdate" style="margin-bottom: -5px; margin-left: 13px;" >수정하기</button>
			</fieldset>
		</form>

	</div>



</body>
</html>