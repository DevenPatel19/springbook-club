<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<title>Read Share</title>
</head>
<body>
	<div class="container mt-5">
	<h3><c:out value="${oneBook.title}"></c:out></h3>
	<a href="/dashboard">back to the shelves</a>
	
	<h5><c:out value="${oneBook.user.userName}"/> read <c:out value="${oneBook.title}" /> by <c:out value="${oneBook.author}" />.</h5>
	<h5>Here are <c:out value="${oneBook.user.userName}" /> thoughts.</h5>
		<br>
		<c:out value="${oneBook.thoughts}"/>
		<br>
		
		<a href="/books/${oneBook.id}/edit" class="btn btn-warning">Edit</a>
		
		<form action="/books/${oneBook.id}" method="post">
			<input type="hidden" name="_method" value="delete" />
			<button style="display:inline;" type="submit" class="btn btn-danger">Delete</button>
		</form>
	</div>
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>