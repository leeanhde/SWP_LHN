<%-- 
    Document   : learning
    Created on : Sep 23, 2023, 10:55:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.CourseDAO"%>
<%@page import="dal.ProgressDAO"%>
<%@page import="dal.ExamDetailDAO"%>
<%@page import="dal.ExamDAO"%>
<%@page import="dal.MoocDAO"%>
<%@page import="dal.LessonDAO"%>
<%@page import="dal.ExamDetailDAO"%>

<%@page import="model.Lesson"%>
<%@page import="model.Exam"%>
<%@page import="model.Mooc"%>
<%@page import="model.Course"%>
<%@page import="model.ExamDetail"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="java.io.*, java.util.*" %>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%
    int userId=0;
    int courseID=0;

    ProgressDAO progressDao = new ProgressDAO();
    int numberLearned= progressDao.getNumberLessonLerned(courseID,userId);
    int count=0;

%>
<%
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

                ExamDAO examDao = new ExamDAO();
                ArrayList<Exam> listExam = new ArrayList<Exam>();
                listExam=examDao.selectExamByCourseId(courseID);
%>

<!DOCTYPE html>
<html>
    <head>  
        <title>Learning</title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


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
                border: 0.8;
                margin-bottom: 0px;
            }
            label {
                margin-bottom: 0px;
                padding-bottom: 0px;
            }
            .vertical {
                border-left: 1px solid #d8d8d8;
                height: 75px;
                font-weight: 300px;
                margin: auto;
                margin-right: 30px;
            }
            /*  //////////////////////////////  //////////////////////////////////////////////////////////// //////////////////////////////////////*/

            .img-sm {
                width: 46px;
                height: 46px;
            }

            .panel {
                box-shadow: 0 2px 0 rgba(0, 0, 0, 0.075);
                border-radius: 0;
                border: 0;
                margin-bottom: 15px;
            }

            .panel .panel-footer,
            .panel > :last-child {
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
            }

            .panel .panel-heading,
            .panel > :first-child {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

            .panel-body {
                padding: 25px 20px;
            }

            .media-block .media-left {
                display: block;
                float: left;
            }

            .media-block .media-right {
                float: right;
            }

            .media-block .media-body {
                display: block;
                overflow: hidden;
                width: auto;
            }

            .middle .media-left,
            .middle .media-right,
            .middle .media-body {
                vertical-align: middle;
            }

            .thumbnail {
                border-radius: 0;
                border-color: #e9e9e9;
            }

            .tag.tag-sm,
            .btn-group-sm > .tag {
                padding: 5px 10px;
            }

            .tag:not(.label) {
                background-color: #fff;
                padding: 6px 12px;
                border-radius: 2px;
                border: 1px solid #cdd6e1;
                font-size: 12px;
                line-height: 1.42857;
                vertical-align: middle;
                -webkit-transition: all 0.15s;
                transition: all 0.15s;
            }
            .text-muted,
            a.text-muted:hover,
            a.text-muted:focus {
                color: #acacac;
            }
            .text-sm {
                font-size: 0.9em;
            }
            .text-5x,
            .text-4x,
            .text-5x,
            .text-2x,
            .text-lg,
            .text-sm,
            .text-xs {
                line-height: 1.25;
            }

            .btn-trans {
                background-color: transparent;
                border-color: transparent;
                color: #929292;
            }

            .btn-icon {
                padding-left: 9px;
                padding-right: 9px;
            }

            .btn-sm,
            .btn-group-sm > .btn,
            .btn-icon.btn-sm {
                padding: 5px 10px !important;
            }

            .mar-top {
                margin-top: 15px;
            }
            .popup-menu {
                display: none;
                position: absolute;
                background-color: #fff;
                border: 1px solid #ccc;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            }

            /* Định dạng dấu ba chấm */
            .ellipsis {
                cursor: pointer;
            }
            .option li:hover {
                background-color: #4267b2;
                color: white;
                cursor: pointer;
            }
            ul {
                list-style: none;
                padding-inline-start: 00px;
                margin: 0px;
            }
            .activeLesson p{
                color:#2a6ced;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div id="header">
            <div  class="d-flex justify-content-between align-items-center " style="padding: 4px 15px; background: #404b5c  "  >
                <div class="d-flex align-items-center"id="btn_back">
                    <a href="javascript:history.back()" style="padding: 7px 15px" >
                        <i class="fa-solid fa-arrow-left mr-2" style="color:white; font-size: 21px"></i>
                        <span style="font-size: 19px; color: #138496"></span>
                    </a> 
                    <div class="ml-3">
                        <p id="text-header" style="font-weight: 500; margin: 0px; color:white">How to install and run netbean environment</p>
                        <p style="margin:0px; font-size: 13px; color:white">Graded Quiz. • 20 min</p>
                    </div>
                </div>
                <div class="mr-3">     
                    <p style="color:white; margin: 0px; font-weight: 500">Ngoc Duc </p>
                    <p style="color:white; margin: 0px; font-size: 15px">Complete: 12/20 Lessons</p>
                </div>
            </div>  
        </div>
        <div class="row">
            <div
                id="video"
                class="col-md-9"
                style=" padding-right: 0px"
                >
                <!-- Phần video -->
                <div class="scrollable-div ">
                    <div class="text-center youtube" style=" background-color: black">
                        <div
                            class="embed-responsive embed-responsive-16by9"
                            style="width: 82%; margin-left: 9%"
                            >
                            <div class="video-container" id="youtube-player">
                                <div id="youtube-player"></div>

                            </div>
                        </div>
                    </div>

                    <div
                        style="background-color: white; padding: 3% 11%"
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
                                id="btn-pre"
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
                        <a  class="" style="font-size: 18px; text-decoration: none; cursor: pointer" id="discuss"><i class="fa-solid fa-comments" style="color: #085ae7;"></i> Discussions</a>

                        <!--   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

                        <link
                            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
                            rel="stylesheet"
                            />
                        <div class="container bootdey" id="commentbox" style="display: none">
                            <div class="col-md-12 bootstrap snippets">
                                <div class="panel">
                                    <div class="panel-body">
                                        <p style=" margin:0px; font-size: 13px; color:red">*Maximum 300 characters</p>
                                        <textarea
                                            id="commentText"
                                            oninput="checkInput()"
                                            class="form-control"
                                            rows="2"
                                            placeholder="What are you thinking?"
                                            ></textarea>
                                        <div class="mar-top clearfix">
                                            <button id="commentButton" class="btn btn-sm btn-primary pull-right" type="submit" 
                                                    style="pointer-events: none;opacity: 0.5; cursor: not-allowed;">
                                                <i class="fa fa-pencil fa-fw"></i> Comment
                                            </button>
                                            <a
                                                class="btn btn-trans btn-icon fa fa-video-camera add-tooltip"
                                                href="#"
                                                ></a>
                                            <a
                                                class="btn btn-trans btn-icon fa fa-camera add-tooltip"
                                                href="#"
                                                ></a>
                                            <a
                                                class="btn btn-trans btn-icon fa fa-file add-tooltip"
                                                href="#"
                                                ></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel" >
                                    <div class="panel-body" id="comment_content" >
                                        <!-- Newsfeed Content -->
                                        <!--===================================================-->
                                        <!--                                       
                                        <!--===================================================-->
                                        <!-- End Newsfeed Content -->

                                        <!-- Newsfeed Content -->
                                        <!--===================================================-->
                                        <!--                                       
                                        <!--===================================================-->
                                        <!-- End Newsfeed Content -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->   
                    </div>
                </div>
            </div>
            <div id="exam" class="col-md-9" style="background: white;max-height: 622px; padding:45px 190px;display:none">
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
                                                font-weight: 500
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
                                                font-weight: 500
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
                                                font-weight: 500

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
                                        <div class="icon-lock">
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
                            </div>
                        </li>
                    </ul>
                    <%}%>


                    <ul class="accordion" style="margin: 0">
                        <li>                           
                            <input type="checkbox" name="accordion" id="test" />
                            <label
                                for="test"
                                style="
                                font-weight: 600;
                                border-bottom: solid 1px rgba(0, 0, 0, 0.15);
                                "
                                >Exams 
                            </label>
                            <div class="content">
                                <%for (Exam exam : listExam) {%>
                                <a data-value="<%=exam.getExamId()%>" class="examPage" style="margin: 0px">
                                    <div style="position: relative; display: flex">
                                        <div>
                                            <p
                                                style="
                                                margin: auto 0px;
                                                font-weight: 500
                                                "
                                                >
                                                1. <%=exam.getExamName()%> 
                                            </p>

                                            <i
                                                class="fa-solid fa-book-open"
                                                style="font-size: 11px; color: #8c8c8c;text-transform: lowercase;"
                                                >
                                                <%=exam.getQuantity()%> question</i
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
                                <%}%>
                            </div>
                        </li>
                    </ul>
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
            var player;
            var videoId = "PKkKCv7Lno0"; // ID của video ban đầu
            var lessonId;
            let numberLearnd = <%=numberLearned%>

            function onYouTubeIframeAPIReady() {
                player = new YT.Player("youtube-player", {
                    height: "360",
                    width: "940",
                    videoId: videoId,
                    events: {
                        onReady: onPlayerReady,
                        onStateChange: onPlayerStateChange,
                    },
                });
            }
            function onPlayerReady(event) {
                event.target.playVideo(); // Tự động chạy video
            }
            function onPlayerStateChange(event) {
                if (event.data == YT.PlayerState.ENDED) {
                    if (numberLearnd == lessonId) {
                        ///////////////      //////////////////                              
                        var lessonLock = document.querySelector("a.lock");
                        lessonLock.style.pointerEvents = "auto";
                        lessonLock.style.cursor = "pointer";
                        lessonLock.style.color = "#000";
                        lessonLock.classList.remove("lock");
/////////////////////////////////
                        var iconLock = document.querySelector(".icon-lock i");
                        iconLock.style.color = "#2a6ced";
                        iconLock.classList.remove("fa-solid", "fa-lock");
                        iconLock.classList.add("fa-solid", "fa-play");
                        var iconLockDiv = document.querySelector(".icon-lock");
                        iconLockDiv.classList.remove("icon-lock");
                        iconLockDiv.classList.add("icon-learning");
/////////////////////////////////

                        var iconLearning = document.querySelector(".icon-learning i");
                        iconLearning.style.color = "#05f057";
                        iconLearning.classList.remove("fa-solid", "fa-play");
                        iconLearning.classList.add("fa-solid", "fa-circle-check");
                        var iconLearningDiv = document.querySelector(".icon-learning");
                        iconLearningDiv.classList.remove("icon-learning");
/////////////////////////////
                        numberLearnd = numberLearnd + 1;
                    }
                }
            }

//            document.getElementById("change-video-button")
//                    .addEventListener("click", function () {
//                        var newVideoId = "PKkKCv7Lno0"; // ID của video mới
//
//                        player.loadVideoById(newVideoId);
//                        videoId = newVideoId;
//                    });

            //            var lessonLinks = document.querySelectorAll(".lesson");
            //            lessonLinks.forEach(function (link) {
            //                link.addEventListener("click", function (event) {
            //                    event.preventDefault();
            //                    var linkValue = link.getAttribute("data-value");
            //                    console.log(linkValue);
            //                });
            //            });
            var lessonId = 0;
            $(document).ready(function () {
                $(".lesson").click(function (event) {
                    event.preventDefault(); // Ngăn chặn trang tải lại

                    var lessonLinks = document.querySelectorAll('.lesson');
                    lessonLinks.forEach(function (lessonLink) {
                        lessonLink.addEventListener('click', function (event) {
                            event.preventDefault();
                            // Loại bỏ class "active" từ tất cả các thẻ <a> có class "lesson-link"
                            lessonLinks.forEach(function (link) {
                                link.classList.remove('activeLesson');
                            });
                            // Thêm class "active" vào thẻ <a> được bấm
                            lessonLink.classList.add('activeLesson');
                        });
                    });

                    var commentbox = document.getElementById("commentbox");
                    commentbox.style.display = "none";

                    var dataValue = this.dataset.value;

                    console.log(dataValue);

                    lessonId = dataValue;
                    $.ajax({
                        type: "POST", // Loại yêu cầu
                        url: "http://localhost:9999/ELearning/Learning", // URL của servlet
                        data: {dataValue: dataValue}, // Dữ liệu gửi đến servlet
                        success: function (response) {

                            var newVideoId = response.lessonUrl; // ID của video mới
                            player.loadVideoById(newVideoId);
                            videoId = newVideoId;
                            //  lessonId = response.lessonNumber - 1;
                            var name = document.getElementById("lesson-name");
                            name.innerHTML = response.lessonName;
                            var textheader = document.getElementById("text-header");
                            textheader.innerHTML = response.lessonName;
                            var video = document.getElementById("video");
                            var exam = document.getElementById("exam");
                            video.style.display = "block";
                            exam.style.display = "none";
                            console.log(response);
                            var btnNext = document.getElementById("btn-next");
                            btnNext.setAttribute("data-value", parseInt(dataValue) + 1);
                            var btnpre = document.getElementById("btn-pre");
                            btnpre.setAttribute("data-value", parseInt(dataValue) - 1);


                        },
                        error: function (xhr, status, error) {
                            console.error("Lỗi:", error);
                        }
                    });
                });
            });
        </script>
        <script>

            var commentText = document.getElementById('commentText');
            var commentButton = document.getElementById('commentButton');
            function checkInput() {
                // Lấy giá trị từ thẻ input
                var inputValue = commentText.value;
                if (inputValue.length > 300) {
                    commentButton.style.opacity = '0.5';
                    commentButton.style.pointerEvents = 'none';
                    commentButton.style.cursor = 'not-allowed';
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Comment length is less than 300 characters!',
                    })

                } else {
                    // Kiểm tra xem giá trị không rỗng
                    if (inputValue.trim() !== '') {
                        // Nếu không rỗng, hiển thị nút submit
                        commentButton.style.opacity = '1';
                        commentButton.style.pointerEvents = 'auto';
                        commentButton.style.cursor = 'pointer';
                    } else {
                        commentButton.style.opacity = '0.5';
                        commentButton.style.pointerEvents = 'none';
                        commentButton.style.cursor = 'not-allowed';
                    }
                }
            }

            var video = document.getElementById("video");
            var exam = document.getElementById("exam");
            var testLinks = document.querySelectorAll('a.examPage');
            testLinks.forEach(function (link) {
                link.addEventListener("click", function (event) {
                    event.preventDefault();
                    video.style.display = "none";
                    exam.style.display = "block";
                });
            });
        </script>
        <script>
            var examid;
            $(document).ready(function () {
                $(".examPage").click(function (event) {
                    event.preventDefault();

                    var dataValue = $(this).data("value");
                    examid = dataValue;
                    $.ajax({
                        type: "POST", // Loại yêu cầu
                        url: "http://localhost:9999/ELearning/Exam", // URL của servlet
                        data: {dataValue: dataValue}, // Dữ liệu gửi đến servlet
                        success: function (response) {
                            var exam = response.object;
                            var listExamDetail = response.list;
                            displayResults(listExamDetail, exam);
                        },
                        error: function (xhr, status, error) {
                            console.error("Lỗi:", error);
                        }
                    });
                });
                function displayResults(results, exam) {
                    var container = document.getElementById('exam');
                    container.innerHTML = "";


                    var divtitle = document.createElement('div');
                    divtitle.className = "mt-1";
                    container.appendChild(divtitle);

                    var h1Element = document.createElement('h1');
                    h1Element.id = 'title_exam';
                    h1Element.textContent = '' + exam.examName;
                    divtitle.appendChild(h1Element);
//
//                    // Tạo và thêm thẻ p
                    var p1Element = document.createElement('p');
                    var span1Element = document.createElement('span');
                    span1Element.id = 'quantity';
                    span1Element.style.fontWeight = '500';
                    span1Element.textContent = '' + exam.quantity;
                    p1Element.textContent = 'Number Of Questions: ';
                    p1Element.appendChild(span1Element);
                    divtitle.appendChild(p1Element);
//
//                    // Tạo và thêm thẻ p
                    var p2Element = document.createElement('p');
                    var span2Element = document.createElement('span');
                    span2Element.id = 'time';
                    span2Element.style.fontWeight = '500';
                    span2Element.textContent = '' + exam.duration;
                    p2Element.textContent = 'Time: ';
                    p2Element.appendChild(span2Element);
                    p2Element.innerHTML += ' minute';
                    divtitle.appendChild(p2Element);

                    // Tạo và thêm div thứ hai
                    var div2Element = document.createElement('div');
                    div2Element.className = 'mt-5 d-flex justify-content-between align-items-center';
                    container.appendChild(div2Element);

                    var divGradeElement = document.createElement('div');
                    div2Element.appendChild(divGradeElement)

//                    // Tạo và thêm p
                    var p3Element = document.createElement('p');
                    p3Element.style.fontWeight = '600';
                    p3Element.style.fontSize = '18px';
                    p3Element.textContent = 'Submit your assignment';
                    divGradeElement.appendChild(p3Element);
//
//                    // Tạo và thêm p
                    var p4Element = document.createElement('p');
                    var span3Element = document.createElement('span');
                    span3Element.style.fontWeight = '500';
                    span3Element.textContent = 'Date:';
                    p4Element.appendChild(span3Element);
                    var span4Element = document.createElement('span');
                    span4Element.style.fontSize = '14px';
                    if (results.length != 0) {
                        span4Element.textContent = ' ' + results[0].timeEnd;
                    } else {
                        span4Element.textContent = '';

                    }
                    p4Element.appendChild(span4Element);
                    divGradeElement.appendChild(p4Element);

                    if (results.length != 0) {

                        // Tạo và thêm a
                        var aElement = document.createElement('a');
                        aElement.href = 'http://localhost:9999/ELearning/learning/exam.jsp';
                        aElement.style.padding = '10px 45px';
                        aElement.style.fontWeight = '600';
                        aElement.style.fontSize = '19px';
                        aElement.style.textDecoration = 'none';
                        aElement.textContent = 'Try Again';
                        div2Element.appendChild(aElement);
                    } else {
                        var bElement = document.createElement('a');
                        bElement.href = 'http://localhost:9999/ELearning/learning/exam.jsp';
                        bElement.className = 'btn btn-info';
                        bElement.style.padding = '10px 45px';
                        bElement.style.fontWeight = '600';
                        bElement.style.fontSize = '19px';
                        bElement.style.color = 'white';
                        bElement.textContent = 'Start Exam';
                        div2Element.appendChild(bElement);
                    }
//                    // Thêm hr
                    var hr1Element = document.createElement('hr');
                    container.appendChild(hr1Element);

//                    // Tạo và thêm div thứ ba
                    var div3Element = document.createElement('div');
                    div3Element.className = 'mt-3 d-flex';
                    container.appendChild(div3Element);

                    var div4Element = document.createElement('div');
                    div3Element.appendChild(div4Element)

                    // Tạo và thêm p
                    var p5Element = document.createElement('p');
                    p5Element.style.fontWeight = '600';
                    p5Element.textContent = 'Receive grade';
                    div4Element.appendChild(p5Element);
//
//                    // Tạo và thêm p
                    var p6Element = document.createElement('p');
                    var span5Element = document.createElement('span');
                    span5Element.style.fontWeight = '500';
                    span5Element.textContent = '80%';
                    p6Element.textContent = 'To Pass ';
                    p6Element.appendChild(span5Element);
                    p6Element.innerHTML += ' or higher';
                    div4Element.appendChild(p6Element);

                    // Tạo và thêm div phân cách
                    var divSeparator = document.createElement('div');
                    divSeparator.className = 'vertical';
                    div3Element.appendChild(divSeparator);

                    var div5Element = document.createElement('div');
                    div5Element.className = 'd-flex align-items-center';
                    div3Element.appendChild(div5Element)

                    var div6Element = document.createElement('div');
                    div6Element.className = 'mr-5';
                    div5Element.appendChild(div6Element)
//
                    // Thêm hr`
                    var hr2Element = document.createElement('hr');
                    container.appendChild(hr2Element);


                    // Tạo và thêm p
                    var p7Element = document.createElement('p');
                    p7Element.style.fontWeight = '600';
                    p7Element.style.margin = '0px';
                    p7Element.textContent = 'Your grade';
                    div6Element.appendChild(p7Element);
                    if (results.length == 0) {

                        // Tạo và thêm p
                        var p8Element = document.createElement('p');
                        p8Element.style.fontWeight = '600';
                        p8Element.textContent = '____________';
                        div6Element.appendChild(p8Element);
                    } else {

                        var p8Element = document.createElement('p');
                        p8Element.style.fontWeight = '600';
                        p8Element.style.margin = '0px';
                        p8Element.style.color = '#d30001';
                        p8Element.style.fontSize = '24px';
                        p8Element.textContent = "" + results[0].score + "%";
                        div6Element.appendChild(p8Element);
                    }
                    if (results.length != 0) {

                        var bElement = document.createElement('a');
                        bElement.href = 'http://localhost:9999/ELearning/learning/examPrevious.jsp?examid='+examid;
                        bElement.className = 'btn btn-info';
                        bElement.style.padding = '10px 45px';
                        bElement.style.fontWeight = '600';
                        bElement.style.fontSize = '19px';
                        bElement.style.color = 'white';
                        bElement.textContent = 'View Feedback';
                        div5Element.appendChild(bElement);


                        // Tạo và thêm bảng
                        var tableElement = document.createElement('table');
                        tableElement.className = 'table table-hover mt-3';
                        tableElement.id = 'data-table';
                        container.appendChild(tableElement);

                        // Tạo và thêm thead
                        var theadElement = document.createElement('thead');
                        tableElement.appendChild(theadElement);

                        // Tạo và thêm dòng header
                        var headerRow = document.createElement('tr');
                        var headerCols = ['No', 'Exam Date', 'Grade', 'Status'];
                        for (var i = 0; i < headerCols.length; i++) {
                            var thElement = document.createElement('th');
                            thElement.textContent = headerCols[i];
                            headerRow.appendChild(thElement);
                        }
                        theadElement.appendChild(headerRow);

                        // Tạo và thêm tbody
                        var tbodyElement = document.createElement('tbody');
                        tableElement.appendChild(tbodyElement);

                        for (var i = 0; i < results.length; i++) {
                            var resultItem = results[i];

                            // Tạo dữ liệu cho một hàng trong bảng
                            var rowData = [i + 1, resultItem.timeEnd, resultItem.score, resultItem.status];

                            // Tạo dòng dữ liệu
                            var dataRow = document.createElement('tr');
                            for (var j = 0; j < rowData.length; j++) {
                                if (j == rowData.length - 1) {
                                    if (rowData[j] == true) {
                                        rowData[j] = "Passed";
                                        var tdElement = document.createElement('td');
                                        var spanElement = document.createElement('span');
                                        spanElement.style.fontWeight = '500';
                                        spanElement.style.backgroundColor = '#0f9d58';
                                        spanElement.style.padding = '3px 8px';
                                        spanElement.style.color = 'white';
                                        spanElement.style.fontSize = '13px';
                                        spanElement.style.borderRadius = '5px';

                                        spanElement.textContent = rowData[j];
                                        tdElement.appendChild(spanElement);
                                        dataRow.appendChild(tdElement);
                                    } else {
                                        rowData[j] = "Not Pass";
                                        var tdElement = document.createElement('td');
                                        var spanElement = document.createElement('span');
                                        spanElement.style.fontWeight = '500';
                                        spanElement.style.backgroundColor = '#d30001';
                                        spanElement.style.padding = '3px 8px';
                                        spanElement.style.color = 'white';
                                        spanElement.style.fontSize = '13px';
                                        spanElement.style.borderRadius = '5px';

                                        spanElement.textContent = rowData[j];
                                        tdElement.appendChild(spanElement);
                                        dataRow.appendChild(tdElement);
                                    }

                                } else {
                                    var tdElement = document.createElement('td');
                                    var spanElement = document.createElement('span');
                                    spanElement.style.fontWeight = '500';
                                    spanElement.textContent = rowData[j];
                                    tdElement.appendChild(spanElement);
                                    dataRow.appendChild(tdElement);
                                }
                            }
                            tbodyElement.appendChild(dataRow);
                        }
                    }
                }
            });
        </script>
        <!--        <script>
                    var table = document.getElementById("data-table").getElementsByTagName('tbody')[0];
                    var count = 1;
                    for (var i = 0; i < table.rows.length; i++) {
                        var row = table.rows[i];
                        var cell1 = row.insertCell(0);
                        cell1.innerHTML = count;
                        cell1.style.fontWeight = "500";
                        count++;
                    }
                </script>-->
        <script>
            var button = document.getElementById("discuss");
            var commentbox = document.getElementById("commentbox");
            button.addEventListener("click", function (event) {
                event.preventDefault(); // Ngăn chặn trang tải lại khi bấm vào thẻ a

                // Kiểm tra trạng thái hiện tại của thẻ div
                if (commentbox.style.display === "none") {
                    // Nếu đang ẩn, thì hiện thẻ div
                    commentbox.style.display = "block";
                } else {
                    // Nếu đang hiện, thì ẩn thẻ div
                    commentbox.style.display = "none";
                }
            });
        </script>
        <script>

            // Lấy tham chiếu đến thẻ a và thẻ div
            var userId =<%=userId%>;
            $(document).ready(function () {
                $("#discuss").click(function (event) {
                    event.preventDefault(); // Ngăn chặn trang tải lại

                    var dataValue = lessonId;
                    $.ajax({
                        type: "POST", // Loại yêu cầu
                        url: "http://localhost:9999/ELearning/Comment", // URL của servlet
                        data: {dataValue: dataValue, action: "get", userid: userId}, // Dữ liệu gửi đến servlet
                        success: function (response) {
                            // Xử lý kết quả từ servlet
                            var listCommentJson = response[0];
                            var listCommentReactionJson = response[1];
                            console.log(listCommentJson);
                            console.log(listCommentReactionJson);
                            displayResults2(listCommentJson, listCommentReactionJson);
                        },
                        error: function (xhr, status, error) {
                            console.error("Lỗi:", error);
                        }
                    });
                });
                function displayResults2(results, listCommentReactionJson) {


                    var commentContentDiv = document.getElementById("comment_content");
                    commentContentDiv.innerHTML = "";
                    for (var i = 0; i < results.length; i++) {
                        var resultItem = results[i];


// Create the main container element
                        var mediaBlock = document.createElement('div');
                        mediaBlock.id = 'comment' + resultItem.commentId.toString();
                        mediaBlock.style.padding = "10px 0px";
                        mediaBlock.className = 'media-block';

// Create the media left element with image
                        var mediaLeft = document.createElement('a');
                        mediaLeft.className = 'media-left';
                        mediaLeft.href = '#';

                        var profileImage = document.createElement('img');
                        profileImage.className = 'img-circle img-sm';
                        profileImage.style.borderRadius = '50%';
                        profileImage.alt = 'Profile Picture';
                        profileImage.src = "http://localhost:9999/ELearning/imageStorage/user/" + resultItem.userId.avatar.toString();

                        mediaLeft.appendChild(profileImage);
                        mediaBlock.appendChild(mediaLeft);

// Create the media body element
                        var mediaBody = document.createElement('div');
                        mediaBody.className = 'media-body';
                        mediaBody.setAttribute('id', 'mediaBody' + resultItem.commentId);

/////headComment

                        var headComment = document.createElement('div');
                        headComment.className = 'headComment';
                        mediaBody.appendChild(headComment);

                        /////bodyComment

                        var bodyComment = document.createElement('div');
                        bodyComment.className = 'bodyComment';
                        bodyComment.setAttribute('id', 'bodyComment' + resultItem.commentId);

                        mediaBody.appendChild(bodyComment);

// Create the mar-btm div
                        var marBtmDiv = document.createElement('div');
                        marBtmDiv.className = 'mar-btm';

// Create the media heading element with link
                        var mediaHeading = document.createElement('a');
                        mediaHeading.className = 'ml-2 btn-link text-semibold media-heading box-inline';
                        mediaHeading.href = '#';
                        mediaHeading.style.float = 'left';
                        mediaHeading.style.fontWeight = "500";
                        mediaHeading.style.color = "black";
                        mediaHeading.innerHTML = '' + resultItem.userId.fullName;

                        marBtmDiv.appendChild(mediaHeading);

// Create the ellipsis icon
                        if (resultItem.userId.userId == userId) {
                            var ellipsisIcon = document.createElement('i');
                            ellipsisIcon.className = 'fa-solid fa-ellipsis-vertical ellipsis';
                            ellipsisIcon.style.float = 'right';
                            marBtmDiv.appendChild(ellipsisIcon);
                        }


// Create the popup menu div
                        var popupMenu = document.createElement('div');
                        popupMenu.className = 'popup-menu';

// Create the options list
                        var optionsList = document.createElement('ul');
                        optionsList.className = 'option';

// Create the edit comment option
                        var editOption = document.createElement('li');
                        editOption.style.padding = '10px 8px 5px 15px';
                        editOption.setAttribute('data-value', '0');
                        editOption.innerHTML = 'Edit comment';
                        optionsList.appendChild(editOption);

// Create the ban user option
                        var banOption = document.createElement('li');
                        banOption.style.padding = '5px 8px 5px 15px';
                        banOption.innerHTML = 'Ban user';
                        optionsList.appendChild(banOption);

// Create the delete comment option
                        var deleteOption = document.createElement('li');
                        deleteOption.style.padding = '5px 8px 8px 15px';
                        deleteOption.innerHTML = 'Delete comment';
                        deleteOption.setAttribute('data-value', resultItem.commentId);
                        deleteOption.classList.add('delelte_comment');
                        optionsList.appendChild(deleteOption);

                        popupMenu.appendChild(optionsList);
                        marBtmDiv.appendChild(popupMenu);

// Create the clear divs
                        var clearDiv = document.createElement('div');
                        clearDiv.style.clear = 'both';
                        marBtmDiv.appendChild(clearDiv);

// Create the text-muted paragraph
                        var textMuted = document.createElement('p');
                        textMuted.className = 'ml-2 text-muted text-sm';
                        textMuted.style.fontSize = '12px';
                        textMuted.style.margin = '0px';

                        textMuted.innerHTML = '<i class="fa-solid fa-globe"></i> ' + resultItem.commentDate;
                        marBtmDiv.appendChild(textMuted);

                        headComment.appendChild(marBtmDiv);

// Create the comment paragraph
                        var commentParagraph = document.createElement('p');
                        commentParagraph.className = "mt-1 ml-2";
                        commentParagraph.style.fontSize = '16px';

                        commentParagraph.innerHTML = '' + resultItem.content;
                        commentParagraph.style.fontWeight = "400";
                        commentParagraph.style.margin = '0px';
                        commentParagraph.style.marginLeft = '6px';

                        headComment.appendChild(commentParagraph);

// Create the pad-ver div
                        var padVerDiv = document.createElement('div');
                        padVerDiv.setAttribute('id', 'padVerDiv' + resultItem.commentId);
                        padVerDiv.className = 'pad-ver';

// Create the btn-group div
                        var btnGroupDiv = document.createElement('div');
                        btnGroupDiv.className = 'btn-group';


// Create the thumbs-up button
                        var thumbsUpButton = document.createElement('a');
                        thumbsUpButton.className = 'btn btn-sm btn-default btn-hover-success like';
                        thumbsUpButton.setAttribute('data-value', resultItem.commentId);
                        thumbsUpButton.setAttribute('id', 'like' + resultItem.commentId);
                        thumbsUpButton.style.fontSize = "13px";
                        thumbsUpButton.innerHTML = '<i class="fa fa-thumbs-up"></i>' + resultItem.like;

                        for (var j = 0; j < listCommentReactionJson.length; j++) {
                            if (listCommentReactionJson[j].commentId.commentId === resultItem.commentId) {
                                if (listCommentReactionJson[j].isLike === true) {
                                    // console.log(listCommentReactionJson[j].commentId.commentId);
                                    // console.log('hiiiiiiiiiiasas');
                                    thumbsUpButton.innerHTML = '<i class="fa fa-thumbs-up liked" style="color:#3378fc"></i>' + resultItem.like;
                                }
                            }
                        }

                        btnGroupDiv.appendChild(thumbsUpButton);


// Create the thumbs-down button
                        var thumbsDownButton = document.createElement('a');
                        thumbsDownButton.className = 'btn btn-sm btn-default btn-hover-danger dislike';
                        thumbsDownButton.setAttribute('data-value', resultItem.commentId);
                        thumbsDownButton.setAttribute('id', 'dislike' + resultItem.commentId);
                        thumbsDownButton.style.fontSize = "13px";

                        thumbsDownButton.innerHTML = '<i class="fa fa-thumbs-down"></i>' + resultItem.disLike;

                        for (var j = 0; j < listCommentReactionJson.length; j++) {
                            if (listCommentReactionJson[j].commentId.commentId === resultItem.commentId) {
                                if (listCommentReactionJson[j].isDisLike === true) {
                                    thumbsDownButton.innerHTML = '<i class="fa fa-thumbs-down dislike" style="color:#3378fc"></i>' + resultItem.disLike;
                                }
                            }
                        }
                        btnGroupDiv.appendChild(thumbsDownButton);

                        padVerDiv.appendChild(btnGroupDiv);

// Create the comment button
                        var commentButton = document.createElement('a');
                        commentButton.className = 'btn btn-sm btn-default btn-hover-primary replyButton';
                        commentButton.style.fontSize = "12px";
                        commentButton.innerHTML = '<i class="fa-solid fa-reply"></i> Reply';
                        commentButton.setAttribute('data-value', resultItem.commentId);

                        padVerDiv.appendChild(commentButton);


                        headComment.appendChild(padVerDiv);

////////////////////////////////////////////////////////////////

                        // Tạo phần tử div với class "panel"
                        var panelDiv = document.createElement("div");
                        panelDiv.style.marginBottom = "0px";
                        panelDiv.setAttribute('data-value', resultItem.commentId);
                        panelDiv.setAttribute('id', 'replyWrite' + resultItem.commentId);
                        panelDiv.style.display = "none";
                        panelDiv.className = "panel";

                        // Tạo phần tử div với class "panel-body"
                        var panelBodyDiv = document.createElement("div");
                        panelBodyDiv.style.paddingLeft = "0px";
                        panelBodyDiv.setAttribute('id', 'replyWriteBox' + resultItem.commentId);
                        panelBodyDiv.className = "panel-body d-flex align-items-center replyWriteBox";




                        // Tạo phần tử textarea với class "form-control"
                        var textarea = document.createElement("textarea");
                        textarea.className = "form-control";
                        textarea.setAttribute('id', 'textReply' + resultItem.commentId);
                        textarea.rows = "1";
                        textarea.placeholder = "What are you thinking?";

                        // Tạo phần tử div với class "mar-top clearfix"
                        var marTopDiv = document.createElement("div");
                        marTopDiv.style.margin = "0px";
                        marTopDiv.className = "mar-top clearfix";

                        // Tạo phần tử button với class "btn btn-sm btn-primary pull-right" và nội dung "Share"
                        var button = document.createElement("a");
                        button.className = "btn btn-sm btn-primary pull-right replyBtn";
                        button.type = "submit";
                        button.style.fontSize = "16px";
                        button.setAttribute('data-value', resultItem.commentId);

                        button.innerHTML = '<i class="fa-solid fa-paper-plane"></i>';


                        // Gắn các phần tử con vào các phần tử cha tương ứng
                        marTopDiv.appendChild(button);

                        panelBodyDiv.appendChild(textarea);
                        panelBodyDiv.appendChild(marTopDiv);

                        panelDiv.appendChild(panelBodyDiv);

                        // Lấy tham chiếu đến phần tử gốc
                        var container = document.getElementById("container");

                        // Thêm phần tử panelDiv vào container
                        headComment.appendChild(panelDiv);

////////////////////////////////////////////////////////////////////
//                        var ducc = document.createElement('p');
//                        ducc.innerHTML = 'reply2ssssssssssssss';
//                        padVerDiv.appendChild(ducc);

                        var lineBreak = document.createElement('br');
                        padVerDiv.appendChild(lineBreak);

                        var viewReply = document.createElement('a');
                        viewReply.className = 'viewReply';
                        viewReply.style.textDecoration = "none";
                        viewReply.style.color = "#2b2b2b";
                        viewReply.style.marginLeft = "9px";
                        viewReply.style.fontSize = "13px";
                        if (resultItem.isReply === true) {
                            viewReply.style.display = "block";
                        } else {
                            viewReply.style.display = "none";
                        }
                        viewReply.style.cursor = "pointer";
                        viewReply.innerHTML = "View 2 reply ";
                        viewReply.setAttribute('id', 'reply' + resultItem.commentId);
                        viewReply.setAttribute('data-value', resultItem.commentId);

                        var icon = document.createElement('i');
                        icon.className = "fa-solid fa-chevron-down";
                        viewReply.appendChild(icon);
                        padVerDiv.appendChild(viewReply);



// Create the hr element
                        var hrElement = document.createElement('hr');
                        headComment.appendChild(hrElement);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Create the nested media-block element
//                        var nestedMediaBlock = document.createElement('div');
//                        nestedMediaBlock.className = 'media-block';

// Create the nested media-left element with image
//                        var nestedMediaLeft = document.createElement('a');
//                        nestedMediaLeft.className = 'media-left';
//                        nestedMediaLeft.href = '#';
//
//                        var nestedProfileImage = document.createElement('img');
//                        nestedProfileImage.className = 'img-circle img-sm';
//                        nestedProfileImage.alt = 'Profile Picture';
//                        nestedProfileImage.src = 'https://bootdey.com/img/Content/avatar/avatar3.png';
//
//                        nestedMediaLeft.appendChild(nestedProfileImage);
//                        nestedMediaBlock.appendChild(nestedMediaLeft);

// Create the nested media-body element
//                        var nestedMediaBody = document.createElement('div');
//                        nestedMediaBody.className = 'media-body';

// Create the nested mar-btm div
//                        var nestedMarBtmDiv = document.createElement('div');
//                        nestedMarBtmDiv.className = 'mar-btm';

// Create the nested media heading element with link
//                        var nestedMediaHeading = document.createElement('a');
//                        nestedMediaHeading.className = 'ml-2 btn-link text-semibold media-heading box-inline';
//                        nestedMediaHeading.href = '#';
//                        nestedMediaHeading.innerHTML = 'Lucy Moon';
//
//                        nestedMarBtmDiv.appendChild(nestedMediaHeading);

// Create the nested ellipsis icon
//                        var nestedEllipsisIcon = document.createElement('i');
//                        nestedEllipsisIcon.className = 'fa-solid fa-ellipsis-vertical';
//                        nestedMarBtmDiv.appendChild(nestedEllipsisIcon);

// Create the nested text-muted paragraph
//                        var nestedTextMuted = document.createElement('p');
//                        nestedTextMuted.className = 'ml-2 text-muted text-sm';
//                        nestedTextMuted.innerHTML = '<i class="fa fa-globe fa-lg"></i> - From Web - 2 min ago';
//                        nestedMarBtmDiv.appendChild(nestedTextMuted);
//
//                        nestedMediaBody.appendChild(nestedMarBtmDiv);

//// Create the nested reply paragraph
//                        var nestedReplyParagraph = document.createElement('p');
//                        nestedReplyParagraph.innerHTML = 'reply2';
//                        nestedMediaBody.appendChild(nestedReplyParagraph);
//
//// Create the nested pad-ver div
//                        var nestedPadVerDiv = document.createElement('div');
//                        nestedPadVerDiv.className = 'pad-ver';

// Create the nested btn-group div
//                        var nestedBtnGroupDiv = document.createElement('div');
//                        nestedBtnGroupDiv.className = 'btn-group';
//
//// Create the nested thumbs-up button
//                        var nestedThumbsUpButton = document.createElement('a');
//                        nestedThumbsUpButton.className = 'btn btn-sm btn-default btn-hover-success';
//                        nestedThumbsUpButton.href = '#';
//                        nestedThumbsUpButton.innerHTML = '<i class="fa fa-thumbs-up"></i>';
//                        nestedBtnGroupDiv.appendChild(nestedThumbsUpButton);
//
//// Create the nested thumbs-down button
//                        var nestedThumbsDownButton = document.createElement('a');
//                        nestedThumbsDownButton.className = 'btn btn-sm btn-default btn-hover-danger';
//                        nestedThumbsDownButton.href = '#';
//                        nestedThumbsDownButton.innerHTML = '<i class="fa fa-thumbs-down"></i>';
//                        nestedBtnGroupDiv.appendChild(nestedThumbsDownButton);
//                        nestedPadVerDiv.appendChild(nestedBtnGroupDiv);

// Create the nested comment button
//                        var nestedCommentButton = document.createElement('a');
//                        nestedCommentButton.className = 'btn btn-sm btn-default btn-hover-primary';
//                        nestedCommentButton.href = '#';
//                        nestedCommentButton.innerHTML = '';
//                        nestedPadVerDiv.appendChild(nestedCommentButton);
//
//                        nestedMediaBody.appendChild(nestedPadVerDiv);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Create the nested hr element
                        //  var nestedHrElement = document.createElement('hr');

                        //   nestedMediaBody.appendChild(nestedHrElement);

                        //   nestedMediaBlock.appendChild(nestedMediaBody);

                        //   mediaBody.appendChild(nestedMediaBlock);

                        mediaBlock.appendChild(mediaBody);

// Append the media block to the desired container element

                        commentContentDiv.appendChild(mediaBlock);
                    }
                    ellipsisEvent();
                }
            }
            );


        </script>
        <script>

            $(document).ready(function () {
                $("#commentButton").click(function () {
                    var comment = $("#commentText").val(); // Lấy giá trị từ textarea
                    var dataToSend = {
                        comment: comment,
                        userid: <%=userId%>,
                        lessonid: lessonId
                    };
                    $.ajax({
                        type: "POST", // Loại yêu cầu
                        url: "http://localhost:9999/ELearning/AddComment",
                        data: dataToSend,
                        success: function (response) {
                            // Xử lý kết quả từ servlet (nếu cần)

                            if (typeof response === 'string' && response.toLowerCase() === 'false') {
                                // Giá trị gửi từ AJAX là chuỗi "false"
                                console.log("Giá trị là false");
                            } else {
                                // Giá trị không phải là chuỗi "false"
                                console.log(" listtttttttGiá trị không phải là false");
                                displayResults2(response);
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("Lỗi:", error);
                        }
                    });
                });


                function displayResults2(results) {

                    var commentButton = document.getElementById('commentButton');
                    commentButton.style.opacity = '0.5';
                    commentButton.style.pointerEvents = 'none';
                    commentButton.style.cursor = 'not-allowed';

                    var commentText = document.getElementById("commentText");
                    commentText.value = "";

                    var commentContentDiv = document.getElementById("comment_content");
                    commentContentDiv.innerHTML = "";
                    for (var i = 0; i < results.length; i++) {
                        var resultItem = results[i];

// Create the main container element
                        var mediaBlock = document.createElement('div');
                        mediaBlock.id = 'comment' + resultItem.commentId.toString();
                        mediaBlock.className = 'media-block';

// Create the media left element with image
                        var mediaLeft = document.createElement('a');
                        mediaLeft.className = 'media-left';
                        mediaLeft.href = '#';

                        var profileImage = document.createElement('img');
                        profileImage.className = 'img-circle img-sm';
                        profileImage.alt = 'Profile Picture';
                        profileImage.src = "http://localhost:9999/ELearning/imageStorage/user/" + resultItem.userId.avatar.toString();

                        mediaLeft.appendChild(profileImage);
                        mediaBlock.appendChild(mediaLeft);

// Create the media body element
                        var mediaBody = document.createElement('div');
                        mediaBody.className = 'media-body';

// Create the mar-btm divs
                        var marBtmDiv = document.createElement('div');
                        marBtmDiv.className = 'mar-btm';

// Create the media heading element with link
                        var mediaHeading = document.createElement('a');
                        mediaHeading.className = 'ml-2 btn-link text-semibold media-heading box-inline';
                        mediaHeading.href = '#';
                        mediaHeading.style.fontWeight = "500";
                        mediaHeading.style.float = 'left';
                        mediaHeading.innerHTML = '' + resultItem.userId.fullName;

                        marBtmDiv.appendChild(mediaHeading);

// Create the ellipsis icon
                        var ellipsisIcon = document.createElement('i');
                        ellipsisIcon.className = 'fa-solid fa-ellipsis-vertical ellipsis';
                        ellipsisIcon.style.float = 'right';
                        marBtmDiv.appendChild(ellipsisIcon);

// Create the popup menu div
                        var popupMenu = document.createElement('div');
                        popupMenu.className = 'popup-menu';

// Create the options list
                        var optionsList = document.createElement('ul');
                        optionsList.className = 'option';

// Create the edit comment option
                        var editOption = document.createElement('li');
                        editOption.style.padding = '10px 8px 5px 15px';
                        editOption.setAttribute('data-value', '0');
                        editOption.innerHTML = 'Edit comment';
                        optionsList.appendChild(editOption);

// Create the ban user option
                        var banOption = document.createElement('li');
                        banOption.style.padding = '5px 8px 5px 15px';
                        banOption.innerHTML = 'Ban user';
                        optionsList.appendChild(banOption);

// Create the delete comment option
                        var deleteOption = document.createElement('li');
                        deleteOption.style.padding = '5px 8px 8px 15px';
                        deleteOption.innerHTML = 'Delete comment';
                        deleteOption.setAttribute('data-value', resultItem.commentId);
                        deleteOption.classList.add('delelte_comment');
                        optionsList.appendChild(deleteOption);

                        popupMenu.appendChild(optionsList);
                        marBtmDiv.appendChild(popupMenu);

// Create the clear divs
                        var clearDiv = document.createElement('div');
                        clearDiv.style.clear = 'both';
                        marBtmDiv.appendChild(clearDiv);

// Create the text-muted paragraph
                        var textMuted = document.createElement('p');
                        textMuted.className = 'ml-2 text-muted text-sm';
                        textMuted.style.fontSize = '14px';
                        textMuted.innerHTML = '<i class="fa-solid fa-globe"></i> ' + resultItem.commentDate;
                        marBtmDiv.appendChild(textMuted);

                        mediaBody.appendChild(marBtmDiv);

// Create the comment paragraph
                        var commentParagraph = document.createElement('p');
                        commentParagraph.innerHTML = '' + resultItem.content;
                        commentParagraph.style.fontWeight = "400";

                        mediaBody.appendChild(commentParagraph);

// Create the pad-ver div
                        var padVerDiv = document.createElement('div');
                        padVerDiv.className = 'pad-ver';

// Create the btn-group div
                        var btnGroupDiv = document.createElement('div');
                        btnGroupDiv.className = 'btn-group';

// Create the thumbs-up button
                        var thumbsUpButton = document.createElement('a');
                        thumbsUpButton.className = 'btn btn-sm btn-default btn-hover-success';
                        thumbsUpButton.href = '#';
                        thumbsUpButton.innerHTML = '<i class="fa fa-thumbs-up"></i>' + resultItem.like;
                        btnGroupDiv.appendChild(thumbsUpButton);

// Create the thumbs-down button
                        var thumbsDownButton = document.createElement('a');
                        thumbsDownButton.className = 'btn btn-sm btn-default btn-hover-danger';
                        thumbsDownButton.href = '#';
                        thumbsDownButton.innerHTML = '<i class="fa fa-thumbs-down"></i>' + resultItem.disLike;
                        btnGroupDiv.appendChild(thumbsDownButton);

                        padVerDiv.appendChild(btnGroupDiv);

// Create the comment button
                        var commentButton = document.createElement('a');
                        commentButton.className = 'btn btn-sm btn-default btn-hover-primary';
                        commentButton.href = '#';

                        commentButton.innerHTML = 'Reply';
                        padVerDiv.appendChild(commentButton);
                        mediaBody.appendChild(padVerDiv);

// Create the hr element
                        var hrElement = document.createElement('hr');
                        mediaBody.appendChild(hrElement);
///////////////////////////////////////////////////////////////////////////////////////////////////
// Create the nested media-block element
//                        var nestedMediaBlock = document.createElement('div');
//                        nestedMediaBlock.className = 'media-block';
//
//// Create the nested media-left element with image
//                        var nestedMediaLeft = document.createElement('a');
//                        nestedMediaLeft.className = 'media-left';
//                        nestedMediaLeft.href = '#';
//
//                        var nestedProfileImage = document.createElement('img');
//                        nestedProfileImage.className = 'img-circle img-sm';
//                        nestedProfileImage.alt = 'Profile Picture';
//                        nestedProfileImage.src = 'https://bootdey.com/img/Content/avatar/avatar3.png';
//
//                        nestedMediaLeft.appendChild(nestedProfileImage);
//                        nestedMediaBlock.appendChild(nestedMediaLeft);
//
//// Create the nested media-body element
//                        var nestedMediaBody = document.createElement('div');
//                        nestedMediaBody.className = 'media-body';
//
//// Create the nested mar-btm div
//                        var nestedMarBtmDiv = document.createElement('div');
//                        nestedMarBtmDiv.className = 'mar-btm';
//
//// Create the nested media heading element with link
//                        var nestedMediaHeading = document.createElement('a');
//                        nestedMediaHeading.className = 'ml-2 btn-link text-semibold media-heading box-inline';
//                        nestedMediaHeading.href = '#';
//                        nestedMediaHeading.innerHTML = 'Lucy Moon';
//
//                        nestedMarBtmDiv.appendChild(nestedMediaHeading);
//
//// Create the nested ellipsis icon
//                        var nestedEllipsisIcon = document.createElement('i');
//                        nestedEllipsisIcon.className = 'fa-solid fa-ellipsis-vertical';
//                        nestedMarBtmDiv.appendChild(nestedEllipsisIcon);
//
//// Create the nested text-muted paragraph
//                        var nestedTextMuted = document.createElement('p');
//                        nestedTextMuted.className = 'ml-2 text-muted text-sm';
//                        nestedTextMuted.innerHTML = '<i class="fa fa-globe fa-lg"></i> - From Web - 2 min ago';
//                        nestedMarBtmDiv.appendChild(nestedTextMuted);
//
//                        nestedMediaBody.appendChild(nestedMarBtmDiv);
//
//// Create the nested reply paragraph
//                        var nestedReplyParagraph = document.createElement('p');
//                        nestedReplyParagraph.innerHTML = 'reply2';
//                        nestedMediaBody.appendChild(nestedReplyParagraph);
//
//// Create the nested pad-ver div
//                        var nestedPadVerDiv = document.createElement('div');
//                        nestedPadVerDiv.className = 'pad-ver';
//
//// Create the nested btn-group div
//                        var nestedBtnGroupDiv = document.createElement('div');
//
//                        nestedBtnGroupDiv.className = 'btn-group';
//
//// Create the nested thumbs-up button
//                        var nestedThumbsUpButton = document.createElement('a');
//                        nestedThumbsUpButton.className = 'btn btn-sm btn-default btn-hover-success';
//                        nestedThumbsUpButton.href = '#';
//                        nestedThumbsUpButton.innerHTML = '<i class="fa fa-thumbs-up"></i>';
//                        nestedBtnGroupDiv.appendChild(nestedThumbsUpButton);
//
//// Create the nested thumbs-down button
//                        var nestedThumbsDownButton = document.createElement('a');
//                        nestedThumbsDownButton.className = 'btn btn-sm btn-default btn-hover-danger';
//                        nestedThumbsDownButton.href = '#';
//                        nestedThumbsDownButton.innerHTML = '<i class="fa fa-thumbs-down"></i>';
//                        nestedBtnGroupDiv.appendChild(nestedThumbsDownButton);
//
//                        nestedPadVerDiv.appendChild(nestedBtnGroupDiv);
//
//// Create the nested comment button
//                        var nestedCommentButton = document.createElement('a');
//                        nestedCommentButton.className = 'btn btn-sm btn-default btn-hover-primary';
//                        nestedCommentButton.href = '#';
//                        nestedCommentButton.innerHTML = '';
//                        nestedPadVerDiv.appendChild(nestedCommentButton);
//
//                        nestedMediaBody.appendChild(nestedPadVerDiv);
//                        

///////////////////////////////////////////////////////////////////////////////
// Create the nested hr element
                        // var nestedHrElement = document.createElement('hr');
                        // nestedMediaBody.appendChild(nestedHrElement);

                        // nestedMediaBlock.appendChild(nestedMediaBody);

                        //  mediaBody.appendChild(nestedMediaBlock);
                        // mediaBody.appendChild(duc);

                        mediaBlock.appendChild(mediaBody);


                        commentContentDiv.appendChild(mediaBlock);
                    }
                    // ellipsisEvent();

                }
            });

        </script>

        <script>
            function deleteComment() {
                // Lấy tất cả các phần tử có lớp (class) là "my-div"
                var divs = document.querySelectorAll(".delelte_comment");

                // Lặp qua từng phần tử và gắn sự kiện click
                divs.forEach(function (div) {
                    div.addEventListener("click", function () {
                        // Lấy giá trị data-value của thẻ div
                        var dataValue = this.dataset.value;
                        console.log("data-value của div:", dataValue);

                        var myData = {action: "deleleComment", dataValue: dataValue, lessonId: lessonId};

                        $.ajax({
                            type: "POST",
                            url: "http://localhost:9999/ELearning/Comment",
                            data: myData,
                            success: function (response) {
                                if (Array.isArray(response)) {
                                    var id = "comment" + dataValue;
                                    var div_comment = document.getElementById(id);
                                    div_comment.style.display = "none";
                                    console.log("xoa thanh cong");
                                } else if (typeof response === "string") {
                                    console.log("deltethatbai");
                                } else {
                                    console.log("deltethatbai2");
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error("Lỗi:", error);
                            }
                        });
                    });
                });
            }
        </script>
        <script>
            function like() {
                var likeLinks = document.querySelectorAll(".like");
                likeLinks.forEach(function (likeLink) {
                    likeLink.addEventListener('click', function (event) {
                        // Ngăn chặn hành động mặc định của liên kết
                        event.preventDefault();
                        var dataValue = likeLink.getAttribute('data-value');

                        var dislikediv = document.getElementById("dislike" + dataValue);

                        var dislikeicon = dislikediv.childNodes[0];
                        var dislikeNumber = parseInt(dislikediv.childNodes[1].textContent);

                        // console.log(dislikeicon);

                        var likeicon = likeLink.childNodes[0];
                        var likeNumber = parseInt(likeLink.childNodes[1].textContent);

                        if (!likeicon.classList.contains('liked')) {
                            if (dislikeicon.classList.contains('dislike')) {
                                dislikeicon.classList.remove('dislike')
                                dislikeicon.style.color = "black"
                                dislikediv.childNodes[1].textContent = dislikeNumber - 1;

                                var data1 = {action: "subdislikeaddlike", dataValue: dataValue};
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:9999/ELearning/Reaction",
                                    data: data1,
                                    success: function (response) {


                                        console.log("ok");
                                    },
                                    error: function (xhr, status, error) {
                                        console.error("Lỗi:", error);
                                    }
                                });
                                likeLink.childNodes[1].textContent = likeNumber + 1;
                                likeicon.classList.add('liked');
                                likeicon.style.color = "#3378fc"

                            } else {
                                likeLink.childNodes[1].textContent = likeNumber + 1;
                                likeicon.classList.add('liked');
                                likeicon.style.color = "#3378fc"
                                var data1 = {action: "addlike", dataValue: dataValue};
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:9999/ELearning/Reaction",
                                    data: data1,
                                    success: function (response) {


                                        console.log("ok");
                                    },
                                    error: function (xhr, status, error) {
                                        console.error("Lỗi:", error);
                                    }
                                });
                            }

                        } else {
                            likeLink.childNodes[1].textContent = likeNumber - 1;
                            likeicon.classList.remove('liked');
                            likeicon.style.color = "black";
                            console.log("duc");

                            var data2 = {action: "sublike", dataValue: dataValue};
                            $.ajax({
                                type: "POST",
                                url: "http://localhost:9999/ELearning/Reaction",
                                data: data2,
                                success: function (response) {


                                    console.log("ok");
                                },
                                error: function (xhr, status, error) {
                                    console.error("Lỗi:", error);
                                }
                            });

                        }
                    });
                }
                );
                var likeDisLinks = document.querySelectorAll(".dislike");
                likeDisLinks.forEach(function (disLikeLink) {
                    disLikeLink.addEventListener('click', function (event) {
                        // Ngăn chặn hành động mặc định của liên kết
                        event.preventDefault();
                        var dataValue = disLikeLink.getAttribute('data-value');


                        var likediv = document.getElementById("like" + dataValue);

                        var likeicon = likediv.childNodes[0];
                        var likeNumber = parseInt(likediv.childNodes[1].textContent);


                        var dislikeicon = disLikeLink.childNodes[0];
                        var dislikeNumber = parseInt(disLikeLink.childNodes[1].textContent);

                        if (!dislikeicon.classList.contains('dislike')) {

                            if (likeicon.classList.contains('liked')) {

                                likeicon.classList.remove('liked')
                                likeicon.style.color = "black"
                                likediv.childNodes[1].textContent = likeNumber - 1;


                                var data2 = {action: "sublikeandaddislike", dataValue: dataValue};
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:9999/ELearning/Reaction",
                                    data: data2,
                                    success: function (response) {
                                        console.log("ok");
                                    },
                                    error: function (xhr, status, error) {
                                        console.error("Lỗi:", error);
                                    }
                                });
                                disLikeLink.childNodes[1].textContent = dislikeNumber + 1;
                                dislikeicon.classList.add('dislike');
                                dislikeicon.style.color = "#3378fc";

//                                var data1 = {action: "adddislike", dataValue: dataValue};
//                                $.ajax({
//                                    type: "POST",
//                                    url: "http://localhost:9999/ELearning/Reaction",
//                                    data: data1,
//                                    success: function (response) {
//
//
//                                        console.log("add dislike ok");
//                                    },
//                                    error: function (xhr, status, error) {
//                                        console.error("Lỗi:", error);
//                                    }
//                                });
                            } else {
                                disLikeLink.childNodes[1].textContent = dislikeNumber + 1;
                                dislikeicon.classList.add('dislike');
                                dislikeicon.style.color = "#3378fc";

                                var data1 = {action: "adddislike", dataValue: dataValue};
                                $.ajax({
                                    type: "POST",
                                    url: "http://localhost:9999/ELearning/Reaction",
                                    data: data1,
                                    success: function (response) {
                                        console.log("ok");
                                    },
                                    error: function (xhr, status, error) {
                                        console.error("Lỗi:", error);
                                    }
                                });
                            }

                        } else {
                            disLikeLink.childNodes[1].textContent = dislikeNumber - 1;
                            dislikeicon.classList.remove('dislike');
                            dislikeicon.style.color = "black"

                            var data1 = {action: "subdislike", dataValue: dataValue};
                            $.ajax({
                                type: "POST",
                                url: "http://localhost:9999/ELearning/Reaction",
                                data: data1,
                                success: function (response) {


                                    console.log("ok");
                                },
                                error: function (xhr, status, error) {
                                    console.error("Lỗi:", error);
                                }
                            });
                        }
                    });
                }
                );
            }

        </script>
        <script>

            function viewReply() {

                var viewLinks = document.querySelectorAll('a.viewReply');
                var commentId;
                viewLinks.forEach(function (viewLink) {
                    viewLink.addEventListener('click', function () {
                        // Lấy giá trị 'data-value' của thẻ được bấm
                        var dataValue = viewLink.getAttribute('data-value');
                        commentId = dataValue;
                        // In giá trị 'data-value' ra console để kiểm tra
                        //  console.log('Data Value:', viewLink);

                        var replyElement = document.getElementById("divReplyContainer" + dataValue);

                        var padvarDiv = document.getElementById("padVerDiv" + dataValue);
                        var viewReplyButton = document.getElementById("reply" + dataValue);
//                        console.log('viewButton: ', viewReplyButton);
//                        console.log('padvarDiv ', padvarDiv);
                        viewReplyButton.style.display = "none";
                        // padvarDiv.removeChild(viewReplyButton);

                        var anchorElement = padvarDiv.querySelector("a.replyDisplayHidden");
                        if (anchorElement) {

                        } else {
                            var viewReply = document.createElement('a');
                            viewReply.style.textDecoration = "none";
                            viewReply.className = 'replyDisplayHidden';
                            viewReply.style.color = "#2b2b2b";
                            viewReply.style.marginLeft = "9px";
                            viewReply.style.fontSize = "13px";
                            viewReply.style.cursor = "pointer";
                            viewReply.innerHTML = "Hidden 2 reply ";
                            viewReply.setAttribute('id', 'replyDisplayHidden' + dataValue);
                            viewReply.setAttribute('data-value', dataValue);
                            var icon = document.createElement('i');
                            icon.className = "fa-solid fa-chevron-down";
                            viewReply.appendChild(icon);
                            padvarDiv.appendChild(viewReply);
                        }

//                        if (replyElement.style.display === 'none') {
//                            replyElement.style.display = 'block';
//                            viewReplyLink.textContent = 'Hide ' + replyId;
//                        } else {
//                            replyElement.style.display = 'none';
//                            viewReplyLink.textContent = 'View ' + replyId;
//                        }

                        var data1 = {action: "getReply", dataValue: dataValue, userId: userId};
                        $.ajax({
                            type: "POST",
                            url: "http://localhost:9999/ELearning/Comment",
                            data: data1,
                            success: function (response) {
                                console.log(response);
                                dislayReply(response);
                                //   replyDisplayHidden();

                            },
                            error: function (xhr, status, error) {
                                console.error("Lỗi:", error);
                            }
                        });

                    });
                    function dislayReply(response) {

                        var mediaBodyDiv = document.getElementById("bodyComment" + commentId);
                        mediaBodyDiv.innerHTML = "";


//                        var viewReplyText = document.getElementById("reply" + commentId);
//                        viewReplyText.textContent = "Hideen 2 reply";
//                        viewReplyText.classList.remove("viewReply");
//                        viewReplyText.classList.add("hidden");
//                        console.log(viewReplyText);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        var divReplyContainer = document.createElement("div");
                        divReplyContainer.setAttribute('id', 'divReplyContainer' + commentId);
                        divReplyContainer.style.display = "block";
                        mediaBodyDiv.appendChild(divReplyContainer);
// Create the main container element

                        for (var i = 0; i < response.length; i++) {
                            var resultItem = response[i];

                            var mediaBlock = document.createElement('div');
//                        mediaBlock.id = 'comment' + resultItem.commentId.toString();
                            mediaBlock.className = 'media-block';

// Create the media left element with image
                            var mediaLeft = document.createElement('a');
                            mediaLeft.className = 'media-left';
                            mediaLeft.href = '#';

                            var profileImage = document.createElement('img');
                            profileImage.className = 'img-circle img-sm';
                            profileImage.alt = 'Profile Picture';
                            profileImage.style.borderRadius = '50%';
                            profileImage.style.width = '35px';
                            profileImage.style.height = '35px';

                            profileImage.src = "http://localhost:9999/ELearning/imageStorage/user/" + resultItem.userId.avatar.toString();

                            mediaLeft.appendChild(profileImage);
                            mediaBlock.appendChild(mediaLeft);

// Create the media body element
                            var mediaBody = document.createElement('div');
                            mediaBody.className = 'media-body';

// Create the mar-btm divs
                            var marBtmDiv = document.createElement('div');
                            marBtmDiv.className = 'mar-btm';

// Create the media heading element with link
                            var mediaHeading = document.createElement('a');
                            mediaHeading.className = 'ml-2 btn-link text-semibold media-heading box-inline';
                            mediaHeading.href = '#';
                            mediaHeading.style.fontWeight = "500";
                            mediaHeading.style.float = 'left';
                            mediaHeading.style.fontSize = '14px';
                            mediaHeading.innerHTML = '' + resultItem.userId.fullName;

                            marBtmDiv.appendChild(mediaHeading);

// Create the ellipsis icon
                            var ellipsisIcon = document.createElement('i');
                            ellipsisIcon.className = 'fa-solid fa-ellipsis-vertical ellipsis';
                            ellipsisIcon.style.float = 'right';
                            marBtmDiv.appendChild(ellipsisIcon);

// Create the popup menu div
                            var popupMenu = document.createElement('div');
                            popupMenu.className = 'popup-menu';

// Create the options list
                            var optionsList = document.createElement('ul');
                            optionsList.className = 'option';

// Create the edit comment option
                            var editOption = document.createElement('li');
                            editOption.style.padding = '10px 8px 5px 15px';
                            editOption.setAttribute('data-value', '0');
                            editOption.innerHTML = 'Edit comment';
                            optionsList.appendChild(editOption);

// Create the ban user option
                            var banOption = document.createElement('li');
                            banOption.style.padding = '5px 8px 5px 15px';
                            banOption.innerHTML = 'Ban user';
                            optionsList.appendChild(banOption);

// Create the delete comment option
                            var deleteOption = document.createElement('li');
                            deleteOption.style.padding = '5px 8px 8px 15px';
                            deleteOption.innerHTML = 'Delete comment';
                            //  deleteOption.setAttribute('data-value');
                            deleteOption.classList.add('delelte_comment');
                            optionsList.appendChild(deleteOption);

                            popupMenu.appendChild(optionsList);
                            marBtmDiv.appendChild(popupMenu);

// Create the clear divs
                            var clearDiv = document.createElement('div');
                            clearDiv.style.clear = 'both';
                            marBtmDiv.appendChild(clearDiv);

// Create the text-muted paragraph
                            var textMuted = document.createElement('p');
                            textMuted.className = 'ml-2 text-muted text-sm';
                            textMuted.style.fontSize = '12px';
                            textMuted.style.margin = '0px';
                            textMuted.innerHTML = '<i class="fa-solid fa-globe"></i> ' + resultItem.relpyDate;
                            marBtmDiv.appendChild(textMuted);

                            mediaBody.appendChild(marBtmDiv);

// Create the comment paragraph
                            var commentParagraph = document.createElement('p');
                            commentParagraph.innerHTML = '' + resultItem.content;
                            commentParagraph.className = "ml-2 mt-1";
                            commentParagraph.style.fontSize = '15px';
                            commentParagraph.style.margin = '0px';

                            commentParagraph.style.fontWeight = "400";

                            mediaBody.appendChild(commentParagraph);

// Create the pad-ver div
                            var padVerDiv = document.createElement('div');
                            padVerDiv.className = 'pad-ver';

// Create the btn-group div
                            var btnGroupDiv = document.createElement('div');
                            btnGroupDiv.className = 'btn-group';

// Create the thumbs-up button
                            var thumbsUpButton = document.createElement('a');
                            thumbsUpButton.className = 'btn btn-sm btn-default btn-hover-success';
                            thumbsUpButton.href = '#';
                            thumbsUpButton.style.fontSize = '12px';

                            thumbsUpButton.innerHTML = '<i class="fa fa-thumbs-up"></i>';
                            btnGroupDiv.appendChild(thumbsUpButton);

// Create the thumbs-down button
                            var thumbsDownButton = document.createElement('a');
                            thumbsDownButton.className = 'btn btn-sm btn-default btn-hover-danger';
                            thumbsDownButton.href = '#';
                            thumbsDownButton.style.fontSize = '12px';

                            thumbsDownButton.innerHTML = '<i class="fa fa-thumbs-down"></i>';
                            btnGroupDiv.appendChild(thumbsDownButton);
                            padVerDiv.appendChild(btnGroupDiv);

// Create the comment button
                            var commentButton = document.createElement('a');
                            commentButton.className = 'btn btn-sm btn-default btn-hover-primary';
                            commentButton.href = '#';
                            commentButton.innerHTML = 'Reply';
                            padVerDiv.appendChild(commentButton);

                            mediaBody.appendChild(padVerDiv);

// Create the hr element
                            var hrElement = document.createElement('hr');

                            mediaBody.appendChild(hrElement);
                            mediaBlock.appendChild(mediaBody);
                            divReplyContainer.appendChild(mediaBlock);
                        }
                        ellipsisEvent2();

                    }
                });
            }

        </script>
        <script>
            function replyDisplayHidden() {
                var replyDisplayHiddenLinks = document.querySelectorAll('a.replyDisplayHidden');

                replyDisplayHiddenLinks.forEach(function (replyDisplayHiddenLink) {
                    replyDisplayHiddenLink.addEventListener('click', function (event) {
                        event.preventDefault();

                        var dataValue = replyDisplayHiddenLink.getAttribute('data-value');
                        // console.log(replyDisplayHiddenLink, dataValue);
                        var replyDiv = document.getElementById("divReplyContainer" + dataValue);
                        console.log(replyDiv);
                        var textReply = document.getElementById("replyDisplayHidden" + dataValue);
                        console.log(textReply);

                        if (replyDiv.style.display === "none") {
                            console.log("hi");
                            var iconElement = document.createElement('i');
                            iconElement.className = 'fa-solid fa-chevron-up';
                            textReply.textContent = 'Hidden 2 reply ';
                            textReply.appendChild(iconElement);

                            replyDiv.style.display = "block";
                        } else {
                            console.log("ha");
                            var iconElement = document.createElement('i');
                            iconElement.className = 'fa-solid fa-chevron-down';
                            iconElement.style.marginTop = '16px';
                            textReply.textContent = 'View 2 reply ';
                            textReply.appendChild(iconElement);


                            replyDiv.style.display = "none";
                        }
                    });
                });
            }

        </script>
        <script>
            function hiddenDisplayreplyWrite() {
                // JavaScript
                var replyLinks = document.querySelectorAll('a.replyButton'); // Lấy tất cả các thẻ <a> có class "school"

                replyLinks.forEach(function (replyLink) {
                    replyLink.addEventListener('click', function (event) {
                        event.preventDefault();
                        console.log("vao vao duoc roi");

                        var dataValue = replyLink.getAttribute('data-value');

                        var replyWriteBox = document.getElementById("replyWrite" + dataValue);
                        var computedStyle = window.getComputedStyle(replyWriteBox);

                        console.log(replyWriteBox);

                        if (computedStyle.display === 'none') {
                            replyWriteBox.style.display = 'block';
                            console.log("1", replyWriteBox.style.display)

                        } else {
                            replyWriteBox.style.display = 'none';
                            console.log("2", replyWriteBox.style.display);
                        }
                    });
                });
            }
        </script>
        <script>

            function replyWrite() {
                var replyBtns = document.querySelectorAll('a.replyBtn');
                replyBtns.forEach(function (replyBtn) {
                    replyBtn.addEventListener('click', function (event) {
                        event.preventDefault();

                        var dataValue = replyBtn.getAttribute('data-value');

                        console.log(dataValue);
                        var textareaElement = document.getElementById("textReply" + dataValue);

//                        var divReplyContainer = document.getElementById("mediaBody" + dataValue);
//                        var divBodyReplyContainer = document.getElementById("divReplyContainer" + dataValue);
//                        //divReplyContainer .innerHTML = '';
//                        divReplyContainer.removeChild(divBodyReplyContainer);
//                        divReplyContainer.removeChild(divBodyReplyContainer);
                        
                        var replyWriteBox = document.getElementById("replyWrite" + dataValue);
                        replyWriteBox.style.display="none";
                        
                        var text = textareaElement.value;
                        console.log(text);

                        var myData = {action: "addReply", commentId: dataValue, content: text};
                        $.ajax({
                            type: "POST",
                            url: "http://localhost:9999/ELearning/Reply",
                            data: myData,
                            success: function (response) {

                                console.log(response);

                                if (typeof response === 'string' && response.toLowerCase() === 'false') {
                                    // Giá trị gửi từ AJAX là chuỗi "false"
                                    console.log("Giá trị là false");
                                } else {
                                    console.log("dung", response);
                                    // displayResults2(response);

                                    var viewReplyBtn = document.getElementById("reply" + dataValue);
                                    viewReplyBtn.click();
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error("Lỗi:", error);
                            }
                        });
                    });
                });
            }

        </script>

        <script>

            function ellipsisEvent() {
                // Lấy danh sách tất cả các dấu ellipsis
                var ellipsisList = document.querySelectorAll(".ellipsis");
                // Lặp qua từng dấu ellipsis và thêm sự kiện click
                ellipsisList.forEach(function (ellipsis) {
                    ellipsis.addEventListener("click", function (event) {
                        // Đóng tất cả các popup menu trước khi mở popup menu hiện tại
                        closeAllPopupMenus();
                        // Tìm popup menu liên quan
                        var popupMenu = this.nextElementSibling;
                        // Tính toán vị trí cho popup menu
                        var ellipsisRect = this.getBoundingClientRect();
                        popupMenu.style.position = "fixed"; // Sử dụng position: fixed để định vị dựa trên cửa sổ trình duyệt
                        popupMenu.style.top = ellipsisRect.bottom + "px";
                        popupMenu.style.left = ellipsisRect.left + "px";
                        // Mở popup menu hiện tại
                        popupMenu.style.display = "block";
                        // Ngăn sự kiện click toàn cục lan ra các menu ellipsis
                        event.stopPropagation();
                    });
                });
                // Thêm sự kiện click toàn cục để đóng popup menu khi người dùng bấm bất kỳ nơi nào trên trang
                document.addEventListener("click", function () {
                    closeAllPopupMenus();
                });
                // Hàm đóng tất cả các popup menu
                function closeAllPopupMenus() {
                    var popupMenus = document.querySelectorAll(".popup-menu");
                    popupMenus.forEach(function (popupMenu) {
                        popupMenu.style.display = "none";
                    });
                }
                deleteComment();
                like();
                viewReply();
                replyWrite();
                hiddenDisplayreplyWrite();
            }
            function ellipsisEvent2() {
                // Lấy danh sách tất cả các dấu ellipsis
                var ellipsisList = document.querySelectorAll(".ellipsis");
                // Lặp qua từng dấu ellipsis và thêm sự kiện click
                ellipsisList.forEach(function (ellipsis) {
                    ellipsis.addEventListener("click", function (event) {
                        // Đóng tất cả các popup menu trước khi mở popup menu hiện tại
                        closeAllPopupMenus();
                        // Tìm popup menu liên quan
                        var popupMenu = this.nextElementSibling;
                        // Tính toán vị trí cho popup menu
                        var ellipsisRect = this.getBoundingClientRect();
                        popupMenu.style.position = "fixed"; // Sử dụng position: fixed để định vị dựa trên cửa sổ trình duyệt
                        popupMenu.style.top = ellipsisRect.bottom + "px";
                        popupMenu.style.left = ellipsisRect.left + "px";
                        // Mở popup menu hiện tại
                        popupMenu.style.display = "block";
                        // Ngăn sự kiện click toàn cục lan ra các menu ellipsis
                        event.stopPropagation();
                    });
                });
                // Thêm sự kiện click toàn cục để đóng popup menu khi người dùng bấm bất kỳ nơi nào trên trang
                document.addEventListener("click", function () {
                    closeAllPopupMenus();
                });
                // Hàm đóng tất cả các popup menu
                function closeAllPopupMenus() {
                    var popupMenus = document.querySelectorAll(".popup-menu");
                    popupMenus.forEach(function (popupMenu) {
                        popupMenu.style.display = "none";
                    });
                }
                replyDisplayHidden();

            }
        </script>

        <script src="https://www.youtube.com/iframe_api"></script>
    </body>
</html>
