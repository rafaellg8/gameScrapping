<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.gamecomparator.model.*"%>

<%
		//Usuario local
		Costumer userLocal = null;
		if (session.getLastAccessedTime() != 0 || session.getAttribute("user")!=null){
			String aux = session.getAttribute("user").toString();
			userLocal = CostumerDC.getCostumer(aux);
		}
		else{ //Sesion cerrada abrimos index.jsp
			response.sendRedirect("/index");
		}
			//Si la session esta abierta traemos el obeto costumer completo
		
	//si no esta logeado creamos el login de google
		String url ="";
		String urlLinktext = "";

		//si esta logeado ponemos el logout
			url = "logout.jsp";
			urlLinktext = "Logout";
	%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Game Comparator - <%=userLocal.getName()%></title>
	<meta name="description" content="Game Comparator - Web Scrapping - Comparador de vieojuegos" />
	<meta name="keywords" content="html template, css, free, one page, game comparator,games, web design" />
	<meta name="author" content="Rafael Lachica Garrido" />
	<!-- Favicons (created with http://realfavicongenerator.net/)-->
	<link rel="apple-touch-icon" sizes="57x57" href="img/favicons/favicon.ico">
	<link rel="apple-touch-icon" sizes="60x60" href="img/favicons/favicon.ico">
	<link rel="icon" type="image/png" href="img/favicons/favicon.ico" sizes="32x32">
	<link rel="icon" type="image/png" href="img/favicons/favicon.ico" sizes="16x16">
	<link rel="manifest" href="img/favicons/manifest.json">
	<link rel="shortcut icon" href="img/favicons/favicon.ico">
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<!-- Normalize -->
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<!-- Owl -->
	<link rel="stylesheet" type="text/css" href="css/owl.css">
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.1.0/css/font-awesome.min.css">
	<!-- Elegant Icons -->
	<link rel="stylesheet" type="text/css" href="fonts/eleganticons/et-icons.css">
	<!-- Main style -->
	<link rel="stylesheet" type="text/css" href="css/cardio.css">
</head>

<body>
	<div class="preloader">
		<img src="img/loader.gif" alt="Preloader image">
	</div>
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="img/logo.jpg"  data-active-url="img/logo-active.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					<li><a href="#intro">Intro</a></li>
					<li><a href="#services">Services</a></li>
					<li><a href="#team">About</a></li>
					<li><%=userLocal.getName() %><img src="img/icons/png/nerd.png" alt="Avatar Image" class="avatar"></li>
					<li><a href="logout.jsp" class="btn btn-red-fill ripple"><img alt="log-out" src="img/icons/png/log-out.png">Logout</a></li>
				</ul>
						
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<header id="intro">
		<div class="container">
			<div class="table">
				<div class="header-text">
					<div class="row">
						<div class="col-md-12 text-center">
							<h3 class="light white">Game comparator</h3>
							<h1 class="white typed">Bienvenido : <%=userLocal.getName()%></h1>
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	

	<section id="services" class="section section-padded">
		<div class="container">
			<div class="row text-center title">
				<h2>Services</h2>
				<h4 class="light muted">Achieve the best results with game comparassions</h4>
			</div>
			<div class="row services">
				<div class="col-md-4">
					<div class="service">
					<a href="/games#top">
						<div class="icon-holder">
							<img src="img/icons/png/game-controller-1.png" alt="" class="icon">
						</div>
						<h4 class="heading">Games</h4>
						<p class="description">Top Games</p>
						</a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="service">
						<a href="/favorites">
						<div class="icon-holder">
							<img src="img/icons/png/mushroom.png" alt="" class="icon">
						</div>
						<h4 class="heading">Favorites</h4>
						<p class="description">List of favorites games</p>
						</a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="service">
					<a href="/moregames">
						<div class="icon-holder">
							<img src="img/icons/png/technology.png" alt="" class="icon">
						</div>
						<h4 class="heading">More Games</h4>
						<p class="description">More fantastic games</p>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="cut cut-bottom"></div>
	</section>
<!-- 	<section id="team" class="section gray-bg"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row title text-center"> -->
<!-- 				<h2 class="margin-top">Team</h2> -->
<!-- 				<h4 class="light muted">We're a dream team!</h4> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="team text-center"> -->
<!-- 						<div class="cover" style="background:url('img/team/team-cover1.jpg'); background-size:cover;"> -->
<!-- 							<div class="overlay text-center"> -->
<!-- 								<h3 class="white">$69.00</h3> -->
<!-- 								<h5 class="light light-white">1 - 5 sessions / month</h5> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<img src="img/team/team3.jpg" alt="Team Image" class="avatar"> -->
<!-- 						<div class="title"> -->
<!-- 							<h4>Ben Adamson</h4> -->
<!-- 							<h5 class="muted regular">Fitness Instructor</h5> -->
<!-- 						</div> -->
<!-- 						<button data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill">Sign Up Now</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="team text-center"> -->
<!-- 						<div class="cover" style="background:url('img/team/team-cover2.jpg'); background-size:cover;"> -->
<!-- 							<div class="overlay text-center"> -->
<!-- 								<h3 class="white">$69.00</h3> -->
<!-- 								<h5 class="light light-white">1 - 5 sessions / month</h5> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<img src="img/team/team1.jpg" alt="Team Image" class="avatar"> -->
<!-- 						<div class="title"> -->
<!-- 							<h4>Eva Williams</h4> -->
<!-- 							<h5 class="muted regular">Personal Trainer</h5> -->
<!-- 						</div> -->
<!-- 						<a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill ripple">Sign Up Now</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="team text-center"> -->
<!-- 						<div class="cover" style="background:url('img/team/team-cover3.jpg'); background-size:cover;"> -->
<!-- 							<div class="overlay text-center"> -->
<!-- 								<h3 class="white">$69.00</h3> -->
<!-- 								<h5 class="light light-white">1 - 5 sessions / month</h5> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<img src="img/team/team2.jpg" alt="Team Image" class="avatar"> -->
<!-- 						<div class="title"> -->
<!-- 							<h4>John Phillips</h4> -->
<!-- 							<h5 class="muted regular">Personal Trainer</h5> -->
<!-- 						</div> -->
<!-- 						<a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill ripple">Sign Up Now</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	<!--<section id="pricing" class="section">
		<div class="container">
			<div class="row title text-center">
				<h2 class="margin-top white">Pricing</h2>
				<h4 class="light white">Choose your favorite pricing plan and sign up today!</h4>
			</div>
			<div class="row no-margin">
				<div class="col-md-7 no-padding col-md-offset-5 pricings text-center">
					<div class="pricing">
						<div class="box-main active" data-img="img/pricing1.jpg">
							<h4 class="white">Yoga Pilates</h4>
							<h4 class="white regular light">$850.00 <span class="small-font">/ year</span></h4>
							<a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-white-fill">Sign Up Now</a>
							<i class="info-icon icon_question"></i>
						</div>
						<div class="box-second active">
							<ul class="white-list text-left">
								<li>One Personal Trainer</li>
								<li>Big gym space for training</li>
								<li>Free tools &amp; props</li>
								<li>Free locker</li>
								<li>Free before / after shower</li>
							</ul>
						</div>
					</div>
					<div class="pricing">
						<div class="box-main" data-img="img/pricing2.jpg">
							<h4 class="white">Cardio Training</h4>
							<h4 class="white regular light">$100.00 <span class="small-font">/ year</span></h4>
							<a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-white-fill">Sign Up Now</a>
							<i class="info-icon icon_question"></i>
						</div>
						<div class="box-second">
							<ul class="white-list text-left">
								<li>One Personal Trainer</li>
								<li>Big gym space for training</li>
								<li>Free tools &amp; props</li>
								<li>Free locker</li>
								<li>Free before / after shower</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>-->
	<section class="section section-padded blue-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="owl-twitter owl-carousel">
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i>
							<h4 class="white light">To enjoy the glow of good health, you must exercise.</h4>
							<h4 class="light-white light">#health #training #exercise</h4>
						</div>
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i>
							<h4 class="white light">To enjoy the glow of good health, you must exercise.</h4>
							<h4 class="light-white light">#health #training #exercise</h4>
						</div>
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i>
							<h4 class="white light">To enjoy the glow of good health, you must exercise.</h4>
							<h4 class="light-white light">#health #training #exercise</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal 1  Register -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign Up</h3>
				<form action="/register" class="popup-form">
					<input type="text" class="form-control form-white" placeholder="Full Name">
					<input type="text" class="form-control form-white" placeholder="Email Address">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="None" id="squaredOne" name="check" required="true"/>
							<label for="squaredOne"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
						</div>
					</div>
					<button type="submit" class="btn btn-submit">Register</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal 2 Login -->
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="green">Sign in</h3>
				<form action="/login" class="popup-form">
					<input type="text" class="form-control form-white" name="username" placeholder="User Name">
					<input type="password" class="form-control form-white" name="password">
					<button type="submit" style="background-color: lightgrey" class="btn btn-submit">Login</button>
				</form>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Last Games Visited</h3>
<!-- 					<h5 class="light regular light-white">Shape your body and improve your health.</h5> -->
<!-- 					<a href="#" class="btn btn-blue ripple trial-button">Start Free Trial</a> -->
				</div>
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Opening Hours <span class="open-blink"></span></h3>
					<div class="row opening-hours">
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Mon - Fri</h5>
							<h3 class="regular white">9:00 - 22:00</h3>
						</div>
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Sat - Sun</h5>
							<h3 class="regular white">10:00 - 18:00</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row bottom-footer text-center-mobile">
				<div class="col-sm-8">
					<p>&copy; 2016 Rafael Lachica Garrido. Powered by <a href="http://www.phir.co/">PHIr</a> exclusively for <a href="http://tympanus.net/codrops/">Codrops</a></p>
				</div>
				<div class="col-sm-4 text-right text-center-mobile">
					<ul class="social-footer">
						<li><a href="https://github.com/rafaellg8/gameScrapping"><i class="fa fa-github"></i></a></li>
						<li><a href="http://www.twitter.com/rafaellg8"><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://plus.google.com/u/0/103749564663167226601/posts"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	<!-- Scripts -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/typewriter.js"></script>
	<script src="js/jquery.onepagenav.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
