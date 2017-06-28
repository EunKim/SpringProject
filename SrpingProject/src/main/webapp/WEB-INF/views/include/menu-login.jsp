<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- jstl core tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <div id="loginshow" style="display: inline-block; text-align: center; width: 100%; height: 5%;  margin-left: 375px; margin-top: 30px;">
   <div href="${path}/member/viewuser.do?uid=${sessionScope.uid}" style="color: white; margin-right: 10px;"> </div> 
   <div href="${path}/member/logout.do"  style="color: white;">로그아웃</div>
</div> --%>



<header id="fh5co-header" role="banner">
   <nav class="navbar navbar-default" role="navigation">
   
   <div id="loginshow" style="display: inline-block; text-align: center; height: 5%;  margin-left:1200px; margin-top: 15px;">
   <div style="color: white; margin-right: 10px;"><p></p> </div> 
   <div style="color: white;"> </div>
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
                     class="navbar-brand" href="${path}">Clean</a>
                  </div>   
               <div id="fh5co-navbar" class="navbar-collapse collapse">
                  <ul class="nav navbar-nav navbar-right">
                     <li class="active" ><a href="${path}" style="color:#C63A44;"><span>Home
                              <span class="border"></span>
                        </span></a></li>
                      <li><a href="${path}/member/newlogin.do"><span>회원가입 <span class="border"></span></span></a></li>
                     <li id="loginconfirm"><a id="login"><span> 로그인
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
      <form class="form-horizontal" style="width: 350px; padding : 20px 5px 10px 0px;" name="login_form" method="post" >
         <fieldset>
            <legend style="color: #777777;"><span class="glyphicon glyphicon-lock"></span>LOGIN<span class="close"></span></legend>
            <div class="form-group">
               <div style="width: 290px; margin: 5px 0px -10px;">
                  <input class="form-control" id="member_id" name="member_id" type="text" placeholder="아이디">
               </div>
            </div>
            <div class="form-group">
               <div style="width: 290px;">
                  <input class="form-control" id="member_pw" name="member_pw" type="password" placeholder="비밀번호">
               </div>
            </div>
            <div id="login_fail" style="float:left; margin: -20px 30px 5px; color: red;" ><!-- spanner --></div>
            <div class="form-group">
               <div style="width: 290px; margin-top: 10px ">
                  <input type="submit" class="form-control" style="background-color: #269489; color: #ffffff;" id="loginbtn" value = "로 그 인">
               </div>
            </div>
            <div style="float: right; margin: -20px 30px 0px;" id="newlogin">회원가입</div><br/>
            <div style="float: right; margin: -20px 30px 5px" onclick="">아이디/비밀번호 분실</div>
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
var span = document.getElementsByClassName('close')[0];
var id = document.getElementById('member_id');
var pw = document.getElementById('member_pw');
var fail = document.getElementById('login_fail');

// When the user clicks the button, open the modal 
login.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
   modal.style.display = "none";
   id.value = '';
   pw.value = '';
   fail.innerHTML = '';
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
   if (event.target == modal) {
      modal.style.display = "none";
      id.value = '';
      pw.value = '';
      fail.innerHTML = '';
   }
}

$(document).ready(function() {

   // Launch MODAL BOX if the Login Link is clicked
  /*  $("#login").click(function() {
      modal.style.display = "block";
   });
    */
   $("#newlogin").click(function (){
     location.href="${path}/member/newlogin.do";
   });

   // When the form is submitted
   $("#loginbtn").click(function() {

      // 'this' refers to the current submitted form  
      //var str = $(this).serialize();
      
      var member_id = $("#member_id").val();
      var member_pw = $("#member_pw").val();
      
      $.ajax({
         type : "post",
         url: "${path}/member/login_check.do",  // Send the login info to this page
         data : "member_id="+member_id+"&member_pw="+member_pw,
         success : function(message) {
            if (message) // LOGIN OK?
             {
                alert('로그인에 성공 하셨습니다.');
                //location.reload(false);
                //localhost.href="mian.jsp"
                window.history.go(0);
             
             } else {
                
                document.getElementById('login_fail').innerHTML = '* 아이디 혹은 비밀번호가 틀렸습니다.'; 
                $("#member_id").focus();
             } 
         }
      });

      // -- End AJAX Call --
      return false;
   }); // end submit event
});

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
    background-color: #fefefe;
    margin: auto;
    padding-left: 8px;
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

#loginbtn:hover,
#loginbtn:focus{
  outline: none;
  box-shadow: none !important;
  border: 2px solid #1a645c;
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