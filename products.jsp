<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>



<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>



<style type="text/css">
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>


</head>
<body>



	<table class="table table-condensed" border="1" style="width: 100%">

		<tr>
			<td>pId</td>
			<td>name</td>
			<td>Description</td>
			<td>Price</td>

		</tr>
		<tr>
			<td>${pId}</td>
			<td>${name}</td>
			<td>${price}</td>
			<td>${Description}</td>
		</tr>

	</table>
</body>
</html>