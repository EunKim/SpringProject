<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>

	
	<h2>회원목록</h2>
	<table width="700px"  class="table table-striped table-hover ">
		<tr class="warning">
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
		</tr>

		<c:forEach var="row" items="${list}">
			<tr>
				<th>${row.unumber}</th>
				<th><a href="${path}/member/viewuser.do?uid=${row.uid}">${row.uid}</a></th>
				<th>${row.upw}</th>
				<th>${row.uname}</th>
				<th>${row.ugender}</th>
				<th>${row.ubirth}</th>
			</tr>
		</c:forEach>
	</table>



</body>
</html>