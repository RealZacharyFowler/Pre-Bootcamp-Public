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
<div>
<h1><c:out value="${pirate.name}"/></h1>
</div>
<hr />
<h4>Role: <c:out value="${pirate.role }"/></h4>
<h4>Bounty: <c:out value="${pirate.bounty}"/></h4>
<h4>Crew: <c:out value="${pirate.crew}"/></h4>
<h4>Devil Fruit Ability: <c:out value="${pirate.ability}"/></h4>
<hr />
<div>
<c:if test = "${pirate.user.id==userId}">
<div class="btn-group">
			<h2><a href="/home" class="btn btn-outline-success">Home</a></h2>
    		<h2><a href="/edit/${pirate.id}" class="btn btn-outline-warning">Edit Pirate</a></h2>
    		<h2><a href="/delete/${pirate.id}" class="btn btn-outline-danger">Delete Pirate</a></h2>
  </div>
		</c:if>
</div>

</body>
</html>