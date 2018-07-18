<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Register/Sign-Up</title>
</head>
<body class="bg">
	<div class="container">
	<c:url value="/addUserDetail" var="actionString" />
	<form:form id="signupform" cssClass="form-horizontal" modelAttribute="user" method="POST" action="${actionString}">
		<div id="signupbox"	class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">Sign Up</div>
					<div class="toFloat"><a href="login">Sign In</a>
					</div>
				</div>
				<div class="panel-body">
					<p class="bg-danger">${message}</p>
					
					<label for="fname" class="col-md-3 control-label">Name</label>
					<div style="margin-bottom: 25px" class="input-group">								
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<form:input path="name" cssClass="form-control" placeholder="Enter your name" required="true"/>
					</div>
						
					<label for="email" class="col-md-3 control-label">Email</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						<form:input path="emailId" cssClass="form-control" placeholder="Enter your email ID" required="true"/>
					</div>
					
					<label for="mobile" class="col-md-3 control-label">Mobile</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
						<form:input path="mobileNo" cssClass="form-control" placeholder="Enter your mobile number" pattern="^[0-9]{10}$" required="true"/>
					</div>
						
					<label for="address" class="col-md-3 control-label">Address</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-tasks"></i></span>
						<form:textarea path="address" rows="5" cols="30" cssClass="form-control" placeholder="Enter your address" required="true"/>
					</div>
					
                    <div style="border-top: 1px solid#4cae4c; padding-top:15px;" ></div>
                    
					<label for="username" class="col-md-3 control-label">User Name</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<form:input path="username" cssClass="form-control" placeholder="Choose an unique user name" required="true"/>
					</div>
				
					<label for="password" class="col-md-3 control-label">Password</label>
					<div style="margin-bottom: 25px" class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>	
						<form:password path="password" cssClass="form-control" placeholder="Choose your password" required="true"/>
					</div>

					<div class="form-group">
						<div class="col-md-offset-3 col-md-9">
							<input type="submit" id="btn-signup" class="btn btn-success" value="Sign Up" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                			<input type="reset" id="btn-reset" class="btn btn-warning" value="Reset" /> 
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