<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<link type = "text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
	
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2> CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		<!-- Add Customer button -->
		
		<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button"/>
		
		<form:form action="search" method="GET">
			Search customer:<input type="text" name="theSearchName" placeholder="search by name"/>
			<input type="submit" value="Search" class="add-button"/>
		</form:form>
		
		<!-- add our html table here -->
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<!-- loop over and print customers, construct an "update" link with customer id -->
			
				
				<c:forEach var="tempCustomer" items="${customers}">
				
				<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
					
					<!-- construct a "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/deleteCustomer">
						<c:param name="customerId" value="${tempCustomer.id}"/>
					</c:url>
					
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td>
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this?'))) return false">Delete</a>
						</td>
						
					</tr>
					</c:forEach>
					
			</table>
		<p>
		<a href="${pageContext.request.contextPath}/customer/list">Back to List</a>
		</p>
		</div>
	
	</div>

</body>
</html>