<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	//수정 버튼
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/member/update.do";
		document.form1.submit();
	});
	
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/member/delete.do";
			document.form1.submit();
		}
	});
	
});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<h2>회원정보</h2>

	<form method="post" name="form1">
		<table border="1" width="700px">
			<tr>
				<td>아이디</td>
				<td><input name="userid"  value="${dto.userid}" readonly></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw"></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input name="username" value="${dto.username}"></td>
			</tr>
			
			<tr>
				<td>생년/월/일</td>
				<td><input name="userbirthyear" value="${dto.userbirthyear}">/<input name="userbirthmonth" value="${dto.userbirthmonth}">/<input name="userbirthday" value="${dto.userbirthday}"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
				</td>
			</tr>
		
		</table>

	</form>

</body>
</html>