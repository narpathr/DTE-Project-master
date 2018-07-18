<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Welcome!</title>
</head>
<body class="bg">
	<div class="container">    
        <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 margin50">                    
            <div class="panel panel-success" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                    </div>  
                    <div class="panel-body" style="padding-top:30px">
                    	<c:if test="${sessionScope.role=='ROLE_USER'}">
                    		Change Header.jsp also accordingly.
                    	</c:if>
                    </div>
              </div>
       	</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>