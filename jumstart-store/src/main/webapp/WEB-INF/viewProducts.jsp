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
      <link rel="stylesheet" type="text/css" href="css/homepage.css">
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
	
			
			<div
        style="background-image: url(images/top-img.jpg); background-position: center; background-size: cover; height: 890px;">
 
                  <!-- banner section start --> 
            <div class="container">
				<div class="row">   
					<div class="tagline">			
						<h1>MODERN & ELEGANT</h1>
						<h5>Simple and Beautiful Design</h5>                         
					</div>                 
				</div>
            </div>
         <!-- banner section end -->
     
</div>


 			<!-- <div class="" style="margin-left:100px; margin-bottom:50px;">
 					<div class="d-flex align-items-center gap-2 py-3" >
		 			<sec:authorize access="hasRole('Partner')">
		 					<span class="btn btn-danger" style="margin-right:200px;"> 
								<button type="button" class="btn btn-danger" data-bs-toggle="modal"
									data-bs-target="#exampleModal">
									ADD PRODUCT</button>
							</span>
		 			
		 			</sec:authorize>
		 			
		 		</div>
 						
 				</div> -->	
		 		
		
	<div class="container">
		<sec:authorize access="hasRole('Partner')">
			<!-- post car link-->
			<div class="row p-3 mb-5" >
				
				<div class="col-4"></div>
				<div class="col col-lg-2" style="text-align: end; margin: auto;">
					
					<!-- Modal -->

					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Sell Your
										Product Today!</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<c:if test="${success_post != null}">
										<div class="alert alert-success">${success_post}</div>
									</c:if>

									<!-- Meal Post Form -->
									<sf:form action="product_post" method="post" class="was-validated"
										modelAttribute="product" enctype="multipart/form-data">
										<div class="mb-3 mt-3">
											<label for="itemName" class="d-flex form-label">Item-Name:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter Item Name" name="itemName" path="itemName"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="model" class="d-flex form-label">Description:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter Description" name="description" path="description"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="price" class="d-flex form-label">Price
												</label>
											<sf:input type="text" class="form-control" id="price"
												placeholder="Enter product price" name="price" path="price"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										
										<div class="mb-3">
											<label for="madeIn" class="d-flex form-label">madeIn
												</label>
											<sf:input type="text" class="form-control" id="madeIn"
												placeholder="Enter madeIn" name="madeIn" path="madeIn"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										
									
										
										<div class="mb-3">
											<label for="stock" class="d-flex form-label">Stock
												</label>
											<sf:input type="text" class="form-control" id="stock"
												placeholder="Enter Stock" name="stock" path="stock"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										
										
										<div class="mb-3">
										    <label for="category" class="d-flex form-label">Category</label>
												    <select class="form-select" id="category" name="category" required="true">
												        <option value="" disabled selected>Select a category</option>
												       		 <option value="Appliances">Appliances</option>
												        		 <option value="Product">Baby Product</option>
												              		  <option value="Woman Clothing's">Woman Clothing's</option>
												                      	 <option value="Men Clothing's">Men Clothing's</option>
												                             
		
												    </select>
										    <div class="valid-feedback">Valid.</div>
										    <div class="invalid-feedback">Please select a category.</div>
										</div>
	
										<br><br>
										<div class="mb-3">
											<label class="d-flex form-label">Photo:</label> <input
												type="file" class="form-control" name="fileImage" id="photo"
												accept="image/png, image/jpeg" required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>

										<div class="holder"
											style="height: 300px; width: 300px; margin: auto;">
											<img id="imgPreview" src="#" alt="image preview"
												style="width: inherit;" />
										</div>

										<button type="submit" class="btn btn-primary d-flex">Post</button>
									</sf:form>
									<script>
						            $(document).ready(() => {
						            	
						                $("#photo").change(function () {
						                    const file = this.files[0];
						                    if (file) {
						                        let reader = new FileReader();
						                        reader.onload = function (event) {
						                            $("#imgPreview")
						                              .attr("src", event.target.result);
						                        };
						                        reader.readAsDataURL(file);
						                    }
						                });
						            });
						        </script>
									<!-- Product Post Form -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</sec:authorize>
		
		</div>
		
		<!-- list of all cars posted -->
		<div class="container">
            <div class="row">
               <h1 class="coffee_taital">Best Product</h1>
               
            </div>
         </div>
		<div class="row" style="gap: 0px; margin:100px;">
			<c:forEach items="${products}" var="c">
				<c:set var="id" value="${c.id}"></c:set>
				<c:if test="${success_post == null}">

					<c:if test="${c.sellStatus != 'sold'}">
						<div class="col-lg-4 col-md-6">
							<img class="card-img-top" style="width:100%;" src="${c.photoImagePath}"
								alt="${c.photos}">
							<div class="card-body">
							<hr>
								<h4 class="card-title">${c.itemName}</h4>
								<p class="card-text">
									<i class="fas fa-tags"></i>&nbsp; ${c.price}
								</p>

								<!--<a href="#" class="btn"
							style="background-color: red; margin-right: 40px;">Book a
							Test Drive</a>-->
								<a href="/Product_detail?cid=${c.id}" class="btn btn-outline-danger">View
									Details</a>
							</div>
						</div>
					</c:if>

				</c:if>
			</c:forEach>
			<c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}
					Click here to <a href="/Product_detail?cid=${id}">View</a> Your Meal
					post
				</div>
			</c:if>
		</div>
		
		
      <!-- collection section start -->
		<div class="collection">
			<div class="premium">
				<h2>FEATURED PRODUCTS</h2>
				<i>Free shipping with orders over $200</i>
			</div>
			<div class="E">
				<div class="A">
					<div class="1" style="width: 481px; height:422px; margin-left:0px;" ><img src="images/option1.jpg"></div>
				</div>
				<div class="B">
					<div class="2" style="width: 289px; height:193px;" ><img src="images/option2.jpg"></div>
					<div class="3" style="width: 289px; height:193px;"><img src="images/option3.jpg"></div>	
				</div>				
				<div class="C">
					<div class="4" style="width: 289px; height:193px;"><img src="images/option4.jpg"></div>
					<div class="5" style="width: 289px; height:193px;"><img src="images/option5.jpg"></div>
				</div>
				<div class="D">
					<div class="6" style="width: 382px; height:255px;"><img src="images/option6.jpg"></div>
					<div class="7" style="width: 708px; height:246px;"><img src="images/option7.jpg"></div>					
				</div>
			</div>	
		</div>
      <!-- collection section end -->

	<%@ include file="footer.jsp"%>
</body>
</html>