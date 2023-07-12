<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome, <c:out value="${user.userName}"/></h1>
	<h3>One Piece Pirate Action Figures</h3>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Role</th>
				<th scope="col">Pirate Crew</th>
				<th scope="col">Bounty</th>
				<th scope="col">Devil Fruit Ability</th>
			</tr>
			 </thead>
			<c:forEach var="pirate" items="${pirates}">
			
				<tr>
					<td><a href="pirates/${pirate.id}"> <c:out value="${pirate.name}"/></a></td>
					<td> Role: <c:out value="${pirate.role}"/></td>
					<td> Crew: <c:out value="${pirate.crew}"/></td>
					<td> Bounty: <c:out value="${pirate.bounty}"/></td>
					<td> Devil Fruit Ability: <c:out value="${pirate.ability}"/></td>
				</tr>
			</c:forEach>
		
		</table>
		<div class="btn-group">
		<a href="/addPage" class="btn btn-outline-success">Create New Pirate</a>
		<a href="/logout" class="btn btn-outline-danger">logout</a>
		<a href="/paypal" class="btn btn-outline-danger">Buy Figure</a>
		
		</div>
</div>
</body>
</html>