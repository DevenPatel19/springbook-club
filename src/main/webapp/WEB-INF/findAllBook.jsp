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
	<div class="container mt-5 ">
		<p><h1> Welcome, <c:out value="${userName}" /></h1><a href="/logout">logout</a></p>
		
	
		<div class="container mt-5">
			<h5 style="display: inline;">Books from everyone's shelves:</h5>
			<a href="/books/new">+ Add a to my shelf!</a>
		</div>
		
		<table class="table table-bordered table-striped mt-5">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachBook" items="${allBook}">
					<tr>
						<td>${eachBook.id}</td>
						<td><a href="/books/${eachBook.id}"><c:out value="${eachBook.title}"/></a></td>
						<td><c:out value="${eachBook.author}"/> </td>
						<td><c:out value="${eachBook.user.userName}"/> </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>