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
      input = document.getElementById('ugender');

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

$(document).ready(function(){
   
   var pwdwindow;
   //수정 버튼
   $("#btnUpdateEnd").click(function(){
      if(confirm("수정하시겠습까?")){
         document.formUpdate.action="${path}/member/updateuser.do";
         document.formUpdate.submit();
      } 
      
   });
   
   $("#btnpwd").click(function(){
      var pwdwindow;
      pwdwindow = window.open("${path}/member/updatepwd.do", "window", "width=450, height=500");
      //pwdwindow.document.getElementById("PwdInput").value = ${dto.upw};

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
            <legend style="text-align:left; font-size: 30px; font-style: bold;">수정창</legend>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputID">아이디</label>
               <div class="col-lg-10">
                  <input class="form-control" id="uid" name="uid" type="text"
                     value="${dto.uid}" readonly>
               </div>
            </div>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputPassword" style="font-size: 13px;">비밀번호</label>
               <div class="col-lg-8">
                  <input type="hidden" name="CheckedPwd" id="CheckedPwd" value="${dto.upw}" />
                  <input class="form-control" id="upw" name="upw" type="password" value="${dto.upw}">
               </div>
               <button class="btn btn-primary" type="button" id="btnpwd" style="margin-bottom: -5px; margin-left: -30px;">수정하기</button>
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
               <input type="hidden" id="ugender" name="ugender" value="">
               <input type="hidden" id="checkgender" name="checkgender" value="${dto.ugender}">
               <div class="my_button button1" id="male" onclick="selGender(this)"
                  readonly>남 성</div>
               <div class="my_button button1" id="female"
                  onclick="selGender(this)" readonly>여 성</div>
            </div>


            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputBirth">생일</label>
               <div class="col-lg-10">
                  <!-- <input class="form-control" name="uname" type="text" placeholder="이름 or 닉네임을 15자 이내로 입력."> -->
                  <div style="margin-top: 10px;">
                     <input type="date" id="ubirth" name="ubirth"
                        value="${dto.ubirth}" >
                  </div>
               </div>
            </div>


            <div class="form-group">
               <div class="col-lg-10 col-lg-offset-2" style="margin-top: 20px;">
                  <button class="btn btn-primary" type="button" id="btnUpdateEnd">수정완료</button>
               </div>
            </div>
         </fieldset>
      </form>
      <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2>

   </div>

</body>
</html>