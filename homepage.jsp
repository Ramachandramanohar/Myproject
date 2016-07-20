<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<html>
<head></head>

<body>
	<h1>Welcome come to shopping cart - User</h1>

	<security:authorize access="hasRole('ROLE_USER')">
		You can manage select products and checkout
				<br />
	</security:authorize>

	<security:authorize access="hasRole('ROLE_ADMIN')">
		You can manage products, categories and suppliers
		<br />
	</security:authorize>

	<a href="<c:url value="/j_spring_security_logout" />">Logout</a>

</body>
</html>