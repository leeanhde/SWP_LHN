<%-- 
    Document   : index
    Created on : Sep 13, 2023, 12:57:51 AM
    Author     : NhatAnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page import="model.Course"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>

<%@page import="dal.CourseDAO"%>
<%@page import="dal.EnrollDAO"%>
<%@page import="dal.UserDAO"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

        ArrayList<Course> listCourseAll = new ArrayList<Course>();
        CourseDAO daoCourse= new CourseDAO();
        listCourseAll = daoCourse.selectTop3Course();
            
        ArrayList<User> listTeacher = new ArrayList<User>();
        UserDAO userDao= new UserDAO();
        listTeacher= userDao.getAllTeacher();
    

%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="<%=url%>/homepage/img/tab_icon.png" type="image/x-icon">

        <meta charset="utf-8">
        <title>ELearning</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <!-- Favicon -->
        <link href="homepage/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
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
            /*Avatar and menu*/
            .nav-bar-avatar {
                margin-right: 16px;
                position: relative;
            }
            .nav-bar-sidemenu {
                display: none;
                position: absolute;
                width: 240px;
                background-color: #f4f4f4;
                border-radius: 8px;
                left: -200px;
                top: 57px;
            }
            .nav-bar-sidemenu-item {
                padding: 16px;
                display: flex;
                gap: 16px;
                align-items: center;
            }
            .nav-bar-sidemenu-item:hover {
                background-color: #dbdbdb;
                cursor: pointer;
                transition: 1s;
            }
            .nav-bar-sidemenu a {
                text-decoration: none;
            }
            .nav-bar-avatar img{
                cursor: pointer;
                width: 40px;
                height: 40px;
                border-radius: 100%
            }
            /*Avatar and menu*/
            @media all and (max-width: 991px) {
                .navbar-search-wrap {
                    display: none !important;
                }
            }

            .overlay_all {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6);
                z-index: 222222222222222222222222222222222222222222222222222222222222222222222222222222;
            }

            .popup2{
                position: absolute;
                top:-150%;
                left:50%;
                transform :translate(-50%,-50%) scale(1.15);
                width: 450px;
                padding:20px 30px;
                background: #fff;
                box-shadow: 2px 2px 5px 5px rgba(0,0,0,0,15);
                border-radius: 10px;
                transition: top 0ms ease-in-out 200ms,
                    opacity 200ms ease-in-out 0ms,
                    transform 200ms ease-in-out 0ms;
            }

            .popup2.active{

                top:50%;
                opacity: 1;
                transform :translate(-50%,-50%) scale(1);
                transition: top 0ms ease-in-out 0ms,
                    opacity 200ms ease-in-out 0ms,
                    transform 200ms ease-in-out 0ms;
            }

            .popup2 .close-btn{
                position: absolute;
                top:10px;
                right: 10px;
                width: 15px;
                height: 15px;
                background: #888;
                color:#eee;
                text-align: center;
                line-height: 15px;
                border-radius: 15px;
                cursor: pointer;
            }
            .popup2 .form h2{
                text-align: center;
                color:#222;
                margin: 10px 0px 20px;
                font-size:25px;
            }

            .popup2 .form .form-element{
                margin: 15px 0px;
            }
            .popup2 .form .form-element label{
                font-size:14px;
                color:#222;
            }
            .popup2 .form .form-element input[type="text"], .popup2 .form .form-element input[type="password"]{
                margin-top:5px;
                display:block;
                width: 100%;
                padding:10px;
                outline: none;
                border:1px solid #aaa;
                border-radius: 5px
            }
            .popup2 .form .form-element button{
                width: 100%;
                height: 40px;
                border:none;
                outline: none;
                font-size: 16px;
                background: #222;
                color:#f5f5f5;
                border-radius: 10px;
                cursor: pointer;
            }
            .no-click {
                pointer-events: none;
                background-color: gray;
                color: white;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        <c:if test="${not empty logout}">
            <script>
                Swal.fire(
                        'Sign Out!',
                        'You have successfully logged out of the system',
                        'success'
                        )
            </script>
            <c:remove var="logout" scope="session" />

        </c:if>
        <c:if test="${ not empty loginGG}">
            <script>
                console.log("hi");
            </script>
            <div class="overlay_all" id="overlay" style="display: block;"></div>
            <div class="popup2 active" id ="popup" style="z-index: 2222222222222222222222222222222222222222222222222222222222222222222222222222223;">
                <div class="close-btn">x</div>

                <form action="/EBook/AddBook" id="editform" method="post" enctype="multipart/form-data">
                    <div class="text-center">
                        <img src="http://localhost:9999/ELearning/homepage/img/logo.png" style="width: 100px">

                    </div>
                    <h5 class="mt-4" id="title">Set a password for your account.</h5>
                    <p id="content">
                        You can log in with your google account or email, the password is set here.
                    </p>
                    <div class="alert alert-danger" role="alert" id="errorAlert" style="display: none;">
                        <i class="fa-solid fa-triangle-exclamation"></i> Error
                        <br>
                        <span id="errorText"></span>
                    </div>
                    <div id="input-button">
                        <div class="form-group first">
                            <p style="color: #000; margin-bottom: 0px" for="newpassd">New Password</p>
                            <input type="password" class="form-control" placeholder="From 6 to 30 characters" id="newpass" required="required">
                        </div>
                        <div class="form-group first">
                            <p style="color: #000; margin-bottom: 0px" for="conpass">Confirm Password</p>
                            <input type="password" class="form-control" placeholder="From 6 to 30 characters" id="conpass" required="required">
                        </div>
                        <input type="hidden" name="formType" value="forgot">
                        <div class="text-center form-group mb-1 mt-4">
                            <button type="button" class="btn btn-info w-100" id="submitButton" onclick="validateInput()">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </c:if>
        <%--  <c:if test="${not empty acc}">
              <c:if test="${ empty acc.password}">
                  <script>
                      console.log("hi55555");
                  </script>
                  <div class="overlay_all" id="overlay" style="display: block;"></div>
                  <div class="popup2 active" id ="popup" style="z-index: 2222222222222222222222222222222222222222222222222222222222222222222222222222223;">
                      <div class="close-btn">x</div>

                        <form action="/EBook/AddBook" id="editform" method="post" enctype="multipart/form-data">
                            <div class="text-center">
                                <img src="http://localhost:9999/ELearning/homepage/img/logo.png" style="width: 100px">

                            </div>
                            <h5 class="mt-4" id="title">Set a password for your account.</h5>
                            <p id="content">
                                You can log in with your google account or email, the password is set here.
                            </p>
                            <div class="alert alert-danger" role="alert" id="errorAlert" style="display: none;">
                                <i class="fa-solid fa-triangle-exclamation"></i> Error
                                <br>
                                <span id="errorText"></span>
                            </div>
                            <div id="input-button">
                                <div class="form-group first">
                                    <p style="color: #000; margin-bottom: 0px" for="newpassd">New Password</p>
                                    <input type="password" class="form-control" placeholder="From 6 to 30 characters" id="newpass" required="required">
                                </div>
                                <div class="form-group first">
                                    <p style="color: #000; margin-bottom: 0px" for="conpass">Confirm Password</p>
                                    <input type="password" class="form-control" placeholder="From 6 to 30 characters" id="conpass" required="required">
                                </div>
                                <input type="hidden" name="formType" value="forgot">
                                <div class="text-center form-group mb-1 mt-4">
                                    <button type="button" class="btn btn-info w-100" id="submitButton" onclick="validateInput()">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
            </c:if>--%>



        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Header Start -->
        <%@include file= "../component/header.jsp" %>
        <!-- Header End -->


        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5">
            <div class="owl-carousel header-carousel position-relative">
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="<%=url%>/homepage/img/carousel-1.jpg" alt="abc">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-sm-10 col-lg-8">
                                    <h5 class="text-primary text-uppercase mb-3 animated slideInDown">Best Online Courses</h5>
                                    <h1 class="display-3 text-white animated slideInDown">The Best Online Learning Platform</h1>
                                    <p class="fs-5 text-white mb-4 pb-2">Join now for truly useful courses.</p>
                                    <a href="<%=url%>/homepage/about.jsp" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                    <a href="http://localhost:9999/ELearning/login" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-carousel-item position-relative">
                    <img class="img-fluid" src="<%=url%>/homepage/img/carousel-2.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-sm-10 col-lg-8">
                                    <h5 class="text-primary text-uppercase mb-3 animated slideInDown">Best Online Courses</h5>
                                    <h1 class="display-3 text-white animated slideInDown">Get Educated Online From Your Home</h1>
                                    <p class="fs-5 text-white mb-4 pb-2">Flexible learning lets you study wherever and whenever suits your schedule.</p>
                                    <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                    <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-graduation-cap text-primary mb-4"></i>
                                <h5 class="mb-3">Skilled Instructors</h5>
                                <p>Lecturers have extensive experience in teaching.</p>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-globe text-primary mb-4"></i>
                                <h5 class="mb-3">Online Classes</h5>
                                <p>We have 1000+ Online Classes to suit your study schedule.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-home text-primary mb-4"></i>
                                <h5 class="mb-3">Home Practice</h5>
                                <p>We have a team of consultants 24/7 to help answer questions.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="service-item text-center pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-book-open text-primary mb-4"></i>
                                <h5 class="mb-3">Book Library</h5>
                                <p>We are affiliated with university online book libraries.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                        <div class="position-relative h-100">
                            <img class="img-fluid position-absolute w-100 h-100" src="<%=url%>/homepage/img/about.jpg" alt="" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                        <h6 class="section-title bg-white text-start text-primary pe-3">About Us</h6>
                        <h1 class="mb-4">Welcome to ELearning</h1>
                        <p class="mb-4">There are many courses, documents, and quizzes in many fields with a team of high-quality teachers.</p>
                        <p class="mb-4">Join us for truly useful courses</p>
                        <div class="row gy-2 gx-4 mb-4">
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Online Classes</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Skilled Instructors</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>Online Classes</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"></i>International Certificate</p>
                            </div>
                        </div>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="http://localhost:9999/ELearning/homepage/about.jsp">Read More</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Categories Start -->
        <div class="container-xxl py-5 category">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Categories</h6>
                    <h1 class="mb-5">Popular Courses Categories</h1>
                </div>
                <%      
                       CourseDAO daoCourse2= new CourseDAO();
                       ArrayList<Course> listCoursePrograming = new ArrayList<Course>();
                       listCoursePrograming = daoCourse2.selectByCategoryID(0);  
                %>
                <div class="row g-3">
                    <div class="col-lg-7 col-md-6">
                        <div class="row g-3">
                            <div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
                                <a class="position-relative d-block overflow-hidden" href="">
                                    <img class="img-fluid" src="<%=url%>/homepage/img/cat-1.jpg" alt="">
                                    <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                        <h5 class="m-0">Programing</h5>                                
                                        <small class="text-primary"><%= listCoursePrograming.size()%> Courses </small>
                                    </div>
                                </a>
                            </div>
                            <%      
                                CourseDAO daoCourse3= new CourseDAO();
                                ArrayList<Course> listCourseDesign = new ArrayList<Course>();
                                listCourseDesign = daoCourse3.selectByCategoryID(4);  
                            %>
                            <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
                                <a class="position-relative d-block overflow-hidden" href="">
                                    <img class="img-fluid" src="<%=url%>/homepage/img/cat-2.jpg" alt="">
                                    <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                        <h5 class="m-0">Graphic Design</h5>
                                        <small class="text-primary"><%= listCourseDesign.size()%> Courses </small>
                                    </div>
                                </a>
                            </div>
                            <%      
                                CourseDAO daoCourse4= new CourseDAO();
                                ArrayList<Course> listCourseCooking = new ArrayList<Course>();
                                listCourseCooking = daoCourse4.selectByCategoryID(1);  
                            %>                    
                            <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
                                <a class="position-relative d-block overflow-hidden" href="">
                                    <img class="img-fluid" src="<%=url%>/homepage/img/cooking.jpg" alt="">
                                    <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                        <h5 class="m-0">Cooking</h5>
                                        <small class="text-primary"><%= listCourseCooking.size()%> Courses</small>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%      
                        CourseDAO daoCourse5= new CourseDAO();
                        ArrayList<Course> listCourseMaketting = new ArrayList<Course>();
                        listCourseMaketting = daoCourse5.selectByCategoryID(3);  
                    %>                         
                    <div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s" style="min-height: 350px;">
                        <a class="position-relative d-block h-100 overflow-hidden" href="">
                            <img class="img-fluid position-absolute w-100 h-100" src="<%=url%>/homepage/img/cat-4.jpg" alt="" style="object-fit: cover;">
                            <div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin:  1px;">
                                <h5 class="m-0">Online Marketing</h5>
                                <small class="text-primary"><%= listCourseMaketting.size()%> Courses</small>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories Start -->


        <!-- Courses Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Courses</h6>
                    <h1 class="mb-5">Popular Courses</h1>
                </div>
                <div class="row g-4 justify-content-start">
                    <%for (Course course : listCourseAll) {%>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="course-item bg-light">
                            <div class="position-relative overflow-hidden">
                                <a href="<%=url%>/course/courseDetail.jsp?courseId=<%=course.getCourseId()%>">

                                    <img class="img-course img-fluid" src="<%=url%>/imageStorage/course/<%=course.getCourseImg()%>" alt="" style="width: 100%; height: 200px">
                                </a>
                                <!--                                    <div class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4">
                                                                        <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end" style="border-radius: 30px 0 0 30px;">Read More</a>
                                                                        <a href="#" class="flex-shrink-0 btn btn-sm btn-primary px-3" style="border-radius: 0 30px 30px 0;">Join Now</a>
                                                                    </div>-->
                            </div>
                            <div class="text-center p-4 pb-0 ">
                                <div class="d-flex justify-content-around">
                                    <h3 class="mb-0 text-danger">Free</h3>
                                    <div class="mb-3">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small>(123)</small>
                                    </div>  
                                </div>

                                <a href="<%=url%>/course/courseDetail.jsp?courseId=<%=course.getCourseId()%>">
                                    <h5 class="mb-4 mt-3 course-name"><%=course.getCourseName()%></h5>
                                </a>
                                <p>Publish Date: <%=course.getPublish()%></p>
                            </div>
                            <div class="d-flex border-top">
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i><%=course.getUserId().getFullName()%></small>
                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i><%=course.getDuration()%> Hrs</small>
                                <%
                                            EnrollDAO enrollDao = new EnrollDAO();
                                            int total= enrollDao.totalParticipationInCourse(course.getCourseId());
                                %>
                                <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i><%=total%> Students</small>
                            </div>
                        </div>
                    </div>
                    <%}%>




                </div>
            </div>
        </div>
        <!-- Courses End -->


        <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Instructors</h6>
                    <h1 class="mb-5">Expert Instructors</h1>
                </div>
                <div class="row g-4">

                    <%for (User teacher : listTeacher) {%>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light">
                            <div class="overflow-hidden">

                                <%String avatar = teacher.getAvatar(); %>
                                <%if (avatar.contains("//")) {%>
                                <img style="height: 300px" class="img-fluid w-100" src="<%=teacher.getAvatar()%>" alt="">
                                <%}else{%>
                                <img style="height: 300px" class="img-fluid w-100" src="<%=url%>/imageStorage/user/<%=teacher.getAvatar()%>" alt="">
                                <%}%>



                            </div>
                            <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                                <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4">
                                <h5 class="mb-0"><%=teacher.getFullName()%></h5>
                                <small>Teacher</small>
                            </div>
                        </div>
                    </div>
                    <%}%>


                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h6 class="section-title bg-white text-center text-primary px-3">Testimonial</h6>
                    <h1 class="mb-5">Our Students Say!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel position-relative">
                    <div class="testimonial-item text-center">
                        <img class="border rounded-circle p-2 mx-auto mb-3" src="<%=url%>/homepage/img/testimonial-1.jpg" style="width: 80px; height: 80px;">
                        <h5 class="mb-0">Bui Dinh Chien</h5>
                        <p>Lecturers</p>
                        <div class="testimonial-text bg-light text-center p-4">
                            <p class="mb-0">This website has a very nice interface and deserves a high score.</p>
                        </div>
                    </div>
                    <div class="testimonial-item text-center">
                        <img class="border rounded-circle p-2 mx-auto mb-3" src="<%=url%>/homepage/img/testimonial-2.jpg" style="width: 80px; height: 80px;">
                        <h5 class="mb-0">Vu Minh Tuan</h5>
                        <p>Lecturers</p>
                        <div class="testimonial-text bg-light text-center p-4">
                            <p class="mb-0">The courses here are extremely useful. Thank you development team.</p>
                        </div>
                    </div>
                    <div class="testimonial-item text-center">
                        <img class="border rounded-circle p-2 mx-auto mb-3" src="<%=url%>/homepage/img/testimonial-3.jpg" style="width: 80px; height: 80px;">
                        <h5 class="mb-0">Son Tung ATM</h5>
                        <p>Singer</p>
                        <div class="testimonial-text bg-light text-center p-4">
                            <p class="mb-0">The vocal courses are extremely good. Thank you teachers and development team.</p>
                        </div>
                    </div>
                    <div class="testimonial-item text-center">
                        <img class="border rounded-circle p-2 mx-auto mb-3" src="<%=url%>/homepage/img/testimonial-4.jpg" style="width: 80px; height: 80px;">
                        <h5 class="mb-0">Uzumaki Naruto</h5>
                        <p>Ninja</p>
                        <div class="testimonial-text bg-light text-center p-4">
                            <p class="mb-0">I hope more ninjas will know about this website.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->

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
        <!-- Script Avatar and menu -->

        <!-- Script Avatar and menu -->
        <!-- Template Javascript -->
        <script src="<%=url%>/homepage/js/main.js"></script>
        <script>
                                function validateInput() {
                                    var newpass = document.getElementById("newpass").value;
                                    var conpass = document.getElementById("conpass").value;
                                    var errorText = document.getElementById("errorText");
                                    var errorAlert = document.getElementById("errorAlert");

                                    console.log(newpass);
                                    console.log(conpass);
                                    if (newpass.length == 0) {
                                        errorAlert.style.display = "block";
                                        errorText.innerHTML = "Please fill in all information fields! ";
                                    } else if (newpass.length < 6) {
                                        errorAlert.style.display = "block";
                                        errorText.innerHTML = "Please click larger than 6 characters! ";
                                    } else if (newpass != conpass) {
                                        errorAlert.style.display = "block";
                                        errorText.innerHTML = "Password and confirm password do not match! ";
                                    } else if (newpass.length > 30) {
                                        errorAlert.style.display = "block";
                                        errorText.innerHTML = "Password between 6 and 30 characters! ";
                                    } else {

                                        var user = "${sessionScope.acc.userId}";
                                        console.log(user);
                                        var overlay = document.getElementById("overlay");
                                        var popup = document.getElementById("popup");
                                        overlay.style.display = "none";
                                        popup.style.display = "none";

                                        var data1 = {action: "setPassword", userId: user, password: newpass};
                                        $.ajax({
                                            type: "POST",
                                            url: "http://localhost:9999/ELearning/LoginGoogleHandler",
                                            data: data1,
                                            success: function (response) {
                                                console.log(response);

                                                Swal.fire(
                                                        'Welcome New Members!',
                                                        ' Please go to my profile to complete your information.',
                                                        'success'
                                                        )
                                            },
                                            error: function (xhr, status, error) {
                                                console.error("Lỗi:", error);
                                            }
                                        });


                                    }
                                }
        </script>
    </body>
</html>
