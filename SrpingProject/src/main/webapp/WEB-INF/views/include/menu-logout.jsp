<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl core tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />


<header id="fh5co-header" role="banner">
	<nav class="navbar navbar-default" role="navigation">
	<div id="loginshow" style="display: inline-block; text-align: center; height: 5%;  margin-left: 1050px; margin-top: 10px;width: 20%;">
	<div style="width: 250px; float: left; text-align: right;">
	<a href="${path}/member/viewuser.do?member_id=${sessionScope.member_id}" style="color: #5DC9BC; margin-right: 6px;">${sessionScope.member_name} 접속중</a>
	</div>
	<div style="width: 110px; float: right; text-align: left;">
	<a href="${path}/member/logout.do" style="margin-left: 13px;">로그아웃</a>
	</div>
	</div>
		<div class="container">
			<div class="row">
			

				<div class="col-md-10 col-md-offset-1">
					<div class="navbar-header">
						<!-- Mobile Toggle Menu Button -->
						<a href="#"
							class="js-fh5co-nav-toggle fh5co-nav-toggle visible-xs-block"
							data-toggle="collapse" data-target="#fh5co-navbar"
							aria-expanded="false" aria-controls="navbar"><i></i></a> <a
							class="navbar-brand" href="${path}">Clean</a>
					</div>
					<div id="fh5co-navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="active"><a href="${path}" style="color:#C63A44;"><span>Home
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