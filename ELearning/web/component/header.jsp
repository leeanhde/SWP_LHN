<%@page import="java.util.ArrayList"%>
<%@page import="model.Course"%>
<%@page import="dal.CourseDAO"%>
<%@page import="model.User"%>
<%@page import="model.Enroll"%>
<%@page import="dal.EnrollDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%
    User user = (User) session.getAttribute("acc");
    ArrayList<Integer> listProgressPercent= new ArrayList<Integer>();
%>
<meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
            <meta content="" name="description">
                <!-- Favicon -->
                <link href="<%=url%>/homepage/img/favicon.ico" rel="icon">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                            <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

                                <!-- Icon Font Stylesheet -->
                                <link
                                    rel="stylesheet"
                                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
                                    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
                                    crossorigin="anonymous"
                                    referrerpolicy="no-referrer"
                                    />
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
                                                        left:20px;
                                                    }
                                                    .navbar-search-icon {
                                                        position: absolute;
                                                        left:8px;
                                                        top: 8px;
                                                        color: #2b2b2b;
                                                        cursor: pointer;
                                                    }
                                                    .navbar-search-wrap input {
                                                        border: 1px solid #515151;
                                                        border-radius: 10px;
                                                        padding: 8px 16px 8px 32px;
                                                        min-width: 450px;
                                                    }
                                                    .navbar-search-wrap input::placeholder {
                                                        color: #2b2b2b;
                                                    }
                                                    .navbar-search-wrap input:focus {
                                                        outline: #06bbcc;
                                                        color: #2b2b2b;
                                                        border: 3px solid #06bbcc;

                                                    }

                                                    .logo {
                                                        width: 100px;
                                                        height: 50px;
                                                        margin: 10px;
                                                    }


                                                    .navbar {
                                                        display: flex;
                                                        justify-content: space-between;
                                                        align-items: center;
                                                        padding: 10px 20px;
                                                    }



                                                    /* CSS responsive: thay ??i kích th??c logo khi màn hình nh? h?n */


                                                    .hi{
                                                        max-width: 450px;
                                                        position: fixed;
                                                        top:65px;
                                                        left: 155px;
                                                        width: 100%;
                                                        height: 100%;
                                                        z-index: 1111111111111111111111;
                                                    }
                                                    .hi{
                                                        background-color: #fbfbfb;
                                                        height: auto;
                                                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                                                        border-radius: 10px;
                                                    }
                                                    .hi p{
                                                        color:#181d38;
                                                        border: 1rem;
                                                        margin-left: 1rem;
                                                    }
                                                    .hi p:hover{
                                                        color: #28c4d3
                                                    }
                                                    /*                                                    /////////////////////////*/
                                                    .mycourse{
                                                        max-width: 450px;
                                                        position: fixed;
                                                        top:65px;
                                                        right: 215px;
                                                        width: 100%;
                                                        height: 100%;
                                                        z-index: 1111111111111111111111;
                                                    }
                                                    .mycourse{
                                                        background-color: #fbfbfb;
                                                        height: auto;
                                                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                                                        border-radius: 10px;
                                                    }
                                                    .mycourse p{
                                                        color:#181d38;
                                                        border: 1rem;
                                                        margin-left: 1rem;
                                                    }
                                                    .mycourse p:hover{
                                                        color: #28c4d3
                                                    }

                                                    @keyframes slideDown {
                                                        from {
                                                            transform: translateY(-100%);
                                                            opacity: 0;
                                                        }
                                                        to {
                                                            transform: translateY(0);
                                                            opacity: 1;
                                                        }
                                                    }
                                                    .iconsearch:hover{
                                                        fill: lightblue;

                                                        .hidden {
                                                            display: none;
                                                        }

                                                        .slide-down {
                                                            animation: slideDown 0.5s ease-in-out forwards;
                                                        }

                                                        .name-user {
                                                            display: flex;
                                                            flex-direction: column;
                                                        }
                                                        .name-user strong {
                                                            color: #3d3d3d;
                                                            font-size: 1.1rem;
                                                            letter-spacing: 0.5px;
                                                        }
                                                        .name-user span {
                                                            color: #979797;
                                                            font-size: 0.8rem;
                                                        }



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

                                                        /*Avatar and menu*/
                                                        .vl {
                                                            border-left: 6px solid green;
                                                            height: 500px;
                                                        }
                                                        /*       process                    /////////////////////////// //////*/

                                                        .progress{
                                                            width: 320px;
                                                            height: 20px;
                                                            background: #181d38;
                                                        }
                                                        .progress_fill{
                                                            width: 50%;
                                                            height: 100%;
                                                            background: #28c4d3
                                                        }

                                                    </style>   
                                                    <style>
                                                        .vertical {
                                                            border-left: 1px solid #d8d8d8;
                                                            height: 45px;
                                                            font-weight: 300px;
                                                            margin: auto;
                                                            margin-right: 30px;
                                                        }
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
                                                            left: -105px;
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

                                                        .hidden2 {
                                                            display: none;
                                                        }
                                                    </style>
                                                    <!-- Navbar Start -->
                                                    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0 navbar">
                                                        <a href="/ELearning/" class="navbar-brand d-flex align-items-center px-4 px-lg-5" style="padding-left: 0rem !important;
                                                           padding-right:0rem !important">
                                                               <!--                <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eLEARNING</h2>-->
                                                               <img class="logo" src="<%=url%>/homepage/img/logo.png" alt="Logo">

                                                           </a>
                                                           <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                                                               <span class="navbar-toggler-icon"></span>
                                                           </button>
                                                           <div class="d-flex align-items-center navbar-search-wrap" >
                                                               <input placeholder="Search..." id="searchInput">
                                                                   <div class="navbar-search-icon">
                                                                       <svg class="iconsearch" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>

                                                                           </style><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>           
                                                                   </div>                                                                    
                                                           </div>

                                                           <div class="collapse navbar-collapse" id="navbarCollapse">
                                                               <div class="navbar-nav ms-auto p-4 p-lg-0">
                                                                   <a href="<%=url%>/homepage/index.jsp" class="nav-item nav-link active">Home</a>
                                                                   <a href="<%=url%>/homepage/about.jsp" class="nav-item nav-link">About</a>
                                                                   <a href="<%=url%>/homepage/courses.jsp" class="nav-item nav-link">Courses</a>
                                                                   <!--                <div class="nav-item dropdown">
                                                                                       <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                                                                       <div class="dropdown-menu fade-down m-0">
                                                                                           <a href="homepage/team.html" class="dropdown-item">Our Team</a>
                                                                                           <a href="homepage/testimonial.html" class="dropdown-item">Testimonial</a>
                                                                                           <a href="404.html" class="dropdown-item">404 Page</a>
                                                                                       </div>
                                                                                   </div>-->
                                                                   <a href="<%=url%>/homepage/contact.jsp" class="nav-item nav-link">Contact</a>
                                                                   <c:if test="${not empty acc}">
                                                                       <div class = "vertical"></div>
                                                                       <a style="color:black;
                                                                       margin :auto;
                                                                       margin-right: 30px;
                                                                       cursor: pointer;
                                                                       font-weight: 700;
                                                                       user-select: none;
                                                                       font-size: 15px" id="toggleButton">MY COURSES</a>
                                                                       <div class = "vertical"></div>
                                                                       <div  style="margin:auto">
                                                                           <i class="fa-solid fa-bell align-middle" style="font-size: 23px;
                                                                           margin: auto;
                                                                           margin-top: 0px;
                                                                           margin-right: 1.8rem"></i>
                                                                       </div>
                                                                   </c:if>


                                                               </div>
                                                               <c:if test="${ empty acc}">
                                                                   <a href="<%=url%>/login" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Join Now<i class="fa fa-arrow-right ms-3"></i></a>
                                                                   </c:if>
                                                                   <c:if test="${not empty acc}">

                                                                   <div class="nav-bar-avatar" id="avatar">
                                                                       <%String avatar = user.getAvatar(); %>
                                                                       <%if (avatar.contains("//")) {%>
                                                                       <img src="<%=user.getAvatar()%>" alt="">
                                                                           <%}else{%>
                                                                           <img style="margin-right:5px" src="<%=url%>/imageStorage/user/<%=user.getAvatar()%>" alt=""> Ngoc Duc
                                                                               <%}%>
                                                                               <div class="nav-bar-sidemenu" id="nav-bar-sidemenu">
                                                                                   <a href="<%=url%>/UpdateProfile" class="nav-bar-sidemenu-item-link">
                                                                                       <div class="nav-bar-sidemenu-item"> 
                                                                                           <i class="fa-solid fa-user"></i> Profile  
                                                                                       </div>
                                                                                   </a>
                                                                                   <a href="<%=url%>/UpdateProfile" class="nav-bar-sidemenu-item-link">
                                                                                       <div class="nav-bar-sidemenu-item"> 
                                                                                           <i class="fa-solid fa-gear"></i> Profile  
                                                                                       </div>
                                                                                   </a>
                                                                                   <c:if test="${ not empty acc }">
                                                                                       <a href="<%=url%>/admin/dashboard" class="nav-bar-sidemenu-item-link">
                                                                                           <div class="nav-bar-sidemenu-item"> 
                                                                                               <i class="fa-solid fa-cogs"></i></i> Admin Manager 
                                                                                           </div>
                                                                                       </a>
                                                                                   </c:if>                                                                               


                                                                                   <a href="<%=url%>/Logout" class="nav-bar-sidemenu-item-link">
                                                                                       <div class="nav-bar-sidemenu-item"> 
                                                                                           <i class="fa-solid fa-arrow-right-from-bracket"></i></i> Sign Out 
                                                                                       </div>
                                                                                   </a> 

                                                                               </div>
                                                                               </div>
                                                                           </c:if>

                                                                           </div>
                                                                           </nav>
                                                                           <div class="hi" style="display: none" id="searchResults">
                                                                               <div class="d-flex" style="margin:1rem 0px ">
                                                                                   <i class="fa-solid fa-magnifying-glass" style="margin-left: 1rem"></i><span style="font-weight:100;
                                                                                   font-size:13px ;
                                                                                   margin-left: 0.5rem">Results for 'HTML'</span>
                                                                               </div>
                                                                               <span style="font-size: 16px;
                                                                               font-weight: 500;
                                                                               margin-left: 1rem;
                                                                               margin-top: 25px">COURSE</span>
                                                                               <hr style="margin:0px 1rem;
                                                                               font-weight: 50">

                                                                                   <%
                                                                                        ArrayList<Course> listCourse = new ArrayList<Course>();
                                                                                           CourseDAO dao = new CourseDAO();
                                                                                           listCourse = dao.popularCourses();
                                                                                   %>
                                                                                   <%for (Course course2 : listCourse) {%>
                                                                                   <a href="http://localhost:9999/ELearning/course/courseDetail.jsp?courseId=<%=course2.getCourseId()%>" style="display: flex;
                                                                                   align-items: center;
                                                                                   margin-top: 1rem">
                                                                                       <img src="<%=url%>/imageStorage/course/<%=course2.getCourseImg()%>" style="max-width: 58px;
                                                                                       margin:0px 1rem">
                                                                                           <p style="margin: 0px;
                                                                                           width: 500px;
                                                                                           font-weight: 600"><%=course2.getCourseName()%><br>
                                                                                                   <span style="font-size: 14px;
                                                                                                   color: #232c4e;
                                                                                                   font-weight: 100"><%=course2.getCategoryId().getCategoryName()%> &nbsp;  - &nbsp; <%=course2.getUserId().getFullName()%> &nbsp;  - &nbsp; <%=course2.getPublish()%></span>
                                                                                           </p>
                                                                                   </a>

                                                                                   <%
                                                                                       }                                                      
                                                                                   %>

                                                                                   <div class="text-center mt-3 mb-2">
                                                                                       <a style="color:#2bc5d4" href="">See More</a>

                                                                                   </div>
                                                                           </div>
                                                                           <c:if test="${ not empty acc}">

                                                                               <div class="mycourse hidden2"  id="courseprogress">

                                                                                   <div class="mt-3">
                                                                                       <span style="font-size: 16px;
                                                                                       font-weight: 500;
                                                                                       margin-left: 1rem;
                                                                                       margin-top: 25px">My Course</span> 
                                                                                   </div>

                                                                                   <%
                                                                                      ArrayList<Enroll> listCourseEnroll = new ArrayList<Enroll>(); 
                                                                                       EnrollDAO enrollDaoCourse = new EnrollDAO();
                                                                                       listCourseEnroll = enrollDaoCourse.getListcourseEnrolledByUserID(user.getUserId());
                                                                                   %>
                                                                                   <%for (Enroll enroll : listCourseEnroll) {%>
                                                                                   <div class="d-flex">

                                                                                       <div>
                                                                                           <a href="http://localhost:9999/ELearning/course/courseDetail.jsp?courseId=<%=enroll.getCourseId().getCourseId()%>" style="display: flex;
                                                                                           align-items: center;
                                                                                           margin-top: 1rem">
                                                                                               <img src="<%=url%>/imageStorage/course/<%=enroll.getCourseId().getCourseImg()%>" style="width: 120px;
                                                                                               margin:0px 1rem;
                                                                                               border-radius:  5px">
                                                                                           </a>
                                                                                       </div>
                                                                                       <div style="margin-top: 1rem">
                                                                                           <div>
                                                                                               <p style="margin: 0px;
                                                                                               width: 500px;
                                                                                               color:black;
                                                                                               font-weight: 700" ><%=enroll.getCourseId().getCourseName()%><br>
                                                                                                       <span style="font-size: 14px;
                                                                                                       color: #232c4e;
                                                                                                       font-weight: 100">Enrollment Date: &nbsp; <%=enroll.getDateEnroll()%></span>
                                                                                                       <br>                                                                                                  
                                                                                                           </p>

                                                                                                           </div>

                                                                                                           <div>
                                                                                                               <div class="progress" 
                                                                                                                    style="border-radius: 8px;
                                                                                                               width: 280px;
                                                                                                               position: relative;
                                                                                                               overflow: hidden; ">
                                                                                                               <div class="progress_fill" style="
                                                                                                                    width: 50%;
                                                                                                                    height: 100%;
                                                                                                                    border-radius: 8px;
                                                                                                                    background:#2ac5d4" id="percent-progress"></div>
                                                                                                                    <span class="progress__text" style="position: absolute;
                                                                                                                    top:0;
                                                                                                                    right: 5px;
                                                                                                                    font-weight: 1000 "><%=enroll.getProgess()%>%</span>
                                                                                                               </div>
                                                                                                           </div>
                                                                                                           </div>
                                                                                                           </div>
                                                                                                           <% listProgressPercent.add(enroll.getProgess()); %>  
                                                                                                           <%} %>
                                                                                                           <div class="text-center mt-3 mb-2 text-primary">
                                                                                                               <a href="">See All</a>
                                                                                                           </div>

                                                                                                           </div>
                                                                                                       </c:if>
                                                                                                       <!--                                                                        //////-->

                                                                                                       <!-- Navbar End -->
                                                                                                       <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                                                                                                       <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                                                                                                       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                                                                                                       <script src="<%=url%>/homepage/lib/wow/wow.min.js"></script>
                                                                                                       <script src="<%=url%>/homepage/lib/easing/easing.min.js"></script>
                                                                                                       <script src="<%=url%>/homepage/lib/waypoints/waypoints.min.js"></script>
                                                                                                       <script src="<%=url%>/homepage/lib/owlcarousel/owl.carousel.min.js"></script>

                                                                                                       <!-- Template Javascript -->
                                                                                                       <script src="<%=url%>/homepage/js/main.js"></script>
                                                                                                       <script>

                                                                                                           const search = document.getElementById("searchInput");
                                                                                                           const content = document.getElementById("searchResults");

                                                                                                           search.addEventListener("focus", () => {
                                                                                                               content.style.display = "block";
                                                                                                               content.classList.remove("hidden");
                                                                                                               content.classList.add("slide-down");
                                                                                                           });

                                                                                                           search.addEventListener("blur", () => {
                                                                                                               setTimeout(() => {
                                                                                                                   if (!content.contains(document.activeElement)) {
                                                                                                                       content.classList.remove("slide-down");
                                                                                                                       setTimeout(() => {
                                                                                                                           content.classList.add("hidden");
                                                                                                                       }, 500);
                                                                                                                       content.style.display = "none";
                                                                                                                   }
                                                                                                               }, 100);
                                                                                                           });
                                                                                                       </script>
                                                                                                       <script>
                                                                                                           $(document).ready(function () {
                                                                                                               $('#searchInput').on('input', function () {
                                                                                                                   var searchTerm = $(this).val(); // 

                                                                                                                   $.ajax({
                                                                                                                       url: 'http://localhost:9999/ELearning/Search',
                                                                                                                       type: 'POST',
                                                                                                                       data: {term: searchTerm},
                                                                                                                       dataType: 'json',
                                                                                                                       success: function (data) {
                                                                                                                           displayResults(data);
                                                                                                                           console.log(data);
                                                                                                                       },
                                                                                                                       error: function () {
                                                                                                                           console.error('Failed to perform search.');
                                                                                                                       }
                                                                                                                   });
                                                                                                               });
                                                                                                               function displayResults(results) {
                                                                                                                   var resultsContainer = document.getElementById('searchResults');
                                                                                                                   const inputElement = document.getElementById("searchInput");
                                                                                                                   const inputValue = inputElement.value;

                                                                                                                   resultsContainer.innerHTML = '';

                                                                                                                   var divElement = document.createElement("div");
                                                                                                                   divElement.className = "d-flex";
                                                                                                                   divElement.style.margin = "1rem 0px";

                                                                                                                   var iconElement = document.createElement("i");
                                                                                                                   iconElement.className = "fa-solid fa-magnifying-glass";
                                                                                                                   iconElement.style.marginLeft = "1rem";

                                                                                                                   var spanElement = document.createElement("span");
                                                                                                                   spanElement.style.fontWeight = "100";
                                                                                                                   spanElement.style.fontSize = "13px";
                                                                                                                   spanElement.style.marginLeft = "0.5rem";
                                                                                                                   spanElement.textContent = "Results for " + "'" + inputValue + "'";

                                                                                                                   divElement.appendChild(iconElement);
                                                                                                                   divElement.appendChild(spanElement);

                                                                                                                   var courseSpanElement = document.createElement("span");
                                                                                                                   courseSpanElement.style.fontSize = "16px";
                                                                                                                   courseSpanElement.style.fontWeight = "500";
                                                                                                                   courseSpanElement.style.marginLeft = "1rem";
                                                                                                                   courseSpanElement.style.marginTop = "25px";
                                                                                                                   courseSpanElement.textContent = "COURSE";

                                                                                                                   var hrElement = document.createElement("hr");
                                                                                                                   hrElement.style.margin = "0px 1rem";
                                                                                                                   hrElement.style.fontWeight = "50";

                                                                                                                   resultsContainer.appendChild(divElement);
                                                                                                                   resultsContainer.appendChild(courseSpanElement);
                                                                                                                   resultsContainer.appendChild(hrElement);



                                                                                                                   for (var i = 0; i < results.length; i++) {
                                                                                                                       var resultItem = results[i];
                                                                                                                       var listItem = document.createElement('li');

                                                                                                                       var link = document.createElement("a");
                                                                                                                       var string = "http://localhost:9999/ELearning/course/courseDetail.jsp?courseId=" + resultItem.courseId.toString();
                                                                                                                       link.href = string;
                                                                                                                       link.style.display = "flex";
                                                                                                                       link.style.alignItems = "center";
                                                                                                                       link.style.marginTop = "1rem";

                                                                                                                       ////////////////////////////////////////
                                                                                                                       var link_img = "http://localhost:9999/ELearning/imageStorage/course/" + resultItem.courseImg.toString();

                                                                                                                       var img = document.createElement("img");
                                                                                                                       img.src = link_img;
                                                                                                                       img.style.maxWidth = "58px";
                                                                                                                       img.style.margin = "0px 1rem";
                                                                                                                       //////////////////////////////////////
                                                                                                                       var paragraph = document.createElement("p");
                                                                                                                       paragraph.style.margin = "0px";
                                                                                                                       paragraph.style.width = "500px";
                                                                                                                       paragraph.style.fontWeight = "700";
                                                                                                                       paragraph.innerHTML = resultItem.courseName + `<br>`;
                                                                                                                       ////////////////////////////////////////////////////////////
                                                                                                                       var spane = document.createElement("span")
                                                                                                                       spane.style.fontSize = "14px";
                                                                                                                       spane.style.color = "#232c4e";
                                                                                                                       spane.style.fontWeight = "100";
                                                                                                                       spane.innerHTML = resultItem.categoryId.categoryName + " &nbsp; - &nbsp; " + resultItem.userId.fullName + " &nbsp; - &nbsp; " + resultItem.Publish;
                                                                                                                       ////////////////////////////////////////////////////
                                                                                                                       paragraph.appendChild(spane);
                                                                                                                       link.appendChild(img);
                                                                                                                       link.appendChild(paragraph);

                                                                                                                       resultsContainer.appendChild(link);
                                                                                                                   }

                                                                                                                   var link = document.createElement("a");
                                                                                                                   link.href = "#";
                                                                                                                   var paragraph = document.createElement("p");
                                                                                                                   paragraph.classList.add("text-center", "mt-3", "mb-2");
                                                                                                                   paragraph.textContent = "See More";
                                                                                                                   paragraph.style.marginLeft = "0px";

                                                                                                                   link.appendChild(paragraph);

                                                                                                                   var parentElement = document.getElementById("myDiv");
                                                                                                                   resultsContainer.appendChild(link);

                                                                                                               }
                                                                                                           });
                                                                                                       </script>
                                                                                                       <script>
                                                                                                           document.addEventListener("DOMContentLoaded", function () {
                                                                                                               const avatar = document.getElementById("avatar");
                                                                                                               const sideMenu = document.getElementById("nav-bar-sidemenu");

                                                                                                               avatar.addEventListener("click", function () {
                                                                                                                   const computedStyle = window.getComputedStyle(sideMenu);
                                                                                                                   const isHidden = computedStyle.display === "none";

                                                                                                                   sideMenu.style.display = isHidden ? "block" : "none";
                                                                                                               });
                                                                                                           });
//                                                                                                           document.addEventListener("DOMContentLoaded", function () {
//                                                                                                               const avatar = document.getElementById("avatar");
//                                                                                                               const sideMenu = document.getElementById("nav-bar-sidemenu");
//
//                                                                                                               avatar.addEventListener("click", function () {
//                                                                                                                   const isHidden = sideMenu.style.display === "none";
//
//                                                                                                                   sideMenu.style.display = isHidden ? "block" : "none";
//                                                                                                               });
//                                                                                                           });
                                                                                                       </script>

                                                                                                       <script>

                                                                                                           const progressFillDivs = document.querySelectorAll(".progress_fill");
                                                                                                           const widthList = <%=listProgressPercent%>; 

                                                                                                           for (let i = 0; i < progressFillDivs.length; i++) {
                                                                                                               const currentDiv = progressFillDivs[i];
                                                                                                               const width = widthList[i];

                                                                                                               currentDiv.style.width = width + "%";
                                                                                                           }

                                                                                                       </script>
                                                                                                       <script>
                                                                                                           var toggleButton = document.getElementById("toggleButton");
                                                                                                           var myDiv = document.getElementById("courseprogress");
                                                                                                           toggleButton.addEventListener("click", function () {
                                                                                                               myDiv.classList.toggle("hidden2");
                                                                                                           });

                                                                                                           document.addEventListener("click", function (event) {
                                                                                                               if (!myDiv.contains(event.target) && event.target !== toggleButton) {
                                                                                                                   myDiv.classList.add("hidden2");
                                                                                                               }
                                                                                                           });
                                                                                                       </script>