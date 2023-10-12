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
		<p><a href="/dashboard">back to the shelves</a></p>
		<h1>Add  a Book to Your Shelf!</h1>
		<form:form action="/books/${oneBook.id}/edit" method="PUT" modelAttribute="oneBook" class="form-control">
			<div class="form-group">
				<form:label path="title"> Title: </form:label>
				<form:input path="title" type="text" class="form-control" /> 
				<form:errors path="title" class="text-danger" /> 
			</div>
			<div class="form-group">
				<form:label path="author"> Author: </form:label>
				<form:input path="author"   type="text" class="form-control"/> 
				<form:errors path="author" class="text-danger" /> 
			</div>
			<div class="form-group">
				<form:label path="thoughts"> My thoughts: </form:label>
				<form:textarea path="thoughts" class="form-control" /> 
				<form:errors path="thoughts" class="text-danger" /> 
			</div>
			<form:hidden path="user" />
			<button type="submit" class="btn btn-primary mt-3"> Submit</button>
		</form:form>
		
		
		
	</div>
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>