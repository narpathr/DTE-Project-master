<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Welcome Back!</title>
</head>
<body class="bg">
	<div class="container">    
        <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
            <div class="panel panel-success" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <div class="toFloat"><a href="contactus">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body">
                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <p class="bg-danger">${message}</p>
                        <c:url value="/signIn" var="actionString" />                         
                        <form:form id="loginform" cssClass="form-horizontal" action="${actionString}" method="POST" modelAttribute="user">                                    
                            <div style="margin-bottom: 25px" class="input-group">
                            	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <form:input id="login-username" cssClass="form-control" path="username" placeholder="username" required="true"/>                                        
                           	</div>    
                            <div style="margin-bottom: 25px" class="input-group">
                            	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <form:password id="login-password" cssClass="form-control" path="password" placeholder="password" required="true" />
                            </div>   
                            <div class="input-group">
                            	<div class="checkbox">
                                	<label>
                                    	<input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                 	</label>
                               	</div>
                            </div>

                            <div style="margin-top:10px" class="form-group">
                           		<div class="col-sm-12 controls">
                                	<input type="submit" id="btn-login" class="btn btn-success icon-hand-right" value="Login" />                           
                                </div>
                           	</div>
                           	
                           	<div class="form-group">
                            	<div class="col-md-12 control">
                                	<div style="border-top: 1px solid#4cae4c; padding-top:15px;" >
                                    	Don't have an account?
                                        <a href="register">&nbsp;Sign Up Here</a>
                                    </div>
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