<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>New Pirate</h1>
<a href="/home">dashboard</a>

<div class="container">
		<form:form action="/edit/${pirate.id}" modelAttribute="pirate" class="form" mode="put">
		
			<div class="form-row">
			 	<form:errors path="name" class="error"/>
				<form:label for="name" path="name">Name:</form:label>
				<form:input type="text" path="name" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="role" class="error"/>
				<form:label for="role" path="role">role:</form:label>
				<form:input type="text" path="role" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="crew" class="error"/>
				<form:label for="crew" path="crew">crew:</form:label>
				<form:textarea path="crew" class="form-control"/>
			</div>
			<div class="form-row">
				<form:errors path="bounty" class="error"/>
				<form:label for="bounty" path="bounty">bounty:</form:label>
				<form:textarea path="bounty" class="form-control"/>
			</div>
			<div class="form-row">
				<form:errors path="ability" class="error"/>
				<form:label for="ability" path="ability">ability:</form:label>
				<form:textarea path="ability" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			
			<div class="form-row">
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
	</div>
</div>

</body>
</html>