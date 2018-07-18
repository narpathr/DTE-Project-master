<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/basicStyles.css">
<title>Confirm Order</title>
<script type="text/javascript">

function copyBillingAddress() {
	var isChecked = document.getElementById("shippingAndBilling").value;
	if(isChecked==1) {
		document.getElementById("billingAddr").value = document.getElementById("shippingAddr").value;
	}
	else {
		document.getElementById("billingAddr").value = null;
	}		
}

</script>
</head>
<body class="bg">
	<div class="container">
	<c:url value="/thankYou" var="actionString"></c:url>
	<form:form action="${actionString}" modelAttribute="order" cssClass="form-horizontal">
	<div id="signupbox"	class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">
		<div class="panel panel-success">
			<div class="panel-heading">
        		<div class="panel-title">Please confirm your order</div>
        	</div>
        	<div class="panel-body">
					
			<table class="table table-hover table-condensed table-responsive">
				<tr  align="center">
					<td>Product</td>
					<td>Quantity</td>
					<td>SubTotal</td>
					<td colspan="2">Action</td>
				</tr>				
				<c:forEach items="${cartList}" var="cart">
					<c:set var = "productIdFromCart" value = "${cart.productId}"/>
					<c:forEach items="${productDetails}" var="prod">
						<c:set var = "productIdFromProductList" value = "${prod.key}"/>
						<c:if test="${productIdFromCart==productIdFromProductList}">
							<c:set var="productName" value="${prod.value}" />
						</c:if>
					</c:forEach>
					<tr>
						<td>${productName}</td>
						<td align="right">${cart.quantity}</td>
						<td align="right">Rs.${cart.subTotal}</td>
						<c:url value="/editCart/${cart.cartItemId}" var="editString"></c:url>
						<c:url value="/deleteCart/${cart.cartItemId}" var="deleteString"></c:url>
						<td align="right"><a href="${editString}"><img src="resources/images/bgImages/edit.png" alt="Edit"/></a></td>
						<td><a href="${deleteString}"><img src="resources/images/bgImages/delete.png" alt="Delete"/></a></td>
					</tr>
				</c:forEach>
					<tr align="right">
					<td colspan="3" align="right"><b>Grand Total</b></td>
					<td colspan="1" align="right"><b>${grandTotal}</b></td>
					</tr>
			</table>
			<div class="well">
				Payment Options
			</div>
			<label for="transactionType" class="col-md-4 control-label">Choose your payment method</label>
			
    			<div class="form-group">
    				<div class="col-lg-6">
      					<div class="radio radio-success beautiful">
        					<form:radiobutton name="transactionType" path="transactionType" value="CC" />Credit Card
      					</div>
      					<div class="radio radio-success beautiful">
      						<form:radiobutton name="transactionType" path="transactionType" value="DC" />Debit Card
      					</div>
      					<div class="radio radio-success beautiful">
      						<form:radiobutton name="transactionType" path="transactionType" value="eW" />e-Wallets
      					</div>
      					<div class="radio radio-success beautiful">
      						<form:radiobutton name="transactionType" path="transactionType" value="COD" />Cash On delivery
      					</div>
    				</div>
  				</div>	
  				
  				<label for="address" class="col-md-4 control-label">Shipping Address</label>
				<div style="margin-bottom: 25px" class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-tasks"></i></span>
					<form:textarea id="shippingAddr" path="shippingAddress" rows="5" cols="15" cssClass="form-control" required="true" placeholder="Please specify where your order is to be delivered"/>
				</div>
  				
  				<div class="input-group">
                	<div class="checkbox" style="margin-bottom: 25px">
                    	<label>
                        	<input id="shippingAndBilling" type="checkbox" name="remember" value="1" onclick="copyBillingAddress();"> Both shipping address and billing address are the same.
                        </label>
                    </div>
                 </div>
  				
  				<label for="address" class="col-md-4 control-label">Billing Address</label>
				<div style="margin-bottom: 25px" class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-tasks"></i></span>
					<form:textarea id="billingAddr" path="billingAddress" rows="5" cols="15" cssClass="form-control" required="true" placeholder="Please specify the billing address"/>
				</div>				
				
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-9">
					<input type="submit" value="Proceed to checkout" class="btn btn-lg btn-primary btnAlign"/>	
				</div>
			</div>
			</div>
		</div>			
	</form:form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>