<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>WITH BEA</title>
<%@ include file="../include/header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<style>

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 140px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding-left: 8px;
	border: 1px solid #888;
	width: 370px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0
		rgba(0, 0, 0, 0.22);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: Red;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.center {
	text-align: center;
}

.pagination {
	display: inline-block;
	width: 100%;
}

.pagination a {
	color: black;
	float: center;
	padding: 6px 14px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #e6aaae;
	border-radius: 5px;
}
.pagination
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#ddd
;

	
border-radius
:
 
5
px
;


}
</style>
<script>

$(document).ready(function(){
	
	   //수정 버튼
	   $("#btnUpdate").click(function(){
		   
	      document.myInfo.action="${path}/member/updateuserinfo.do";
	      document.myInfo.submit();
	   });
	   
	   //삭제 버튼
	   $("#btnDelete").click(function(){
	      if(confirm("탈퇴하시겠습니까?")){
	         document.myInfo.action="${path}/member/deleteuser.do";
	         document.myInfo.submit();
	      }
	   });
 
});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="card" style="margin: 80px 50px 40px 350px;">
		<form method="post" name="myInfo">
			<fieldset>
				<label
					style="width: 160px; font-size: 23px; font-weight: normal; color: #444444;">
					<img
					src="${pageContext.request.contextPath}/resources/images/user.png"
					height="25" width="25" style="margin-left: 3%; margin-right: 3%">MY
					INFO
				</label>
				<div style="width: 320px; margin-top: 3px;">
					<label class="mylabel">아이디</label> <input class="under" type="text"
						readonly style="width: 180px; float: left; padding-left: 20px;"
						id="member_id" name="member_id" value="${map.dto.member_id}">
					<input type="hidden" id="member_pw" name="member_pw"
						value="${map.dto.member_pw}">
				</div>
				<div style="width: 360px">
					<label class="mylabel">이 름</label> <input class="under" type="text"
						readonly style="width: 180px; float: left; padding-left: 20px;"
						id="member_name" name="member_name" value="${map.dto.member_name}">
				</div>
				<div style="width: 360px">
					<label class="mylabel">성 별</label> <input class="under" type="text"
						readonly style="width: 180px; float: left; padding-left: 20px;"
						id="gender" name="gender" value="${map.dto.gender}">
				</div>
				<div style="width: 360px">
					<label class="mylabel">생년월일</label> <input class="under"
						type="text" readonly
						style="width: 180px; float: left; padding-left: 20px;" id="birth"
						name="birth" value="${map.dto.birth}">
				</div>
				<div style="width: 360px; padding-left: 40px;">
					<button class="btn btn-primary" type="button" id="btnUpdate"
						style="margin-top: 14px;">수 정</button>
					<button class="btn btn-default" type="button" id="btnDelete"
						style="margin-top: 14px;">회원탈퇴</button>
				</div>
			</fieldset>
		</form>
	</div>
	<div class="card"
		style="width: 800px; height: 650px; margin: 80px 50px 40px 0px;">
		<label
			style="width: 150px; font-size: 23px; font-weight: normal; color: #444444;">
			<img
			src="${pageContext.request.contextPath}/resources/images/post.png"
			height="25" width="25" style="margin-left: 0%; margin-right: 3%;">
			MY POST
		</label>
		<div style="width: 320px; margin-top: 3px; margin-bottom: -10px;">
			<label class="mylabel" style="width: 150px; margin-right: -25px;">작성한
				게시글 수 : </label> <input class="under" type="text" readonly
				style="width: 50px; float: left; text-align: center; border: none;"
				id="postcount" name="postcount" value="${map.postCount}">
		</div>
		<p>
		<div style="width: 700px;">
			<label class="mylabel"
				style="width: 150px; margin-top: -5px; margin-right: 500px">최근
				작성한 게시글</label>
			<!-- <label id="more"
						style="width: 80px; float: right; padding-top: 9px; margin-right: 15px; margin-bottom: -5px; cursor: pointer;">more..</label> -->
		</div>

		<c:set var="postsize" value="map.myRecentPost"></c:set>
		<%-- <c:if test="${ empty map.myRecentPost}"> --%>
		<c:if test="${ empty map.myAllpost}">
			<div style="width: 700px;">
				<input class="under" type="text" readonly
					style="width: 250px; float: left; padding-left: 20px; margin-left: 250px; margin-bottom: -5px; text-align: center;"
					value="최근 작성한 게시글이 없습니다.">
			</div>
		</c:if>
		<c:if test="${ !empty map.myAllpost}">
			<div style="width: 700px;">
				<table class="table table-striped table-hover">
					<tr style="background-color: #8DC9BB; color: #000000;">
						<!-- <th>글 번호</th> -->
						<th width="10%" style="text-align: center;">글번호</th>
						<th width="60%" style="text-align: center;">제 목</th>
						<th style="text-align: center;">작성날짜</th>
					</tr>

					<c:forEach var="mypost" items="${map.myAllpost}">
						<tr
							onClick="location.href = '${path}/board/viewList.do?board_num=${mypost.board_num}'"
							style="cursor: pointer;">
							<%-- <th>${row.bonumber}</th> --%>
							<th style="text-align: center; vertical-align: middle;">${mypost.board_num}</th>
							<%-- <th width="25%"><a
                  href="${path}/board/viewList.do?bonumber=${row.bonumber}" style="display: block;">${row.botitle}</a></th> --%>
							<th width="25%">${mypost.title}</th>
							<th style="text-align: center;"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${mypost.board_datetime}" /></th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:if>

		<div class="center">
			<div class="pagination">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('1')"> << </a>
				</c:if>

				<c:if test="${map.pager.curBlock > 1}">
					<a href="javascript:list('${map.pager.prevPage}')"><</a>
				</c:if>


				<c:forEach var="num" begin="${map.pager.blockBegin}"
					end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<a class="active">${num}</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
					<a href="javascript:list('${map.pager.nextPage}')">></a>
				</c:if>
				<c:if test="${map.pager.curPage <= map.pager.totPage}">
					<a href="javascript:list('${map.pager.totPage}')">>></a>
				</c:if>
			</div>
		</div>

<script>

var modal = document.getElementById('myModalPost');
var more = document.getElementById('more');
//Get the <span> element that closes the modal
var span = document.getElementsByClassName('close')[0];

more.onclick = function() {
	modal.style.display = "block";
}

 
/* span.onclick = function(){
	   modal.style.display = "none";
} */
//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
   		modal.style.display = "none";
	}
}

function list(page){
	   location.href="${path}/member/mypage.do?member_id=${sessionScope.member_id}&curPage="+page;
}

</script>
</body>
</html>