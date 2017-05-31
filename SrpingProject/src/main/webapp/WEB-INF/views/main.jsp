<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="include/header.jsp"%>
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


	<div id="fh5co-main">
		<div class="fh5co-intro text-center">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="intro-lead">Make something you love</h1>
						<p class="">
							100% Free HTML5 Template by <a href="http://freehtml5.co/"
								target="_blank">FREEHTML5.co</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-portfolio">
			<div class="fh5co-portfolio-item ">
				<div class="fh5co-portfolio-figure animate-box"
					style="background-image: url(${pageContext.request.contextPath}/resources/images/work_1.jpg);"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project First</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean. A small river named Duden flows
						by their place and supplies it with the necessary regelialia.</p>
					<p>
						<a href="#" class="btn btn-primary">Read the casetudy</a>
					</p>
				</div>
			</div>
			<div class="fh5co-portfolio-item fh5co-img-right">
				<div class="fh5co-portfolio-figure animate-box"
					style="background-image: url(${pageContext.request.contextPath}/resources/images/work_2.jpg);"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project Second</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean. A small river named Duden flows
						by their place and supplies it with the necessary regelialia.</p>
					<p>
						<a href="#" class="btn btn-primary">Read the casetudy</a>
					</p>
				</div>
			</div>
			<div class="fh5co-portfolio-item ">
				<div class="fh5co-portfolio-figure animate-box"
					style="background-image: url(${pageContext.request.contextPath}/resources/images/work_3.jpg);"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project Third</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean. A small river named Duden flows
						by their place and supplies it with the necessary regelialia.</p>
					<p>
						<a href="#" class="btn btn-primary">Read the casetudy</a>
					</p>
				</div>
			</div>
			<div class="fh5co-portfolio-item fh5co-img-right">
				<div class="fh5co-portfolio-figure animate-box"
					style="background-image: url(${pageContext.request.contextPath}/resources/images/work_4.jpg);"></div>
				<div class="fh5co-portfolio-description">
					<h2>Project Fourth</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean. A small river named Duden flows
						by their place and supplies it with the necessary regelialia.</p>
					<p>
						<a href="#" class="btn btn-primary">Read the casetudy</a>
					</p>
				</div>
			</div>
		</div>

		<div id="fh5co-team">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<h2 class="section-lead text-center">Leadership</h2>
							<div
								class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure> <img
									src="${pageContext.request.contextPath}/resources/images/user.jpg"
									alt="Free HTML5 Template by FREEHTML5.co"
									class="img-responsive"> </figure>
								<h3>Will Barrow</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
								</p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul>
							</div>
							<div
								class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure> <img
									src="${pageContext.request.contextPath}/resources/images/user_2.jpg"
									alt="Free HTML5 Template by FREEHTML5.co"
									class="img-responsive"> </figure>
								<h3>Max Conversion</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
								</p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul>
							</div>
							<div class="clearfix visible-sm-block visible-xs-block"></div>
							<div
								class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure> <img
									src="${pageContext.request.contextPath}/resources/images/user_3.jpg"
									alt="Free HTML5 Template by FREEHTML5.co"
									class="img-responsive"> </figure>
								<h3>Hanson Deck</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
								</p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul>
							</div>
							<div
								class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
								<figure> <img
									src="${pageContext.request.contextPath}/resources/images/user.jpg"
									alt="Free HTML5 Template by FREEHTML5.co"
									class="img-responsive"> </figure>
								<h3>Sue Shei</h3>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
								</p>
								<ul class="fh5co-social">
									<li><a href="#"><i class="icon-twitter"></i></a></li>
									<li><a href="#"><i class="icon-github"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-services">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<div class="row">
							<h2 class="section-lead text-center">Features</h2>
							<div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 fh5co-service">
								<div class="fh5co-icon to-animate">
									<i class="icon-present"></i>
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
									<i class="icon-eye"></i>
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
									<i class="icon-crop"></i>
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
									<i class="icon-speedometer"></i>
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
									<i class="icon-heart"></i>
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
									<i class="icon-umbrella"></i>
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
		</div>

	</div>

	<footer id="fh5co-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 text-center">
				<p>
					&copy; Clean Free HTML5. All Rights Reserved. <br>Created by <a
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