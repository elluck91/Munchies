<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList, org.elluck91.munchies.Product"%>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<link rel = "icon" href = "./img/MunchiesLogo.jpg">
	<title>Munchies</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
	<!-- HEADER -->
	<header>
		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- Logo -->
					<div class="header-logo">
						<a class="logo" href="index.jsp">
							<img src="./img/MunchiesLogoCrop.jpg" alt="">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Search -->
					<div class="header-search">
						<form>
							<input class="input search-input" type="text" placeholder="Enter your keyword">
							<select class="input search-categories">
								<option value="0">All Categories</option>
								<option value="1">Beverages</option>
								<option value="1">Baking</option>
								<option value="1">Breakfast & Cereal</option>
								<option value="1">Frozen Food</option>
								<option value="1">Grains & Pasta</option>
								<option value="1">Produce</option>
							</select>
							<button class="search-btn"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /Search -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">My Account<i class="fa fa-caret-down"></i></strong>
							</div>
							<% 
								String username = (String) session.getAttribute("userid");
								if (username == null){
							%>
							<a href="./login.jsp" class="text-uppercase">Login</a> / <a href="./register.jsp" class="text-uppercase">Join</a>
							<ul class="custom-menu">
								<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
								<li><a href="./checkout.jsp"><i class="fa fa-check"></i> Checkout</a></li>
								<li><a href="./login.jsp"><i class="fa fa-unlock-alt"></i> Login</a></li>
								<li><a href="./register.jsp"><i class="fa fa-user-plus"></i> Create An Account</a></li>
							</ul>
							<%
								}else {
							%>
							<a>Hi, <%= request.getSession().getAttribute("userid")%></a>
							<a href = "LogoutAPI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
								
							<ul class="custom-menu">
								<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
								<li><a href="./checkout.jsp"><i class="fa fa-check"></i> Checkout</a></li>
								<li><a href="./TransactionAPI?username=${userid}"><i class="fa fa-book"></i> History</a></li>
							</ul>
							<% }%>
						</li>
						<!-- /Account -->	

						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<%
										if (request.getSession().getAttribute("cart") == null){
									%>
									<span class="qty">0</span>
									<% 
										}else {
									%>
									<!--add quanitity iterator-->
									<c:set var = "quantity" value = "0"/>
									<c:forEach items = "${cart.getProductList()}" var = "record">
										<c:set var = "quantity" value = "${quantity+record.getProduct_quantity()}"/>
									</c:forEach>
									<span class="qty"><c:out value = "${quantity}"/></span>
									<%} %>
								</div>
								<strong class="text-uppercase">My Cart:</strong>
								<br>
								<%
									if (request.getSession().getAttribute("cart") == null){
								%>
								<span>$0.00</span>
									<%
									}else {
									%>
									<c:set var = "total" value = "0.00"/>
									<c:forEach items = "${cart.getProductList()}" var = "record">
										<c:set var = "total" value = "${total + record.getProduct_price()*record.getProduct_quantity()}"/>
									</c:forEach>
									<span>$<c:out value = "${total}"/></span>
									<%}%>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
										<%
											if (request.getSession().getAttribute("cart") != null){
										%>
										<c:forEach items = "${cart.getProductList()}" var = "product">
											<div class="product product-widget">
												<div class="product-thumb">
													<img src= "${product.getProduct_img()}" alt="nope">
												</div>
												<div class="product-body">
													<h3 class="product-price"><a href="#"><c:out value = "${product.getProduct_uniquename()}"/></a></h2>
													<h2 class="product-name">price: $<span class="qty"><c:out value = "${product.getProduct_price()}"/></span></h3>
												</div>
												<form action="CartAPI" method = "post">
													<input type="hidden" value="delete" name="action">
													<input type="hidden" value="${product.getProduct_id() }" name="product_id">
													<input name="page" type="hidden" value="index">
													<button class="cancel-btn" type = "submit"><i class="fa fa-trash"></i></button>
												</form>
											</div>
										</c:forEach>
										<%}else{%>
										<div class="product product-widget">
											<div class="product-thumb">
												<img src="./img/thumb-product01.jpg" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-price"><span class="qty"></span></h3>
												<h2 class="product-name"><a href="#">Cart is Empty</a></h2>
											</div>
											<button class="cancel-btn"><i class="fa fa-trash"></i></button>
										</div>
										<%}%>
									</div>
									<div class="shopping-cart-btns">
										<button class="main-btn">View Cart</button>
										<a href = "./checkout.jsp" button class="primary-btn" >Checkout <i class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
						</li>
						<!-- /Cart -->

						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- category nav -->
				<div class="category-nav show-on-click">
					<div class="category-nav">
						<span class="category-header">Categories <i class="fa fa-list"></i></span>
						<ul class="category-list">			
								<li class="dropdown side-dropdown">
									<a class="dropdown-toggle" href = "./CategoryAPI?category=beverages">Beverages<i class="fa fa-angle-right"></i></a>
								</li>
								<li class="dropdown side-dropdown">
									<a class="dropdown-toggle" href = "./CategoryAPI?category=baking">Baking<i class="fa fa-angle-right"></i></a>
								</li>
							
								<li class="dropdown side-dropdown">
									<a class="dropdown-toggle" href = "./CategoryAPI?category=breakfast">Breakfast & Cereal<i class="fa fa-angle-right"></i></a>
								</li>
							
								<li class="dropdown side-dropdown">
									<a class="dropdown-toggle" href = "./CategoryAPI?category=frozenfood">Frozen Foods<i class="fa fa-angle-right"></i></a>
								</li>
							
								<li class="dropdown side-dropdown">
									<a class="dropdown-toggle" href = "./CategoryAPI?category=grain&pasta">Grains & Pasta<i class="fa fa-angle-right"></i></a>
								</li>
							
								<li class="dropdown side-dropdown">
									<a class="dropdown-toggle" href = "./CategoryAPI?category=produce">Produce<i class="fa fa-angle-right"></i></a>
								</li>
						</ul>
					</div>
				</div>	
			</div>
				<!-- /category nav -->

				<!-- menu nav -->
				<div class="menu-nav">
					<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="./index.jsp">Home</a></li>
					</ul>
				</div>
				<!-- menu nav -->
			</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->

	<!-- HOME -->
	<div id="home">
		<!-- container -->
		<div class="container">
			<!-- home wrap -->
			<div class="home-wrap">
				<!-- home slick -->
				<div id="home-slick">
					<!-- banner -->
					<div class="banner banner-3" height = "400">
						<img src="./img/foodbanner1.jpeg" alt="" >
						<div class="banner-caption text-center">
							<h1 class = "white-color">Sale</h1>
							<h1 class="white-color font-weak">Up to 10% OFF</h1>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-3">
						<img src="./img/foodbanner2.jpg" alt="">
						<div class="banner-caption text-center">
							<h1 class="white-color">HOT DEAL<br><span class="white-color font-weak">Up to 50% OFF</span></h1>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
					<!-- /banner -->

					<!-- banner -->
					<div class="banner banner-3">
						<img src="./img/foodbanner3.jpg" alt="">
						<div class="banner-caption text-center">
							<h1 class="white-color">New Product <span>Collection</span></h1>
							<button class="primary-btn">Shop Now</button>
						</div>
					</div>
					<!-- /banner -->
				</div>
				<!-- /home slick -->
			</div>
			<!-- /home wrap -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOME -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1" href="./CategoryAPI?category=produce">
						<img src="./img/fruit.jpg" alt="">
						<div class="banner-caption text-center">
							<h1 class="white-color font-weak">Fresh Produce</h2>
						</div>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-sm-6">
					<a class="banner banner-1 " href="./CategoryAPI?category=beverages">
						<img src="./img/wine.jpg" alt="">
						<div class="banner-caption text-center">
							<h1 class="white-color font-weak">New Collection</h2>
						</div>
					</a>
				</div>
				<!-- /banner -->

				<!-- banner -->
				<div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-3">
					<a class="banner banner-1" href="./CategoryAPI?category=grain">
						<img src="./img/Heinz.png" alt="">
						<div class="banner-caption text-center">
							<h1 class="white-color font-weak">Discounted Prices</h2>
						</div>
					</a>
				</div>
				<!-- /banner -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section-title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title"></h2>
						<div class="pull-right">
							<div class="product-slick-dots-1 custom-dots"></div>
						</div>
					</div>
				</div>
				<!-- /section-title -->
	<!-- FOOTER -->
	<footer id="footer" class="section section-grey">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<!-- footer logo -->
						<div class="footer-logo">
							<a class="logo" href="#">
		            <img src="./img/MunchiesLogo.jpg" alt="">
		          </a>
						</div>
						<!-- /footer logo -->
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer widget -->
				<% 
					if (username == null){
				%>
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">My Account</h3>
						<ul class="list-links">
							<li><a href="./login.jsp">Login</a></li>
							<li><a href="./register.jsp">Register</a></li>
						</ul>
					</div>
				</div>
				<%} else {%>
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">My Account</h3>
						<ul class="list-links">
							<li><a href="#">My Account</a></li>
							<li><a href="./checkout.jsp">Checkout</a></li>
							<li><a href="./TransactionAPI?username=${userid}">History</a></li>
						</ul>
					</div>
				</div>
				<%}%>
				<!-- /footer widget -->

				<div class="clearfix visible-sm visible-xs"></div>

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">Customer Service</h3>
						<ul class="list-links">
							<li><a href="#">About Us</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<!-- /footer widget -->
			</div>
			<!-- /row -->
			<hr>
			<!-- row -->
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<!-- footer copyright -->
					<div class="footer-copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<!-- /footer copyright -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</footer>
	<!-- /FOOTER -->
	
	<script type = "text/javascript">
		function submitMe() 
		{ 
			document.MyForm.action="http://www.ugs.com/"; 
			document.MyForm.target="targetName"; 
			document.MyForm.submit(); 
			return; 
		}
	</script>
	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
