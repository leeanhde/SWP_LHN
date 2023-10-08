<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<html lang="en">

    <head>
 <link rel="icon" href="<%=url%>/homepage/img/tab_icon.png" type="image/x-icon">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <link rel="stylesheet" href="<%=url%>/login/fonts/icomoon/style.css">

        <link rel="stylesheet" href="<%=url%>/login/css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=url%>/login/css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="<%=url%>/login/css/style.css">

        <link rel="stylesheet" href="<%=url%>/login/css/google.css">


        <title>Login E-Learning</title>
        <style>
            /* CSS cho button khi di chuột (hover) */
            .btn.btn-block.btn-info:hover {
                color:#24c3d3;
            }
            ; /* Đổi màu chữ sang đỏ khi hover */

            .overlay {
                position: absolute; /* Đặt overlay trên div */
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.9); /* Màu đen với độ mờ 50% */
                z-index: 99999; /* Đặt overlay lên trên div */
            }
            .overlay_all {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6);
                z-index: 1;
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

            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
            .highlight {
                background-color: #ffcccc; /* Màu nền đỏ nhạt, bạn có thể thay đổi theo ý muốn */
            }
            .loader {
                font-size: 22px;
                width: 30px;
                height: 30px;
                border: 3px solid transparent;
                border-radius: 50%;
                border-top-color: black;
                animation: an1 1s ease infinite;
            }
            @keyframes an1 {
                0% {
                    transform: rotate(0turn);
                }
                100% {
                    transform: rotate(1turn);
                }
            }
            .eye{
                position: absolute;
                right: 35px;
                top: 47%;
                transform: translateY(-50%);
                cursor: pointer;
                max-width: 20px;
            }
            .hidden{
                display: none;
            }


        </style>
        <script>

        </script>
    </head>

    <body>

        <div class="overlay_all" id="overlay"></div>


        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('<%=url%>/homepage/img/about.jpg');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">

                            <h3>Login to <strong>E-LEARNING</strong></h3>
                            <p class="mb-4">Wellcome to E-Learning</p>
                            <label style="color: red">${failed}</label>

                            <label style="color: green">${msg1}</label>

                            <form action="login" method="post">
                                <div class="form-group first">
                                    <label for="username">Email</label>
                                    <input type="email" class="form-control" placeholder="Your-email@gmail.com" id="username" name="username" required value="${email}">
                                </div>
                                <div class="form-group last mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" placeholder="Your password" id="password" name="password" value="${pass}">
                                    <!--hi-->

                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="eye eye-close">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88" />
                                    </svg>

                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="eye eye-open hidden">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                    </svg>
                                </div>




                                <div class="d-flex mb-5 align-items-center">
                                    <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                        <input type="checkbox" name="check" value="checked" <c:if test="${check!=null}" >checked=""</c:if>/>
                                            <div class="control__indicator"></div>
                                        </label>
                                        <span class="ml-auto forgot"><a href="#" class="forgot-pass edit" style="color:#138496">Forgot Password</a></span>
                                    </div>
                                    <input type="submit" value="SIGN IN" class="btn btn-block btn-info">

                                    <div class="signup text-center mt-3">
                                        Don't have an account? <span class="signup-underline" ><a href="Register" style="color: blue">Sign Up</a></span>
                                    </div>
                                    <br>
                                    <p class="text-center">or</p>
                                    <div class="text-center">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/ELearning/LoginGoogleHandler&response_type=code
                                           &client_id=432965523414-4hkjas0g7irtoqr8hcnl0uskahfgda9t.apps.googleusercontent.com&approval_prompt=force">
                                            <button type="button" class="login-with-google-btn" >
                                                Sign in with Google
                                            </button>  
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <div class="popup2">
                <div class="close-btn">&times;</div>
            <c:if test="${not empty successMsg}">
                <p class="text-center text-success">${successMsg}</p>
                <c:remove var="successMsg" scope="session" />
            </c:if>

            <c:if test="${not empty failedMsg}">
                <p class="text-center text-danger">${failedMsg}</p>
                <c:remove var="failedMsg" scope="session" />

            </c:if>
            <form action="/EBook/AddBook" id="editform" method="post" enctype="multipart/form-data" >
                <div class="text-center">
                    <img  src="<%=url%>/homepage/img/logo.png" style="width: 100px">

                </div>
                <h5 class='mt-4' id="title" >Forgot your password?</h5>
                <p id="content">
                    Enter your email address and we will send you the link to reset password.
                </p>
                <div class="alert alert-danger" role="alert" id="errorAlert" style="display: none;">
                    <i class="fa-solid fa-triangle-exclamation"></i> Error
                    <br>
                    <span id="errorText"></span>
                </div>
                <div id="input-button">
                    <div class="form-group first">
                        <p style="color: #000; margin-bottom: 0px" for="username" >Email</p>
                        <input type="email" class="form-control" placeholder="Your-email@gmail.com" id="email" required="required">
                    </div>
                    <input type="hidden" name="formType" value="forgot">
                    <div class="text-center form-group mb-1 mt-4 ">
                        <button type="button" class="btn btn-info w-100" id="submitButton" onclick="validateInput()">Send Reset Password</button>
                    </div>
                </div>

            </form>
        </div>






        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <script>
                            const input = document.getElementById("password");
                            const eyeOpen = document.querySelector(".eye-open");
                            const eyeClose = document.querySelector(".eye-close");
                            eyeOpen.addEventListener("click", function () {
                                eyeOpen.classList.add("hidden");
                                eyeClose.classList.remove("hidden");
                                input.setAttribute("type", "password");

                            });
                            eyeClose.addEventListener("click", function () {
                                eyeOpen.classList.remove("hidden");
                                eyeClose.classList.add("hidden");
                                input.setAttribute("type", "text");

                            });

        </script>

        <!--        <a  href="#" class="btn btn-sm btn-primary edit""> <i class="fa-solid fa-pen-to-square" style="margin-right: 0.3rem"></i>Edit </a>-->

        <script>

            const overlay = document.getElementById('overlay');
            document.addEventListener('click', function (event)


            {
                if (event.target.classList.contains('edit')) {

                    // Xử lý sự kiện click cho thẻ <a> có class "edit" ở đây
                    document.querySelector(".popup2").classList.add("active");
                    overlay.style.display = 'block';
                    popup = document.querySelector(".popup2");
                    popup.style.zIndex = "9888991";
                    // Thực hiện các hành động cần thiết khi thẻ được click
                }
            }
            );
            overlay.addEventListener('click', () =>
            {
                document.querySelector(".popup2").classList.remove("active");
                document.getElementById("errorAlert").style.display = "none";

                overlay.style.display = 'none';
            });
            document.querySelector(".popup2 .close-btn").addEventListener("click", function ()


            {
                document.getElementById("errorAlert").style.display = "none";
                document.querySelector(".popup2").classList.remove("active");
                overlay.style.display = 'none';
            }
            );
            document.addEventListener('keydown', function (event) {
                if (event.key === 'Escape') {
                    // Xử lý khi người dùng nhấn phím Esc ở đây
                    overlay.style.display = 'none';
                    document.querySelector(".popup2").classList.remove("active");
                    document.getElementById("errorAlert").style.display = "none";

                }
            });
            document.getElementById("submitButton").addEventListener("click", function (event) {
                openPopupEdit(event); // Gọi hàm openPopupEdit và truyền sự kiện vào
            });
            function openPopupEdit(event) {
                event.preventDefault();
                swal({
                    title: "Are you sure?",
                    text: "After editing, the original data of the file will be lost!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                document.getElementById("editform").submit();
                                setTimeout(function () {
                                    swal("Poof! Your imaginary file has been deleted!", {
                                        icon: "success",
                                    });
                                }, 1000);
                            } else {
                                swal("You have exited book editing!");
                                document.querySelector(".popup2").classList.remove("active");
                                overlay.style.display = 'none';
                            }
                        });
            }
            function openPopupDelete() {
                swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this imaginary file!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                swal("Poof! Your imaginary file has been deleted!", {
                                    icon: "success",
                                });
                            } else {
                                swal("Your imaginary file is safe!");
                            }
                        });
            }
        </script>

        <script>
            function isValidEmail(email) {
                // Biểu thức chính quy để kiểm tra định dạng email
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return emailPattern.test(email);
            }

            function validateInput() {



                var input = document.getElementById("email");
                var errorTextElement = document.getElementById("errorText");

                var newErrorText = "Invalid email. Please try again!.";

                if (input.value === "") {
                    document.getElementById("errorAlert").style.display = "block";
                    errorTextElement.innerHTML = "Email has no value. Please try again!.";
                } else if (!isValidEmail(input.value)) {
                    var errorAlert = document.getElementById("errorAlert");
                    errorAlert.classList.add("highlight");
                    document.getElementById("errorAlert").style.display = "block";
                    errorTextElement.innerHTML = "Email format is invalid. Please try again!.";
                } else {
                    this.innerHTML = "<div class='loader'></div>";
                    setTimeout(() => {
                        this.innerHTML = "Done";
                    }, 3000);
                    $(document).ready(function () {
                        var email = $("#email").val();
                        $.ajax({
                            type: "POST",
                            url: "http://localhost:9999/ELearning/ForgotPassword", // Thay thế bằng URL của Servlet của bạn
                            data: {email: email},
                            success: function (response) {
                                // Xử lý kết quả từ Servlet
                                if (response === "true") {
                                    document.getElementById("errorAlert").style.display = "none";
                                    document.getElementById("title").innerHTML = "Email Has Been Sent";
                                    document.getElementById("title").style.color = "#035fc4";
                                    document.getElementById("title").classList.add("text-center");
                                    document.getElementById("content").innerHTML = "Please check your email inbox for a password recovery link. Don't forget to check your spam folder.";
                                    document.getElementById("content").style.color = "black";
                                    document.getElementById("content").classList.add("text-center");
                                    document.getElementById("input-button").style.display = "none";
                                    document.getElementById("input-button").style.display = "none";
                                    document.getElementById("icon").style.display = "block";
                                    save_btn = document.getElementById("submitButton");
//                                    this.innerHTML = "<div class='loader'></div>";
//                                    setTimeout(() => {
//                                        this.innerHTML = "Done";
//                                    }, 3000);

                                } else {
                                    document.getElementById("errorAlert").style.display = "block";
                                    errorTextElement.innerHTML = "Email is not registered. Please enter your registered email!.";
                                }
                            }
                        });

                    });
                    // document.getElementById("errorAlert").style.display = "none";

                }
            }
        </script>
        <script>
//            save_btn = document.getElementById("submitButton");
//            save_btn.onclick = function () {
//                this.innerHTML = "<div class='loader'></div>";
//                setTimeout(() => {
//                    this.innerHTML = "Done";
//                }, 3000);
//            };
        </script>
    </body>

</html>