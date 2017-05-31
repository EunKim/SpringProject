<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl core tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<div id="loginshow" style="display: inline-block; text-align: center; width: 100%; height: 5%;  margin-left: 375px; margin-top: 10px;">
	<a href="${path}/member/viewuser.do?uid=${sessionScope.uid}" style="color: blue; margin-right: 10px;">${sessionScope.uname} 접속중</a>
	<a href="${path}/member/logout.do">로그아웃</a>
</div>


<header id="fh5co-header" role="banner">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="row">
			

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
							<li style="display: none;"><a
								href="${path}/member/newlogin.do"><span>회원가입 <span
										class="border"></span></span></a></li>
							<li id="loginconfirm" style="display: none;"><a
								href="${path}/member/login.do"><span>로그인 <span
										class="border"></span>
								</span></a></li>
							<li><a href="${path}/board/list.do"><span> 글 목록 <span class="border"></span></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>

<nav class="navbar navbar-default"></nav>