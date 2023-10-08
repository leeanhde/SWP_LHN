<%-- 
    Document   : learning
    Created on : Sep 23, 2023, 10:55:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.CourseDAO"%>
<%@page import="dal.ProgressDAO"%>
<%@page import="model.Lesson"%>
<%@page import="model.Mooc"%>
<%@page import="model.Course"%>
<%@page import="dal.MoocDAO"%>
<%@page import="dal.LessonDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.io.*, java.util.*" %>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<%
    ProgressDAO progressDao = new ProgressDAO();
    int numberLearned= progressDao.getNumberLessonLerned(0,0);
    int count=0;
%>
<%
                int courseID=0;
                Course courseStart= new CourseDAO().selectById(0);
                
                ArrayList<Mooc> listMooc = new ArrayList<Mooc>();
                MoocDAO moocDao= new MoocDAO();
                listMooc = moocDao.getMoocByCourseId(courseID);
                
                ArrayList<Lesson> listLesson2 = new ArrayList<Lesson>();
                Lesson LessonFirstObj= new Lesson();
                            LessonDAO lessonDao2= new LessonDAO();
                            int moocIDone=listMooc.get(0).getMoocId();
                            LessonFirstObj= (Lesson)lessonDao2.selectLessonByMoocId(0).get(1);
                            String urlLessonFirst = LessonFirstObj.getLessonUrl();

%>

<!DOCTYPE html>
<html>
    <head>

        <title>Learning</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />

        <style>
            .video-container {
                display: flex;
                justify-content: center;
                align-items: center;
            }
            body {
                overflow: hidden;
            }
            .scrollable-div {
                overflow: auto;
                height: 95vh;
            }
            /* Tùy chỉnh thanh cuộn */
            .scrollable-div::-webkit-scrollbar {
                width: 7px; /* Đặt chiều rộng của thanh cuộn */
            }

            .scrollable-div::-webkit-scrollbar-thumb {
                background-color: #d9d9d9; /* Đặt màu sắc của thanh cuộn */
                border-radius: 4px; /* Đặt viền cong của thanh cuộn */
            }

            .scrollable-div::-webkit-scrollbar-thumb:hover {
                background-color: #ffffff; /* Đặt màu sắc khi hover lên thanh cuộn */
            }
            .accordion {
                padding-left: 0;
            }
            .accordion li {
                list-style: none;
                width: 100%;
                background-color: #edeff1;
                box-shadow: 6px 6px 10px -1px rgba(0, 0, 0, 0.15);
            }
            .accordion li label {
                display: flex;
                align-items: center;
                padding: 10px;
                padding-bottom: 5px;
                font-size: 17px;
                cursor: pointer;
            }
            label::before {
                content: "+";
                margin-right: 10px;
                align-items: center;
                font-size: 18px;
                margin-bottom: 4px;
                font-weight: bold;
            }

            input[type="checkbox"] {
                display: none;
            }
            .accordion .content {
                background-color: white;
                line-height: 26px;
                max-height: 0;
                overflow: hidden;
                padding-bottom: 0px;
                transition: max-height 0.5s, padding 0.5s;
            }
            .accordion .content a {
                text-decoration: none;
                margin-left: 2rem;
                color: black;
                cursor: pointer;
            }

            .content a:focus p {
                font-weight: bold;
                color: #2bc5d4
            }
            .accordion .content :hover {
                color: #2bc5d4;
            }
            .accordion input[type="checkbox"]:checked + label + .content {
                max-height: 400px;
                padding: 0px 10px 0px 40px;
            }

            .accordion input[type="checkbox"]:checked + label::before {
                content: "-";
                margin-right: 10px;
                font-size: 18px;
            }
            hr {
                border: 0.5;
                margin-bottom: 0px;
            }
            label {
                margin-bottom: 0px;
                padding-bottom: 0px;
            }

        </style>
    </head>
    <body>
        <%@include file= "../component/header.jsp" %>
        <%=urlLessonFirst%>

        <div class="row">
            <div
                class="col-md-9"
                style="background-color: black; max-height: 622px; padding-right: 0px"
                >
                <!-- Phần video -->
                <div class="scrollable-div ">
                    <div class="text-center youtube">
                        <div
                            class="embed-responsive embed-responsive-16by9"
                            style="width: 82%; margin-left: 9%"
                            >

                            <div class="video-container">
                                <iframe
                                    id="videoIframe"
                                    class="embed-responsive-item"
                                    src="<%=urlLessonFirst%>"
                                    allowfullscreen
                                    frameborder="0"
                                    ></iframe>
                            </div>
                        </div>
                    </div>

                    <div
                        style="background-color: white; max-height: 300px; padding: 3% 11%"
                        class="align-content-around"
                        >
                        <div>
                            <h5 id="lesson-name"><%=LessonFirstObj.getLessonName()%></h5>
                            <p style="margin-bottom: 0px" >Update day: <%=courseStart.getPublish()%></p>
                            <br />
                            <p>Teacher: <span style="font-weight: 500"><%=courseStart.getUserId().getFullName()%></span></p>

                        </div>
                        <div class="text-center mt-3 mb-3">
                            <a

                                class="mr-3 btn-secondary lesson"
                                data-value="0"
                                style="
                                cursor: pointer;
                                text-decoration: none;
                                color: white;
                                padding: 10px;
                                border-radius: 5px;
                                "
                                ><i class="fa-solid fa-chevron-left"> </i>&nbsp;Previous
                                Lesson</a
                            >
                            <a
                                id="btn-next"
                                data-value=0
                                class="ml-3 btn-info lesson"
                                style="
                                text-decoration: none;
                                color: white;
                                padding: 10px;
                                border-radius: 5px;
                                cursor: pointer;
                                "
                                >Next Lesson&nbsp;<i class="fa-solid fa-chevron-right"></i
                                ></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="background-color: #f0f1f2; padding: 0">
                <p
                    style="
                    font-weight: 500;
                    color: black;
                    padding: 10px 10px 10px 20px;
                    background-color: #ffffff;
                    margin: 0;
                    "
                    >
                    Content Of Course
                </p>
                <div class="scrollable-div">
                    <%for (Mooc mooc : listMooc) {%>
                    <ul class="accordion" style="margin: 0">
                        <li>                           
                            <input type="checkbox" name="accordion" id="<%=mooc.getMoocId()%>" />
                            <label
                                for="<%=mooc.getMoocId()%>"
                                style="
                                font-weight: 600;
                                border-bottom: solid 1px rgba(0, 0, 0, 0.15);
                                "
                                >Mooc <%=mooc.getMoocNumber()%> - <%=mooc.getMoocName()%>
                            </label>
                            <%
                            ArrayList<Lesson> listLesson = new ArrayList<Lesson>();
                            LessonDAO lessonDao= new LessonDAO();
                            int moocid=mooc.getMoocId();
                            listLesson=lessonDao.selectLessonByMoocId(moocid);
                            %>
                            <div class="content">
                                <%for (Lesson lesson : listLesson) {%>
                                <%if(count<numberLearned){%>
                                <a data-value="<%=lesson.getLessonId()%>" class="lesson" style="margin: 0px">
                                    <div style="position: relative; display: flex">
                                        <div>
                                            <p
                                                style="
                                                margin: auto 0px;
                                                font-weight: 300
                                                "
                                                >
                                                <%=lesson.getLessonNumber()%>. <%=lesson.getLessonName()%>
                                            </p>

                                            <i
                                                class="fa-solid fa-circle-play"
                                                style="font-size: 11px; color: #8c8c8c"
                                                >
                                                03:15</i
                                            >
                                        </div>
                                        <div>
                                            <i
                                                class="fa-solid fa-circle-check"
                                                style="
                                                color: #05f057;
                                                position: absolute;
                                                right: 20px;
                                                bottom: 17px;
                                                margin: auto;
                                                "
                                                ></i>
                                        </div>
                                    </div>
                                </a>
                                <hr style="margin:0">
                                <%count++;%>
                                <%}else if(count==numberLearned){%>


                                <a data-value="<%=lesson.getLessonId()%>" class="lesson" style="margin: 0px;">
                                    <div style="position: relative; display: flex">
                                        <div>
                                            <p
                                                style="
                                                margin: auto 0px;
                                                font-weight: 300

                                                "
                                                >
                                                <%=lesson.getLessonNumber()%>. <%=lesson.getLessonName()%>
                                            </p>

                                            <i
                                                class="fa-solid fa-circle-play "
                                                style="font-size: 11px; color: #8c8c8c"
                                                >
                                                03:15</i
                                            >
                                        </div>
                                        <div class="icon-learning">
                                            <i
                                                class="fa-solid fa-play"
                                                style="
                                                color: #2a6ced;
                                                position: absolute;
                                                right: 20px;
                                                bottom: 15px;
                                                margin: auto;
                                                "
                                                ></i>
                                        </div>
                                    </div>
                                </a>
                                <hr style="margin:0">
                                <%count++;%>


                                <%}else{%>
                                <a data-value="<%=lesson.getLessonId()%>" class="lesson lock" style="margin: 0px;pointer-events: none;
                                   cursor: not-allowed;user-select: none;color:#9d9d9d">
                                    <div style="position: relative; display: flex; ">
                                        <div>
                                            <p
                                                style="
                                                margin: auto 0px;
                                                font-weight: 300

                                                "
                                                >
                                                <%=lesson.getLessonNumber()%>. <%=lesson.getLessonName()%>
                                            </p>

                                            <i
                                                class="fa-solid fa-circle-play"
                                                style="font-size: 11px; color: #8c8c8c"
                                                >
                                                03:15</i
                                            >
                                        </div>
                                        <div>
                                            <i
                                                class="fa-solid fa-lock"
                                                style="

                                                color: #9d9d9d;
                                                position: absolute;
                                                right: 20px;
                                                bottom: 15px;
                                                margin: auto;
                                                "
                                                ></i>
                                        </div>
                                    </div>
                                </a>
                                <hr style="margin:0">
                                <%count++;%>

                                <%}%>
                                <%}%>
                                <!--                                            <i
                                                                                class="fa-solid fa-lock"
                                                                                style="
                                                                                color: #9d9d9d;
                                                                                position: absolute;
                                                                                right: 20px;
                                                                                bottom: 15px;
                                                                                margin: auto;
                                                                                "
                                                                                ></i>-->
                            </div>
                        </li>
                    </ul>
                    <%} %>
                </div>

            </div>

        </div>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
//            var lessonLinks = document.querySelectorAll(".lesson");
//            lessonLinks.forEach(function (link) {
//                link.addEventListener("click", function (event) {
//                    event.preventDefault();
//                    var linkValue = link.getAttribute("data-value");
//                    console.log(linkValue);
//                });
//            });

                $(document).ready(function () {
                    $(".lesson").click(function (event) {
                        event.preventDefault(); // Ngăn chặn trang tải lại

                        var dataValue = $(this).data("value");

                        $.ajax({
                            type: "POST", // Loại yêu cầu
                            url: "http://localhost:9999/ELearning/Learning", // URL của servlet
                            data: {dataValue: dataValue}, // Dữ liệu gửi đến servlet
                            success: function (response) {

                                var videoIframe = document.getElementById("videoIframe");
                                var name = document.getElementById("lesson-name");
                                var btnNext = document.getElementById("btn-next");

                                videoIframe.src = response.lessonUrl;
                                name.innerHTML = response.lessonName;
                                console.log(response.lessonUrl);
//                            btnNext.setAttribute("data-value", 0);

                                btnNext.dataset.value = response.lessonNumber + 1;
                            },
                            error: function (xhr, status, error) {
                                console.error("Lỗi:", error);
                            }
                        });
                    });
                });
        </script>
        <script>
            // Lấy thẻ iframe bằng ID
            var videoIframe = document.getElementById("videoIframe");
            var player;

            // Hàm được gọi sau khi thư viện YouTube API đã được tải
            function onYouTubeIframeAPIReady() {
                player = new YT.Player("videoIframe", {
                    events: {
                        onStateChange: onPlayerStateChange,
                    },
                });
            }

            // Hàm xử lý sự kiện thay đổi trạng thái của video
            function onPlayerStateChange(event) {
                if (event.data == YT.PlayerState.ENDED) {

//                    var lessonLock = document.querySelector("a.lock");
//                    lessonLock.style.pointerEvents = "auto";
//                    lessonLock.style.cursor = "pointer";
//                    lessonLock.style.color = "#000000";
//
//                    var iconElement = document.querySelector(".icon-learning i");
//                    iconElement.style.color = "#05f057";
//                    iconElement.classList.remove("fa-solid", "fa-play");
//                    iconElement.classList.add("fa-solid", "fa-circle-check");
                    console.log('hi')
                }
            }

        </script>
        <script src="https://www.youtube.com/iframe_api"></script>

    </body>
</html>
