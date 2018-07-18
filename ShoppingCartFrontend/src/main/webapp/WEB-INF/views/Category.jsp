<html>
<body>
<%@include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3 align="center">Add Category</h3>
<form action="<c:url value="/insertCategory" />" method="post">
	
<table align="center" class="table table-hover table-condensed" style="width: 50%;">	
	<tr class="success">
		<td colspan="2" align="center"><label id="tableHeader">Add Category</label></td>
	</tr>
	<tr>
		<td><label for="catname">Category Name:</label></td>
		<td><input type="text" id="catname" name="catname" required/></td>
	</tr>
	<tr>	
		<td><label for="catDesc">Category Description:</label></td>	
		<td><input type="text" id="catDesc" name="catDesc" required/></td>
	</tr>
	<tr> 
		<td align="center">	<input type="submit" value="Insert" class="btn btn-success" /></td>
		<td align="center">	<input type="reset" value="Reset" class="btn btn-warning"/></td>
	</tr>
</table>

</form>
<table align="center" class="table table-striped table table-hover table-condensed"  style="width: 50%;">
	<thead>
	<tr align="center" class="success">
		<th>Category ID</th>
		<th>Category Name</th>
		<th>Category Desc</th>
		<th>Action</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${listCategories}" var="category">
	<tr>
		<td>${category.categoryId}</td>
		<td>${category.categoryName}</td>
		<td>${category.categoryDesc}</td>
		<td><a href="editCategory/${category.categoryId}">Edit</a>&nbsp;/&nbsp;<a href="deleteCategory/${category.categoryId}">Delete</a></td>
	</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>