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
<title>Order</title>

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
		<section>

	<div class="container">
		<h3 style="margin-bottom: 20px;">Order Management</h3>

		<div class="row" style="width: max-content;">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">Address</th>
							<th scope="col">User_Name</th>
							<th scope="col">order_Name</th>
							<th scope="col">order_status</th>
							<th scope="col">Date of Order</th>
							
							
							

						</tr>
						<tbody>
																	<c:forEach items="${orders}" var="b" varStatus="status">
																		<c:set var="address" value="${b.address}"></c:set>
																		<c:if test="${address != null}">
																			<tr>
																				<th scope="row">${status.count}</th>
																				<td>${b.address}</td>
																				<td>${b.userName}</td>
																				<td>${b.orderName}</td>
																				<td>${b.orderStatus}
																					<!-- Button trigger modal -->
																					<button type="button" class="btn" data-bs-toggle="modal"
																						data-bs-target="#exampleModal1${status.index}">
																						<i class="fas fa-edit fa-sm"></i>
																					</button> <!-- Modal -->
											
																					<div class="modal fade" id="exampleModal1${status.index}"
																						tabindex="-1" aria-labelledby="exampleModalLabel"
																						aria-hidden="true" role="dialog">
																						<div class="modal-dialog">
																							<div class="modal-content">
																								<div class="modal-header">
																									<h5 class="modal-title" id="exampleModal1Label">Set
																										Order Status</h5>
																									<button type="button" class="btn-close"
																										data-bs-dismiss="modal" aria-label="Close"></button>
																								</div>
																								<div class="modal-body">
											
																									<!-- Booking Status Form -->
																									<sf:form action="/order_status?bid=${b.id}"
																										method="post" class="was-validated" modelAttribute="book">
																										<div class="mb-3 mt-3">
																											<label for="orderStatus" class="form-label">Order
																												Status:</label> <input type="text" class="form-control"
																												placeholder="Enter order status" name="orderStatus"
																												value="${b.orderStatus}" required="true" />
																											<div class="valid-feedback">Valid.</div>
																											<div class="invalid-feedback">Please fill out this
																												field.</div>
																										</div>
											
																										<button type="submit" class="btn btn-primary">Set</button>
																									</sf:form>
																								</div>
																							</div>
																						</div>
																					</div> <!-- booking modal -->
								
																				
																				</td>
																				<td>${b.deliveryDate}
																					<!-- Button trigger modal -->
																					<button type="button" class="btn" data-bs-toggle="modal"
																						data-bs-target="#exampleModal2${status.index}">
																						<i class="fas fa-edit fa-sm"></i>
																					</button> <!-- Modal -->
											
																					<div class="modal fade" id="exampleModal2${status.index}"
																						tabindex="-1" aria-labelledby="exampleModalLabel"
																						aria-hidden="true" role="dialog">
																						<div class="modal-dialog">
																							<div class="modal-content">
																								<div class="modal-header">
																									<h5 class="modal-title" id="exampleModal1Label">Set
																										Date Status</h5>
																									<button type="button" class="btn-close"
																										data-bs-dismiss="modal" aria-label="Close"></button>
																								</div>
																								<div class="modal-body">
											
																									<!-- Booking Status Form -->
																									<sf:form action="/order_date?bid=${b.id}"
																										method="post" class="was-validated" modelAttribute="book">
																										<div class="mb-3 mt-3">
																											<label for="deliveryDate" class="form-label">Date
																												Status:</label> <input type="date" class="form-control"
																												placeholder="Enter order status" name="deliveryDate"
																												value="${b.deliveryDate}" required="true" />
																											<div class="valid-feedback">Valid.</div>
																											<div class="invalid-feedback">Please fill out this
																												field.</div>
																										</div>
											
																										<button type="submit" class="btn btn-primary">Set</button>
																									</sf:form>
																								</div>
																							</div>
																						</div>
																					</div> <!-- booking modal -->
								
																				
																				</td>
																				
																				
																			</tr>
																		</c:if>
																	</c:forEach>
						
																</tbody>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="c" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td>${c.name}</td>
								<td>${c.description}</td>
								<td>${c.price}</td>
								<td><a type="button" class="btn btn-primary"
									href="/view?uid=${c.sellerId}"> <i class="far fa-eye"></i>
								</a></td>
								<td><a type="button" class="btn btn-primary"
									href="/meal_detail?cid=${c.id}"> <i class="far fa-eye"></i>
								</a> <!-- Button trigger modal -->
									<button type="button" class="btn btn-success"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal${status.index}">
										<i class="fas fa-edit"></i>
									</button> <!-- Modal -->

									<div class="modal fade" id="exampleModal${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														Meal Post</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- meal Post Form -->
													<sf:form action="/edit_meal?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="meal"
														enctype="multipart/form-data">
														<div class="mb-3 mt-3">
															<label for="name" class="d-flex form-label">Name:</label>
															<input type="text" class="form-control"
																placeholder="Enter car name" name="name" path="name"
																required="true" value="${c.name}" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="model" class="d-flex form-label">Description:</label>
															<input type="text" class="form-control"
																placeholder="Enter description" name="description" path="description"
																value="${c.description}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="price" class="d-flex form-label">Price
																(RM):</label> <input type="text" class="form-control" id="price"
																placeholder="Enter car price" name="price" path="price"
																value="${c.price}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
													
														<input type="hidden" name="sellerId" value="${c.sellerId}" />
														<input type="hidden" name="photos" value="${c.photos}" />
														<input type="hidden" name="photoImagePath"
															value="${c.photoImagePath}" />

														<div class="holder"
															style="height: 300px; width: 300px; margin: auto;">
															<img id="imgPreview" src="${c.photoImagePath}"
																alt="image preview" style="width: inherit;" />
														</div>

														<button type="submit" class="btn btn-primary d-flex">Edit</button>
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
													<!-- Meal Post Form -->
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>

												</div>
											</div>
										</div>

									</div> <a type="button" class="btn btn-danger"
									href="/delete_meal?cid=${c.id}"> <i class="far fa-trash-alt"></i>
								</a></td>
								
								
								
								<td>${b.orderStatus}<!-- Button trigger modal -->
										<button type="button" class="btn" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${status.index}">
											<i class="fas fa-edit fa-sm"></i>
										</button> <!-- Modal -->

										<div class="modal fade" id="exampleModal1${status.index}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModal1Label">Set
															Order Status</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Booking Status Form -->
														<sf:form action="/order_status?bid=${b.id}"
															method="post" class="was-validated" modelAttribute="book">
															<div class="mb-3 mt-3">
																<label for="orderStatus" class="form-label">Order
																	Status:</label> <input type="text" class="form-control"
																	placeholder="Enter order status" name="orderStatus"
																	value="${b.orderStatus}" required="true" />
																<div class="valid-feedback">Valid.</div>
																<div class="invalid-feedback">Please fill out this
																	field.</div>
															</div>

															<button type="submit" class="btn btn-primary">Set</button>
														</sf:form>
													</div>
												</div>
											</div>
										</div> <!-- booking modal -->
									</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


	</div>
	</section>
	

	<%@ include file="footer.jsp"%>

</body>
</html>