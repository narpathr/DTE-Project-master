<html>
<head>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@include file="header.jsp" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<title>Shopping Cart</title>
</head>
<body class="bg">
	<div class="container-fluid">
		<div class="panel panel-success">
			<div class="panel-heading">
              	<div class="panel-title">Welcome, ${nameOfUser}!</div>			
			</div>
			<div class="panel-body">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="resources/images/carouselImages/Image5.jpg" alt="Cameras and Accessories" style="width: 100%;">
						</div>

						<div class="item">
							<img src="resources/images/carouselImages/Image6.jpg" alt="Shoes" style="width: 100%;">
						</div>

						<div class="item">
							<img src="resources/images/carouselImages/Image7.jpg" alt="Books" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="resources/images/carouselImages/Image8.jpg" alt="Baby Care Products" style="width: 100%;">
						</div>
						
						<div class="item">
							<img src="resources/images/carouselImages/Image9.jpg" alt="Sports Accessories" style="width: 100%;">
						</div>
						
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		</div>
	
		<div class="container">
		<div class="panel panel-success">
			<div class="panel-heading">
				<div class="panel-title">Explore our products from various categories</div>
			</div>
			<div class="panel-body">
				<div class="row">
				<c:forEach items="${listCategories}" var="category">
					<div class="col-sm-6 col-md-4">					
						<div class="thumbnail">
							<img src="resources/images/shoppingcart.png" alt="Alternate Name for the picture">
							<div class="caption">
								<h3>${category.categoryName}</h3>
								<p>${category.categoryDesc}</p>
								<p>
									<a href="exploreProducts" class="btn btn-warning" role="button">Explore More</a> 
								</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>	
	<%@include file="footer.jsp" %>
</body>
</html>