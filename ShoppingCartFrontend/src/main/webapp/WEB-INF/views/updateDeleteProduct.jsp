<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Update or Delete Product</title>
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
	<form:form modelAttribute="product" method="GET">
	<div id="loginbox" class="mainbox col-md-12 col-sm-8 margin50">
		<div class="panel panel-success" >
			<div class="panel-heading">
	       		<div class="panel-title">Available products</div>
	        </div>
	        <div style="padding-top:30px;" class="panel-body table-responsive">
				<table class="table table-striped table table-hover table-condensed">
					<thead>
					<tr align="center">
						<th>Product Image</th>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Product Desc</th>
						<th>Price</th>
						<th>Stock</th>
						<th>Category</th>
						<th>Supplier ID</th>
						<th colspan="2">Action</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${listProducts}" var="product">
					<tr>
						<td class="tableTextvAlign" align="center"><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt="ProductImage" width="70" height="100"/></td>
						<td class="tableTextvAlign" align="center">${product.productId}</td>
						<td class="tableTextvAlign">${product.productName}</td>
						<td class="tableTextvAlign">${product.prodDesc}</td>
						<td class="tableTextvAlign" align="right">${product.price}</td>
						<td class="tableTextvAlign" align="right">${product.stock}</td>
						<td class="tableTextvAlign" align="right">${product.categoryId}</td>
						<td class="tableTextvAlign" align="center">${product.supplierId}</td>
						<td class="tableTextvAlign" align="center"><a href="<c:url value="editProduct/${product.productId}" />"><img src="resources/images/bgImages/edit.png" alt="Edit" onerror="this.src='../resources/images/bgImages/edit.png';"/></a></td>
						<td class="tableTextvAlign" align="center"><a href="<c:url value="deleteProduct/${product.productId}" />" ><img src="resources/images/bgImages/delete.png" alt="Delete" onerror="this.src='../resources/images/bgImages/delete.png';"/></a></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</form:form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>