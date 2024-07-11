<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<!--  Enable Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/script.js"></script>
</head>
<body>

	<%@ include file="header.jsp"%>

	<!--<c:forEach items="${product}" var="c">
		<c:set var="id" value="${c.id}"></c:set>
		<c:set var="itemName" value="${c.itemName}"></c:set>
		<c:set var="image" value="${c.photoImagePath}"></c:set>
		<c:set var="description" value="${c.description}"></c:set>
		<c:set var="price" value="${c.price}"></c:set>
		<c:set var="stock" value="${c.stock}"></c:set>
		<c:set var="madeIn" value="${c.madeIn}"></c:set>
	

	</c:forEach>-->
	
<div
        style="background-image: url(images/or2.png); background-position: center; background-size: cover; height: 890px;">
  <c:forEach items="${product}" var="product">
        <div class="container mb-5">
		<div class="card mb-5">
			<div class="row g-0">
				<div class="col-md-6 border-end">
					<div class="d-flex flex-column justify-content-center">
						<div class="main_image">
							<img src="${product.getPhotoImagePath()}" id="main_product_image" width="100%">
						</div>

					</div>
				</div>
				<div class="col-md-6">
					<div class="p-3 right-side">
						<div class="d-flex justify-content-between align-items-center ">
							<h3 class="fw-bold">${product.getItemName()}</h3>

						</div>
						<div class="my-3 mx-2 content">


							<div class="d-flex">

								<div>
									<span class="fw-bold">Description</span>
									<p style="font-size: 16px;">
									 ${product.getDescription()}
									</p>
								</div>
							</div>
						</div>
<!--  
						<c:if test="${sellStatus == 'sold'}">
							<h3>Car Sold!</h3>
						</c:if>
						
						<c:if test="${sellStatus != 'sold'}">-->
						<div class="d-flex flex-row" style="margin-bottom:100px;">
							<div style="margin-left:50px;">
								<span class="fw-bold"> Price</span>
								<h3> ${product.getPrice()}</h3>
							</div>
							<div style="margin-left:50px;">
								<span class="fw-bold"> Stock</span>
								<h3> ${product.getStock()}</h3>
							</div>
							<div style="margin-left:50px;">
								<span class="fw-bold"> Made In</span>
								<h3> ${product.getMadeIn()}</h3>
							</div>
						</div>
						<div>
							   <form method="post" action="/order/add">
							        <input type="hidden" name="productId" value="1" /> <!-- Example product ID -->
							        <!-- Quantity input field -->
							       
							    </form>
						</div>


						<div class="buttons d-flex flex-row mt-5 gap-3">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-danger"
								data-bs-toggle="modal" data-bs-target="#exampleModal1"
								style="width: 500px;">Buy Now</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal1" tabindex="-1"
								aria-labelledby="exampleModal1Label" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModal1Label">Order
												</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Order Form -->
											<sf:form action="ordering" method="post" class="was-validated"
												modelAttribute="order">
												<div class="mb-3 mt-3">
													<label for="bookDate" class="form-label">Order Address
														</label> <input type="text" class="form-control"
														name="orderAddress" required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${id}">

												<button type="submit" class="btn btn-primary" data-bs-target="#exampleModal2
													style="width: auto;">Order</button>
											</sf:form>
											<!-- User Update Form -->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>

										</div>
									</div>
								</div>

							</div>
							<!-- Modal -->

							<!-- Button trigger modal -->
							
						<sf:form action="/product_detail/${product.id}/addToCart" method="POST">
							<input type="hidden" name="cid" value="${product.id}"/>
								<button class="btn btn-outline-dark"
									style="width: 250px;"type="submit">Add to Cart</button>
						</sf:form>
							</div>
						
						<img src="images/star.png" style="margin-top:20px;">
						
						</c:if>
						<!-- end of button options -->
						
					</div>
				</div>
			</div>
		</div>
			<img src="images/r.png">

	</div>

        </div>
   
		
</c:forEach>
	
	  <!-- coffee section start -->
      <div class="coffee_section layout_padding" style=" margin-top:200px;">
         <div class="container">
            <div class="row">
               <h1 class="coffee_taital">Best Product</h1>
               <div class="bulit_icon"><img src="images/bulit-icon.png"></div>
            </div>
         </div>
         <div class="coffee_section_2" style="margin-bottom:200px;">
            <div id="main_slider" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="container-fluid">
                        <div class="row">
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p1.png"></div>
                              <h3 class="types_text">Electronics</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p2.png"></div>
                              <h3 class="types_text">Toys Under $30</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p3.png"></div>
                              <h3 class="types_text">Health & Personal Care</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p4.png"></div>
                              <h3 class="types_text">Shop school essentials</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="container-fluid">
                        <div class="row">
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p5.png"></div>
                              <h3 class="types_text">Home & Kitchen Under $30</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p6.png"></div>
                              <h3 class="types_text">New arrivals in Toys</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p7.png"></div>
                              <h3 class="types_text">For your Fitness Needs</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                           <div class="col-lg-3 col-md-6">
                              <div class="coffee_img"><img src="images/p8.png"></div>
                              <h3 class="types_text">Discover fashion trends</h3>
                              <p class="looking_text">looking at its layout. The point of</p>
                              <div class="read_bt"><a href="#">Read More</a></div>
                           </div>
                        </div>
                     </div>
                  </div>
                 
               </div>
               <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
               <i class="fa fa-arrow-left"></i>
               </a>
               <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
               <i class="fa fa-arrow-right"></i>
               </a>
            </div>
         </div>
         
         


	<%@ include file="footer.jsp"%>

</body>
</html>