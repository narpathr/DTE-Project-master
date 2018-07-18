<html>
<head>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<title>Users List</title>
</head>
<body class="bg">
<form:form>
	<div class="container"> 
		<div id="loginbox" class="mainbox col-md-12 col-sm-12 margin50">
			<div class="panel panel-success" >
				<div class="panel-heading">
		       		<div class="panel-title">List of users</div>
		        </div>
		        <div style="padding-top:10px;" class="panel-body">
					<table class="table table-striped table table-hover table-condensed table-responsive">
						<thead>
						<tr align="center" class="tableTextvAlign">
							<th class="tableTextvAlign">Role</th>
							<th class="tableTextvAlign">Username</th>
							<th class="tableTextvAlign">Name of the user</th>
							<th class="tableTextvAlign">Mobile</th>
							<th class="tableTextvAlign">Email</th>
							<th colspan="2" class="tableTextvAlign">Action</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${userList}" var="user">
						<tr>
							<td class="tableTextvAlign" align="center">${user.role}</td>
							<td class="tableTextvAlign" align="center">${user.username}</td>
							<td class="tableTextvAlign" align="center">${user.name}</td>
							<td class="tableTextvAlign" align="right">${user.mobileNo}</td>
							<td class="tableTextvAlign" align="center">${user.emailId}</td>
							<td><a href="<c:url value="editUser/${user.username}" />"><img src="resources/images/bgImages/edit.png" alt="Edit"/></a></td>
							<td><a href="<c:url value="deleteUser/${user.username}" />"><img src="resources/images/bgImages/delete.png" alt="Delete"/></a></td>
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