<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@   page import="java.io.*, java.util.Date, java.util.Enumeration" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 성별 박스 style효과 -->
<style type="text/css">
.my_button {
   background-color: #1f7870;
   color: white;
   padding: 7px 32px;
   width: 240px;
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>

<script type="text/javascript">

/* 성별 */
function selGender(x) {
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
      input.value = '남';
   //   m.innerHTML = selGender.mtoggle + " " + selGender.ftoggle;

      if (selGender.ftoggle == false) {
         selGender.ftoggle = f.classList.toggle('button1');
      }

   } else if (x.id == 'female') {
      selGender.ftoggle = x.classList.toggle('button1');
      input.value = '여';
   //   f.innerHTML = selGender.mtoggle + " " + selGender.ftoggle;

      if (selGender.mtoggle == false) {
         selGender.mtoggle = m.classList.toggle('button1');
      }
   }
   
}


//비밀번호 실시간 유효성 검사 : 비밀번호를 입력하면서 실시간으로 유효 한지 안한지확인
$(function(){
   $("#pw").keyup(function(){
      var pw= $("#pw").val();
        var pwcon = /^[a-z0-9]{6,20}$/;
        
        if(pwcon.test(pw) == false){
           document.getElementById('errorUpw').innerHTML='* 비밀번호가 유효하지 않습니다.';
           $("#pw").focus();
           return;
         }else{
           document.getElementById('errorUpw').innerHTML='';
        }
   });
});

//비밀번호 확인 실시간으로 검사 : 비밀번호와  실시간으로 일치한지 확인
$(function(){
    $("#repw").keyup(function(){
         
       var pwcon = $("#pw").val();
        var repwcon = $("#repw").val();
         
        if(pwcon != repwcon){
            document.getElementById('errorReUpw').innerHTML='* 비밀번호가 일치 하지 않습니다.';
            $("#repw").focus();
           return; 
        }else{
           document.getElementById('errorReUpw').innerHTML='';
        }
    });
});

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

   $(document).ready(function() {
      //확인 버튼 누를시
      $("#btnSubmit").click(function() {
         
         //아이디 중복검사를 했는지 안했는지 확인
         if($("#isCheckedId").val() == "N"){
            alert("ID 중복검사를 먼저 해주세요.");
            $("#uid").focus();
            return;
         }
         
         //이름(닉네임)중복 검사를 했는지 안했는지 확인
         if($("#isCheckedName").val() == "N"){
            alert("이름(닉네임)중복검사를 먼저 해주세요.");
            $("#member_name").focus();
            return;
         }
         
         //성별 선택을 안했을시
         var gender = $("#gender").val();
        
         if(gender == ''){
            alert('성별을 꼭 선택해주세요');
            //document.getElementById('errorUgender').innerHTML='* 성별을 선택하세요.';
            $("#gender").focus();
            return;
         }
         
         //생년월일 검사
         var uyear = $("#uyear").val();
         var umonth = $("#umonth").val();
         var uday = $("#uday").val();
         var birth =  document.getElementById('birth');
         
         for(var a=0; a<errorArray.length; a++){
            if(errorArray[a] != ''){
               break;
           }
         }
         
         if(uyear == '' || umonth == '' || uday == '' || a < errorArray.length){
            
            alert('생년월일을 꼭 선택해주세요');
               $("#uyear").focus();
               return;
         }
         $('#birth').val(uyear+'-'+umonth+'-'+uday);
        
        //비밀번호 확인
         var pw = $("#pw").val();
         var repw = $("#repw").val();
         
         if(pw == '' || repw == '' 
               || document.getElementById('errorUpw').innerHTML != ''
               || document.getElementById('errorReUpw').innerHTML != '' ){
               
            alert('비밀번호를 정확하게 입력하시오.');
            $('#pw').focus();
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
         if(reuid.test(uid) != true){
            //alert('아이디를 다시 작성해주세요');
            document.getElementById('errorUid').innerHTML='* 아이디를 다시 작성해 주세요.';
            $("#uid").focus();
            return;
         }else{//유효성 검사에서 통과하면 아이디 중복 체크
            var url = "${path}/member/selectId.do";
            $.post(url, {member_id : uid}, function(json){
               console.log(json);
               alert(json.msg);
               document.getElementById('errorUid').innerHTML='';
               //ID를 사용할수 있으면 isCheckedId : Y -> 확인버튼 누를시 중복확인 했으면 회원가입가능하고, 아니면 불가능하게 하려고 사용
               if(json.code == 99){
                  $("#isCheckedId").val("Y");
               }
            });
         }
      });
      
      //이름(닉네임) 중복 확인
      $("#btnConfirmName").click(function(){
         var member_name =$("#member_name").val();
         var blank_pattern = /^\s+|\s+$/g;
         var blank_pattern2 = /[\s]/g;
         var han = /[ㄱ-ㅎ가-힣]/g;
         
         //공백 처리
         if(member_name == "" || member_name == " " || member_name==null || (blank_pattern.test(member_name) == true) || (blank_pattern.test(member_name) == true) || (han.test(member_name) != true) ){
            //alert('이름(닉네임)을 다시 작성해주세요.');
            document.getElementById('errorUname').innerHTML='* 이름(닉네임)을 다시 작성하세요.';
            $("#member_name").focus();
            return;
            
         }else{//이름 내역 성공시
            var url="${path}/member/selectName.do";
            $.post(url, {member_name:member_name}, function(json){
               console.log(json);
               alert(json.msg);
               document.getElementById('errorUname').innerHTML='';
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
   <%@ include file="../include/sessionSuccess.jsp"%>
   
     <div align="center">
      <form class="form-horizontal" style="width: 600px;" name="formwrite" method="post">
         <fieldset>
            <legend style="text-align: center;">회원가입</legend>
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputID" style="float: left; width: 100px; margin-right: 20px">아이디</label>
               <div style="width: 370px; float: left; margin-right: -10px;">
                  <input class="form-control" id="uid" name="member_id" type="text"
                     placeholder="* 소문자나 숫자로 6자리~20자리 사이"> <input
                     type="hidden" name="isCheckedId" id="isCheckedId" value="N">
               </div>
               <button class="btn btn-primary" type="button" id="btnConfirmId" style="padding: 12px 10px">중복 확인</button>   
               <p id="errorUid" style="color: red; float:left; margin: -1px 120px -2px;"></p>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputPassword" style="float: left; width: 100px; margin-right: 20px;">비밀번호</label>
               <div style="width: 485px; float: left;">
                  <input class="form-control" id="pw" name="member_pw" type="password"
                     placeholder="* 소문자나 숫자로 6자리~20자리 사이">
               </div>
               <p id="errorUpw" style="color: red; float:left; margin: 15px 120px -15px;"></p>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputPassword" style="float: left; width: 100px; margin: -15px 0px; margin-right: 20px;">비밀번호 <br/>확인</label>
               <div style="width: 485px; float: left;">
                  <input class="form-control" id="repw" name="repw" type="password"
                     placeholder="* 비밀번호를  재입력 해주세요">
               </div>
               <p id="errorReUpw" style="color: red; float:left; margin: 15px 120px -15px;"></p>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputName" style="float: left; width: 100px; margin-right: 20px">이름</label>
               <div style="width: 370px; float: left; margin-right: -10px;">
                  <input class="form-control" id="member_name" name="member_name" type="text"
                     placeholder="*이름 or 닉네임을 15자 이내로 입력해주세요"> <input
                     type="hidden" name="isCheckedName" id="isCheckedName" value="N" />
               </div>
               <button class="btn btn-primary" type="button" id="btnConfirmName"
                 style="padding: 12px 10px">중복 확인</button>
               <p id="errorUname" style="color: red; float:left; margin: 1px 120px -3px;"></p>
            </div>

            <div class="form-group">
               <label class="control-label" style="float: left; width: 100px; margin-right: 20px">성별</label> 
               <input type="hidden" id="gender" name="gender" value="">
               <div style="float: left;">
               <div class="my_button button1" id="male" onclick="selGender(this)">남     성</div>
               <div class="my_button button1" id="female" onclick="selGender(this)">여     성</div>
               </div>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputBirth" style="float: left; width: 100px; margin-right: 20px">생년월일</label>
               <input type="hidden" id="birth" name="birth" value="">
                <div style="float: left; width: 165px; padding-right: 10px;">
                  <input class="form-control" type="number" id="uyear" name="uyear"
                     onchange="checkBirth(this)" placeholder="년도">
               </div>
               <div style="float: left; width: 165px; padding-right: 10px;">
                  <input class="form-control" type="number" id="umonth" name="umonth"
                     onchange="checkBirth(this)" placeholder="월">
               </div>
               <div style="float: left; width: 165px; padding-right: 10px;">
                  <input class="form-control" type="number" id="uday" name="uday"
                     onchange="checkBirth(this)" placeholder="일">
               </div>
               <p id="errorUbirth" style="color: red; float:left; margin: 10px 120px -5px;"></p>
            </div>
            
            <div class="form-group">
               <div>
                  <button class="btn btn-default" type="reset">Cancel</button>
                  <button class="btn btn-primary" type="button" id="btnSubmit" >Submit</button>
               </div>
            </div>
         </fieldset>
         
      </form>
   </div>
</body>
</html>