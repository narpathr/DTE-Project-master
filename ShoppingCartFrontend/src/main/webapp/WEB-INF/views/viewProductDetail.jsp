<html>
<head>	
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>	
	<title>Product Details</title>
<style>
	.bg { 
    	background-image: url("../resources/images/bgImages/Final.jpg");
    	height: 100%; 
    	background-position: center;
    	background-repeat:repeat-y;
    	background-size: cover;
	}
</style>
</head>
<body class="bg">
<div class="container">
<div class="panel panel-success">
		<div class="panel-heading">
        	<div class="panel-title">Your Cart</div>
        </div>
        <div class="panel-body table-responsive">
<c:url value="/addToCart/${product.productId}" var="actionString"></c:url>
<form:form action="${actionString}">
	<table align="center" class="table table-hover table-condensed"  style="width: 90%;">
	<tr align="center">
		<td class="tableTextvAlign" rowspan="7"><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt="ProductImage" width="100" height="100"/> </td>
	</tr>
	<tr>
		<td>Product</td>
		<td><b>${product.productName}</b></td>
	</tr>
	<tr>
		<td>About the product</td>
		<td>${product.prodDesc}</td>
	</tr>
	<tr>	
		<td>Product price</td>
		<td>${product.price}</td>
	</tr>
	<tr>		
		<td>Available Quantity</td>
		<c:set value="${product.stock}" var="stock"></c:set>
		<c:if test="${stock==0}">
			<td>Sorry! Currently this product is out of stock!</td>
		</c:if>
		<c:if test="${stock>0}">
			<td>${product.stock}</td>
		</c:if>
	</tr>
	<tr>
		<td><b>Select quantity here: </b></td>
		<td><select id="selectedQuantity" name="quantity">
			<option value="0">-----Select-----</option>
			<c:forEach items="${quantityValues}" var="quan">
				<option value="${quan.key}">${quan.value}</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="image" id="btn-signup" src="../resources/images/bgImages/cart.png" name="submit" alt="Add to Cart" /></td>
	</tr>			
</table>
</form:form>
</div>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>