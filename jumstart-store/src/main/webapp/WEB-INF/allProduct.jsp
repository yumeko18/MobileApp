<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<section>

	<div class="container">
		<h3 style="margin-bottom: 20px;">Product Management</h3>

		<div class="row" style="width: max-content;">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">Name</th>
								<!-- 	<th scope="col">Description</th>-->
							<th scope="col">Price</th>
							<!-- <th scope="col">Seller</th>-->
							<th scope="col">Action</th>
							<th scope="col">Stock</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="c" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td>${c.itemName}</td>
						<!--  		<td>${c.description}</td>-->
								<td>${c.price}</td>
						<!--		<td><a type="button" class="btn btn-primary"
									href="/view?uid=${c.sellerId}"> <i class="far fa-eye"></i>
								</a></td>-->
								<td><a type="button" class="btn btn-primary"
									href="/Product_detail?cid=${c.id}"> <i class="far fa-eye"></i>
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
														Product Post</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- meal Post Form -->
													<sf:form action="/edit_product?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="meal"
														enctype="multipart/form-data">
														<div class="mb-3 mt-3">
															<label for="itemName" class="d-flex form-label">Name:</label>
															<input type="text" class="form-control"
																placeholder="Enter car name" name="itemName" path="itemName"
																required="true" value="${c.itemName}" />
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
								
								
								
								<td>${c.stock}<!-- Button trigger modal -->
										<button type="button" class="btn d-flex" data-bs-toggle="modal"
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
															Stock Status</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Booking Status Form -->
														<sf:form action="/edit_stock?cid=${c.id}"
															method="post" class="was-validated" modelAttribute="book">
															<div class="mb-3 mt-3">
																<label for="stock" class="form-label">Stock
																	Status:</label> <input type="text" class="form-control"
																	placeholder="Enter order status" name="stock"
																	value="${c.stock}" required="true" />
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