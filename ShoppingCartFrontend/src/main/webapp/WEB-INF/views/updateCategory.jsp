<html>
<head>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@include file="header.jsp" %>	
	<title>Update Category</title>	
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
<form action="<c:url value="/updateCategory" />" method="post" class="form-horizontal">
  <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
            <div class="panel panel-success" >
                    <div class="panel-heading">
                        <div class="panel-title">Update Category</div>
                    </div>
					<div class="panel-body" style="height:250px;">	
						<label for="catId" class="col-md-3 control-label">Category ID</label>
						<div style="margin-bottom: 25px" class="input-group">								
								<span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>		
								<input type="text" id="catId" class="form-control" readonly="readonly" name="catId" value="${categoryInfo.categoryId}"/>
						</div>
						<label for="catname" class="col-md-3 control-label">Category Name</label>
						<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>	
								<input type="text" id="catname" class="form-control" name="catname" value="${categoryInfo.categoryName}" required/>
						</div>
						<label for="catDesc" class="col-md-3 control-label">Category Description</label>
						<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-align-justify"></i></span>	
								<input type="text" id="catDesc" class="form-control" name="catDesc" value="${categoryInfo.categoryDesc}" required/>
						</div>
						<div style="margin-top:10px;" class="form-group">
							<div class="col-sm-12 controls">		
								<input type="submit" value="Update" class="btn btn-success btnAlign"/>
							</div>
						</div>	
					</div>
			</div>
	</div>
</form>

<div id="loginbox" class="mainbox col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 margin50">
	<div class="panel panel-success" >
		<div class="panel-heading">
       		<div class="panel-title">Available categories</div>
        </div>
        <div style="padding-top:30px;" class="panel-body">
			<table class="table table-striped table table-hover table-condensed table-responsive">
				<thead>
				<tr align="center">
					<th>Category ID</th>
					<th>Category Name</th>
					<th>Category Desc</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${listCategories}" var="category">
				<tr>
					<td class="tableTextvAlign">${category.categoryId}</td>
					<td class="tableTextvAlign">${category.categoryName}</td>
					<td class="tableTextvAlign">${category.categoryDesc}</td>
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