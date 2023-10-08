<%-- 
    Document   : exam
    Created on : Sep 27, 2023, 2:24:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dal.QuizDAO"%>
<%@page import="dal.ChoiceDAO"%>
<%@page import="dal.ExamDAO"%>

<%@page import="model.Quiz"%>
<%@page import="model.Choice"%>
<%@page import="model.User"%>
<%@page import="model.Exam"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
//            User user = (User) session.getAttribute("acc");
    int examId=0;
    int userId=0;
    QuizDAO quizeDao = new QuizDAO();
    ArrayList<Quiz> listQuiz = new ArrayList<Quiz>();
    listQuiz=quizeDao.selectAllQuizByExamID(0);
    
    Exam exam = new ExamDAO().selectById(examId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam </title>
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            html, body {
                overflow-x: hidden;
            }

            .form-check-input[type="radio"] {
                width: 18px; /* Đặt chiều rộng */
                height: 18px; /* Đặt chiều cao */
            }
            #btn_back a{
                text-decoration: none;
            }
            #btn_back :hover{
                background: #f3f8ff
            }
            #countdown {
                font-size: 16px;
                font-weight: 500;
                color: #ef4d2e;
            }
            #header {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                background: #ffffff;
                z-index: 1000; /* Để header hiển thị phía trên các phần tử khác */
            }
        </style>
    </head>
    <body>
        <div id="header">
            <div  class="d-flex justify-content-between align-items-center " style="padding: 15px 60px" >
                <div class="d-flex align-items-center"id="btn_back">
                    <a href="javascript:history.back()" style="padding: 7px 15px" >
                        <i class="fa-solid fa-arrow-left mr-2" style="color:#138496; font-size: 19px"></i>
                        <span style="font-size: 19px; color: #138496">Back</span>
                    </a> 
                    <div class="ml-3">
                        <p style="font-weight: 500; margin: 0px"> <%=exam.getExamName()%></p>
                        <p style="margin:0px; font-size: 13px">Practice  Quiz • <%=exam.getDuration()%> min</p>
                    </div>
                </div>
                <div>
                    <p style="margin: 0px; font-size: 17px ">Time Remaining</p>
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-clock mr-2" style="font-size: 14px; color:#f2582e"></i>
                        <div id="countdown">00:00:00</div>
                    </div>
                </div>
            </div>  
            <hr style="margin: 0px; font-weight: 1000">
        </div>

        <div   class="d-flex" style="background: #d4edda;margin-top: 0px">
            <div class="col-md-3" >
            </div>
            <div id="pass" class="col-md-6 alert " role="alert" style="margin:0px;display: none;margin-top: 80px">
                <i class="fa-solid fa-circle-check mr-2" style="color: #0e811c;font-size: 22px"></i>
                <span style="font-size:25px; font-weight: 500; color:#000">Congratulations! You passed!</span>
                <div class="d-flex justify-content-around align-items-center" style="font-weight: 500">
                    <p class="mr-2">Grade <br> received <span id="score_pass" style="color:#0e811c; font-weight: 700">100%</span></p>
                    <p class="mr-5">Completed on <br> <span id="date_pass"  style="color:#0e811c;font-weight: 700">2022-02-02</span></p>
                    <p>To  pass <br> <span style="color:#0e811c;font-weight: 700">80%</span> or higher </p>  
                    <a href="javascript:history.back()"  class="btn btn-info" style="padding:10px 20px; font-weight: 600" >Go to next item</a>
                </div>
            </div> 
            <div class="col-md-3">
            </div>
        </div>
        <div  class="d-flex" style="background: #fdd6d6">
            <div class="col-md-3" >
            </div>
            <div id="notpass" class="col-md-6 alert " role="alert" style="margin:0px;display: none; margin-top: 80px">
                <i class="fa-solid fa-triangle-exclamation mr-2" style="color: #d30001;font-size: 22px"></i>
                <span style="font-size:25px; font-weight: 500; color:#000">Try again once you are ready!</span>
                <div class="d-flex justify-content-around align-items-center" style="font-weight: 500">
                    <p class="mr-2">Grade <br> received <span id="score_notpass" style="color:#d30001; font-weight: 700">50%</span></p>
                    <p class="mr-5">Completed on <br> <span id="date_notpass" style="color:#d30001;font-weight: 700">2022-02-02</span></p>
                    <p>To  pass <br> <span style="color:#0e811c;font-weight: 700">80%</span> or higher </p>  
                    <a href="javascript:void(0);" onclick="refreshPage()" class="btn btn-info" style="padding:10px 20px; font-weight: 600" >Try again</a>
                </div>
            </div> 
            <div class="col-md-3">
            </div>
        </div>
        <hr style="margin: 0px">
        <div id="contentbig" class="row d-flex " >
            <div class="col-md-3" >
            </div>
            <div class="col-md-6">
                <div>
                    <div class="container py-2 mt-5" id="content">
                        <div style="padding: 0px">
                            <form id="myForm">

                                <%int count=1;%>
                                <%for (Quiz quiz : listQuiz) {%>
                                <input type="hidden" value="0" name="examId" >
                                <input type="hidden" value="0" name="userId" >
                                <input type="hidden" value="<%=exam.getDuration()%>" name="timeExam" >
                                <input id="timedo" type="hidden" value="0" name="timedo" >
                                <div class="question mt-5" style="user-select: none;"id="<%=count%>" >
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p style="font-size: 18px; font-weight: 500"><span style="font-weight: 700"><%=count%>. </span><%=quiz.getQuizContent()%></p>
                                        <p style=" white-space: nowrap;padding:4px 10px; background: #e5e7e8; border-radius: 5px ; font-weight: 500; font-size: 13px">1 point</p>
                                    </div>

                                    <div class="ml-4 choices" style="font-size: 17px">
                                        <%
                                            ChoiceDAO choiceDao = new ChoiceDAO();
                                                ArrayList<Choice> listChoice = new ArrayList<Choice>();
                                                listChoice= choiceDao.selectAllChoiceByQuizID(quiz.getQuizId());
                                        %>
                                        <%for (Choice choice : listChoice) {%>
                                        <div class="form-check mt-2 ">
                                            <input class="form-check-input" value="<%=choice.getChoiceId()%>" type="radio" name="<%=quiz.getQuizId()%>" id="choice+<%=choice.getChoiceId()%>">
                                            <label class="form-check-label ml-2" for="choice+<%=choice.getChoiceId()%>">
                                                <%=choice.getDescription()%>
                                            </label>
                                        </div>
                                        <%}  %>
                                        <div class="alert align-items-center mt-1" role="alert" style="display: none;background: #f8ebec; user-select:auto">
                                            <div>
                                                <i class="fa-regular fa-circle-xmark" style="color: #df113a;"></i>
                                                <span style="font-weight: 500;color: #df113a">Incorrect</span>
                                                <p class="ml-3" >Oops! Review the previous lesson so you can complete this question correctly.</p>
                                            </div>
                                        </div>
                                        <div class="alert align-items-center mt-1" role="alert" style="display: none;background: #e3eddd; user-select:auto">
                                            <div>
                                                <i class="fa-regular fa-circle-check" style="color: #088c22;"></i>
                                                <span style="font-weight: 500;color: #1d7c50">Correct</span>
                                                <p class="ml-3" >Congratulations! You did an excellent job answering this question correctly.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%count++;%>
                                <%} %>
                            </form>
                            <a id="btn_submit" onclick="submitForm()" class="btn btn-info mt-5 mb-4" style="padding: 10px 30px; font-size: 18px; font-weight: 600; pointer-events: none;opacity: 0.4;cursor: not-allowed">Submit</a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-3" >
            </div>
        </div>
        <script>
            var form = document.getElementById("myForm");

            form.addEventListener("input", function () {
                var isAllGroupsChecked = areAllGroupsChecked();

                if (isAllGroupsChecked) {
                    console.log("Tất cả các nhóm đã được chọn.");
                    var btnSubmit = document.getElementById("btn_submit");
                    btnSubmit.style.pointerEvents = "auto";
                    btnSubmit.style.opacity = "1";
                    btnSubmit.style.cursor = "pointer";
                } else {
                    console.log("Chưa chọn đủ tất cả các nhóm.");
                }
            });

            function areAllGroupsChecked() {
                var groups = form.querySelectorAll(".choices");
                for (var i = 0; i < groups.length; i++) {
                    var inputs = groups[i].querySelectorAll('input[type="radio"]');
                    var checkedCount = 0;

                    for (var j = 0; j < inputs.length; j++) {
                        if (inputs[j].checked) {
                            checkedCount++;
                        }
                    }

                    if (checkedCount !== 1) {
                        return false;
                    }
                }

                return true;
            }
        </script>

        <script>
            var pausedSeconds;

            function submitForm() {

                $("html, body").animate({scrollTop: 0}, "slow");
                var btn_submit = document.getElementById("btn_submit");
                btn_submit.style.pointerEvents = "none";
                btn_submit.style.opacity = "0.5";
                btn_submit.style.cursor = "not-allowed";


                var content = document.getElementById("content");
                content.classList.remove("mt-5");


                var radioButtons = document.querySelectorAll('input[type="radio"]');
                radioButtons.forEach(function (radioButton) {
                    if (!radioButton.checked) {
                        radioButton.disabled = true;
                    }
                });

                console.log("haa" + seconds);
                var timedo = document.getElementById("timedo");
                timedo.value = seconds;

                var formData = $("#myForm").serialize();
                // formData.push({name: "variableName", value: "variableValue"});

                $.ajax({
                    type: "POST", // Loại yêu cầu
                    url: "http://localhost:9999/ELearning/GetScore", // URL của servlet
                    data: formData, // Dữ liệu gửi đến servlet
                    success: function (response) {
                        // Xử lý kết quả từ servlet (nếu cần)
                        console.log("Kết quả từ servlet:", response.list1);
                        console.log("Kết quả từ servlet:", response.list2);
                        console.log("Kết quả từ servlet:", response.score);
                        console.log("Kết quả từ servlet:", response.timeend);
                        // console.log("end time:", response.timeend);

                        var differentIndexes = response[0];
                        var sameIndexes = response[1];
                        response.list1.forEach(function (currentItem) {
                            var quiz = document.getElementById(currentItem + 1);
                            var divInsideQuiz = quiz.getElementsByClassName("alert")[0];
                            divInsideQuiz.style.display = "block";
                        });
                        response.list2.forEach(function (currentItem) {
                            var quiz = document.getElementById(currentItem + 1);
                            var divInsideQuiz = quiz.getElementsByClassName("alert")[1];
                            divInsideQuiz.style.display = "block";
                        });

                        if (response.score < 80) {
                            var notification = document.getElementById("notpass");
                            notification.style.display = "block";
                            var score = document.getElementById("score_notpass");
                            score.innerHTML = "" + response.score + "%";

                            var date = document.getElementById("date_notpass");

                            date.innerHTML = response.timeend;

                        } else {
                            var notification = document.getElementById("pass");
                            notification.style.display = "block";
                            var score = document.getElementById("score_pass");
                            score.innerHTML = "" + response.score + "%";

                            var date = document.getElementById("date_pass");

                            date.innerHTML = response.timeend;
                        }

                    },
                    error: function (xhr, status, error) {
                        console.error("Lỗi:", error);
                    }
                });
            }
        </script>
        <script>
            //var timeExam = <%=exam.getDuration()%>;
            var seconds = 19 * 60;
            var pausedSeconds;
            function countdown() {
                var hours = Math.floor(seconds / 3600);
                var minutes = Math.floor((seconds % 3600) / 60);
                var remainingSeconds = seconds % 60;

                // Định dạng số để hiển thị 2 chữ số cho giờ, phút và giây
                var hoursStr = hours.toString().padStart(2, "0");
                var minutesStr = minutes.toString().padStart(2, "0");
                var secondsStr = remainingSeconds.toString().padStart(2, "0");

                // Hiển thị thời gian
                document.getElementById("countdown").textContent =
                        hoursStr + ":" + minutesStr + ":" + secondsStr;

                // Giảm thời gian đi 1 giây
                seconds--;

                // Kiểm tra nếu thời gian kết thúc
                if (seconds < 0) {
                    clearInterval(interval);
                    alert("Hết giờ!"); // Thêm xử lý khi hết giờ ở đây
                }
            }
            document.getElementById("btn_submit").addEventListener("click", function () {
                clearInterval(interval); // Dừng đồng hồ đếm
                pausedSeconds = seconds;

            });
            // Gọi hàm countdown mỗi giây
            var interval = setInterval(countdown, 1000);



        </script>
        <script>
            // Hàm để làm mới trang
            function refreshPage() {
                window.location.href = window.location.href;
            }
        </script>
    </body>
</html>
