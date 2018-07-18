<html>
<head>	
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>	
	<title>Update Supplier Details</title>
	<style type="text/css">
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
<c:url value="/updateSupplier" var="actionString" />
<div class="container">
<form:form action="${actionString}" modelAttribute="supplier" method="POST" >
<div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
	<div class="panel panel-success" >
    	<div class="panel-heading">
        	<div class="panel-title">Update Supplier Details</div>
    	</div>
		<div class="panel-body">
			<label for="supplierId" class="col-md-3 control-label">Supplier	ID</label>
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
				<form:input cssClass="form-control" path="supplierId" readonly="true" />
			</div>

			<label for="supplierName" class="col-md-3 control-label">Name of the Supplier</label>
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i class="fa fa-truck"></i></span>
				<form:input cssClass="form-control" path="supplierName" required="true" />
			</div>

			<label for="mobile" class="col-md-3 control-label">Mobile</label>
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
				<form:input cssClass="form-control" path="supplierMobileNo" required="true" />
			</div>

			<div class="form-group">
				<div class="col-md-offset-3 col-md-9">
					<input type="submit" value="Update Supplier Details" class="btn btn-success" id="btn-updateSupplier"/>
				</div>
			</div>
			
		</div>
	</div>
</div>
</form:form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>