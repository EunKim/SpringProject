<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WITH BEA</title>
<%@ include file="../include/header.jsp"%>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>

$(document).ready(function(){
   $('#btnNameUpdate').click(function(){
      
       var member_name =$("#member_name").val();
         var blank_pattern = /^\s+|\s+$/g;
         var blank_pattern2 = /[\s]/g;
         var han = /[ㄱ-ㅎ가-힣]/g;
         
         //공백 처리
         if(member_name == "" || member_name==null || (blank_pattern.test(member_name) == true) || (blank_pattern.test(member_name) == true)  || (han.test(member_name) != true ){
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
                  opener.document.getElementById('member_name').value = document.getElementById('member_name').value;
                  window.close();
               }
            });
         }
      
   });
});
</script>

<body>
      <div align="center" style="margin-top: 30px; margine: 0px">
      <form class="form-horizontal" style="" name="formName">
         <fieldset>
            <legend style="text-align:center; font-style: bold; padding-bottom: 10px;">이름 수정</legend>
            <div class="form-group" style="width: 350px; margin: 20px 0px 0px 0px">
               <label class="control-label" style="float: left; width: 100px; text-align: right; margin-left: -20px; margin-right: 15px;" for="inputName">변경할<br/>이름</label>
               <div >
                  <input class="form-control" style="float: left; width:200px;" id="member_name" name="member_name" type="text">
               </div>
            </div>  
            <button class="btn btn-primary" type="button" id="btnNameUpdate" style="margin: 15px 0px -5px 13px; margin-bottom: -5px; margin-left: 13px;" >수정하기</button>
         </fieldset>
      </form>
   </div>
</body>
</html>