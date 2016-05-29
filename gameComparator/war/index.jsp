<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.gamecomparator.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Game Comparator</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/CabinSketch_700.font.js"></script>
<script type="text/javascript" src="js/EB_Garamond_400.font.js"></script>
<!-- [if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">
.bg {behavior:url(js/PIE.htc)}
</style>
<![endif]-->
<!-- [if lt IE 7]>
<div style='clear:both;text-align:center;position:relative'>
	<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0" alt="" /></a>
</div>
<![endif]-->
</head>
<body id="page1">
	<%
		//Login de usuarios de google
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		//si no esta logeado creamos el login de google
		String url ="";
		String urlLinktext = "";

		//si esta logeado ponemos el logout
		if (user != null) {
			url = userService.createLogoutURL(request.getRequestURI());
			urlLinktext = "Logout";
			if (CostumerDC.getCostumer(user.getNickname())!=null) {//Si el usuario esta ya en el datastore lo traemos
				Costumer costumer;
				costumer = CostumerDC.getCostumer(user.getNickname());
			}
			else{
				url = "/login";
				urlLinktext = "Registrarse";
		}
		}
	%>

	<div class="main">
		<!-- header -->
		<header>
			<div class="wrapper">
				<nav>
					<ul id="menu">
						<li id="menu_active"><a href="index.jsp"><span>Game</span>Comparator</a></li>
						<li><a href="Services.jsp"><span>S</span>ervices</a></li>
						<li><a href="Productos.jsp"><span>G</span>ames</a></li>
						<li><a href="About.jsp"><span>A</span>bout</a></li>
					</ul>
				</nav>
			</div>
			<h1>
				<a href="index.html"
					style="text-decoration: none; background-color: none; color: white; font-size: 40px">Game
					Comparator</a>
			</h1>
		</header>


		<div style="width: 100%;">
			<div class="log">
				<span class="glyphicon glyphicon-log-in"><a href="<%=url%>"><%=urlLinktext%></a>
					<%=(user == null ? "" : user.getNickname())%></span>
			</div>
		</div>
		
		<div class="ic">Comparator of Games Web Scrapping</div>
		<!-- / header -->
		<!-- content -->
		<section id="content">
			<div class="wrapper">
				<article class="col1">
					<h2>Last best Games</h2>
					<div class="pad_left1 pad_bot1">
						<div id="slider">
							<div id="for_img">
								<div id="nivo_slider">
									<!-- Aqui en jsp deberíamos meter juegos -->
									<img src="images/img1.jpg" alt=""> <img
										src="images/img2.jpg" alt=""> <img src="images/img3.jpg"
										alt=""> <img src="images/img4.jpg" alt=""> <img
										src="images/img5.jpg" alt="">
								</div>
							</div>
						</div>
						<div class="pad">
							<p>
								<strong>Game Comparator</strong>
							</p>
						</div>
					</div>

					<h2>
						<span>Our Solutions</span>
					</h2>
					<div class="pad_left1">
						<div class="pad_left1">
							<div class="wrapper pad_top1">
								<div class="col3">
									<div class="wrapper">
										<figure class="left marg_right1">
											<img src="images/page1_img3.png" alt="">
										</figure>
										<p class="cols">
											<strong class="font1">Development</strong><br>Error sit
											voluptatem accus antium doloremque laiantium totam rem
											aperiam, eaque tecto beatae.
										</p>
									</div>
								</div>
								<div class="col3 pad_left2">
									<div class="wrapper">
										<figure class="left marg_right1">
											<img src="images/page1_img5.png" alt="">
										</figure>
										<p class="cols">
											<strong class="font1">Creative Design</strong><br>Eorporis
											suscipit laboriosam, nisi ut aliquid ex ea commodi eum iure
											reprehenderit qui in ea voluptate.
										</p>
									</div>
								</div>
							</div>
							<div class="wrapper">
								<div class="col3">
									<div class="wrapper">
										<figure class="left marg_right1">
											<img src="images/page1_img4.png" alt="">
										</figure>
										<div class="cols">
											<strong class="font1">Planning</strong><br>Eius modi
											tempora incidunt aliquam quaerat enim ad minima veniam, quis
											nostrum exercitationem ullam.
										</div>
									</div>
								</div>
								<div class="col3 pad_left2">
									<div class="wrapper">
										<figure class="left marg_right1">
											<img src="images/page1_img6.png" alt="">
										</figure>
										<div class="cols">
											<strong class="font1">Effective Strategies</strong><br>Velit
											esse quam nihil molestiae consequatur, vel illumqui dolorem
											eum fugiat voluptas laiantium totam rem.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
			</div>
		</section>
		<!-- / content -->
		<!-- footer -->
		<footer>
			<div class="wrapper">
				<article class="col">
					<h5>Why Us</h5>
					<ul class="list1">
						<li><a href="#">Sedut perspiciatis</a></li>
						<li><a href="#">Unde omnis iste</a></li>
						<li><a href="#">Natus error sit </a></li>
						<li><a href="#">Volupttem accus</a></li>
						<li><a href="#">Ntium doloremque </a></li>
					</ul>
				</article>
				<article class="col pad_left2">
					<h5>Links</h5>
					<ul class="list1">
						<li><a href="https://github.com/rafaellg8/gameScrapping">Github</a></li>
					</ul>
				</article>
				<article class="col pad_left2">
					<h5>Follow Us</h5>
					<ul class="icons">
						<li><a href="#"><img src="images/icon1.jpg" alt="">Facebook</a></li>
						<li><a href="#"><img src="images/icon2.jpg" alt="">Stumleupon</a></li>
						<li><a href="#"><img src="images/icon3.jpg" alt="">Twitter</a></li>
						<li><a href="#"><img src="images/icon4.jpg" alt="">Digg</a></li>
						<li><a href="#"><img src="images/icon5.jpg" alt="">RSS
								Feed</a></li>
					</ul>
				</article>
				<article id="newsletter">
					<h5>Newsletter</h5>
					<form id="newsletter_form">
						<div class="wrapper">
							<input class="input" type="text" value="Enter your email here"
								onblur="if(this.value=='') this.value='Enter your email here'"
								onFocus="if(this.value =='Enter your email here' ) this.value=''">
						</div>
						<a href="#"
							onClick="document.getElementById('newsletter_form').submit()">Subscribe</a>
					</form>
				</article>
			</div>
			<a href="index.jsp" class="footer_logo">Game<span>
					Comparator</span></a>
		</footer>
		<!-- / footer -->
	</div>
	<script type="text/javascript">
		Cufon.now();
	</script>
	<script type="text/javascript">
		$(window).load(function() {
			$('#nivo_slider').nivoSlider({
				effect : 'fold', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft'
				slices : 7,
				animSpeed : 500,
				pauseTime : 6000,
				startSlide : 0, //Set starting Slide (0 index)
				directionNav : true, //Next & Prev
				directionNavHide : false, //Only show on hover
				controlNav : true, //1,2,3...
				controlNavThumbs : false, //Use thumbnails for Control Nav
				controlNavThumbsFromRel : false, //Use image rel for thumbs
				controlNavThumbsSearch : '.jpg', //Replace this with...
				controlNavThumbsReplace : '_thumb.jpg', //...this in thumb Image src
				keyboardNav : true, //Use left & right arrows
				pauseOnHover : true, //Stop animation while hovering
				manualAdvance : false, //Force manual transitions
				captionOpacity : 1, //Universal caption opacity
				beforeChange : function() {
				},
				afterChange : function() {
				},
				slideshowEnd : function() {
				} //Triggers after all slides have been shown
			});
		});
	</script>
</body>
</html>