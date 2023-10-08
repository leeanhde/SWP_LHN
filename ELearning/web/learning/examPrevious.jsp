<%-- 
    Document   : examPrevious
    Created on : Oct 7, 2023, 12:11:05 AM
    Author     : ADMIN
--%>
<%@page import="dal.UserChoiceDAO"%>
<%@page import="dal.QuizDAO"%>
<%@page import="dal.ChoiceDAO"%>

<%@page import="model.UserChoice"%>
<%@page import="model.Quiz"%>
<%@page import="model.Choice"%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        int examId = Integer.parseInt(request.getParameter("examid"));
        UserChoiceDAO userChoiceDao  = new UserChoiceDAO();
        ArrayList<UserChoice> listUserChoice = new ArrayList<>();
        listUserChoice = userChoiceDao.selectUserChoiceByUserExamID(0, examId); 

        ArrayList<Integer> listUserChoiceId= new ArrayList<>();
        for (UserChoice userChoice : listUserChoice) {
            listUserChoiceId.add(userChoice.getChoiceId().getChoiceId());
        }
        
        ArrayList<Integer> listRightAnswer = new ArrayList<Integer>();
        listRightAnswer= new ChoiceDAO().getListRightAnswerByExamID(examId);
        
        
        
         QuizDAO quizeDao = new QuizDAO();
        ArrayList<Quiz> listQuiz = new ArrayList<Quiz>();
        listQuiz=quizeDao.selectAllQuizByExamID(examId);
%>
<%
              java.sql.Timestamp timestamp = listUserChoice.get(0).getExamDetailId().getTimeEnd();
              java.util.Date date = new java.util.Date(timestamp.getTime());
              java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              String timeEnd = sdf.format(date);
              
java.sql.Timestamp timestamp2 = listUserChoice.get(0).getExamDetailId().getTimeStart();
              java.util.Date date2 = new java.util.Date(timestamp2.getTime());
              java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              String timeStart = sdf2.format(date2);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Exam Previous</title>
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
                        <p style="font-weight: 500; margin: 0px"><%=listUserChoice.get(0).getChoiceId().getQuizId().getExamId().getExamName()%></p>
                        <p style="margin:0px; font-size: 13px">Graded Quiz • <%=listUserChoice.get(0).getChoiceId().getQuizId().getExamId().getDuration()%> min</p>
                    </div>
                </div>
                <div>
                    <p style="margin: 0px; font-size: 17px ">Exam Completion Time</p>
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-clock-rotate-left mr-2" style="font-size: 14px; color:#f2582e;"></i>
                        <div id="countdown">00:00:00</div>
                    </div>
                </div>
            </div>  
            <hr style="margin: 0px; font-weight: 1000">
        </div>

        <div   class="d-flex" style="background: #d4edda;margin-top: 0px">
            <div class="col-md-3" >
            </div>
            <div id="pass" class="col-md-6 alert " role="alert" style="margin:0px;display: none;margin-top: 80px; padding:20px">
                <i class="fa-solid fa-circle-check mr-2" style="color: #0e811c;font-size: 22px"></i>
                <span style="font-size:25px; font-weight: 500; color:#000">Congratulations! You passed!</span>
                <div class="d-flex justify-content-around align-items-center mt-3" style="font-weight: 500">
                    <p class="mr-2" style="margin:auto 0px">Grade <br> received <span id="score_pass" style="color:#0e811c; font-weight: 700">100%</span></p>
                    <div class="grid-container" style="display: grid;grid-template-columns: 1fr;grid-gap: 0px;">
                        <p class="mr-5" style="margin:0px">Start time:  <span id="datestart_notpass" style="color:#0e811c;font-weight: 700"><%=timeStart%></span></p>
                        <p class="mr-5" style="margin:0px">End time:  <span id="dateend_notpass" style="color:#0e811c;font-weight: 700; margin-left: 7px"><%=timeEnd%></span></p>
                    </div>
                    <p style="margin:auto 0px">To  pass <br> <span style="color:#0e811c;font-weight: 700">80%</span> or higher </p>  
                    <a href="javascript:history.back()"  class="btn btn-info" style="padding:10px 20px; font-weight: 600" >Go to next item</a>
                </div>
            </div> 
            <div class="col-md-3">
            </div>
        </div>
        <div  class="d-flex" style="background: #fdd6d6">
            <div class="col-md-3" >
            </div>
            <div id="notpass" class="col-md-6 alert " role="alert" style="margin:0px;display: none; margin-top: 80px; padding:20px">
                <i class="fa-solid fa-triangle-exclamation mr-2" style="color: #d30001;font-size: 22px"></i>
                <span style="font-size:25px; font-weight: 500; color:#000">Try again once you are ready!</span>
                <div class="d-flex justify-content-around align-items-center mt-3" style="font-weight: 500">
                    <p class="mr-2" style="margin:auto 0px">Grade <br> received <span id="score_notpass" style="color:#d30001; font-weight: 700">50%</span></p>
                    <div class="grid-container" style="display: grid;grid-template-columns: 1fr;grid-gap: 0px;">
                        <p class="mr-5" style="margin:0px">Start time:  <span id="datestart_notpass" style="color:#d30001;font-weight: 700"><%=timeStart%></span></p>
                        <p class="mr-5" style="margin:0px">End time:  <span id="dateend_notpass" style="color:#d30001;font-weight: 700; margin-left: 7px"><%=timeEnd%></span></p>
                    </div>
                    <p style="margin:auto 0px">To  pass <br> <span style="color:#0e811c;font-weight: 700">80%</span> or higher </p>  
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
            <div class="col-md-6 mb-2 mt-4">
                <div>
                    <div class="container py-2 mb-2 mt-3" id="content">
                        <div style="padding: 0px">
                            <form id="myForm">
                                <%int count=1;%>
                                <%for (Quiz quiz : listQuiz) {%>
                                <input type="hidden" value="0" name="examId" >
                                <input type="hidden" value="0" name="userId" >
                                <div class="question mb-5" style="user-select: none;"id="<%=count%>" >
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p style="font-size: 18px; font-weight: 500"><span style="font-weight: 700"><%=count%>. </span><%=quiz.getQuizContent()%></p>
                                        <p id="point<%=count%>" style=" white-space: nowrap;padding:4px 10px; background: #e5e7e8; border-radius: 5px ; font-weight: 500; font-size: 13px">1 point</p>
                                    </div>

                                    <div class="ml-4 choices" style="font-size: 17px">
                                        <%
                                            ChoiceDAO choiceDao = new ChoiceDAO();
                                                ArrayList<Choice> listChoice = new ArrayList<Choice>();
                                                listChoice= choiceDao.selectAllChoiceByQuizID(quiz.getQuizId());
                                        %>
                                        <%for (Choice choice : listChoice) {%>

                                        <div class="form-check mt-2 ">
                                            <input class="form-check-input" value="<%=choice.getChoiceId()%>" type="radio" name="<%=quiz.getQuizId()%>" id="choice<%=choice.getChoiceId()%>">
                                            <label class="form-check-label ml-2" for="choice<%=choice.getChoiceId()%>">
                                                <%=choice.getDescription()%>
                                            </label>
                                        </div>
                                        <%}%>

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
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3" >
            </div>
        </div>
        <script>
            var valuesToCheck =<%=listUserChoiceId%>;
            var listRightAnswer =<%=listRightAnswer%>;
            console.log(valuesToCheck);
            console.log(listRightAnswer);

            var allRadioButtons = document.querySelectorAll('input[type="radio"]');
            allRadioButtons.forEach(function (radio) {
                // Lấy số từ ID của radio button
                var value = parseInt(radio.id.replace("choice", ""));

                // Kiểm tra xem số có trong danh sách không
                if (valuesToCheck.includes(value)) {
                    radio.checked = true;
                } else {
                    radio.disabled = true;
                }
            });

            var commonIndices = [];

// Danh sách các phần tử khác nhau
            var differentIndices = [];

// So sánh từng phần tử tương ứng
            for (var i = 0; i < valuesToCheck.length; i++) {
                if (valuesToCheck[i] === listRightAnswer[i]) {
                    commonIndices.push(i); // Vị trí của phần tử khác nhau
                } else {
                    differentIndices.push(i); // Vị trí của phần tử khác nhau
                }
            }
            console.log("giong", commonIndices);
            console.log("khas", differentIndices);

            for (var i = 0; i < commonIndices.length; i++) {
                var alartDiv = document.getElementById(commonIndices[i] + 1);
                var divInsideQuiz = alartDiv.getElementsByClassName("alert")[1];
                divInsideQuiz.style.display = "block";

                var point = document.getElementById("point" + (commonIndices[i] + 1));
                point.innerHTML = "1/1 point"

            }
            for (var i = 0; i < differentIndices.length; i++) {
                var alartDiv = document.getElementById(differentIndices[i] + 1);
                var divInsideQuiz = alartDiv.getElementsByClassName("alert")[0];
                divInsideQuiz.style.display = "block";
                var point = document.getElementById("point" + (differentIndices[i] + 1));
                point.innerHTML = "0/1 point";
            }

            var scoreRs = <%=listUserChoice.get(0).getExamDetailId().getScore()%>



            console.log(score);
            if (scoreRs >= 80) {
                var notification = document.getElementById("pass");
                notification.style.display = "block";
                var score = document.getElementById("score_pass");
                score.innerHTML = "" + scoreRs + "%";


            } else {
                var notification = document.getElementById("notpass");
                notification.style.display = "block";
                var score = document.getElementById("score_notpass");
                score.innerHTML = "" + scoreRs + "%";
            }

            function formatTime(seconds) {
                var hours = Math.floor(seconds / 3600);
                var minutes = Math.floor((seconds % 3600) / 60);
                var remainingSeconds = seconds % 60;

                var hoursStr = hours.toString().padStart(2, "0");
                var minutesStr = minutes.toString().padStart(2, "0");
                var secondsStr = remainingSeconds.toString().padStart(2, "0");

                return hoursStr + ":" + minutesStr + ":" + secondsStr;
            }

            var timestart = document.getElementById("datestart_notpass").textContent;
            var timeend = document.getElementById("dateend_notpass").textContent;
            var time1 = new Date(timestart);
            var time2 = new Date(timeend);
            var difference = time2.getTime() - time1.getTime();
            var differenceInSeconds = difference / 1000;

            console.log(differenceInSeconds);
            var countdown = document.getElementById("countdown");
            countdown.innerHTML = formatTime(differenceInSeconds);
        </script>
    </body>
</html>
