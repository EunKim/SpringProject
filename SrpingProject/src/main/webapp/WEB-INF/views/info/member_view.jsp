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

window.onload = function(){
   m = document.getElementById('male');
   f = document.getElementById('female');
   genderValue = document.getElementById('gender').value;
   
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
   //수정 버튼
   $("#btnUpdate").click(function(){
       //location.href="${path}/member/updateuserinfo.do";
      /* if(confirm("수정하시겠습까?")){
         document.formUpdate.action="${path}/member/updateuser.do";
         document.formUpdate.submit();
      } */
      
      document.formUpdate.action="${path}/member/updateuserinfo.do";
      document.formUpdate.submit();
   });
   
   //삭제 버튼
   $("#btnDelete").click(function(){
      if(confirm("탈퇴하시겠습니까?")){
         document.formUpdate.action="${path}/member/deleteuser.do";
         document.formUpdate.submit();
      }
   });
   
   //생일 정보를 가져와서 - 기준으로 분리해서 
   var string = $('#birth').val();
   var strArray = string.split('-');
   
   //각각의 해당되는곳에 값을 넣어 놓고
   document.getElementById('uyear').value = strArray[0];
   document.getElementById('umonth').value = strArray[1]; 
   document.getElementById('uday').value = strArray[2]; 
   
   //생일들은 수정 불가능하게
   document.getElementById('uyear').disabled = "true";
   document.getElementById('umonth').disabled = "true";
   document.getElementById('uday').disabled = "true";
   
   
});
</script>
</head>
<body>
   
   <%@ include file="../include/menu.jsp"%>
   
       <div align="center">
      <form class="form-horizontal" style="width: 600px;" name="formUpdate" method="post">
         <fieldset>
            <legend align="left">INFO!</legend>
            
            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputID" style="float: left; width: 100px; margin-right: 20px">아이디</label>
               <div style="width: 370px; float: left; margin-right: -10px;">
                  <input class="form-control" id="member_id" name="member_id" type="text" value="${dto.member_id}" readonly> 
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputPassword" style="float: left; width: 100px; margin-right: 20px;">비밀번호</label>
               <div style="width: 485px; float: left;">
                  <input class="form-control" id="member_pw" name="member_pw" type="password"  value="${dto.member_pw}" readonly >
               </div>
            </div>

            <div class="form-group" style="margin-bottom: 15px">
               <label class="control-label" for="inputName" style="float: left; width: 100px; margin-right: 20px">이름</label>
               <div style="width: 370px; float: left; margin-right: -10px;">
                   <input class="form-control" id="member_name" name="member_name" type="text" value="${dto.member_name}" readonly>
               </div>
            
            </div>

             <div class="form-group">
               <label  class="control-label" for="inputPassword" style="float: left; width: 100px; padding-left:5px; margin-right: -9px;">성별</label> 
               <input type="hidden" id="gender" name="gender" value="${dto.gender}">
               <div style="width: 100%; height: 10px;">
               <div class="my_button button1" id="male">남     성</div>
               <div class="my_button button1" id="female">여     성</div>
               </div>
            </div>

            <div class="form-group">
               <label class="control-label" for="inputBirth" style="float: left; width: 100px; margin-right: 20px">생년월일</label>
                <input type="hidden" id="birth" name="birth" value="${dto.birth}" readonly>
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
                  <button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
                  <button class="btn btn-default"  type="button" id="btnDelete" >회원탈퇴</button>
               </div>
            </div>
         </fieldset>
         
      </form>
   </div>

</body>
</html>