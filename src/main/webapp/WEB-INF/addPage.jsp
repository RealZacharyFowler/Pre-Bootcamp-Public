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
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
  <div class="container-fluid">
    <h1 class="navbar-brand">One Piece Pirates</h1>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarDark" aria-controls="navbarDark" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
          <form class="d-flex">
        <a href="/home" class="btn btn-outline-success">Home</a>
        <a href="/logout" class="btn btn-outline-danger">logout</a>
      </form>
    </div>
  </div>
</nav>

<div class="container">
<h1>New Pirate
<small class="text-muted">Make your own One piece Pirate!</small>
</h1>
		<form:form action="/pirates" modelAttribute="pirate" class="form p-3 mb-2 bg-dark text-white " method="post">
		
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
			
			<div class="form-row" >
				<input type="submit" value="Submit" class="btn btn-primary"/>
			</div>
			
		</form:form>
	</div>
</div>

</body>
</html>