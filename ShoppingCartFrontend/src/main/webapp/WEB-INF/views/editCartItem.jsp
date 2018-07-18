<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>
<title>Edit Cart Item</title>
<style>
	.bg { 
    	background-image: url("../resources/images/bgImages/Final.jpg"), url("resources/images/bgImages/Final.jpg");
    	height: 100%; 
    	background-position: center;
    	background-repeat:repeat-y;
    	background-size: cover;
	}
</style>
<script type="text/javascript">

function calculateSubTotal(price){
	var quantity = document.getElementById("selectedQuantity").value;
	document.getElementById("subTotal").value = quantity*price;
}

</script>
</head>
<body class="bg">
<div class="container">
<div class="panel panel-success table-responsive">
	<div class="panel-heading">
       	<div class="panel-title">Edit your cart item</div>
    </div>
    <div class="panel-body table-responsive">
	<c:url value="/updateCart" var="actionString"></c:url>
	<form:form action="${actionString}" modelAttribute="cartItem">
	<form:hidden path="cartItemId"/>
	<form:hidden path="cartId"/>
	<form:hidden path="productId"/>
	<form:hidden path="username"/>
	<form:hidden path="paymentStatus"/>	
				<table class="table table-hover table-condensed">
					<tr align="center">
						<td class="tableTextvAlign" rowspan="7">
							<img src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt="ProductImage" width="100" height="100" />
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2"><b>${product.productName}</b></td>
					</tr>
					<tr>
						<td><b>Select quantity here: </b></td>
						<td><select id="selectedQuantity" name="quantity" onchange="calculateSubTotal(${product.price});" required="required">
								<option value="0">-----Select-----</option>
								<c:forEach items="${quantityValues}" var="quan">
									<option value="${quan.key}">${quan.value}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td><b>Sub Total</b></td>
						<td><form:input id="subTotal" path="subTotal" readonly="readonly" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit" id="btn-signup" class="btn btn-success icon-hand-right" value="Update Cart Item" /></td>
					</tr>
				</table>
			</form:form>
	</div>
</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>