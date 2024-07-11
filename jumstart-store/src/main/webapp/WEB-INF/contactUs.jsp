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
      <link rel="stylesheet" type="text/css" href="css/contactUs.css">
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
<link href="/css/contactUs.css" rel="stylesheet" />
<script src="/js/script.js"></script>

</head>

<body>
      <div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light">
                <a class="navbar-brand"href="index"><img style="width:40%; height:10%; margin-left:25px;" src="images/logo.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item ">
                        <a href="index" class="nav-link">HOME</a> 
                     </li>
                     <li class="nav-item">
                        <a href="about_us" class="nav-link">ABOUT</a> 
                     </li>
                     <li class="nav-item active">
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
            
            <h1>Contact Us</h1>
         </div>
      </div>
      <!-- header section end -->
      

      <!-- contact section start -->


    <div class="contact">
        <div class="getin">
            <h2>Get in touch</h2>
            <p>Looking for help? Fill the form and start a new adventure.</p>

            <div class="getin-details">
                <h3>Headquarters</h3>
                <div>
                    <i class="far fa-home get"></i>
                    <p>0705 Ibanez Street, San Diego, Luisiana, Laguna 4032</p>
                </div>
                <h3>Phone</h3>
                <div>
                    <i class="fas fa-phone-alt get"></i>
                    <p> (+63) 961-9985-902 <br> (+63) 907-5507-693</p>
                </div>
                <h3>Support</h3>
                <div>
                    <i class="fal fa-envelope-open-text get"></i>
                    <p>abclearningcenter@gmail.com <br> abclearningcenter@support.com</p>
                </div>
                <h3>Follow Us</h3>
                <div class="pro-links">
                <a href="https://www.facebook.com/janellejagunap22/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a href="https://www.instagram.com/janellejagunap/" target="_blank"><i class="fab fa-instagram"></i></a>
                <a href="https://www.linkedin.com/in/janelle-jagunap-04aa5a250/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>

        <div class="form">
            <h4>Reach Our Team</h4>
            <p>We love questions and feedback – and we’re always happy to help!
                Here are some ways to contact us.</p>
            <div class="form-row">
                <input type="text" placeholder="Your Name">
                <input type="text" placeholder="Email">
            </div>
            <div class="form-col">
                <input type="text" placeholder="Subject">
            </div>
            <div class="form-col">
                <textarea name="" id="" cols="30" rows="8" placeholder="How can we help?"></textarea>
            </div>
            <div class="form-col">
                <button >Send Message</button>
            </div>
        </div>
    </div>

    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d494939.14994190016!2d121.0392454748071!3d14.
        27000440999895!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd600ea02bf27d%3A0xd19ea6f21743ff24!2s
        Laguna!5e0!3m2!1sen!2sph!4v1665103593737!5m2!1sen!2sph"style="border:0;" 
        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
      <!-- contact section end -->
      
<%@ include file="footer.jsp"%>
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

</body>
</html>
