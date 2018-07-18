<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Add Supplier</title>
</head>
<body class="bg">
	<div class="container">
		<div id="signupbox"	class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">Add Supplier</div>
				</div>
			<div class="panel-body">
				<c:url value="/addSupplier" var="actionString" />
					<form:form id="addSupplierForm" cssClass="form-horizontal" modelAttribute="supplier" method="POST" action="${actionString}">
						<div id="signupalert" style="display: none" class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>
						<label for="supplierName" class="col-md-3 control-label">Name of the Supplier</label>
						<div style="margin-bottom: 25px" class="input-group">								
							<span class="input-group-addon"><i class="fa fa-truck"></i></span>
							<form:input cssClass="form-control" path="supplierName" required="true"/>
						</div>
	
						<label for="mobile" class="col-md-3 control-label">Mobile</label>
						<div style="margin-bottom: 25px" class="input-group">								
							<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
							<form:input cssClass="form-control" path="supplierMobileNo" required="true"/>
						</div>
					
						<div class="form-group">
							<div class="col-md-offset-3 col-md-9">
								<input type="submit" id="btn-signup" class="btn btn-success icon-hand-right" value="Add Supplier" />
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>
