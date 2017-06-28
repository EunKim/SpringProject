<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatStyle.css">
<title>Insert title here</title>
<style>
.float-button {
	position: fixed;
	right: 60px;
	bottom: 60px;
	width: 70px;
	height: 70px;
	background-color: #C63A44;
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
								alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
							</figure>
							<h3>Will Barrow</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
							<ul class="fh5co-social">
								<li><a href="#"><i class="icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon-github"></i></a></li>
							</ul>
						</div>
						<div
							class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
							<figure> <img
								src="${pageContext.request.contextPath}/resources/images/user_2.jpg"
								alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
							</figure>
							<h3>Max Conversion</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
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
								alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
							</figure>
							<h3>Hanson Deck</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
							<ul class="fh5co-social">
								<li><a href="#"><i class="icon-twitter"></i></a></li>
								<li><a href="#"><i class="icon-github"></i></a></li>
							</ul>
						</div>
						<div
							class="col-md-3 col-sm-6 col-xs-6 col-xxs-12 fh5co-staff to-animate">
							<figure> <img
								src="${pageContext.request.contextPath}/resources/images/user.jpg"
								alt="Free HTML5 Template by FREEHTML5.co" class="img-responsive">
							</figure>
							<h3>Sue Shei</h3>
							<p>Far far away, behind the word mountains, far from the
								countries Vokalia and Consonantia, there live the blind texts.</p>
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

	<button class="w3-button w3-xlarge w3-circle w3-card-4 float-button" id="floatChat">
		<img
			src="${pageContext.request.contextPath}/resources/images/chat1.png"
			height="35" width="35">
	</button>
	
	<div class="wrapper" id = "hi">
    <div class="container1">
        <div class="left1">
            <div class="top1">
                <input type="text" />
                <a href="javascript:;" class="search"></a>
            </div>
            <ul class="people">
                <li class="person" data-chat="person1">
                    <img src="https://s13.postimg.org/ih41k9tqr/img1.jpg" alt="" />
                    <span class="name">Thomas Bangalter</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">I was wondering...</span>
                </li>
                <li class="person" data-chat="person2">
                    <img src="https://s3.postimg.org/yf86x7z1r/img2.jpg" alt="" />
                    <span class="name">Dog Woofson</span>
                    <span class="time">1:44 PM</span>
                    <span class="preview">I've forgotten how it felt before</span>
                </li>
                <li class="person" data-chat="person3">
                    <img src="https://s3.postimg.org/h9q4sm433/img3.jpg" alt="" />
                    <span class="name">Louis CK</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">But we’re probably gonna need a new carpet.</span>
                </li>
                <li class="person" data-chat="person4">
                    <img src="https://s3.postimg.org/quect8isv/img4.jpg" alt="" />
                    <span class="name">Bo Jackson</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">It’s not that bad...</span>
                </li>
                <li class="person" data-chat="person5">
                    <img src="https://s16.postimg.org/ete1l89z5/img5.jpg" alt="" />
                    <span class="name">Michael Jordan</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">Wasup for the third time like is 
you bling bitch</span>
                </li>
                <li class="person" data-chat="person6">
                    <img src="https://s30.postimg.org/kwi7e42rh/img6.jpg" alt="" />
                    <span class="name">Drake</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">howdoyoudoaspace</span>
                </li>
            </ul>
        </div>
        <div class="right1">
            <div class="top1"><span>To: <span class="name">Dog Woofson</span></span></div>
            <div class="chat" data-chat="person1">
                <div class="conversation-start">
                    <span>Today, 6:48 AM</span>
                </div>
                <div class="bubble you">
                    Hello,
                </div>
                <div class="bubble you">
                    it's me.
                </div>
                <div class="bubble you">
                    I was wondering...
                </div>
            </div>
            <div class="chat" data-chat="person2">
                <div class="conversation-start">
                    <span>Today, 5:38 PM</span>
                </div>
                <div class="bubble you">
                    Hello, can you hear me?
                </div>
                <div class="bubble you">
                    I'm in California dreaming
                </div>
                <div class="bubble me">
                    ... about who we used to be.
                </div>
                <div class="bubble me">
                    Are you serious?
                </div>
                <div class="bubble you">
                    When we were younger and free...
                </div>
                <div class="bubble you">
                    I've forgotten how it felt before
                </div>
            </div>
            <div class="chat" data-chat="person3">
                <div class="conversation-start">
                    <span>Today, 3:38 AM</span>
                </div>
                <div class="bubble you">
                    Hey human!
                </div>
                <div class="bubble you">
                    Umm... Someone took a shit in the hallway.
                </div>
                <div class="bubble me">
                    ... what.
                </div>
                <div class="bubble me">
                    Are you serious?
                </div>
                <div class="bubble you">
                    I mean...
                </div>
                <div class="bubble you">
                    It’s not that bad...
                </div>
                <div class="bubble you">
                    But we’re probably gonna need a new carpet.
                </div>
            </div>
            <div class="chat" data-chat="person4">
                <div class="conversation-start">
                    <span>Yesterday, 4:20 PM</span>
                </div>
                <div class="bubble me">
                    Hey human!
                </div>
                <div class="bubble me">
                    Umm... Someone took a shit in the hallway.
                </div>
                <div class="bubble you">
                    ... what.
                </div>
                <div class="bubble you">
                    Are you serious?
                </div>
                <div class="bubble me">
                    I mean...
                </div>
                <div class="bubble me">
                    It’s not that bad...
                </div>
            </div>
            <div class="chat" data-chat="person5">
                <div class="conversation-start">
                    <span>Today, 6:28 AM</span>
                </div>
                <div class="bubble you">
                    Wasup
                </div>
                <div class="bubble you">
                    Wasup
                </div>
                <div class="bubble you">
                    Wasup for the third time like is <br />you blind bitch
                </div>

            </div>
            <div class="chat" data-chat="person6">
                <div class="conversation-start">
                    <span>Monday, 1:27 PM</span>
                </div>
                <div class="bubble you">
                    So, how's your new phone?
                </div>
                <div class="bubble you">
                    You finally have a smartphone :D
                </div>
                <div class="bubble me">
                    Drake?
                </div>
                <div class="bubble me">
                    Why aren't you answering?
                </div>
                <div class="bubble you">
                    howdoyoudoaspace
                </div>
            </div>
            <div class="write">
                <a href="javascript:;" class="write-link attach"></a>
                <input type="text" />
                <a href="javascript:;" class="write-link smiley"></a>
                <a href="javascript:;" class="write-link send"></a>
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
	
	<script>
	$(document).ready(function(){
		$("#hi").hide();
		
	    $("#floatChat").click(function(){
	        $("#hi").toggle();
	    });
	});
	
	$('.chat[data-chat=person2]').addClass('active-chat');
	$('.person[data-chat=person2]').addClass('active');

	$('.left .person').mousedown(function(){
	    if ($(this).hasClass('.active')) {
	        return false;
	    } else {
	        var findChat = $(this).attr('data-chat');
	        var personName = $(this).find('.name').text();
	        $('.right .top .name').html(personName);
	        $('.chat').removeClass('active-chat');
	        $('.left .person').removeClass('active');
	        $(this).addClass('active');
	        $('.chat[data-chat = '+findChat+']').addClass('active-chat');
	    }
	});
	</script>

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