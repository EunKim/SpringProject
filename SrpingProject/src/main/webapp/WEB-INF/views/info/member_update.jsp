<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.my_button {
   background-color: #1f7870;
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
<title>WITH BEA</title>
<%@ include file="../include/header.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<script type="text/javascript">

//생년월일 유효성 검사
var errorArray = ['','',''];      

function checkBirth(x){
   
   if(x.id == 'uyear'){

      var conYear = /^[0-9]{4}$/;
      
      if(conYear.test(x.value) == true && parseInt(x.value) >= 1930) {
         errorArray[0] = '';
      } else {
         errorArray[0] = '* 생년을 4자리 형식으로 입력하십시오.';
      }
      
   } else if(x.id == 'umonth'){
      
      var conMonth = /^[0-9]{1,2}$/;
      
      if(conMonth.test(x.value) == true && (x.value) <= 12 && (x.value) > 0) {
         errorArray[1] = '';
      } else {
         errorArray[1] = '* 1~12월 사이의 값을 입력하십시오.';
      }
      
   } else if(x.id == 'uday'){
      var conDay = /^[0-9]{1,2}$/;
      
      if(conDay.test(x.value) == true && (x.value) <= 31 && (x.value) > 0){
         errorArray[2] = '';
      }else {
         errorArray[2] = '* 1~31 사이의 값을 입력하십시오.';
        }
   }
   
   //월, 일 0d 패턴
   if((x.value) < 10){
      if((x.value).length == 1){
         x.value = 0 + x.value; 
      }   
   }
   
   
   for(var i=0; i<errorArray.length; i++) {
      if(errorArray[i] != ''){
         document.getElementById('errorUbirth').innerHTML = errorArray[i];
         return ;
      }
      
      document.getElementById('errorUbirth').innerHTML = '';
   }
}


//성별 토글 플래그
var mtoggle = true;
var ftoggle = true;

$(document).ready(function(){
   

      //생일 정보를 가져와서 출력   -기준으로 분리해서 
      var string = $("#birth").val();
      var strArray = string.split('-');

      $("#uyear").val(strArray[0]);
      $("#umonth").val(strArray[1]); 
      $("#uday").val(strArray[2]); 

      //성별출력
      gender = $("#gender").val();
     
      if(gender == 'male'){
       $("#male").toggleClass("button1", mtoggle = !mtoggle);

      }else if(gender == 'female'){
         $("#female").toggleClass("button1", ftoggle= !ftoggle);
      }
   
         
   //수정 버튼
   $("#btnUpdateEnd").click(function(){
      
      var birth;
       //생일 정보 수정
      birth = $("#uyear").val() + '-'
            + $("#umonth").val()  + '-'
            + $("#uday").val(); 
       
         $('#birth').val(birth);
      
      
      if(confirm("수정하시겠습니까?")){
         document.formUpdate.action="${path}/member/updateuser.do";
         document.formUpdate.submit();
      } 
      
   });
   
   $("#btnpwd").click(function(){
      var pwdwindow;
      pwdwindow = window.open("${path}/member/updatepwd.do", "window", "width=450, height=500");
      //pwdwindow.document.getElementById("PwdInput").value = ${dto.member_pw};

   });
   
   //성별 수정
   $("#male").click(function(){
      
      if (ftoggle == false) {
              $("#female").toggleClass('button1', ftoggle = !ftoggle);   
        }
        
      $("#male").toggleClass('button1', mtoggle = !mtoggle);
      $("#gender").val('남'); 
   });
   
   $("#female").click(function(){
      if (mtoggle == false) {
         $("#male").toggleClass('button1', mtoggle = !mtoggle);
       }
      
       $("#female").toggleClass('button1', ftoggle = !ftoggle);
       $("#gender").val('여');
   });
   
   
   //이름(닉네임) 중복 확인
   $("#btnName").click(function(){
      
      var nameWindow;
      nameWindow = window.open("${path}/member/updateName.do", "window", "width=400, height=250")      
   });  
      
});
</script>
</head>
<body>

   <%@ include file="../include/menu.jsp"%>

   <div align="center">
      <form class="form-horizontal" style="width: 600px;" name="formUpdate"
         method="post">
         <fieldset>
            <legend style="text-align: center;">회원정보 수정</legend>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputID"
                  style="float: left; width: 100px; margin-right: 20px">아이디</label>
               <div style="width: 395px; float: left; margin-right: -10px;">
                  <input class="form-control" id="member_id" name="member_id"
                     type="text" value="${dto.member_id}" readonly>
               </div>
            </div>

            <div class="form-group" style="margin-bottom: -3px">
               <label class="control-label" for="inputPassword"
                  style="float: left; width: 100px; margin-right: 20px;">비밀번호</label>
               <div style="width: 395px; float: left; margin-right: -7px;">
                  <input class="form-control" id="member_pw" name="member_pw"
                     type="password" value="${dto.member_pw}" readonly>
               </div>
               <button class="btn btn-primary" type="button" id="btnpwd"
                  style="padding: 12px 10px">수정하기</button>
            </div>

            <div class="form-group" style="margin-bottom: -3px">
               <label class="control-label" for="inputName"
                  style="float: left; width: 100px; margin-right: 20px">이름</label>
               <div style="width: 395px; float: left; margin-right: -10px;">
                  <input class="form-control" id="member_name" name="member_name"
                     type="text" value="${dto.member_name}" readonly>
               </div>
               <button class="btn btn-primary" type="button" id="btnName"
                  style="padding: 12px 10px">수정하기</button>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputPassword"
                  style="float: left; width: 100px; padding-left: 5px; margin-right: -9px;">성별</label>
               <input type="hidden" id="gender" name="gender"
                  value="${dto.gender}">
               <div style="width: 100%; height: 10px;">
                  <div class="my_button button1" id="male">남 성</div>
                  <div class="my_button button1" id="female">여 성</div>
               </div>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputBirth"
                  style="float: left; width: 100px; margin-right: 20px">생년월일</label>
               <input type="hidden" id="birth" name="birth" value="${dto.birth}"
                  readonly>
               <div style="float: left; width: 170px; padding-right: 10px;">
                  <input class="form-control" type="number" id="uyear" name="uyear"
                     onchange="checkBirth(this)" placeholder="년도">
               </div>
               <div style="float: left; width: 170px; padding-right: 10px;">
                  <input class="form-control" type="number" id="umonth"
                     name="umonth" onchange="checkBirth(this)" placeholder="월">
               </div>
               <div style="float: left; width: 170px; padding-right: 10px;">
                  <input class="form-control" type="number" id="uday" name="uday"
                     onchange="checkBirth(this)" placeholder="일">
               </div>
               <p id="errorUbirth"
                  style="color: red; float: left; margin: 10px 120px -5px;"></p>
            </div>

            <div class="form-group">
               <div>
                  <button class="btn btn-primary" type="button" id="btnUpdateEnd">수정완료</button>
               </div>
            </div>
         </fieldset>

      </form>
   </div>

</body>
</html>