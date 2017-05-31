<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.uid == null }">
	<script>
		alert("로그인 하신후 사용하세요.");
		location.href="${path}/member/login.do";
	</script>
</c:if>