<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>Know Your Neighborhood</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/index.css">
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

</head>
<body>
      <div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light">
               <a class="navbar-brand"href="index"><img style="width:40%; height:10%;" src="images/logo.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item active">
                        <a href="index" class="nav-link">HOME</a> 
                     </li>
                     <li class="nav-item">
                        <a href="about_us" class="nav-link">ABOUT</a> 
                     </li>
                     <li class="nav-item">
                        <a href="contact_us" class="nav-link">CONTACT</a>
                     </li>
                     <li class="nav-item">
                        <a href="login" class=" form-inline my-2 my-lg-0 nav-link">LOGIN</a>
                     </li>
                     <li class="nav-item">
                        <a href="register_user" class=" form-inline my-2 my-lg-0 nav-link">REGISTER</a>
                     </li>
                  </ul>                 
               </div>
            </nav>
         </div>
         
         <!-- banner section start --> 
            <div class="container">
				<div class="row">   
					<div class="tagline">			
						<h1>MODERN & ELEGANT</h1>
						<h5>Simple and Beautiful Design</h5>
							<div class="btn_main">
								<div class="about_bt"><a href="#">Start Shopping</a></div>
							</div>                              
					</div>                 
				</div>
            </div>

         <!-- banner section end -->
      </div>
      <!-- header section end -->
      
      <!-- collection section start -->
		<div class="collection">
			<div class="premium">
				<h2>PREMIUM COLLECTION</h2>
				<i>Free shipping with orders over $200</i>
			</div>
			<div class="image1">
				<div class="banner_img"><img src="images/collection1.jpg"></div>
				<div class="banner_img"><img src="images/collection2.jpg"></div>
				<div class="banner_img"><img src="images/collection3.jpg"></div>				
			</div>
			<div class="image2">
				<div class="banner_img"><img src="images/collection4.jpg"></div>
				<div class="banner_img"><img src="images/collection5.png"></div>
				<div class="banner_img"><img src="images/collection6.jpg"></div>				
			</div>
		</div>
      <!-- collection section end -->
		
		<div class="mid">
			<div class="mid-img"
	        	style="background-image: url(images/mid-img.jpg); background-position: center; background-size: cover; height: 450px; ">	        	 	
		     	<div class="philosophy">     		
					<h3>OUR PHILOSOPHY</h3>
					<p>We believe in offering the highest quality products, <br>
					ensuring trust and transparency, <br>
					and embracing innovation to provide the best possible service.</p>
				</div>
				
			</div> 
		</div>
		
		<!-- collection section start -->
		<div class="collection2">
			<div class="premium2">
				<h2>FEATURED PRODUCTS</h2>
				<i>Includes free shipping (Phillipines Only)</i>
			</div>
			<div class="image3">
				<div class="banner_img"><img src="images/product1.png">
				<h6></h6>
				</div>
				<div class="banner_img"><img src="images/product2.png">
				<h6></h6>
				</div>
				<div class="banner_img"><img src="images/product3.png">
				<h6></h6>
				</div>
				<div class="banner_img"><img src="images/product4.png">
				<h6></h6>
				</div>
							
			</div>
		</div>
      <!-- collection section end -->
      		
		<div class="bot">
			<div class="bot-img"
	        	style="background-image: url(images/bot-img.jpg); background-position: center; background-size: cover; height: 400px; ">	        	 	
		     	<div class="discount">    
		     	<div class="tag_img"><img src="images/tag.png"></div>	 		
					<h4>UP TO 20% OFF ON ALL PRODUCTS</h4>
					<p>Now Through December 31</p>
				</div>
				
			</div> 
		</div>
		
		
      
      
	<!-- Copyright -->
	<div class="text-center p-4"
		style="background-color: #fafaf1;">
		&copy; 2022 Copyright: <a class="text-reset fw-bold"
			>Jumpstart.com</a>
	</div>
	<!-- Copyright -->
     
   

   </body>

 
 
		
</html>
