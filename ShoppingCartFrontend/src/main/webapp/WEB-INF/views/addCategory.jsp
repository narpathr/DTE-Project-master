<html>
<head>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<title>Add Category</title>
</head>
<body class="bg">
<div class="container">   
	<div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
    	<div class="panel panel-success" >
        	<div class="panel-heading">
            	<div class="panel-title">Add New Category</div>
            </div>
			<div style="padding-top:30px" class="panel-body">
			<form class="form-horizontal" action="<c:url value="/insertCategory" />" method="post">	
			<div style="margin-bottom: 25px" class="input-group">					
				<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
				<input class="form-control" type="text" id="catname" name="catname" placeholder="Enter Category Name" required/>
			</div>		
			<div style="margin-bottom: 25px" class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-align-justify"></i></span>
				<input class="form-control" type="text" id="catDesc" name="catDesc" placeholder="Enter Category Description" required/>
			</div>	
			
			<div style="margin-top:10px;" class="form-group">
				<div class="col-sm-12 controls">
                	<input type="submit" id="btn-login" class="btn btn-success icon-hand-right" value="Insert" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<input type="reset" id="btn-reset" class="btn btn-warning icon-hand-right" value="Reset" />                            
                </div>
			</div>				
			</form>					
			</div>
		</div>
	</div>
	
<div id="loginbox" class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-1 margin50">
	<div class="panel panel-success table-responsive" >
		<div class="panel-heading">
       		<div class="panel-title">Available categories</div>
        </div>
        <div style="padding-top:30px;" class="panel-body">
			<table class="table table-striped table table-hover table-condensed">
				<thead>
				<tr align="center">
					<th>Category ID</th>
					<th>Category Name</th>
					<th>Category Desc</th>
					<th colspan="2">Action</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listCategories}" var="category">
				<tr>
					<td class="tableTextvAlign">${category.categoryId}</td>
					<td class="tableTextvAlign">${category.categoryName}</td>
					<td class="tableTextvAlign">${category.categoryDesc}</td>
					<td><a href="<c:url value="editCategory/${category.categoryId}" />" ><img src="resources/images/bgImages/edit.png" alt="Edit"/></a></td>
					<td><a href="<c:url value="deleteCategory/${category.categoryId}" />" ><img src="resources/images/bgImages/delete.png" alt="Delete"/></a></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>	
	
</div>
<%@include file="footer.jsp" %>
</body>
</html>