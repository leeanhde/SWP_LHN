<%-- 
    Document   : courses
    Created on : Sep 13, 2023, 1:14:53 AM
    Author     : NhatAnh
--%>
<%@page import="model.Category"%>
<%@page import="dal.CategoryDAO"%>
<%@page import= "java.util.Comparator" %>
<%@page import= "java.util.Collections" %>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<%      
    CourseDAO daoCourse= new CourseDAO();
    ArrayList<Course> listCourseFilter1 = (ArrayList<Course>) request.getAttribute("listCourseFilter");;
    if(listCourseFilter1 == null){
        listCourseFilter1 = daoCourse.selectAll();
    }
        
        ArrayList<Course> listCourseFilter = new ArrayList<Course>();
        daoCourse= new CourseDAO();
        
     if(request.getParameter("categoryid") ==null){
        listCourseFilter = daoCourse.selectAll();
    }   
    else{
        int categoryID = Integer.parseInt(request.getParameter("categoryid"));
        listCourseFilter = daoCourse.selectByCategoryID(categoryID);
    }
%>

<!-- phan trang start -->
<%
    int pageNumber;
    int numberOfPage = listCourseFilter.size()/6;
    if(listCourseFilter.size() % 6 != 0){
        numberOfPage++;
    }

    if(request.getParameter("page") == null){
        pageNumber = 1;
    }   
    else{
        pageNumber = Integer.parseInt(request.getParameter("page"));
    }
    
%>
<!-- phan trang end -->

<!-- Sort by Publish date() -->
<%
        int sort;
        if(request.getParameter("sort") ==null){
            sort = 1;
    }   
    else{
            sort = Integer.parseInt(request.getParameter("sort"));
        switch(sort){
            case 1:
                Collections.sort(listCourseFilter, new Comparator<Course>() {
                    public int compare(Course o1, Course o2) {
                    return o1.getPublish().compareTo(o2.getPublish());
                }
    });
            break;
            case 2:
                Collections.sort(listCourseFilter, new Comparator<Course>() {
                    public int compare(Course o1, Course o2) {
                    return - o1.getPublish().compareTo(o2.getPublish());
                }
    });
            break;

    }
    }   

%>
<!-- Sort by Publish date() -->
<%
    CategoryDAO categoryDAO = new CategoryDAO();
    ArrayList<Category> categoryList = new ArrayList<Category>();
    categoryList = categoryDAO.selectAll();
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
        <link href="<%=url%>img/favicon.ico" rel="icon">

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
        <style>
            #page<%=pageNumber%>{
                background: #06BBCC;

            }
            #page<%=pageNumber%> p{
                color: white;
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
            @media all and (max-width: 991px) {
                .navbar-search-wrap {
                    display: none !important;
                }
            }

            .main {
                background: #f5f7f8;
            }

            .custom-checkbox {
                transform: scale(1.5); /* Adjust the scale factor to change the size */
                margin: 0 1rem;
            }

            /* Change the color of the checkmark to blue-white */
            .custom-checkbox + label::before {
                border: 2px solid #007bff; /* Blue border for the checkbox */
                background-color: #fff; /* White background for the checkbox */
            }

            .card-container {
                background: #fff;
                border: 1px solid lightgrey;
                border-radius: 8px;
                width: 30.33333% !important;
                margin: 10px 5px;
                cursor: pointer;
            }

            .card-container:hover {
                transform: scale(1.05);
                box-shadow: 0 0 11px rgba(33,33,33,.2);
                transition-duration: 0.5s;
            }

            .card-img {
                aspect-ratio: 16/9;
                margin-bottom: 8px;
                overflow: hidden;
                border-bottom-right-radius: 8px !important;
                border-bottom-left-radius: 8px !important;
            }

            img {
                margin-top: 8px;
                border-radius: 8px; /* Apply border-radius to all corners of the image */
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .card-icon-container {
                align-items: center;
                gap: 4px;
                margin: 1rem 0;
            }

            .card-icon {
                width: 24px;
                height: 24px;
                border: 1px solid lightgray;
                padding: 2px;
                user-select: none;
                box-sizing: content-box;
            }

            .text-eclipse-1 {
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .text-eclipse-3 {
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .card-bottom {
                display: flex;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
                gap: 4px;
                -webkit-flex: 1;
                -ms-flex: 1;
                flex: 1;
                -webkit-box-pack: end;
                -ms-flex-pack: end;
                -webkit-justify-content: end;
                justify-content: end;
                padding: 1rem 0;
            }

            .card-bottom-review {
                align-items: initial;
                margin-bottom: 4px;
            }

            .description-text{
                font-size: 13px
            }

            a {
                text-decoration: none !important;
            }
            .content a{
                color: black !important;

            }

            a:hover{
                color: none !important;
            }
        </style>
    </head>
    <body>
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

        <!-- Main start -->
        <div class="main">
            <div class="container d-flex col-12">
                <div class="col-3" style="padding-right: 16px">
                    <div class="mt-3">
                        <h3><b>Filter by</b> </h3> 
                        <a class="filter-item" href="<%=url%>/homepage/courses.jsp">
                            <h6>All courses</h6>
                        </a> </br>
                    </div>
                    <form id="duration-form" action="http://localhost:9999/ELearning/FilterCourseServlet" method="post"> 
                        <h5> <b>Category</b></h5>
                        <div class="category-item-filter">
                            <%for (Category category : categoryList) {%>
                            <label for = "category<%=category.getCategoryId()%>"> <input class="filter-item filter-by-category" id ="category<%=category.getCategoryId()%>" type="checkbox" name="categoryID<%=category.getCategoryId()%>" /> <%=category.getCategoryName()%></label>    
                            </br>
                            <%}%>
                        </div> </br>

                        <h5><b>Duration</b></h5>
                        <div class = "filter-item-duration-container">

                            <label for = "filterID1" ><input class="filter-item filter-by-duration" id="filterID1" type="checkbox" name="duration1"/> Less than 2 hours</label>
                            </br>
                            <label for = "filterID2"> <input class="filter-item filter-by-duration" id="filterID2" type="checkbox" name="duration2"  /> 2-5 hours</label>
                            </br>
                            <label for = "filterID3"><input class="filter-item filter-by-duration" id="filterID3" type="checkbox" name="duration3"  /> 5-8 hours</label>
                            </br>
                            <label for = "filterID4"><input class="filter-item filter-by-duration" id="filterID4" type="checkbox" name="duration4"  /> More than 8 hours</label>
                            </br>
                        </div>
                        <br>
                        <h3><b>Sort by</b></h3>
                        <div class = "filter-item-duration-container">

                            <label for = "sortID1" ><input type="radio" id="sortID1" name="sort-by" value="1" checked="checked" /> Latest </label>
                            </br>
                            <label for = "sortID2"> <input type="radio" id="sortID2" name="sort-by" value="2" />Most people join </label>
                            </br>
                        </div>
                        <br>
                        <input class="button-filter-and-sort" type="submit" value="Filter and sort" />
                    </form>

                    </br>   


                </div>
                <div class="col-10">
                    <h4 class="mt-3"><%=listCourseFilter1.size() %> results</h4>
                    <div class="row col-12">

                        <!-- test course list start -->
                        <div class="container-xxl py-5">
                            <div class="container">
                                <div class="row g-4 justify-content-start" id="course-list-container">  
                                    <%for (int i= pageNumber*6-6 ;i < Math.min(listCourseFilter1.size(), pageNumber*6) ; i++) {%>
                                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                        <div class="course-item bg-light">
                                            <div class="position-relative overflow-hidden">
                                                <a href="<%=url%>/course/courseDetail.jsp?courseId=<%=listCourseFilter1.get(i).getCourseId()%>">

                                                    <img class="img-course img-fluid" src="<%=url%>/imageStorage/course/<%=listCourseFilter1.get(i).getCourseImg()%>" alt="" style="width: 100%; height: 200px">
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

                                                <a href="<%=url%>/course/courseDetail.jsp?courseId=<%=listCourseFilter1.get(i).getCourseId()%>">
                                                    <h5 class="mb-4 mt-3 course-name"><%=listCourseFilter1.get(i).getCourseName()%></h5>
                                                </a>
                                                <p>Publish Date: <%=listCourseFilter1.get(i).getPublish()%></p>
                                            </div>
                                            <div class="d-flex border-top">
                                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-user-tie text-primary me-2"></i><%=listCourseFilter1.get(i).getUserId().getFullName()%></small>
                                                <small class="flex-fill text-center border-end py-2"><i class="fa fa-clock text-primary me-2"></i><%=listCourseFilter1.get(i).getDuration()%> Hrs</small>
                                                <%
                                                            EnrollDAO enrollDao = new EnrollDAO();
                                                            int total= enrollDao.totalParticipationInCourse(listCourseFilter1.get(i).getCourseId());
                                                %>
                                                <small class="flex-fill text-center py-2"><i class="fa fa-user text-primary me-2"></i><%=total%> Students</small>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>

                                    <!-- Page number start -->
                                    <div class="number-page">
                                        <c:forEach begin="1" end="<%=numberOfPage%>" var="i">
                                            <a id ="page${i}" class="number-of-page"href="<%=url%>/homepage/courses.jsp?page=${i}" > <p>${i}</p> </a>
                                        </c:forEach>
                                        <!-- Page number end -->
                                    </div>
                                    <!-- test course list end -->
                                    <!-- comment -->


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main end --> 




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
