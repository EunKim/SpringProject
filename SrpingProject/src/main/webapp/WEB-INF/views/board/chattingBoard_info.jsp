<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
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

.pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
}
</style>
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
         location.href = "${path}/board/writeform.do";
      });
      
   });
  
   function list(page){
	   location.href="${path}/board/list.do?curPage="+page
			   		  +"&search_option=${map.search_option}"
			   		  +"&keyword=${map.keyword}";
   }
   
</script>

<body>
   <%@ include file="../include/menu.jsp"%>
	   

     <div style="width: 1000px; margin-left: 23%; margin-top: 60px">
      <h4 class="control-label" align="left">글 목록</h4>
      <div>
         <!-- 검색 폼 -->
         <form class="form-horizontal" name="formSearch" method="post"
            action="${path}/board/list.do" style="float: left; margin: 5px">
             <%-- ${map.count}개의 게시물이 있습니다.  --%>
            <div>
               <select class="form-control" name="search_option" style="float: left; width: 130px; height:40px; padding:0px 10px; margin-right: 5px">
                  <option value="all"
                     <c:out value="${map.search_option=='all'?'selected':''}"/>>전체검색</option>
                  <option value="title"
                     <c:out value="${map.search_option=='botitle'?'selected':''}"/>>제목</option>
                  <option value="member_id"
                     <c:out value="${map.search_option=='bouname'?'selected':''}"/>>이름</option>
                  <option value="place"
                     <c:out value="${map.search_option=='place'?'selected':''}"/>>장소명+주소</option>
               </select> 
               <input class="form-control" name="keyword" style="float: left; width: 300px; height:40px; padding:0px 10px; margin-right: 5px" value="${map.keyword}"> 
               <input class="btn btn-primary" type="submit" style="float: left; height: 40px; padding: 0px 10px; background-color: #f7e3e4; color: #000; border: 2px solid #cccccc;" value="조회" >
            </div>
         </form>
         <div style="float: left; margin-top: 5px; margin-left: 390px">
            <c:if test="${sessionScope.member_id != null}">
               <button type="button" class="btn btn-primary"
                  style="width: 80px; height:40px; padding: 0px 10px; background-color:  #f7e3e4; color: #000; border: 2px solid #cccccc;" id="btnWrite">글쓰기</button>
            </c:if>
         </div>
      </div>
      <table class="table table-striped table-hover">
         <tr style= "background-color:#8DC9BB; color: #000000;">
            <!-- <th>글 번호</th> -->
            <th width="8%" style="text-align: center;">글번호</th>
            <th width="60%" style="text-align: center;">제  목</th>
            <!-- <th>만날 날짜</th> -->
            <!-- <th>만날 시간</th> -->
            <!-- <th>만날 장소</th> -->
            <!-- <th>비용</th> -->
            <!-- <th>내용</th> -->
            <th style="text-align: center;">작성자</th>
            <th style="text-align: center;">작성날짜</th>
            <th style="text-align: center;">조회수</th>
         </tr>

         <c:forEach var="row" items="${map.list}">
            <tr onClick="location.href = '${path}/board/viewList.do?bonumber=${row.board_num}'" style="cursor:pointer;">
               <%-- <th>${row.bonumber}</th> --%>
               <th rowspan="2" style="text-align: center; vertical-align: middle;">${row.board_num}</th>
               <%-- <th width="25%"><a
                  href="${path}/board/viewList.do?bonumber=${row.bonumber}" style="display: block;">${row.botitle}</a></th> --%>
               <th width="25%">${row.title}</th>
               <%-- <th>${row.bomeetdate}</th>
               <th>${row.bomeettime}</th>
               <th>${row.boplace}</th>
               <th>${row.bocost}</th> --%>
               <%-- <th>${row.bocontent}</th> --%>
               <th style="text-align: center;">${row.member_id}</th>
               <th style="text-align: center;">${row.board_datetime}</th>
               <th style="text-align: center;">${row.hits}</th>
            </tr>
            <tr  onClick="location.href = '${path}/board/viewList.do?bonumber=${row.board_num}'" style="cursor:pointer;">
               <th colspan="4" style="border-top-color: #ffffff;">
                  <div>
                     <div style="margin-left: 1%; width: 5%; float: left;"><img src="${pageContext.request.contextPath}/resources/images/arrow2.png" height="15" width="15" style="margin-left: 10%; margin-right: 10%"></div>
                     <div style="width: 21%; float: left;  border-right-style: dotted;">만날 일자 : ${row.tour_date}</div>
                     <div style="margin-left: 5%; width: 18%; float: left; border-right-style: dotted;">만날 시간 : ${row.tour_time}</div>
                     <div style="margin-left: 5%; width: 40%; float: left;">만날 장소 : ${row.place_name}</div>
                  </div>
               </th>
               <%-- <th><img src="${pageContext.request.contextPath}/resources/images/arrow.png" height="15" width="15" style="margin-left: 10%; margin-right: 10%">만날 일자 : ${row.bomeetdate}</th>
               <th style="padding-left: 5%">만날 시간 : ${row.bomeettime}</th>
               <th colspan="2" style="padding-left: 5%">만날 장소 : ${row.boplace}</th> --%>
               <!-- <th>비용 : ${row.bocost}</th> -->
            </tr>
         </c:forEach>
         
          <!-- <tr style="text-align: center;">
         	<td colspan="6" style="background-color: #000000;">
         		
         
         	</td>
         </tr> -->
      </table>
      
      <div class="center">
      	<div class="pagination">
         		 <c:if test="${map.pager.curBlock > 1}">
         			<a href="javascript:list('1')"> << </a>
         		</c:if>
         		
         		 <c:if test="${map.pager.curBlock > 1}">
         			<a href="javascript:list('${map.pager.prevPage}')"><</a>
         		</c:if>
         		
         		
         		<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
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
	</div>
</body>
</html>