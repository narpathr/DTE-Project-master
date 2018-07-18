<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Add New Product</title>
</head>
<body class="bg">
<div class="container">
<c:url value="/insertProduct" var="actionString"></c:url>
<form:form action="${actionString}" modelAttribute="product" enctype="multipart/form-data" cssClass="form-horizontal">
	<div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
    	<div class="panel panel-success" >
        	<div class="panel-heading">
				<div class="panel-title">Add Product</div>
            </div>
			<div class="panel-body">						
				<label for="pName" class="col-md-3 control-label">Product Name</label>
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="fa fa-product-hunt"></i></span>
					<form:input path="productName" id="pName" cssClass="form-control" placeholder="Enter the product name" required="true"/>
				</div>	
						
				<label for="prodDesc" class="col-md-3 control-label">Product Description</label>		
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="glyphicon glyphicon-align-justify"></i></span>		
					<form:input path="prodDesc" id="prodDesc" cssClass="form-control" placeholder="Enter the product description" required="true"/>
				</div>
				
				<label for="catId" class="col-md-3 control-label">Category</label>
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>			
					<form:select path="categoryId" id="catId" cssClass="form-control" required="true">
						<form:option value="0" label="-----Select-----" />
						<form:options items="${catList}" />
					</form:select>
				</div>	
				
				<label for="supplierId" class="col-md-3 control-label">Supplier</label>		
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="fa fa-truck"></i></span>
					<form:input path="supplierId" id="supplierId" cssClass="form-control" required="true"/>
				</div>
				
				<label for="price" class="col-md-3 control-label">Price</label>	
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="fa fa-inr"></i></span>		
					<form:input path="price" id="price" cssClass="form-control" required="true" pattern="^\\d+$"/>
				</div>
				
				<label for="stock" class="col-md-3 control-label">Stock</label>		
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="fa fa-th-large"></i></span>			
					<form:input path="stock" id="stock" cssClass="form-control" min="1" required="true" pattern="^\\d+$"/>
				</div>
				
				<label for="pimage" class="col-md-3 control-label">Product Image</label>
				<div style="margin-bottom: 25px" class="input-group">								
					<span class="input-group-addon"><i class="fa fa-upload"></i></span>
					<form:input type="file" path="pimage" id="pimage" cssClass="form-control" required="true"/>
				</div>
				
				<div class="form-group">
					<div class="col-md-offset-3 col-md-9">	
						<input type="submit" value="Add Product" class="btn btn-success" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="Reset" class="btn btn-warning"/>
					</div>
				</div>					
			</div>
		</div>
	</div>
	
	<div id="loginbox" class="mainbox col-md-12 col-sm-8 margin50">
	<div class="panel panel-success  table-responsive" >
		<div class="panel-heading">
       		<div class="panel-title">Available products</div>
        </div>
        <div style="padding-top:30px;" class="panel-body">
			<table class="table table-striped table table-hover table-condensed">
				<thead>
				<tr align="center">
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
					<td class="tableTextvAlign" align="center">${product.productId}</td>
					<td class="tableTextvAlign">${product.productName}</td>
					<td class="tableTextvAlign">${product.prodDesc}</td>
					<td class="tableTextvAlign" align="right">${product.price}</td>
					<td class="tableTextvAlign" align="right">${product.stock}</td>
					<td class="tableTextvAlign" align="right">${product.categoryId}</td>
					<td class="tableTextvAlign" align="center">${product.supplierId}</td>
					<td><a href="<c:url value="editProduct/${product.productId}" />"><img src="resources/images/bgImages/edit.png" alt="Edit" onerror="this.src='../resources/images/bgImages/edit.png';"/></a></td>
					<td><a href="<c:url value="deleteProduct/${product.productId}" />" ><img src="resources/images/bgImages/delete.png" alt="Delete" onerror="this.src='../resources/images/bgImages/delete.png';"/></a></td>
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