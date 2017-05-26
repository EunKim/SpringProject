<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	<h2>회원등록</h2>

	<form method="post" action="${path}/member/insert.do">
		<table border="1" width="700px">
			<tr>
				<td>아이디</td>
				<td><input name="userid"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw"></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input name="username"></td>
			</tr>
			
			<tr>
				<td>생년/월/일</td>
				<td><input name="userbirthyear">/<input name="userbirthmonth">/<input name="userbirthday"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인"></td>
			</tr>
		
		</table>

	</form>

</body>
</html>