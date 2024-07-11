<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

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

	<section> <c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="name" value="${u.name}"></c:set>
		<c:set var="uname" value="${u.userName}"></c:set>
		<c:set var="email" value="${u.email}"></c:set>
		<c:set var="mobile" value="${u.mobile}"></c:set>
		<c:set var="address" value="${u.address}"></c:set>
	</c:forEach>
	<div class="container">

		<div class="row">
			<h3 style="margin-bottom: 20px;">
				User Profile
				<!-- Button trigger modal -->
			</h3>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Update User</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<!-- User Update Form -->
							<sf:form action="update" method="post" class="was-validated"
								modelAttribute="user">
								<div class="mb-3 mt-3">
									<label for="name" class="form-label">Name:</label> <input
										type="text" class="form-control" placeholder="Enter name"
										name="name" path="name" value="${name}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="userName" class="form-label">Username:</label> <input
										type="text" class="form-control" id="userName"
										placeholder="Enter username" name="userName" path="userName"
										value="${uname}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">Email:</label> <input
										type="email" class="form-control" placeholder="Enter username"
										name="email" path="email" value="${email}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="mobile" class="form-label">Mobile:</label> <input
										type="text" class="form-control" id="mobile"
										placeholder="Enter mobile" name="mobile" path="mobile"
										value="${mobile}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="address" class="form-label">Address:</label> <input
										type="text" class="form-control" id="address"
										placeholder="Enter address" name="address" path="address"
										value="${address}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>

								<button type="submit" class="btn btn-primary">Update</button>
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

		</div>

		<div class="row">

			<div class="col-lg-3">
				<div class="card mb-4">
					<div class="card-body text-center" style="height: 284px;">
						<img src="/images/img_avatar3.png" alt="avatar"
							class="rounded-circle img-fluid" style="width: 150px;">
						<h5 class="my-3">${name}</h5>
						<p class="text-muted mb-1">${address}</p>

					</div>
				</div>
				<div class="card mb-4">
					<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
						  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">My Profile</a>
	              
              		</div>
              		<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wallet-fill" viewBox="0 0 16 16">
						  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v2h6a.5.5 0 0 1 .5.5c0 .253.08.644.306.958.207.288.557.542 1.194.542.637 0 .987-.254 1.194-.542.226-.314.306-.705.306-.958a.5.5 0 0 1 .5-.5h6v-2A1.5 1.5 0 0 0 14.5 2h-13z"/>
						  <path d="M16 6.5h-5.551a2.678 2.678 0 0 1-.443 1.042C9.613 8.088 8.963 8.5 8 8.5c-.963 0-1.613-.412-2.006-.958A2.679 2.679 0 0 1 5.551 6.5H0v6A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-6z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">Subscriptions</a>
	              
              		</div>
              		<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">My Favorite</a>
	              
              		</div>
              		<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
						  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
						  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">My Downloads</a>
	              
              		</div>
              		<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
						  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
						  <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">My Uploads</a>
	              
              		</div>
              		<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
						  <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">Help Center</a>
	              
              		</div>
              		<div class="d-flex align-items-center gap-2 py-3" style="margin-left:60px;">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gift-fill" viewBox="0 0 16 16">
						  <path d="M3 2.5a2.5 2.5 0 0 1 5 0 2.5 2.5 0 0 1 5 0v.006c0 .07 0 .27-.038.494H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h2.038A2.968 2.968 0 0 1 3 2.506V2.5zm1.068.5H7v-.5a1.5 1.5 0 1 0-3 0c0 .085.002.274.045.43a.522.522 0 0 0 .023.07zM9 3h2.932a.56.56 0 0 0 .023-.07c.043-.156.045-.345.045-.43a1.5 1.5 0 0 0-3 0V3zm6 4v7.5a1.5 1.5 0 0 1-1.5 1.5H9V7h6zM2.5 16A1.5 1.5 0 0 1 1 14.5V7h6v9H2.5z"/>
						</svg>
		                <a href="" class="text-decoration-none fs-7 text-black">Redeem Gifts</a>
	              
              		</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card mb-4" style="padding:50px;">
					<div class="d-flex">
						<div>
							<h5 style=" font-family:Arial;">Current plan</h5>
							<h4 style="color:#6ab67f; font-family:Arial;">Pngtree free account</h4>
							<small style="color:#999; font-family:Arial;">Become an advanced user and enjoy the privileges of unlimited <br> downloads/commercial authorization</small>
					
						</div>
						<div class=""style="margin-left:240px; margin-top:30px;">
							<button type="button" class="btn btn-danger" data-bs-toggle="modal"
								data-bs-target="#exampleModal">Edit Profile
		
							</button>
						</div>
							
					
					</div>
					
				</div>
				
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home2" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Profile</button>
				    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile2" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Contact</button>
				  </div>
				</nav>
					<div class="tab-content" id="nav-tabContent">
					  <div class="tab-pane fade show active" id="nav-home2" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
					  	<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Full Name</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${name}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Email</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${email}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Username</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${uname}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					  <div class="tab-pane fade" id="nav-profile2" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
					  	<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Mobile</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${mobile}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Address</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${address}</p>
									</div>
								</div>
							</div>
						</div>
					  </div>
					  
					  
					  
					  
					  
					  <!--- modalll2-->
					  <div class="accordion" id="accordionPanelsStayOpenExample">
						  <div class="accordion-item">
						    <h2 class="accordion-header">
						      <button class="accordion-button  btn-outline-danger text-black" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
						        Order Status
						      </button>
						    </h2>
						    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse">
						      <div class="accordion-body">
						        <div class="row p-3">
								<nav>
									<div class="nav nav-tabs" id="nav-tab" role="tablist">
										
										<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
											data-bs-target="#nav-profile" type="button" role="tab"
											aria-controls="nav-profile" aria-selected="false">Ordered Status
											</button>
						
									</div>
								</nav>
									
						
											<c:if test="${empty products}">
												<div class="container">
													<div class="row">
														<div class="col-12">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th scope="col">No.</th>
																		<th scope="col">Images</th>
																		<th scope="col"> address</th>
																		<th scope="col">Product</th>
																		<th scope="col">Order Status</th>
																		<th scope="col">Estimated Date</th>
																		<th scope="col">Action</th>
																		
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${orderItems}" var="b" varStatus="status">
																		<c:set var="address" value="${b.address}"></c:set>
																		<c:if test="${address != null}">
																			<tr>
																				<th scope="row">${status.count}</th>
																				<td><img src="${b.getPhotoImagePath()}" alt ="poucture"></td>
																				<td>${b.address}</td>
																				<td>${b.orderName}</td>
																				<td>${b.orderStatus}</td>
																				<td>${b.deliveryDate}</td>
																				<td class="">
																							<a type="button" class="btn btn-danger"
																							href="/delete_order?id=${b.getId()}"> <i class="far fa-trash-alt"></i>
								</a></td>
																				
																			</tr>
																		</c:if>
																	</c:forEach>
						
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</c:if>
										</div>
						    </div>
						  </div>
						</div>
					  
					  
					  



		
	</div>
	
	</section>
	


	<%@ include file="footer.jsp"%>
</body>
</html>