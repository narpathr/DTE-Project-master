<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>
<title>Cart Page</title>
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
	<div class="panel panel-success">
		<div class="panel-heading">
        	<div class="panel-title">Your Cart</div>
        </div>
        <div class="panel-body">
        <c:if test="${empty cartList}">
        	<h3 align="center">Your Cart is empty!</h3>
        	<a style="align:center;" href="viewProducts" class="btn btn-primary" role="button">Continue Shopping</a>        
        </c:if>
        <c:if test="${not empty cartList}">
		<c:url value="/confirmOrder" var="actionString"></c:url>
		<form:form action="${actionString}">
			<table class="table table-hover table-condensed" style="width: 90%;">				
				<c:forEach items="${cartList}" var="cart">
					<c:set var = "productIdFromCart" value = "${cart.productId}"/>
					<c:forEach items="${productDetails}" var="prod">
						<c:set var = "productIdFromProductList" value = "${prod.key}"/>
						<c:if test="${productIdFromCart==productIdFromProductList}">
							<c:set var="productName" value="${prod.value}" />
						</c:if>
					</c:forEach>
					<tr align="center">
						<td class="tableTextvAlign" rowspan="5">
							<img src="<c:url value="/resources/images/${cart.productId}.jpg"/>" alt="ProductImage" width="100" height="150"/>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2"><b>${productName}</b></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td><b>${cart.quantity}</b></td>
					</tr>
					<tr>
						<td>Sub Total</td>
						<td><b>Rs.${cart.subTotal}</b></td>
					</tr>
					<tr>
					<c:url value="/editCart/${cart.cartItemId}" var="editString"></c:url>
					<c:url value="/deleteCart/${cart.cartItemId}" var="deleteString"></c:url>
					<td align="center"><a href="${editString}"><img src="resources/images/bgImages/edit.png" alt="Edit" onerror="this.src='../resources/images/bgImages/edit.png';"/></a></td>
					<td align="center"><a href="${deleteString}"><img src="resources/images/bgImages/delete.png" alt="Delete" onerror="this.src='../resources/images/bgImages/delete.png';"/></a></td>
					</tr>
				</c:forEach>
					<tr align="right">
					<td colspan="3" align="right"><input type="submit" value="Proceed to checkout" class="btn btn-lg btn-primary"/></td>
					</tr>
			</table>
		</form:form>
		</c:if>
	</div>
	</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>