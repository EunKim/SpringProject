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

<%--  ${map.count}개의 게시물이 있습니다.  --%>
   <div style="width: 1000px; margin-left: 23%">
      <h4 align="left">글 목록</h4>
      
      <!-- 검색 폼 -->
      <form name="formSearch" method="post" action="${path}/board/list.do">
      		<select name="search_option">
      			<option value="all"
      			<c:out value="${map.search_option=='all'?'selected':''}"/>>전체검색</option>
      			<option value="botitle"
      			<c:out value="${map.search_option=='botitle'?'selected':''}"/>>제목</option>
      			<option value="bouname"
      			<c:out value="${map.search_option=='bouname'?'selected':''}"/>>이름</option>
      			<option value="place"
      			<c:out value="${map.search_option=='place'?'selected':''}"/>>장소명+주소</option>
      		</select>
      		<input name="keyword" value="${map.keyword}">
      		<input type="submit" vlaue="조회">
      </form>
      
      
      <c:if test="${sessionScope.uid != null}">
         <button type="button" class="btn btn-primary"
            style="background: #bbbbbb; height: 30px; width: 80px; padding: 0px; margin-left: 91%" 
            id="btnWrite">글쓰기</button>
      </c:if>
      
      <table class="table table-striped table-hover">
         <tr style= "background-color: rgba( 255, 0, 0, 0.1);">
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
            <tr>
               <%-- <th>${row.bonumber}</th> --%>
               <th rowspan="2" style="text-align: center; vertical-align: middle;">${row.bonumber}</th>
               <th width="25%"><a
                  href="${path}/board/viewList.do?bonumber=${row.bonumber}" style="display: block;">${row.botitle}</a></th>
               <%-- <th>${row.bomeetdate}</th>
               <th>${row.bomeettime}</th>
               <th>${row.boplace}</th>
               <th>${row.bocost}</th> --%>
               <%-- <th>${row.bocontent}</th> --%>
               <th style="text-align: center;">${row.bouname}</th>
               <th style="text-align: center;">${row.boregdate}</th>
               <th style="text-align: center;">${row.bocount}</th>
            </tr>
            <tr>
               <th colspan="4" style="border-top-color: #ffffff;">
                  <div>
                     <div style="margin-left: 1%; width: 5%; float: left;"><img src="${pageContext.request.contextPath}/resources/images/arrow2.png" height="15" width="15" style="margin-left: 10%; margin-right: 10%"></div>
                     <div style="width: 21%; float: left;  border-right-style: dotted;">만날 일자 : ${row.bomeetdate}</div>
                     <div style="margin-left: 5%; width: 18%; float: left; border-right-style: dotted;">만날 시간 : ${row.bomeettime}</div>
                     <div style="margin-left: 5%; width: 40%; float: left;">만날 장소 : ${row.boplace}</div>
                  </div>
               </th>
               <%-- <th><img src="${pageContext.request.contextPath}/resources/images/arrow.png" height="15" width="15" style="margin-left: 10%; margin-right: 10%">만날 일자 : ${row.bomeetdate}</th>
               <th style="padding-left: 5%">만날 시간 : ${row.bomeettime}</th>
               <th colspan="2" style="padding-left: 5%">만날 장소 : ${row.boplace}</th> --%>
               <!-- <th>비용 : ${row.bocost}</th> -->
            </tr>
         </c:forEach>
         
             <tr style="text-align: center;">
         	<td colspan="6">
         	
         		<%-- <c:if test="${map.pager.curBlock > 1}">
         			<a href="javascript:list('1')">[처음]</a>
         		</c:if>
         		 <c:if test="${map.pager.curBlock > 1">
         			<a href="javascript:list('${map.pager.prevPage')">[이전]</a>
         		</c:if>  --%>
         		
         		<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
         		<c:choose>
         			<c:when test="${num == map.pager.curPage}">
         			<span style="color:blue">${num}</span>
         			</c:when>
         			<c:otherwise>
         			<a href="javascript:list('${num}')">${num}</a>&nbsp;
         			</c:otherwise>
         		</c:choose>
         		</c:forEach>
         		<%-- <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
         			<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
         		</c:if>
         		<c:if test="${map.pager.curPage <= map.pager.totPage}">
         			<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
         		</c:if>  --%>
         	</td>
         </tr>

      </table>
   </div>
</body>
</html>