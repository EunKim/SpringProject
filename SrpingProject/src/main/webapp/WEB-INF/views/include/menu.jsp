<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl core tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <div style="text-align:center;">
	<a href="${path}/member/list.do">회원관리</a>
	<a href="${path}/member/newlogin.do">회원가입</a>
</div> --%>

<%-- <c:if test="${message == 'success'}">
<h5 style="display: inline">${sessionScope.uname}(${sessionScope.uid})님환영합니다</h5>
<!-- <script type="text/javascript">
	${"loginshow"}.show();
	${"loginconfirm"}.hide();
	 document.getElementById("loginshow").style.display="block";
	document.getElementById("loginconfirm").style.display="none"; 
</script>  -->
</c:if> --%>


<c:choose>
	<c:when test="${sessionScope.member_id == null}"><!--로그인처리가 안된것으로 인식  -->
		<%@ include file="menu-login.jsp" %>
	</c:when>
	<c:otherwise>
		<!--로그인처리가 된것으로 인식  -->
		<%@ include file="menu-logout.jsp" %>
	</c:otherwise>
</c:choose>


<%-- <header id="fh5co-header" role="banner">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="row">
				<div id="loginshow" style="display: none;">
					<a href="#">${sessionScope.uname}접속</a> <a href="#">로그아웃</a>
				</div>
				<div class="col-md-10 col-md-offset-1">
					<div class="navbar-header">
						<!-- Mobile Toggle Menu Button -->
						<a href="#"
							class="js-fh5co-nav-toggle fh5co-nav-toggle visible-xs-block"
							data-toggle="collapse" data-target="#fh5co-navbar"
							aria-expanded="false" aria-controls="navbar"><i></i></a> <a
							class="navbar-brand" href="http://localhost/first/">Clean</a>
						</div>	
					<div id="fh5co-navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="active"><a href="http://localhost/first/"><span>Home
										<span class="border"></span>
								</span></a></li>
							<li id="loginconfirm" style="display: none;""><a href="${path}/member/login.do"><span>로그인
										<span class="border"></span>
								</span></a></li>
							<li><a href="${path}/member/newlogin.do"><span>회원가입 <span class="border"></span></span></a></li>
							<li><a href="${path}/member/list.do"><span>회원관리 <span
										class="border"></span></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header> --%>

<!-- <nav class="navbar navbar-default"></nav> -->

