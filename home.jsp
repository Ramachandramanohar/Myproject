<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>my shoping cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>


<!-- <meta http-equiv="refresh" content="0; URL=./onLoad" /> -->
<spring:url value="resources/menu.css" var="menuCSS" />
<link href="${menuCSS}" rel="stylesheet" />
<title>Shopping Cart</title>

<style>
h1 {
	text-align: center;
	font-size: 30px;
	text-decoration: underline;
}

p {
	text-align: center;
	font-size: 40px;
	text-decoration: underline;
}
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
	font-style: oblique;
	font-stretch: narrower;
	font-family: cursive;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #555;
	color: lime;
	padding: 2px;
}

#head {
	color: blue
}
/* Main */
#menu {
	width: 100%;
	margin: 0;
	padding: 10px 0 0 0;
	list-style: none;
	background-color: #111;
	background-image: linear-gradient(#444, #111);
	border-radius: 50px;
	box-shadow: 0 2px 1px #9c9c9c;
}

#menu li {
	float: left;
	padding: 0 0 10px 0;
	position: relative;
}

#menu a {
	float: left;
	height: 25px;
	padding: 0 25px;
	color: #999;
	text-transform: uppercase;
	font: bold 12px/25px Arial, Helvetica;
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}

#menu li:hover>a {
	color: #fafafa;
}

* html #menu li a:hover { /* IE6 */
	color: #fafafa;
}

#menu li:hover>ul {
	display: block;
}

/* Sub-menu */
#menu ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: none;
	position: absolute;
	top: 35px;
	left: 0;
	z-index: 99999;
	background-color: #444;
	background-image: linear-gradient(#444, #111);
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#menu ul li {
	float: none;
	margin: 0;
	padding: 0;
	display: block;
	box-shadow: 0 1px 0 #111111, 0 2px 0 #777777;
}

#menu ul li:last-child {
	box-shadow: none;
}

#menu ul a {
	padding: 10px;
	height: auto;
	line-height: 1;
	display: block;
	white-space: nowrap;
	float: none;
	text-transform: none;
}

* html #menu ul a { /* IE6 */
	height: 10px;
	width: 150px;
}

*:first-child+html #menu ul a { /* IE7 */
	height: 10px;
	width: 150px;
}

#menu ul a:hover {
	background-color: #0186ba;
	background-image: linear-gradient(#04acec, #0186ba);
}

#menu ul li:first-child a {
	border-radius: 5px 5px 0 0;
}

#menu ul li:first-child a:after {
	content: '';
	position: absolute;
	left: 30px;
	top: -8px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 8px solid #444;
}

#menu ul li:first-child a:hover:after {
	border-bottom-color: #04acec;
}

#menu ul li:last-child a {
	border-radius: 0 0 5px 5px;
}

/* Clear floated elements */
#menu:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

* html #menu {
	zoom: 1;
} /* IE6 */
*:first-child+html #menu {
	zoom: 1;
} /* IE7 */
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

#btmanchor a:link {
	color: green;
	text-decoration: none;
	text-align: center;
	font-size: 40px;
}

#btmanchor a:visited {
	color: pink;
	text-decoration: none;
	text-align: center;
}

#btmanchor a:hover {
	color: red;
	text-decoration: underline;
	text-align: center;
}

#btmanchor a:active {
	color: yellow;
	text-decoration: underline;
	text-align: center;
}
</style>
</head>
<body>


	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="About.html">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-user"></span> Login</a></li>
					<li><a href="views/register.jsp"><span
							class="glyphicon glyphicon-user"></span> sign up</a></li>
					<li><a href="myCart"><span
							class="glyphicon glyphicon-shopping-cart"></span> My Cart</a></li>
				</ul>
			</div>
		</div>
	</nav>




	<div class="jumbotron">

		<img alt="book image"
			src="<c:url value="/resources/proj.jpg"></c:url>" width="1380"
			height="500" />
		<div class="container text-center">
			<!--  <h1 style="color: lime;">My Book Stack</h1>
			<p style="color: lime;">Battle of the Books</p>-->
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group input-group">
					<input type="text" class="form-control" placeholder="Search..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>

			</form>
		</div>
	</div>



	<p style="color: blue;">Categories</p>
	<hr color="red" size="5">

	<ul id="menu">
		<c:forEach items="${categoryList}" var="category">
			<li><a href=${category.name}>${category.name}</a>
				<ul>
					<c:forEach items="${category.products}" var="product">

						<li><a href="<c:url value='product/get/${product.id}' />">${product.name}</a></li>

					</c:forEach>

				</ul></li>
		</c:forEach>

	</ul>
	<hr color="red" size="5">
	<br>
	<br>
	<br>



	<div class="container" ng-app="myapp" ng-controller="MyController">

		<c:if test="${!empty selectedProduct.name}">

			<table class="table table-bordered table-striped">

				<thead>
					<tr>
						<td><a href="#"
							ng-click="sortType = 'pId'; sortReverse = !sortReverse">
								<h4 color="black">ProductId</h4> <span
								ng-show="sortType == 'pId' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'pId' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>

						<td><a href="#"
							ng-click="sortType = 'pName'; sortReverse = !sortReverse">
								<h4 color="black">ProductName</h4> <span
								ng-show="sortType == 'pName' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'pName' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>
						<td><a href="#"
							ng-click="sortType = 'pDescription'; sortReverse = !sortReverse">
								<h4 color="black">Description</h4> <span
								ng-show="sortType == 'pDescription' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'pDescription' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>
						<td><a href="#"
							ng-click="sortType = 'price'; sortReverse = !sortReverse">
								<h4 color="black">Price</h4> <span
								ng-show="sortType == 'Price' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'Price' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>
						<td><a href="#"
							ng-click="sortType = 'price'; sortReverse = !sortReverse">
								<h4 color="black">Category</h4> <span
								ng-show="sortType == 'Price' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'Price' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>

						<td><a href="#"
							ng-click="sortType = 'price'; sortReverse = !sortReverse">
								<h4 color="black">Supplier</h4> <span
								ng-show="sortType == 'Price' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'Price' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>
						<td><a href="#"
							ng-click="sortType = 'price'; sortReverse = !sortReverse">
								<h4 color="black">Buy</h4> <span
								ng-show="sortType == 'Price' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'Price' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>





					</tr>
				</thead>

				<tbody>





					<tr
						ng-repeat="roll in Products | orderBy:sortType:sortReverse | filter:searchPname">


					</tr>
					<tr>
						<td align="left">${selectedProduct.id}</td>
						<td align="left">${selectedProduct.name}</td>
						<td align="left">${selectedProduct.description}</td>
						<td align="left">${selectedProduct.price}</td>
						<td align="left">${selectedProduct.category.name}</td>
						<td align="left">${selectedProduct.supplier.name}</td>
						<td align="left"><a href="<c:url value='pay/${cart.id}' />">
								<button type="button" class="btn btn-primary">Add to
									cart</button>
						</a></td>
					</tr>


					</c:if>

				</tbody>


			</table>
	</div>

	<div id="displayCart">
		<c:if test="${displayCart==true}">

			<table>
				<tr>
					<th align="left" width="80">Cart ID</th>
					<th align="left" width="120">Product Name</th>
					<th align="left" width="200">Quantity</th>
					<th align="left" width="80">Price</th>
					<th align="left" width="60">Delete from Cart</th>

				</tr>
				<c:forEach items="${cartList}" var="cart">
					<tr>
						<td align="left">${cart.id}</td>
						<td align="left">${cart.productName}</td>
						<td align="left">${cart.quantity}</td>
						<td align="left">${cart.price}</td>
						<td align="left"><a
							href="<c:url value='/cart/delete/${cart.id}'  />">Delete</a></td>
						<td align="left"><a href="<c:url value='pay/${cart.id}' />">
								<button type="button" class="btn btn-success">Proceed</button>
						</a></td>
					</tr>
				</c:forEach>

			</table>

			<h2>Total cost : ${totalAmount}</h2>
			<%-- <a href="<c:url value='/pay/${cart.userID}'/>">Proceed</a>  --%>
			<a href="<c:url value='/pay/${cart.id}'/>">Proceed</a>
		</c:if>
	</div>


	<hr color="red" size="5">

	<div id=btmanchor>


		<center>
			<a href="prod?name=Allpro" target="_blank">All products</a>
		</center>
	</div>



	<a href="prod?name=LetUsC"> <img
		src=<c:url value="/resources/images/book1.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>
	<a href="prod?name=C++"> <img
		src=<c:url value="/resources/images/book2.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>
	<a href="prod?name=Java"> <img
		src=<c:url value="/resources/images/book3.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />

	</a>
	<a href="prod?name=CO"> <img
		src=<c:url value="/resources/images/book4.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>
	<a href="prod?name=FLAT"> <img
		src=<c:url value="/resources/images/book5.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>
	<a href="prod?name=Networks"> <img
		src=<c:url value="/resources/images/book9.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>
	<a href="prod?name=Database"> <img
		src=<c:url value="/resources/images/book7.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>
	<a href="prod?name=DLD"> <img
		src=<c:url value="/resources/images/book8.jpg"/> class="img-circle"
		alt="Cinque Terre" width="300" height="236" />
	</a>

	<div id=btmanchor></div>



	<footer class="container-fluid text-center">
		<p>@MY BOOK STACK!!!!</p>
	</footer>
</body>
</html>