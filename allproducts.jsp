<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Collaborative Product Info</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>


<script>
	var app = angular.module('myApp', []);

	function MyController($scope, $http) {

		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.searchPName = ''; // set the default search/filter term

		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'GsonConvert'
			}).success(function(data, status, headers, config) {
				$scope.Products = data;
				alert(data);
			}).error(function(data, status, headers, config) {

			});

		};
	};
</script>

<style>
body {
	padding-top: 50px;
}
</style>
<body>


	<div class="container" ng-app="myApp" ng-controller="MyController">



		<form>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-search"></i>
					</div>
					<input type="text" class="form-control"
						placeholder="Search Product Name" ng-model="searchPname">
					<button ng-click="getDataFromServer()">Fetch Data</button>
				</div>
			</div>
		</form>
		<div ng-init="getDataFromServer();">
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
								<h4 color="black">Manipulation</h4> <span
								ng-show="sortType == 'price' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								ng-show="sortType == 'price' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></td>


					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="roll in Products | orderBy:sortType:sortReverse | filter:searchPname">
						<b><td>{{ roll.pId }}</td> </b>
						<b><td>{{ roll.pName }}</td> </b>
						</b>
						<td>{{ roll.pDescription }}</td>
						</b>
						</b>
						<td>{{ roll.price }}</td>
						</b>
						</b>
						<!-- <a href=""> <input type="submit" value="Edit"></a> &nbsp-->
							<td> </b> <a href=""> <input type="submit" value="Add to cart"></a>
							<!--&nbsp </b> <a href=""> <input type="submit" value="Delete"></a>-->
						</td>
						<!-- <td><a href="MoreInfo">More Info</a></td>  -->
					</tr>
				</tbody>

			</table>
		</div>
		<a href="/webapp/views/home.jsp" class="btn btn-info" role="button">Home</a>

	</div>

</body>
</html>