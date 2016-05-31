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
	<h1>Cerrando sesion</h1>
	<div class="preloader">
		<img src="img/loader.gif" alt="Preloader image">
		</div>
		<%session.invalidate();
		response.sendRedirect("index.jsp");
		%>
</body>