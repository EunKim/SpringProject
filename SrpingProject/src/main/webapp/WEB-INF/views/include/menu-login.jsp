<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl core tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <div id="loginshow" style="display: inline-block; text-align: center; width: 100%; height: 5%;  margin-left: 375px; margin-top: 30px;">
	<div href="${path}/member/viewuser.do?uid=${sessionScope.uid}" style="color: white; margin-right: 10px;"> </div> 
	<div href="${path}/member/logout.do"  style="color: white;">로그아웃</div>
</div> --%>


<header id="fh5co-header" role="banner">
	<nav class="navbar navbar-default" role="navigation">
	<div id="loginshow" style="display: inline-block; text-align: center; width: 100%; height: 5%;  margin-left: 375px; margin-top: 10px;">
	<div href="${path}/member/viewuser.do?uid=${sessionScope.uid}" style="color: white; margin-right: 10px;"><p></p> </div> 
	<div href="${path}/member/logout.do"  style="color: white;"> </div>
	</div> 
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="navbar-header">
						<!-- Mobile Toggle Menu Button -->
						<a href="#"
							class="js-fh5co-nav-toggle fh5co-nav-toggle visible-xs-block"
							data-toggle="collapse" data-target="#fh5co-navbar"
							aria-expanded="false" aria-controls="navbar"><i></i></a> <a
							class="navbar-brand" href="http://localhost/first/">Clean</a>
						</div>	
					<div id="fh5co-navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="active"><a href="http://localhost/first/"><span>Home
										<span class="border"></span>
								</span></a></li>
							 <li><a href="${path}/member/newlogin.do"><span>회원가입 <span class="border"></span></span></a></li>
							<li id="loginconfirm"><a id="login"><span>로그인
										<span class="border"></span>
								</span></a></li>
							<li><a href="${path}/board/list.do"><span> 글 목록 <span class="border"></span></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>

 <nav class="navbar navbar-default"></nav>
 
 <!-- The Modal -->
<div id="myModal" class="modal">
   <div class="modal-content">
       <div align="center">
      <form class="form-horizontal"  style="width: 350px"  name="form2" method="post" >
         <fieldset>
            <legend style="padding-top: 10px; color: #777777">LOGIN<span class="close">&times;</span></legend>
            <div class="form-group">
               <div class="col-lg-10" >
                  <input class="form-control" id="uid" name="uid" type="text" style="margin-bottom: -10px; margin-left: 35px; float: none;" placeholder="아이디">
               </div>
            </div>
            <div class="form-group">
               <div class="col-lg-10" >
                  <input class="form-control" id="upw" name="upw" type="password" style="margin-left: 35px; float: none;" placeholder="비밀번호">
               </div>
            </div>
            <div class="form-group">
               <div class="col-lg-10" >
                  <input type="submit" class="form-control" style="margin-left: 35px; float: none; background-color: #f78181;" id="loginbtn" value = "로 그 인">
               </div>
            </div>
            <div class="col-lg-4" style="float: right; margin-top: -20px;" id="newlogin">회원가입</div></br>
            <div class="col-lg-7" style="float: right; margin-top: -20px; margin-bottom: 10px" onclick="">아이디/비밀번호 분실</div>
         </fieldset>
      </form>
      </div>
    </div>
</div>

<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var login = document.getElementById("login");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
login.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
 
$(document).ready(function(){
    	//새로 회원가입 할때
    	$("#newlogin").click(function(){
    		location.href="${path}/member/newlogin.do";	
    	});
    	
    	
    	//로그인 할때
    	$("#loginbtn").click(function(){
    		//태그.val() 태그에 입력된 값
    		//태그.val("값") 태그의 값을 변경
    		var uid=$("#uid").val();
    		var upw=$("#upw").val();
    		
    		//아이디 6자리 미만일때 오류 체크
    		if(uid.length < 6 ){
    			alert("※아이디 6자리 이상 입력 하세요");
    			$("#uid").focus();
    			return;
    		}
    		
    		//비밀번호 6자리 미만일때 아닐때 오류 체크
    		if(upw.length < 6){
    			alert("※비밀번호 6자리 이상 입력 하세요");
    			$("#upw").focus();
    			return;
    		}
    		
    		//6자리~20자리 사이의 소문자와 숫자만 인식 (공백,대문자,특수문자 인식x)
    		var reid = /^[a-z0-9]{6,20}$/;
    		if(reid.test(uid) == false){
    			alert("※아이디는  소문자와 숫자만 가능합니다.");
    			$("#uid").focus();
    			return;
    		}
    		
    		//6자리~20자리 사이의 소문자와 숫자만 인식
    		var repw =/^[a-z0-9]{6,20}$/;
    		if(repw.test(upw) == false){
    			alert("※비밀번호  소문자와 숫자만 가능합니다.");
    			$("#upw").focus();
    			return;
    		}
    		
    		//폼 내부의 데이터를 전송할 주소
    		document.form2.action="${path}/member/login_check.do";
    		
    		//제출
    		document.form2.submit();	
    	
    	});
    	
    
    });   
    
}
</script>

<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 140px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 370px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.3),0 6px 20px 0 rgba(0,0,0,0.22);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: Red;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

/* .modal-header {
    padding: 2px 16px;
    background-color: #666666;
    color: white;
} */

/* .modal-body {padding: 2px 16px;} */

/* .modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
} */
</style>