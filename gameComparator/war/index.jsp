<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.gamecomparator.model.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Game Comparator</title>
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
					<!--<li><a href="#pricing">Pricing</a></li>-->
					<li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign Up</a></li>
					<li><a href="#" data-toggle="modal" data-target="#modal2" class="btn btn-green">Sign In</a></li>
				</ul>
			</div>
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
							<h1 class="white typed">Web Scrapping de videojuegos</h1>
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

	<!-- Modal 1  Register -->
	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign Up</h3>
				<form action="/register" class="popup-form" method="post">
					<input type="text" class="form-control form-white" placeholder="User Name" name="username">
					<input type="email" class="form-control form-white" placeholder="Email Address" name="email">
					<input type="password" class="form-control form-white" name="password">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="register" id="squaredOne" name="check" required="true"/>
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
				<form action="/login" class="popup-form" method="post">
					<input type="text" class="form-control form-white" name="username" placeholder="User Name">
					<input type="password" class="form-control form-white" name="password">
					<button type="submit" style="background-color: lightgrey" class="btn btn-submit">Login</button>
				</form>
			</div>
		</div>
	</div>

	<footer>
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
