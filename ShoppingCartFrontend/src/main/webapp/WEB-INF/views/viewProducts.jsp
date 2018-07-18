<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Update Product Details</title>
<style type="text/css">
.img-responsive, .thumbnail a>img, .thumbnail>img {
	width: 100;
	height: 100;
}
</style>
</head>
<body class="bg">
<form:form modelAttribute="product">
<div class="container">
	<div class="panel panel-success" >
		<div class="panel-heading">
	    	<div class="panel-title">Our Products</div>
	    </div>
	    <div class="panel-body">
	    <p><strong>Browse by categories:</strong></p>
	    <p style="padding-bottom:15px;">
	    	<c:forEach items="${catList}" var="category">
	    		<c:set var="catIdFromList" value="${category.key}"></c:set>
	   			<a class="btn-primary btn-sm" role="button" href="#<c:out value="${catIdFromList}"/>">${category.value}</a>&nbsp;&nbsp;&nbsp;&nbsp;
	   		</c:forEach>
	   	</p>
	   	<c:forEach items="${catList}" var="category">
	   	<c:set var="catIdForCollapse" value="${category.key}"></c:set>
	   	<div>			
			<div class="row">			
			<div class="well"><h4 style="font-weight: bold;" id="${catIdForCollapse}">${category.value}</h4></div>
				<c:forEach items="${listProducts}" var="product">
				<c:set var = "catIdFromProduct" value = "${product.categoryId}"/>
				<c:set var = "catIdFromCategoryList" value = "${category.key}"/>
				<c:if test="${catIdFromProduct==catIdFromCategoryList}">
				  <div class="col-sm-3 col-md-4">   
				    <div class="thumbnail">
						<a href="viewProductDetail/${product.productId}"><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt="ProductImage"/></a>
						<div class="caption">
							<h3><a href="viewProductDetail/${product.productId}">${product.productName}</a></h3>
							<p>${product.prodDesc}</p>
							<p><b>Rs.&nbsp;${product.price}/-</b></p>
							<p><a href="viewProductDetail/${product.productId}" class="btn btn-success" role="button">Buy now</a></p>	
						</div>
					</div>
				  </div>
				  </c:if>
				</c:forEach>
			</div>
			</div>			
			</c:forEach>			
		</div>
	</div>
</div>
</form:form>
<%@include file="footer.jsp" %>
</body>
</html>