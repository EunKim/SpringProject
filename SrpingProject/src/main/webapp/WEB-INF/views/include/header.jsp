<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- jstl core tag -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 컨텍스트 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<script language="javascript">
//not event f5  event.clientY < 0
//event.altKey When press Alt +F4 
//event.ctrlKey When press Ctrl +F4 
//event.clientY 107 or 129 is  Alt F4 postion on window screen it may change base on screen resolution 
 $(window).bind('beforeunload', function() {
    if ((event.clientY < 0) ||(event.altKey) ||(event.ctrlKey)||((event.clientY < 129) && (event.clientY>107))) { 
   $.ajax({
    url : "${path}/member/logout.do"  //스프링시큐리티 에서 적용시켜놓은 custom logout url
   }); 
        }
 }); 
</script>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">



<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/Bootstrap/bootstrap.css"
   type="text/css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Bootstrap/bootstrap.min.css" type="text/css"> --%>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/Bootstrap/bootstrap-clockpicker.css"
   type="text/css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/Bootstrap/bootstrap-clockpicker.min.css"
   type="text/css">


<!-- main.jsp에서 clean 부트스트랩을 쓸때 필요한 것 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- title>Clean &mdash; A free HTML5 Template by FREEHTML5.CO</title> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
   content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- Facebook and Twitter integration -->
<!-- <meta property="og:title" content=""/>
   <meta property="og:image" content=""/>
   <meta property="og:url" content=""/>
   <meta property="og:site_name" content=""/>
   <meta property="og:description" content=""/>
   <meta name="twitter:title" content="" />
   <meta name="twitter:image" content="" />
   <meta name="twitter:url" content="" />
   <meta name="twitter:card" content="" /> -->

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Google Webfonts -->
<link
   href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500'
   rel='stylesheet' type='text/css'>
<link
   href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,300,100,500'
   rel='stylesheet' type='text/css'>

<%-- chat --%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/chatStyle.css">
<!-- Animate.css -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<!-- Simple Line Icons -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/simple-line-icons.css">
<!-- Theme Style -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Modernizr JS -->
<script
   src="${pageContext.request.contextPath}/resources/js/modernizr-2.6.2.min.js"></script>


<!-- 로그인폼 모달용 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


<%-- <link href="${pageContext.request.contextPath}/resources/Bootstrap/bootstrap.css" rel="stylesheet" /> --%>

<link href="login-register.css" rel="stylesheet" />
<link rel="stylesheet"
   href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<script
   src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/bootstrap.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/bootstrap-clockpicker.js"
   type="text/javascript"></script>
<script src="login-register.js" type="text/javascript"></script>

<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> --%>







