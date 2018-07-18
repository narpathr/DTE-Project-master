<html>
<%@include file="header.jsp" %>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<title>Edit User Details</title>
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
	<c:url var="actionString" value="/editUserDetails" />
		<form:form id="editUserDetails" modelAttribute="user" action="${actionString}" method="POST" class="form-horizontal">
		<div id="signupbox"	class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">Edit User Details</div>
				</div>
			<div class="panel-body">
				<form:hidden path="enabled"/>
				<form:hidden path="role"/>	
					<label for="fname" class="col-md-3 control-label">Name</label>
					<div style="margin-bottom: 25px" class="input-group">								
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<form:input path="name" cssClass="form-control" required="true"/>
					</div>
					
					<label for="email" class="col-md-3 control-label">Email</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						<form:input path="emailId" readonly="true" cssClass="form-control"  required="true"/>
					</div>
										
					<label for="mobile" class="col-md-3 control-label">Mobile</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
						<form:input path="mobileNo" cssClass="form-control"  required="true"/>
					</div>
					
					<label for="address" class="col-md-3 control-label">Address</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-tasks"></i></span>
						<form:textarea path="address" rows="5" cols="30" cssClass="form-control"  required="true"/>
					</div>
					
                    <div style="border-top: 1px solid#4cae4c; padding-top:15px;" ></div>
                    
					<label for="username" class="col-md-3 control-label">User Name</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<form:input path="username" cssClass="form-control" readonly="true" />
					</div>
				
					<label for="password" class="col-md-3 control-label">Password</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>	
						<form:password path="password" cssClass="form-control"  required="true"/>
					</div>
					
					<div class="form-group">
						<div class="col-md-offset-3 col-md-9">
							<input type="submit" class="btn btn-success btnAlign" value="Update" />
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