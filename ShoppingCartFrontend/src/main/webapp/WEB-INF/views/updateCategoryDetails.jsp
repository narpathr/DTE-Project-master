<html>
<head>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<title>View Categories</title>
	<style>
	.bg { 
    	background-image: url("../resources/images/bgImages/Final.jpg"), url("resources/images/bgImages/Final.jpg");
    	height: 100%; 
    	background-position: center;
    	background-repeat:repeat-y;
    	background-size: cover;
	}
	</style>
</head>
<body class="bg">
<div class="container">
<div id="loginbox" class="mainbox col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 margin50">
	<div class="panel panel-success table-responsive" >
		<div class="panel-heading">
       		<div class="panel-title">Available categories</div>
        </div>
        <div style="padding-top:30px;" class="panel-body">
			<table class="table table-striped table table-hover table-condensed">
				<thead>
				<tr align="center">
					<th>Category ID</th>
					<th>Category Name</th>
					<th>Category Description</th>
					<th colspan="2">Action</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listCategories}" var="category">
				<tr>
					<td class="tableTextvAlign">${category.categoryId}</td>
					<td class="tableTextvAlign">${category.categoryName}</td>
					<td class="tableTextvAlign">${category.categoryDesc}</td>
					<td><a href="<c:url value="editCategory/${category.categoryId}" />" ><img src="resources/images/bgImages/edit.png" alt="Edit" onerror="this.src='../resources/images/bgImages/edit.png';"/></a></td>
					<td><a href="<c:url value="deleteCategory/${category.categoryId}" />" ><img src="resources/images/bgImages/delete.png" alt="Delete" onerror="this.src='../resources/images/bgImages/delete.png';"/></a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>