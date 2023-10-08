<%-- 
    Document   : index.jsp
    Created on : Sep 19, 2023, 4:33:19 PM
    Author     : KinNhun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.CourseDAO"%>
<%@page import="dal.RoleDAO"%>
<%@page import="dal.AccountDAO"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Dashboard</title>
        <link rel="stylesheet" href="css/all.min.css" />
        <link rel="stylesheet" href="css/framework.css" />
        <link rel="stylesheet" href="css/master.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet" />
        <style>
            /* CSS nền hiển thị Modal */
            .nenmodal .nenmodal2 {
                position:fixed;
                top:0px;
                left:0px;
                width:100vw;
                height:100vh;
                background:rgba(0,0,0,0.7);
                z-index:1;
                display:none;
            }
            /* CSS bảng nội dung Modal */
            .nenmodal .ndmodal {
                position:absolute;
                top:50%;
                left:50%;
                transform:translate(-50%,-50%) scale(0);
                background:#fff;
                width:600px;
                z-index:2;
                text-align:center;
                padding:20px;
                box-sizing:border-box;
                font-family:"Open Sans",sans-serif;
                border-radius:20px;
                display: block;
                position: fixed;
                box-shadow:0px 0px 10px #111;
            }
            @media (max-width: 700px) {
                .nenmodal .ndmodal {
                    width:90%;
                }
            }
            /* CSS bao bọc của nút tắt Modal */
            .nenmodal .closemodal {
                text-align:center;
                margin-top:-40px;
                margin-bottom:10px;
            }
            /* CSS tieu de của Modal */
            .titlemodal{
                font-weight:bold;
                font-size:20px;
                margin-bottom:10px;
            }
            /* CSS nút tắt modal */
            .closemodal button{
                width:40px;
                height:40px;
                font-size:30px;
                padding:0px;
                border-radius:100%;
                background:#333;
                color:#fff;
                border:none;
            }
            .nenmodal.active .nenmodal2 {
                display:block;
            }
            /* CSS hiệu ứng hiển thị Modal */
            .nenmodal.active .ndmodal {
                transition:all 300ms ease-in-out;
                transform:translate(-50%,-50%) scale(1);
            }
        </style>
    </head>
    <body>
        <div class="page d-flex">
            <jsp:include page="sidebar.jsp"></jsp:include>

                <div class="content w-full">
                    <!-- Start Head -->
                    <div>
                    <%@include file= "../component/header.jsp" %>
                </div>
                <!-- End Head -->
                <h1 class="p-relative">Dashboard</h1>
                <div class="wrapper d-grid gap-20">


                    <!-- Start user -->
                    <div class="tickets p-20 bg-white rad-10">
                        <h2 class="mt-0 mb-10">Users by role</h2>
                        <p class="mt-0 mb-20 c-grey fs-15">Everything about the number of users</p>
                        <div class="d-flex txt-c gap-20 f-wrap">
                            <div class="box p-20 rad-10 fs-13 c-grey">
                                <i class="fa-regular fa-rectangle-list fa-2x mb-10 c-orange"></i>
                                <%
                                    CourseDAO courseDao=null;
                                    courseDao = new CourseDAO();
                                    int totalCourses = courseDao.countTotalCourses();
                                %>
                                <span class="d-block c-black fw-bold fs-25 mb-5">
                                    <%= totalCourses%>
                                </span>
                                Course
                            </div>
                            <div class="box p-20 rad-10 fs-13 c-grey">
                                <i class="fa-solid fas fa-chalkboard-teacher fa-2x mb-10 c-blue"></i>
                                <span class="d-block c-black fw-bold fs-25 mb-5">
                                    <%
                                        RoleDAO roleDAO = null;
                                        roleDAO = new RoleDAO();
                                        int totalTeacher = roleDAO.countTotalRolebyID(1);
                                        int totalStudent = roleDAO.countTotalRolebyID(0);
                                        int totalModerator = roleDAO.countTotalRolebyID(2);
                                        
                                    %>
                                    <%=totalTeacher%>
                                </span>
                                Teacher
                            </div>
                            <div class="box p-20 rad-10 fs-13 c-grey">
                                <i class="fa-regular fas fa-user-graduate fa-2x mb-10 c-green"></i>
                                <span class="d-block c-black fw-bold fs-25 mb-5">
                                    <%=totalStudent%>
                                </span>
                                Students
                            </div>
                            <div class="box p-20 rad-10 fs-13 c-grey">
                                <i class="fa-regular fas fa-user-shield fa-2x mb-10 c-red"></i>
                                <span class="d-block c-black fw-bold fs-25 mb-5">
                                    <%=totalModerator%>
                                </span>
                                Moderator
                            </div>
                        </div>
                    </div>
                    <!-- End total user -->
                   
                    <!-- Start category ratio -->
                    <div class="targets p-20 bg-white rad-10">
                        <h2 class="mt-0 mb-10">The category ratio</h2>
                        <p class="mt-0 mb-20 c-grey fs-15"></p>


                        <div class="items-head d-flex space-between c-grey mb-10">
                            <div>
                                <canvas id="myCanvas" width="300" height="300"></canvas>
                                <div id="legend" class="mt-2">
                                    <!-- Thêm div cho legend -->
                                </div>
                            </div>

                            <div>
                                <div id="categoryLegend">
                                    <c:forEach items="${listCategory}" var="listCategory">
                                        <ul class="m-0 p-relative">
                                            <li class="mt-25 d-flex align-center done">
                                                <div class="legend-color-box" style="background-color: ${colors[status.index]};"></div>

                                            </li>
                                        </ul>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <script>
                            var myCanvas = document.getElementById("myCanvas");
                            var ctx = myCanvas.getContext("2d");
                            function generateColors(numColors) {
                            var colors = [];
                            for (var i = 0; i < numColors; i++) {
                            var hue = (i * 360) / numColors;
                            var color = "hsl(" + hue + ", 70%, 50%)"; // Hue, saturation, and lightness
                            colors.push(color);
                            }
                            return colors;
                            }

                            function drawPieChart(data, colors) {
                            var total = 0;
                            for (var key in data) {
                            total += data[key];
                            }

                            var startAngle = 0;
                            var endAngle = 0;
                            for (var i = 0; i < colors.length; i++) {
                            var category = Object.keys(data)[i];
                            var value = data[category];
                            var sliceAngle = (2 * Math.PI * value) / total;
                            ctx.fillStyle = colors[i];
                            ctx.beginPath();
                            ctx.moveTo(myCanvas.width / 2, myCanvas.height / 2);
                            ctx.arc(
                                    myCanvas.width / 2,
                                    myCanvas.height / 2,
                                    myCanvas.width / 2,
                                    startAngle,
                                    startAngle + sliceAngle
                                    );
                            ctx.closePath();
                            ctx.fill();
                            startAngle += sliceAngle;
                            }
                            }

                            var data = {
                            <c:forEach items="${listCategory}" var="category" varStatus="status">
                            "${category.categoryName}": ${category.getCourseCount()}
                                <c:if test="${!status.last}">,</c:if>
                            </c:forEach>
                            };
                            var numColors = Object.keys(data).length; // Số lượng danh mục
                            var colors = generateColors(numColors); // Tạo mảng màu
                            drawPieChart(data, colors);
                            // Thêm màu vào chú thích
                            var categoryLegend = document.getElementById("categoryLegend");
                            for (var i = 0; i < colors.length; i++) {
                            var colorBox = document.createElement("div");
                            colorBox.style.backgroundColor = colors[i];
                            colorBox.style.width = "10px";
                            colorBox.style.height = "10px";
                            colorBox.style.display = "inline-block";
                            var categoryName = Object.keys(data)[i];
                            var courseCount = data[categoryName];
                            var legendText = document.createTextNode(categoryName + " (" + courseCount + " course)");
                            var lineBreak = document.createElement("br");
                            categoryLegend.appendChild(colorBox);
                            categoryLegend.appendChild(legendText);
                            categoryLegend.appendChild(lineBreak);
                            }
                        </script>







                    </div>
                    <!-- End category ratio -->
                    <!-- Start Course New -->
                    <div class="latest-news p-20 bg-white rad-10 txt-c-mobile">
                        <h2 class="mt-0 mb-20">Course new</h2>
                        <c:forEach items="${listTop4Course}" var="course">
                            <div class="news-row d-flex align-center">

                                <img src="<%=url%>/imageStorage/course/${course.getCourseImg()}" alt="" />
                                <div class="info">
                                    <h3>${course.getCourseName()}</h3>
                                    <p class="m-0 fs-14 c-grey"></p>
                                </div>
                                <div class="btn-shape bg-eee fs-13 label">
                                    <script>
                                        // Lấy ngày hiện tại
                                        var currentDate = new Date();
                                        // Lấy giá trị ngày từ danh sách khóa học
                                        var getPublishValue = "${course.getPublish()}";
                                        var publishDate = new Date(getPublishValue);
                                        // Tính toán sự chênh lệch giữa hai ngày
                                        var timeDifference = currentDate - publishDate;
                                        // Chuyển thời gian thành số ngày
                                        var daysDifference = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
                                        // Hiển thị kết quả
                                        document.write(daysDifference + " day ago");
                                    </script>
                                </div>
                            </div>
                        </c:forEach>



                    </div>
                    <!-- End Latest The teacher has the most course  -->
                    <!-- Start Tasks Widget -->
                    <div class="tasks p-20 bg-white rad-10">
                        <h2 class="mt-0 mb-20">Teacher have most course</h2>

                        <c:forEach items="${TopTeachersWithMostCourses}" var="list">
                            <div class="task-row between-flex">
                                <div class="info">
                                    <h3 class="mt-0 mb-5 fs-15">${list.getFullName()}</h3>
                                    <p class="m-0 c-grey">The total number of courser is: ${list.getCourseCount()}</p>
                                </div>
                                <input type="hidden" id="userIDToRetrieve" value="${list.getUserId()}" />



                                <button class="fa-regular fas fa-list delete"  onclick="momodal()"></button>
                            </div>

                            <div class="nenmodal" id="nenmodal-1">
                                <div class="nenmodal2"></div>
                                <div class="ndmodal">
                                    <div class="closemodal"><button onclick="momodal()">×</button></div>
                                    <div class="titlemodal">List Course of ${list.getFullName()}</div>
                                    List course:
                                </div>
                            </div>
                            <!-- kết thúc html modal -->

                            <!-- js Modal -->
                            <script>
                                function momodal() {
                                document.getElementById("nenmodal-1").classList.toggle("active");
                                }
                            </script>
                        </c:forEach>

                    </div>
                    <!-- End Tasks -->

                    <!-- Start Latest Uploads Widget -->
                    <div class="latest-uploads p-20 bg-white rad-10">
                        <h2 class="mt-0 mb-20">Latest Uploads</h2>
                        <ul class="m-0">
                            <li class="between-flex pb-10 mb-10">
                                <div class="d-flex align-center">
                                    <img class="mr-10" src="imgs/pdf.svg" alt="" />
                                    <div>
                                        <span class="d-block">my-file.pdf</span>
                                        <span class="fs-15 c-grey">Elzero</span>
                                    </div>
                                </div>
                                <div class="bg-eee btn-shape fs-13">2.9mb</div>
                            </li>
                            <li class="between-flex pb-10 mb-10">
                                <div class="d-flex align-center">
                                    <img class="mr-10" src="imgs/avi.svg" alt="" />
                                    <div>
                                        <span class="d-block">My-Video-File.avi</span>
                                        <span class="fs-15 c-grey">Admin</span>
                                    </div>
                                </div>
                                <div class="bg-eee btn-shape fs-13">4.9mb</div>
                            </li>
                            <li class="between-flex pb-10 mb-10">
                                <div class="d-flex align-center">
                                    <img class="mr-10" src="imgs/psd.svg" alt="" />
                                    <div>
                                        <span class="d-block">My-Psd-File.pdf</span>
                                        <span class="fs-15 c-grey">Osama</span>
                                    </div>
                                </div>
                                <div class="bg-eee btn-shape fs-13">4.5mb</div>
                            </li>
                            <li class="between-flex pb-10 mb-10">
                                <div class="d-flex align-center">
                                    <img class="mr-10" src="imgs/zip.svg" alt="" />
                                    <div>
                                        <span class="d-block">My-Zip-File.pdf</span>
                                        <span class="fs-15 c-grey">User</span>
                                    </div>
                                </div>
                                <div class="bg-eee btn-shape fs-13">8.9mb</div>
                            </li>
                            <li class="between-flex pb-10 mb-10">
                                <div class="d-flex align-center">
                                    <img class="mr-10" src="imgs/dll.svg" alt="" />
                                    <div>
                                        <span class="d-block">My-DLL-File.pdf</span>
                                        <span class="fs-15 c-grey">Admin</span>
                                    </div>
                                </div>
                                <div class="bg-eee btn-shape fs-13">4.9mb</div>
                            </li>
                            <li class="between-flex">
                                <div class="d-flex align-center">
                                    <img class="mr-10" src="imgs/eps.svg" alt="" />
                                    <div>
                                        <span class="d-block">My-Eps-File.pdf</span>
                                        <span class="fs-15 c-grey">Designer</span>
                                    </div>
                                </div>
                                <div class="bg-eee btn-shape fs-13">8.9mb</div>
                            </li>
                        </ul>
                    </div>
                    <!-- End Latest Uploads Widget -->
                    <!-- Start Last Project Progress Widget -->
                    <div class="last-project p-20 bg-white rad-10 p-relative">
                        <h2 class="mt-0 mb-20">Last Project Progress</h2>
                        <ul class="m-0 p-relative">
                            <li class="mt-25 d-flex align-center done">Got The Project</li>
                            <li class="mt-25 d-flex align-center done">Started The Project</li>
                            <li class="mt-25 d-flex align-center done">The Project About To Finish</li>
                            <li class="mt-25 d-flex align-center current">Test The Project</li>
                            <li class="mt-25 d-flex align-center">Finish The Project & Get Money</li>
                        </ul>
                        <img class="launch-icon hide-mobile" src="imgs/project.png" alt="" />
                    </div>
                    <!-- End Last Project Progress Widget -->
                    <!-- Start Reminders Widget -->
                    <div class="reminders p-20 bg-white rad-10 p-relative">
                        <h2 class="mt-0 mb-25">Reminders</h2>
                        <ul class="m-0">
                            <li class="d-flex align-center mt-15">
                                <span class="key bg-blue mr-15 d-block rad-half"></span>
                                <div class="pl-15 blue">
                                    <p class="fs-14 fw-bold mt-0 mb-5">Check My Tasks List</p>
                                    <span class="fs-13 c-grey">28/09/2022 - 12:00am</span>
                                </div>
                            </li>
                            <li class="d-flex align-center mt-15">
                                <span class="key bg-green mr-15 d-block rad-half"></span>
                                <div class="pl-15 green">
                                    <p class="fs-14 fw-bold mt-0 mb-5">Check My Projects</p>
                                    <span class="fs-13 c-grey">26/10/2022 - 12:00am</span>
                                </div>
                            </li>
                            <li class="d-flex align-center mt-15">
                                <span class="key bg-orange mr-15 d-block rad-half"></span>
                                <div class="pl-15 orange">
                                    <p class="fs-14 fw-bold mt-0 mb-5">Call All My Clients</p>
                                    <span class="fs-13 c-grey">05/11/2022 - 12:00am</span>
                                </div>
                            </li>
                            <li class="d-flex align-center mt-15">
                                <span class="key bg-red mr-15 d-block rad-half"></span>
                                <div class="pl-15 red">
                                    <p class="fs-14 fw-bold mt-0 mb-5">Finish The Development Workshop</p>
                                    <span class="fs-13 c-grey">20/12/2022 - 12:00am</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- End Reminders Widget -->
                    <!-- Start Latest Post Widget -->
                    <div class="latest-post p-20 bg-white rad-10 p-relative">
                        <h2 class="mt-0 mb-25">Latest Post</h2>
                        <div class="top d-flex align-center">
                            <img class="avatar mr-15" src="imgs/avatar.png" alt="" />
                            <div class="info">
                                <span class="d-block mb-5 fw-bold">Osama Elzero</span>
                                <span class="c-grey">About 3 Hours Ago</span>
                            </div>
                        </div>
                        <div class="post-content txt-c-mobile pt-20 pb-20 mt-20 mb-20">
                            You can fool all of the people some of the time, and some of the people all of the time, but you can't
                            fool all of the people all of the time.
                        </div>
                        <div class="post-stats between-flex c-grey">
                            <div>
                                <i class="fa-regular fa-heart"></i>
                                <span>1.8K</span>
                            </div>
                            <div>
                                <i class="fa-regular fa-comments"></i>
                                <span>500</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Latest Post Widget -->

                    <!-- Start End Media Stats Widget -->
                </div>

            </div>
        </div>
    </body>
</html>
