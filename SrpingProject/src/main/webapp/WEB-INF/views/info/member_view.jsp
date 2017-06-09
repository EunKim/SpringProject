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
   genderValue = document.getElementById('ugender').value;
   
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
   
});
</script>
</head>
<body>
   
   <%@ include file="../include/menu.jsp"%>
   
   <div align="center" style="margin-top: 30px;">
      <form class="form-horizontal" style="width: 40%; text-align: center;"
         name="formUpdate">

         <fieldset>
            <legend style="text-align:left; font-size: 30px; font-style: bold;">INFO!</legend>

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputID">아이디</label>
               <div class="col-lg-10">
                  <input class="form-control" id="uid" name="uid" type="text"
                     value="${dto.uid}" readonly>
               </div>
            </div>

            <!-- <div class="form-group">
               <label class="col-lg-2 control-label" for="inputPassword" style="font-size: 13px;">비밀번호</label>
               <div class="col-lg-10">
                  <input class="form-control" id="upw" name="upw" type="password">
               </div>
            </div>  -->

            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputName">이름</label>
               <div class="col-lg-10">
                  <input class="form-control" id="uname" name="uname" type="text"
                     value="${dto.uname}" readonly>
               </div>
            </div>

            <%-- <div class="form-group">
               <label class="col-lg-2 control-label">성별</label>
               <!-- <div>
                  <input id="ugender" name="ugender" type="radio" value="여성">여성
                  <input id="ugender" name="ugender" type="radio" value="남성">남성
               </div> -->
               <div class="col-lg-10">
                  <input class="form-control" id="ugender" name="ugender"
                     type="text" value="${dto.ugender}" readonly>
               </div>
            </div> --%>
            
            <div class="form-group">
               <label class="col-lg-2 control-label">성별</label> 
               <input type="hidden" id="ugender" name="ugender" value="${dto.ugender}">
               <div class="my_button button1" id="male" onclick="selGender(this)" readonly>남     성</div>
               <div class="my_button button1" id="female" onclick="selGender(this)" readonly>여     성</div>
            </div>


            <div class="form-group">
               <label class="col-lg-2 control-label" for="inputBirth">생일</label>
               <div class="col-lg-10">
                  <!-- <input class="form-control" name="uname" type="text" placeholder="이름 or 닉네임을 15자 이내로 입력."> -->
                  <div style="margin-top: 10px;">
                     <input type="date" id="ubirth" name="ubirth"
                        value="${dto.ubirth}" readonly>
                  </div>
               </div>
            </div>


            <div class="form-group">
               <div class="col-lg-10 col-lg-offset-2" style="margin-top: 20px;">
                  <button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
                  <button class="btn btn-default" type="button" id="btnDelete">회원
                     탈퇴</button>
               </div>
            </div>
         </fieldset>
      </form>
      <h2 style="text-align: center; color: blue;">${messageUpdate}</h2>
      <h2 style="text-align: center; color: red;">${messageDelete}</h2>

   </div>

</body>
</html>