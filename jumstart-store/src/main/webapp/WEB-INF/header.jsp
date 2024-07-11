<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style4.css">
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
      
      
<div class="header_section" >
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light">
               <a class="navbar-brand" href="index"><img style="width:40%; margin-left:50px; height:10%;" src="images/logo.png"></a>
               </button>
               
                <sec:authorize access="!isAuthenticated()">
                
						<div class="navbar-nav" style="margin-left:500px;">
							<li><a href="index" class="nav-item nav-link" style="color:#663d00;">HOME</a> </li>
							 <li><a href="about_us" class="nav-item nav-link" style="color:#663d00;">ABOUT</a> </li>
							<li> <a href="contact_us" class="nav-item nav-link" style="color:#663d00;">CONTACT</a></li>
							 <li><a href="login" class="nav-item nav-link" style="color:#663d00;">LOGIN</a></li>
							<li><a href="register_user" class="nav-item nav-link" style="color:#663d00;">REGISTER</a></li>
						</div>
					
				</sec:authorize>


				<sec:authorize access="isAuthenticated()">

					<sec:authorize access="hasRole('Users')">
						<div class="navbar-nav">
							<a class="nav-item nav-link"  style="color:#663d00;" href="products">Home</a>
						
						

						</div>

					</sec:authorize>
					<sec:authorize access="hasRole('Partner')">
						<div class="navbar-nav">
							<a class="nav-item nav-link"  style="color:#663d00; font-size:17px;" href="products">Home</a><a
								class="nav-item nav-link" style="color:#663d00; font-size:17px;" href="all_product">Products Management</a><a
									class="nav-item nav-link" style="color:#663d00; font-size:17px;" href="all_orders">Order Management</a>
								
							
						</div>

					</sec:authorize>
					<sec:authorize access="hasRole('Riders')">
						<div class="navbar-nav">
							<a class="nav-item nav-link"  style="color:#663d00;" href="meals">Home</a><a
									class="nav-item nav-link" style="color:#663d00;" href="all_orders">Order Management</a>
								
							
						</div>

					</sec:authorize>
					

					<sec:authorize access="hasRole('Administrator')">
						<div class="navbar-nav">
							<a class="nav-item nav-link" style="color:#663d00;" href="meals">Home</a> <a
								class="nav-item nav-link" style="color:#663d00;" href="all_product">Products Management</a> <a
								class="nav-item nav-link" style="color:#663d00;" href="users">User Management</a><a
								class="nav-item nav-link" style="color:#663d00;" href="all_orders">Order Management</a>
								
						</div>

					</sec:authorize>

					<sec:authorize access="hasAnyRole('Administrator','Users','Partner','Riders')">

						<div class="navbar-nav px-2">
							<sf:form action="search" method="get" style="width: 100%;">
								<div class="input-group">
									<input type="search" class="form-control rounded"
										placeholder="Search" aria-label="Search" name="keyword"
										aria-describedby="search-addon" />
									<button type="submit" class="btn btn-outline-danger text-black" style="margin-left:20px;">search</button>
								</div>
							</sf:form>
						</div>
						
						

						<!-- /logout must be a POST request, as csrf is enabled.
			        This ensures that log out requires a CSRF token and that a malicious user cannot forcibly log out your users.-->
						<div class="navbar-nav ms-auto">

							<a class="nav-item nav-link p-3" style="color:#663d00; font-size:17px;" href="profile">Profile</a>
							
							<sec:authorize access="hasRole('Partner')">
		 					<span class="" > 
								<button type="button" class="btn btn-danger" data-bs-toggle="modal"
									data-bs-target="#exampleModal" style="margin-top:10px;">
									ADD PRODUCT</button>
							</span>
		 			
		 			</sec:authorize>
		 			<sec:authorize access="hasRole('Users')">
						<div class="">
							<a class="btn btn-danger" href="cart" style="width:100%; margin-top:10px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg></i>Cart</a>
						
						

						</div>

					</sec:authorize>

							<form action="logout" method="post" style="padding: 10px;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" name="Logout"
									value="Logout" class="btn btn-primary"></input>
							</form>
						</div>


					</sec:authorize>
					


				</sec:authorize>
            </nav>
         </div>
     
      </div>
      <!-- header section end -->