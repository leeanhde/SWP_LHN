<%-- 
    Document   : courseDetail
    Created on : Sep 11, 2023, 12:43:52 AM
    Author     : ADMIN
--%>
<%@page import="model.Course"%>
<%@page import="model.Mooc"%>
<%@page import="model.Lesson"%>
<%@page import="model.Review"%>

<%@page import="dal.CourseDAO"%>
<%@page import="dal.EnrollDAO"%>
<%@page import="dal.MoocDAO"%>
<%@page import="dal.LessonDAO"%>
<%@page import="dal.ReviewDAO"%>

<%@page import="java.util.ArrayList"%>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>


<%int totalLesson=0;%>


<%
             int courseID = Integer.parseInt(request.getParameter("courseId"));
                    CourseDAO courseDao=null;
            courseDao = new CourseDAO();
            Course course=new Course();
            course = courseDao.selectById(courseID);
           
EnrollDAO enrollDao = new EnrollDAO();
                                            int total= enrollDao.totalParticipationInCourse(courseID);                    
           ArrayList<Mooc> listMooc = new ArrayList<Mooc>();
                MoocDAO moocDao= new MoocDAO();
                listMooc = moocDao.getMoocByCourseId(courseID);
                    
            

                
                
ArrayList<Review> listReview = new ArrayList<Review>();
                ReviewDAO reviewDao= new ReviewDAO();
                listReview = reviewDao.selectReviewByCourseId(courseID);
                

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="<%=url%>/homepage/img/tab_icon.png" type="image/x-icon">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Detail</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="../asset/CSS/courseDetail.css"/>
        <link rel="stylesheet" href="../asset/CSS/starRating.css"/>
        <link rel="stylesheet" href="../asset/CSS/avatar.css"/>

        <script>
            var a = 0; // Khai báo biến JavaScript 'a' và gán giá trị ban đầu là 0
        </script>

    </head>
    <body>  
        <%@include file= "../component/header.jsp" %>
        <div class="row p-5" style="padding-bottom: 0rem !important;padding-top: 2rem !important; margin-top:0px !important">
            <div class="col-md-8">
                <div class="card border-0">
                    <div class="card-body" style="padding-bottom: 0rem !important">
                        <h1><%=course.getCourseName()%></h1>
                        <span
                            style="
                            display: inline-block;
                            vertical-align: middle;
                            font-size: 17px;
                            "
                            ><i class="fa-solid fa-graduation-cap"></i
                            ></span>
                        <h5
                            style="
                            display: inline-block;
                            vertical-align: middle;
                            margin-bottom: 0;
                            "
                            >
                            Teacher:
                        </h5>

                        <span style="display: inline-block; vertical-align: middle"
                              ><h5 style="color: blue; margin-bottom: 0; cursor: pointer">
                                <%=course.getUserId().getFullName()%>
                            </h5></span
                        >
                        <div class="rating">
                            <!--                            <i class="fas fa-star star-rating"></i>
                                                        <i class="fas fa-star star-rating"></i>
                                                        <i class="fas fa-star star-rating"></i>
                                                        <i class="fas fa-star star-rating"></i>
                                                        <i class="far fa-star star-rating"></i>-->
                            <i data-star=""></i>

                            <div class="ratings-info">

                                <p style="margin-bottom: 0; font-size: 14px">
                                    <span id="avgStar" style="font-weight: 600"></span> Star - <span style="font-weight: 600"><%=listReview.size()%> </span> Reviews
                                </p>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div
                            style="
                            position: relative;
                            padding-bottom: 56.25%;
                            height: 0;
                            overflow: hidden;
                            "
                            >
                            <iframe
                                class="text-center"
                                src="https://www.youtube.com/embed/nRUacyq-h3M?si=BWGIWrfW5X77IsFQ"
                                title="YouTube video player"
                                frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                allowfullscreen
                                style="
                                position: absolute;
                                top: 0;
                                left: 0;
                                width: 82%;
                                height: 82%;
                                "
                                ></iframe>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card border-0">
                    <div class="card-body custom-card-body">
                        <img
                            src="<%=url%>/imageStorage/course/<%=course.getCourseImg()%>"
                            style="width: 100%; border: 2px solid ; border-radius: 10px"
                            />
                        <h3 class="mt-3 animate-charcter" style="color: red; font-weight: bold">free course</h3><br>
                        <button name="enroll-button" type="submit" class="btn btn-primary btn-lg">Enroll Now</button>
                        <!-- Nút lớn -->
                        <p class="mt-4">
                            <i class="fa-solid fa-users" style="margin-right: 0.6rem"></i> Quantity participated: 
                            <span style="font-weight: 700"><%=total%></span>
                        </p>
                        <p>
                            <i class="fa-solid fa-layer-group" style="margin-right: 1rem"></i
                            >Category: <span style="font-weight: 700"> <%=course.getCategoryId().getCategoryName()%></span>

                        </p>
                        <p>
                            <i class="fa-solid fa-film" style="margin-right: 1rem"></i>Total number of lessons:
                            <span style="font-weight: 700" id="totalLesson">0</span>

                        </p>
                        <p>
                            <i class="fa-solid fa-clock" style="margin-right: 1rem"></i>Duration:
                            <span style="font-weight: 700"> <%=course.getDuration()%></span> hour
                        </p>
                        <p>
                            <i class="fa-regular fa-calendar-days" style="margin-right: 1rem"></i> Publish Date:
                            <span style="font-weight: 700" id="totalLesson"><%=course.getPublish()%></span>
                        </p>
                        <p>
                            <i class="fa-solid fa-street-view" style="margin-right: 1rem"></i
                            >Study every time and everywhere
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <!-- Tab items -->
            <div class="tabs">
                <div class="tab-item active">
                    <i class="tab-icon fa-solid fa-circle-info"></i>
                    Description
                </div>
                <div class="tab-item">
                    <i class="tab-icon fa-solid fa-book-open"></i>

                    Content
                </div>
                <div class="tab-item">
                    <i class="tab-icon fa-regular fa-star-half-stroke"></i> Reviews
                </div>
            </div>

            <!-- Tab content -->
            <div class="tab-content">
                <div class="tab-pane active">
                    <div style="text-align: center; margin-bottom: 2rem">
                        <span
                            style="
                            font-size: 1.3rem;
                            color: #252525;
                            margin-bottom: 10px;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            "
                            >Description</span
                        >
                    </div>
                    <p style="width: 80%; margin:auto;  text-align: justify;text-justify: inter-word;">
                        <%=course.getDescription()%>
                    </p>
                </div>
                <div class="tab-pane">
                    <div style="text-align: center; margin-bottom: 2rem">
                        <span
                            style="
                            font-size: 1.3rem;
                            color: #252525;
                            margin-bottom: 10px;
                            letter-spacing: 2px;
                            text-transform: uppercase;
                            "
                            >Content</span
                        >
                    </div>
                    <ul class="accordion">
                        <%for (Mooc mooc : listMooc) {%>
                        <li>
                            <input type="checkbox" name="accordion" id="<%=mooc.getMoocNumber()%>" />
                            <label for="<%=mooc.getMoocNumber()%>"> Mooc <%=mooc.getMoocNumber()%>: &nbsp;    <%=mooc.getMoocName()%></label>
                            <div class="content">
                                <%
                                ArrayList<Lesson> listLesson = new ArrayList<Lesson>();
                                LessonDAO lessonDao= new LessonDAO();
                                int moocid=mooc.getMoocId();
                                listLesson=lessonDao.selectLessonByMoocId(moocid);
                                %>

                                <%for (Lesson lesson : listLesson) {%>
                                <p>
                                    <i
                                        class="fa-solid fa-circle-play"
                                        style="margin-right: 1rem"
                                        ></i
                                    >Lesson <%=lesson.getLessonNumber()%>:&nbsp;  <%=lesson.getLessonName()%>
                                </p>
                                <hr />

                                <%
                                    totalLesson++;}           
                                %>
                            </div>
                        </li> 
                        <%
                           }
                        %>

                    </ul>
                </div>

                <div class="tab-pane">
                    <section id="testimonials">
                        <div style="text-align: center; margin-bottom: 2rem">
                            <span
                                style="
                                font-size: 1.3rem;
                                color: #252525;
                                margin-bottom: 10px;
                                letter-spacing: 2px;
                                text-transform: uppercase;
                                "
                                >Conmments And Reviews</span
                            >
                        </div>
                        <%int totalStar=0;%>
                        <%for (Review review : listReview) {%>

                        <div class="testimonials-box-container">
                            <div class="testimonials-box">
                                <div class="box-top">
                                    <div class="profile">
                                        <div class="profile-img">
                                            <img
                                                src="https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645.jpg"
                                                />
                                        </div>
                                        <div class="name-user">
                                            <strong><%=review.getUserId().getFullName()%></strong>
                                            <span><%=review.getTime()%></span>
                                        </div>
                                    </div>
                                    <%
                                    int star = review.getRating(); 
                                    totalStar+=star;
                                    %>

                                    <div class="review">
                                        <%for (int i = 0; i < star; i++) {%>
                                        <i class="fas fa-star"></i>
                                        <%
                                         }
                                        %>
                                        <%for (int i = star; i < 5; i++) {%>
                                        <i class="far fa-star"></i>

                                        <%                 
                                        }
                                        %>
                                       
                                    </div>
                                </div>

                                <div class="clinet-comment">
                                    <p>
                                        <span><%=review.getReviewContent()%></span>

                                    </p>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </section>
                </div>
            </div>
        </div>
        <%@include file= "../component/footer.jsp" %>   
        <script>
            const tabs = document.querySelectorAll(".tab-item");
            const all_content = document.querySelectorAll(".tab-pane");

            tabs.forEach((tab, index) => {
                tab.addEventListener('click', (e) => {
                    tabs.forEach(tab => {
                        tab.classList.remove('active')
                    });
                    tab.classList.add('active');

                    all_content.forEach(content => {
                        content.classList.remove('active')
                    });
                    all_content[index].classList.add('active');
                });
            });


            //  const tabs = b(".tab-item");
            // const panes = b(".tab-pane");

//            const tabActive = a(".tab-item.active");
//
//            tabs.forEach((tab, index) => {
//                const pane = panes[index];
//
//                tabs.onclick = function () {
//                    tabs(".tab-item.active").classList.remove("active");
//                    tabs(".tab-pane.active").classList.remove("active");
//
//                    this.classList.add("active");
//                    all_content.classList.add("active");
//                };
//            });

        </script>
        <script>
            totalLesson = <%=totalLesson%>;
            avgStar = (<%=totalStar%> /<%=listReview.size()%>).toFixed(1);
            document.getElementById("totalLesson").innerText = totalLesson;
            document.getElementById("avgStar").innerText = avgStar;

            const starElement = document.querySelector('i[data-star=""]');
            starElement.setAttribute('data-star', avgStar);
        </script>

    </body>
</html>
