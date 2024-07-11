<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
	<!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/aboutUs.css">
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


<!--  Access the Static Resources without using spring URL -->
<script src="/js/script.js"></script>

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
                     <li class="nav-item ">
                        <a href="index" class="nav-link">HOME</a> 
                     </li>
                     <li class="nav-item active">
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
						<h1>Simple and Beautiful Designs</h1>                            
					</div>                 
				</div>
            </div>
         <!-- banner section end -->
         
      </div>
      
      <div class="about">
      	<h2>ABOUT US</h2>
      	<p>At Jumpstart, our philosophy is simple yet profound: 
      	We're dedicated to making online shopping an effortless and enjoyable experience for every customer. <br>
      	We believe in offering the highest quality products, ensuring trust and transparency, and embracing innovation to <br>
      	provide the best possible service. <br>
      	<br>
      	We're committed to sustainability, inclusivity, and community engagement, all while prioritizing your privacy and security. <br>
      	We aspire to continuously learn, adapt, and empower our customers to make informed choices. Our philosophy revolves around you,  <br>
      	and we're here to transform your online shopping journey into something exceptional.    	
      	</p>
      	
      	<div class="images">
      		<div class="img1"><img src="images/collection7.jpg"></div>
			<div class="img2"><img src="images/collection8.jpg"></div>
      	</div>      	
      </div>
      
      <div class="mission">
      
      <div class="mission-text">
            <h2>OUR MISSION</h2>
            <hr>
            <p>At Jumpstart, our mission is to make online shopping simple, <br> 
             convenient, and rewarding. Our platform is designed to empower you with <br>
             a wide range of choices, excellent customer service, <br>
            and the latest trends in fashion, electronics, home decor, and more.
            </p>
        </div>  
        
		<div class="about-img">
            <img src="images/1.jpg">
        </div>
        
               
      </div>
      
      <div class="vision">
            
		<div class="about-img">
            <img src="images/2.jpg">
        </div>
        
        <div class="vision-text">
            <h2>OUR VISION</h2>
            <hr>
            <p>Our vision is to become your preferred online shopping destination, <br> 
             providing you with a one-stop solution for all your shopping needs.  <br>
             We aim to continuously expand our product offerings, <br>
             improve our services, and innovate to stay at the forefront of e-commerce.
            </p>
        </div>  
        
     </div>
     
      
      	<%@ include file="footer.jsp"%>
      
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
   </body>
</html>
