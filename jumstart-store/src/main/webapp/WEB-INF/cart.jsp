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
<title>Jumstart Retail Chain</title>



<!--  Enable Bootstrap -->
<!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- font css -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
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

<script src="/js/script.js"></script>
</head>
<body>
<%@ include file="header.jsp"%>
		<div>
			
			<div
        style="background-image: url(images/or2.png); background-position: center; background-size: cover; height: 890px; margin-bottom:1000px;">
        
         <!-- banner section start --> 
       
            <div class="container">
            <h1>Shopping Cart</h1>
               <div class="card mb-4">
							<div class="card-body" >
							
							<c:forEach items="${cartItems}" var="cart">
								<div class="row">
									<div class="col-sm-4">
												<img src="${cart.getPhotoImagePath()}" alt="picture">
									</div>
									<div class="col-sm-4">
										${cart.getPrice()}
										${cart.getItemName()}
									
										
										
									</div>
									
									<div class="col-sm-4">
									
										
										<a type="button" class="btn btn-primary"
									href="/product_detail?cid=${cart.getProducts().getId()}"> <i class="far fa-eye"></i>
								</a>
									<a type="button" class="btn btn-danger"
									href="/delete_cart?id=${cart.getId()}"> <i class="far fa-trash-alt"></i>
								</a> <!-- Button trigger modal -->
								
									<button type="button" class="btn btn-danger"
										data-bs-toggle="modal" data-bs-target="#exampleModal5"
										style="width: 100px;">Buy Now</button>
		
									<!-- Modal -->
									<div class="modal fade" id="exampleModal5" tabindex="-1"
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
													<sf:form action="ordering-cart" method="post" class="was-validated"
														modelAttribute="order">
														<div class="mb-3 mt-3">
															<label for="bookDate" class="form-label">Order Address
																</label> <input type="text" class="form-control"
																name="orderAddress" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
		
														<input type="hidden" name="cid" value="${cart.getId()}">
		
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
										
									</div>
								</div>
								<hr>
							</c:forEach>
						
							</div>
						</div>
					  </div>
         </div>
         <!-- banner section end -->
     
</div>


 		

	<%@ include file="footer.jsp"%>
</body>
</html>