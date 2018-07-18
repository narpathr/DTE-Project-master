<html>
<head>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<title>Suppliers List</title>
</head>
<body class="bg">
<form:form>
	<div class="container"> 
		<div id="loginbox" class="mainbox col-md-12 col-sm-12 margin50">
			<div class="panel panel-success" >
				<div class="panel-heading">
		       		<div class="panel-title">List of suppliers</div>
		        </div>
		        <div style="padding-top:10px;" class="panel-body">
					<table class="table table-striped table table-hover table-condensed table-responsive">
						<thead>
						<tr align="center" class="tableTextvAlign">
							<th>Supplier Id</th>
							<th>Name of the Supplier</th>
							<th>Mobile No.</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${supplierList}" var="supplier">
						<tr>
							<td class="tableTextvAlign">${supplier.supplierId}</td>
							<td class="tableTextvAlign">${supplier.supplierName}</td>
							<td class="tableTextvAlign">${supplier.supplierMobileNo}</td>
							<td><a href="<c:url value="editSupplierDetails/${supplier.supplierId}" />" class="btn btn-success" role="button">Edit</a>&nbsp;&nbsp;<a href="<c:url value="deleteSupplierDetails/${supplier.supplierId}" />" class="btn btn-warning" role="button">Delete</a></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>	
	</div>
</form:form>
<%@include file="footer.jsp" %>	
</body>
</html>