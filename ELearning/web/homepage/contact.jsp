<%-- 
    Document   : contact.jsp
    Created on : Sep 13, 2023, 1:31:31 AM
    Author     : NhatAnh
--%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>eLEARNING - eLearning HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="<%=url%>/homepage/lib/animate/animate.min.css" rel="stylesheet">
        <link href="<%=url%>/homepage/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="<%=url%>/homepage/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="<%=url%>/homepage/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=url%>/asset/CSS/avatar.css"/>

    </head>
    <body>
        <style>
            .navbar-search-wrap {
                position: relative;
            }
            .navbar-search-icon {
                position: absolute;
                left: 8px;
                top: 8px;
                cursor: pointer;
            }
            .navbar-search-wrap input {
                border: 1px solid #06bbcc;
                border-radius: 8px;
                padding: 8px 16px 8px 32px;
                min-width: 360px;
            }
            .navbar-search-wrap input::placeholder {
                color: #06bbcc;
            }
            .navbar-search-wrap input:focus {
                outline: #06bbcc;
                color: #06bbcc;
            }
            @media all and (max-width: 991px) {
                .navbar-search-wrap {
                    display: none !important;
                }
            }
        </style>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Header start-->
        <%@include file= "../component/header.jsp" %>
        <!-- Header End -->



         <!-- Header2 Start -->
                <div class="container-fluid bg-primary py-5 mb-5 page-header">
                    <div class="container py-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-10 text-center">
                                <h1 class="display-3 text-white animated slideInDown">Courses</h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb justify-content-center">
                                        <li class="breadcrumb-item"><a class="text-white" href="<%=url%>/homepage/index.jsp">Home</a></li>
                                        <li class="breadcrumb-item"><a class="text-white" href="<%=url%>/homepage/about.jsp">About</a></li>
                                        <li class="breadcrumb-item"><a class="text-white" href="<%=url%>/homepage/courses.jsp">Courses</a></li>             
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- Header2 End -->


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Contact Us</h6>
                    <h1 class="mb-5">Contact For Any Query</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <h5>Get In Touch</h5>
                        <p class="mb-4">The contact form is currently inactive. Get a functional and working contact form with Ajax & PHP in a few minutes. Just copy and paste the files, add a little code and you're done. <a href="https://htmlcodex.com/contact-form">Download Now</a>.</p>
                        <div class="d-flex align-items-center mb-3">
                            <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary" style="width: 50px; height: 50px;">
                                <i class="fa fa-map-marker-alt text-white"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="text-primary">Office</h5>
                                <p class="mb-0">Beta405 - FPT University</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary" style="width: 50px; height: 50px;">
                                <i class="fa fa-phone-alt text-white"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="text-primary">Mobile</h5>
                                <p class="mb-0">+84 398 452 345</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary" style="width: 50px; height: 50px;">
                                <i class="fa fa-envelope-open text-white"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="text-primary">Email</h5>
                                <p class="mb-0">ELearning@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <iframe class="position-relative rounded w-100 h-100"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d931.1204322467229!2d105.52567724825941!3d21.01340239092305!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345bbf92a47af7%3A0x4edce7f012bf8c9e!2sBeta%20FPT%20Building!5e0!3m2!1sen!2s!4v1694772946657!5m2!1sen!2s"
                                frameborder="0" style="min-height: 400px; border:0;" allowfullscreen="" aria-hidden="false"
                                tabindex="0"></iframe>
                    </div>
                    <div class="col-lg-4 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                        <form>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="name" placeholder="Your Name">
                                        <label for="name">Your Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="email" placeholder="Your Email">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="subject" placeholder="Subject">
                                        <label for="subject">Subject</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px"></textarea>
                                        <label for="message">Message</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->


        <!-- Footer Start -->
        <%@include file= "../component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=url%>/homepage/lib/wow/wow.min.js"></script>
        <script src="<%=url%>/homepage/lib/easing/easing.min.js"></script>
        <script src="<%=url%>/homepage/lib/waypoints/waypoints.min.js"></script>
        <script src="<%=url%>/homepage/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="<%=url%>/homepage/js/main.js"></script>
    </body>
</html>
