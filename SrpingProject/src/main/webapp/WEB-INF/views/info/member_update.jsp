<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<script type="text/javascript">

function selGender(x) {
      window.onload = null
      m = document.getElementById('male');
      f = document.getElementById('female');
      input = document.getElementById('gender');

      //mtoggle과 ftoggle 전역변수 선언
      if (typeof selGender.mtoggle == 'undefined'
            && typeof selGender.ftoggle == 'undefined') {
         selGender.mtoggle = true;
         selGender.ftoggle = true;
      }

      if (x.id == 'male') {
         selGender.mtoggle = x.classList.toggle('button1');
         input.value = 'male';
      //   m.innerHTML = selGender.mtoggle + " " + selGender.ftoggle;

         if (selGender.ftoggle == false) {
            selGender.ftoggle = f.classList.toggle('button1');
         }

      } else if (x.id == 'female') {
         selGender.ftoggle = x.classList.toggle('button1');
         input.value = 'female';
      //   f.innerHTML = selGender.mtoggle + " " + selGender.ftoggle;

         if (selGender.mtoggle == false) {
            selGender.mtoggle = m.classList.toggle('button1');
         }
      }
      
}


window.onload = function(){
   m = document.getElementById('male');
   f = document.getElementById('female');
   genderValue = document.getElementById('checkgender').value;
   
   if(genderValue == 'male'){
      m.style.background = '#f44336';
      m.style.color = '#ffffff';
      m.style.border = '#ffffff';
   }else if(genderValue == 'female'){
      f.style.background = '#f44336'
      f.style.color = '#ffffff';
      f.style.border = '#ffffff';
   }
}

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

$(document).ready(function(){
   
   var pwdwindow;
   //수정 버튼
   $("#btnUpdateEnd").click(function(){
	   
	 //이름(닉네임)중복 검사를 했는지 안했는지 확인
       if($("#isCheckedName").val() == "N"){
          alert("이름(닉네임)중복검사를 먼저 해주세요.");
          $("#member_name").focus();
          return;
       }
	   
	   
	   
      if(confirm("수정하시겠습까?")){
         document.formUpdate.action="${path}/member/updateuser.do";
         document.formUpdate.submit();
      } 
      
   });
   
   $("#btnpwd").click(function(){
      var pwdwindow;
      pwdwindow = window.open("${path}/member/updatepwd.do", "window", "width=450, height=500");
      //pwdwindow.document.getElementById("PwdInput").value = ${dto.member_pw};

   });
   
   
   //이름(닉네임) 중복 확인
   $("#btnConfirmName").click(function(){
      var member_name =$("#member_name").val();
      var blank_pattern = /^\s+|\s+$/g;
      var blank_pattern2 = /[\s]/g;
      
      //공백 처리
      if(member_name == "" || member_name == " " || member_name==null || (blank_pattern.test(member_name) == true) || (blank_pattern.test(member_name) == true) ){
         alert('이름(닉네임)을 다시 작성해주세요.');
         //document.getElementById('errorUname').innerHTML='* 이름(닉네임)을 다시 작성하세요.';
         $("#member_name").focus();
         return;
         
      }else{//이름 내역 성공시
         var url="${path}/member/selectName.do";
         $.post(url, {member_name:member_name}, function(json){
            console.log(json);
            alert(json.msg);
            //document.getElementById('errorUname').innerHTML='';
            if(json.code == 99){
            	//document.getElementById('isCheckedName').innerHTML = "Y";
               $("#isCheckedName").val("Y");
            }
         });
      }
      
   });
   
 //생일 정보를 가져와서 - 기준으로 분리해서 
   var string = $('#birth').val();
   var strArray = string.split('-');
   
   //각각의 해당되는곳에 값을 넣어 놓고
   document.getElementById('uyear').value = strArray[0];
   document.getElementById('umonth').value = strArray[1]; 
   document.getElementById('uday').value = strArray[2]; 
   
      
});
</script>
</head>
<body>
   
   <%@ include file="../include/menu.jsp"%>
   
   <div align="center">
      <form class="form-horizontal" style="width: 600px;" name="formUpdate" method="post">
         <fieldset>
            <legend align="left">수정창!</legend>
            
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputID" style="float: left; width: 100px; margin-right: 20px">아이디</label>
               <div style="width: 395px; float: left; margin-right: -10px;">
                  <input class="form-control" id="member_id" name="member_id" type="text" value="${dto.member_id}" readonly> 
               </div>
            </div>

            <div class="form-group" style="margin-bottom: -3px">
               <label class="control-label" for="inputPassword" style="float: left; width: 100px; margin-right: 20px;">비밀번호</label>
               <div style="width: 395px; float: left; margin-right: -7px;">
                  <input class="form-control" id="member_pw" name="member_pw" type="password"  value="${dto.member_pw}" readonly >
               </div>
               <button class="btn btn-primary" type="button" id="btnpwd" style="padding: 12px 10px">수정하기</button> 
            </div>

            <div class="form-group" style="margin-bottom: -3px">
               <label class="control-label" for="inputName" style="float: left; width: 100px; margin-right: 20px">이름</label>
               <div style="width: 395px; float: left; margin-right: -10px;">
                   <input class="form-control" id="member_name" name="member_name" type="text" value="${dto.member_name}">
                   <input type="hidden" name="isCheckedName" id="isCheckedName" value="N" />
               </div>
               <button class="btn btn-primary" type="button" id="btnConfirmName" style="padding: 12px 10px">중복확인</button> 
            </div>

             <div class="form-group">
               <label  class="control-label" for="inputPassword" style="float: left; width: 100px; padding-left:5px; margin-right: -9px;">성별</label> 
               <input type="hidden" id="gender" name="gender" value="${dto.gender}">
               <div style="width: 100%; height: 10px;">
               <div class="my_button button1" id="male" onclick="selGender(this)">남     성</div>
               <div class="my_button button1" id="female" onclick="selGender(this)" >여     성</div>
               </div>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputBirth" style="float: left; width: 100px; margin-right: 20px">생년월일</label>
                <input type="hidden" id="birth" name="birth" value="${dto.birth}" readonly>
                <div style="float: left; width: 170px; padding-right: 10px;">
                  <input class="form-control" type="number" id="uyear" name="uyear"
                     onchange="checkBirth(this)" placeholder="년도">
               </div>
               <div style="float: left; width: 170px; padding-right: 10px;">
                  <input class="form-control" type="number" id="umonth" name="umonth"
                     onchange="checkBirth(this)" placeholder="월">
               </div>
               <div style="float: left; width: 170px; padding-right: 10px;">
                  <input class="form-control" type="number" id="uday" name="uday"
                     onchange="checkBirth(this)" placeholder="일">
               </div>
               <p id="errorUbirth" style="color: red; float:left; margin: 10px 120px -5px;"></p>
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