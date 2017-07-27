<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>WITH BEA</title>
<style type="text/css">
.phhoto1{
	width:50%;
	border-radius: 10px;
	
}

.fh5co-intro{
	margin-top: -65px;
	height: 700px;
}

#fh5co-portfolio{
	background-color: #e6e5e5;
}

#fh5co-portfolio .fh5co-portfolio-item .fh5co-portfolio-figure{

	border-radius: 10px;
}
</style>
</head>
<body>
   <%@ include file="include/menu.jsp"%>

   <%-- <h2>${message}</h2> --%>
   <%-- <c:if test="${message == 'success'}">
<h5>${sessionScope.uname}(${sessionScope.uid})님환영합니다</h5> 
 <script type="text/javascript">
   document.getElementById("loginshow").style.display="block";
   document.getElementById("login").style.display="block";
</script>
</c:if>  --%>
   <c:if test="${message == 'error'}">
<script type="text/javascript">
   alert("아이디 비밀번호가 일치하지 않습니다.");
</script>
   </c:if>
      <div id="fh5co-main">
      <div class="fh5co-intro text-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/mainimage.png);">
        
      </div>
   <div id="fh5co-portfolio">
      <div class="fh5co-portfolio-item" style="height: 485px;">
         <div class="fh5co-portfolio-figure animate-box"
            style="background-image: url(${pageContext.request.contextPath}/resources/images/mypageimage.png); margin-right: 5px;"></div>
         <div class="phhoto1 animate-box"  style="background-image: url(${pageContext.request.contextPath}/resources/images/moim.png);" > </div>
      </div>
      
      
      <div class="fh5co-portfolio-item fh5co-img-right" style="height: 485px; margin-top: 40px;">
         <div class="fh5co-portfolio-figure animate-box"
            style="background-image: url(${pageContext.request.contextPath}/resources/images/chatinfo.png); margin-right: -3px;"></div>
            <div class="phhoto1 animate-box"  style="background-image: url(${pageContext.request.contextPath}/resources/images/chatimage.png); margin-left: -2px;" > </div>
      </div>
      
      
      <div class="fh5co-portfolio-item " style="height: 485px; margin-top: 40px;">
         <div class="fh5co-portfolio-figure animate-box"
            style="background-image: url(${pageContext.request.contextPath}/resources/images/beaconinfo.png); margin-right: 5px;"></div>
          <div class="phhoto1 animate-box"  style="background-image: url(${pageContext.request.contextPath}/resources/images/map.png);" > </div>
      </div>
      
      
       <div class="fh5co-portfolio-item fh5co-img-right" style="height: 485px; margin-top: 40px;">
         <div class="fh5co-portfolio-figure animate-box"
            style="background-image: url(${pageContext.request.contextPath}/resources/images/cardinfo.png); margin-right: -3px;"></div>
            <div class="phhoto1 animate-box"  style="background-image: url(${pageContext.request.contextPath}/resources/images/card.png); margin-left: -2px;" > </div>
      </div>
      
   </div>

   <div id="fh5co-team">
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1">
               <div class="row">
                  <h2 class="section-lead text-center">활용성</h2>
                  <div
                     class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
                     <figure> <img
                        src="${pageContext.request.contextPath}/resources/images/group.png"
                        alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
                     </figure>
                     <h3></h3>
                     <p>새로운 사람들을 모아 새로운 이야기를 만들 수 있습니다.</p>
                    
                  </div>
                  <div
                     class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
                     <figure> <img
                        src="${pageContext.request.contextPath}/resources/images/road.png"
                        alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
                     </figure>
                     <h3></h3>
                     <p>조그만 비콘을 이용해 커다란 결제의 편리함을 얻을수<br/> 있습니다.</p>
                     
                  </div>
                  <div class="clearfix visible-sm-block visible-xs-block"></div>
                  <div
                     class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
                     <figure> <img
                        src="${pageContext.request.contextPath}/resources/images/distribute.png"
                        alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
                     </figure>
                     <h3></h3>
                     <p>함께 즐기기만 하면 됩니다. 돈을 보내거나 받을 필요가<br/> 없습니다.</p>
                     
                  </div>
                  <div
                     class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
                     <figure> <img
                        src="${pageContext.request.contextPath}/resources/images/question.png"
                        alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
                     </figure>
                     <h3></h3>
                     <p>비콘 주변의 다양한 정보를<br/> 제공합니다.</p>
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- <div id="fh5co-services">
      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1">
               <div class="row">
                  <h2 class="section-lead text-center">Features</h2>
                  <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
                     <div class="fh5co-icon to-animate">
                        <i class="icon-people"></i>
                     </div>
                     <div class="fh5co-desc">
                        <h3>100% Free</h3>
                        <p>Far far away, behind the word mountains, far from the
                           countries Vokalia and Consonantia, there live the blind texts.
                        </p>
                     </div>
                  </div>
                  <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
                     <div class="fh5co-icon to-animate">
                        <i class="icon-phone"></i>
                     </div>
                     <div class="fh5co-desc">
                        <h3>Retina Ready</h3>
                        <p>Far far away, behind the word mountains, far from the
                           countries Vokalia and Consonantia, there live the blind texts.
                        </p>
                     </div>
                  </div>
                  <div class="clearfix visible-sm-block visible-xs-block"></div>
                  <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
                     <div class="fh5co-icon to-animate">
                        <i class="icon-location-pin"></i>
                     </div>
                     <div class="fh5co-desc">
                        <h3>Fully Responsive</h3>
                        <p>Far far away, behind the word mountains, far from the
                           countries Vokalia and Consonantia, there live the blind texts.
                        </p>
                     </div>
                  </div>

                  <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
                     <div class="fh5co-icon to-animate">
                        <i class="icon-wallet"></i>
                     </div>
                     <div class="fh5co-desc">
                        <h3>Lightweight</h3>
                        <p>Far far away, behind the word mountains, far from the
                           countries Vokalia and Consonantia, there live the blind texts.
                        </p>
                     </div>
                  </div>
                  <div class="clearfix visible-sm-block visible-xs-block"></div>
                  <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
                     <div class="fh5co-icon to-animate">
                        <i class="icon-calendar"></i>
                     </div>
                     <div class="fh5co-desc">
                        <h3>Made with Love</h3>
                        <p>Far far away, behind the word mountains, far from the
                           countries Vokalia and Consonantia, there live the blind texts.
                        </p>
                     </div>
                  </div>
                  <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
                     <div class="fh5co-icon to-animate">
                        <i class="icon-paypal"></i>
                     </div>
                     <div class="fh5co-desc">
                        <h3>Eco Friendly</h3>
                        <p>Far far away, behind the word mountains, far from the
                           countries Vokalia and Consonantia, there live the blind texts.
                        </p>
                     </div>
                  </div>
                  <div class="clearfix visible-sm-block visible-xs-block"></div>
               </div>
            </div>
         </div>
      </div>
   </div> -->

   </div>

	  <%@ include file="board/otherchatpage.jsp"%>

   <footer id="fh5co-footer">
   <div class="container">
      <div class="row">
         <div class="col-md-10 col-md-offset-1 text-center">
            <p>
               &copy;  Free HTML5. All Rights Reserved. <br>Created by <a
                  href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a>
               Images: <a href="http://pexels.com/" target="_blank">Pexels</a>
            </p>
         </div>
      </div>
   </div>
   </footer>
   
   

   <!-- jQuery -->
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
   <!-- jQuery Easing -->
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
   <!-- Bootstrap -->
   <script
      src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   <!-- Waypoints -->
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
   <!-- Main JS -->
   <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>