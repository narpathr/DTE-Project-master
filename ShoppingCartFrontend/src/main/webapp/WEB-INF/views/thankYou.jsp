<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="resources/css/basicStyles.css">
<title>Confirm Order</title>
</head>
<body class="bg">
	<div class="container">
	<c:url value="/thankYou" var="actionString"></c:url>
		<div class="panel panel-success">
			<div class="panel-heading">
        		<div class="panel-title">Congratulations ${nameOfUser}!</div>
        	</div>
        	<div class="panel-body">
        		<h3 align="center" class="well">You have placed your order successfully.</h3>        		
        		<p align="center">Your Order Id is <b>${orderId}</b>.</p>
        		<p> Your order will be delivered at <b>${shippingAddress}</b> within 7 business days. The below table provides you the supplier details.</p>
        		
        		<table align="center" class="table table-condensed table-responsive" style="width:60%">
        		<tr>
        			<td colspan="2" align="center" class="success"><b>Supplier Details</b></td>
        		</tr>
        		<tr>
        			<td align="center"><b>Product Name</b></td>
        			<td align="center"><b>Supplier Details</b></td>
        		</tr>
        		<c:forEach items="${productSupplierMap}" var="details">
        			<tr>
        				<td>${details.key}</td>
        				<td>${details.value}</td>
        			</tr>
        		</c:forEach>
        		</table>
        		<h3 align="center" class="well">Please visit again.</h3>
        	</div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>