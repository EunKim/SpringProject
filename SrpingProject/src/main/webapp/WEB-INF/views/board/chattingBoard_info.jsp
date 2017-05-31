<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/board/writeform.do";
	});
});

</script>

<body>
	<%@ include file="../include/menu.jsp"%>

	

	<h2>글 목록</h2>
	<c:if test="${sessionScope.uid != null}">
		<button type="button" id="btnWrite">글쓰기</button>
	</c:if>
	<table width="700px" class="table table-striped table-hover ">
		<tr class="warning">
			<!-- <th>글 번호</th> -->
			<th>제 목</th>
			<th>만날 날짜</th>
			<th>만날 시간</th>
			<th>만날 장소</th>
			<th>비용</th>
			<!-- <th>내용</th> -->
			<th>작성자</th>
			<th>작성날짜</th>
			<th>조회수</th>
		</tr>

		<c:forEach var="row" items="${list}">
			<tr>
				<%-- <th>${row.bonumber}</th> --%>
				<th><a
					href="${path}/board/viewList.do?bonumber=${row.bonumber}">${row.botitle}</a></th>
				<th>${row.bomeetdate}</th>
				<th>${row.bomeettime}</th>
				<th>${row.boplace}</th>
				<th>${row.bocost}</th>
				<%-- <th>${row.bocontent}</th> --%>
				<th>${row.bouname}</th>
				<th>${row.boregdate}</th>
				<th>${row.bocount}</th>
			</tr>
		</c:forEach>
	</table>



</body>
</html>