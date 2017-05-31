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
	<h2>회원목록</h2>
	<input type="button" value="회원등록" onclick="location.href='${path}/member/write.do'">
	<table border="1" width="700px">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>생년월일</th>
		</tr>

		<c:forEach var="row" items="${list}">
			<tr>
				<th>${row.usernumber}</th>
				<th><a href="${path}/member/view.do?userid=${row.userid}">${row.userid}</a></th>
				<th>${row.userpw}</th>
				<th>${row.username}</th>
				<th>${row.userbirthyear}/${row.userbirthmonth}/${row.userbirthday}</th>
			</tr>
		</c:forEach>
	</table>



</body>
</html>