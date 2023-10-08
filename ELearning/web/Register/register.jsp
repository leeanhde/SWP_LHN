<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="<%=url%>/login/fonts/icomoon/style.css">

        <link rel="stylesheet" href="<%=url%>/login/css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=url%>/login/css/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="<%=url%>/Register/style.css">

        <title>Sign Up</title>
    </head>

    <body>


        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('<%=url%>/homepage/img/about.jpg');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7 py-5 " style="padding-bottom: 0rem!important;" >
                            <h3>Sign Up E-Learning</h3>
                            <p class="mb-4"> </p>
                            <form action="Register" method="post">
                                <c:if test="${checkfailed==0}" >
                                    <h2 style="color: rgb(9, 171, 9)">${msg}</h2>
                                </c:if>
                                <c:if test="${checkfailed==1}" >
                                    <p style="color: red">${msg}</p>
                                </c:if>
                                <h2 style="color: rgb(9, 171, 9)">${msgverify}</h2>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group first">
                                            <label for="fname">First Name</label>
                                            <input type="text" class="form-control" placeholder="" id="fname" name="fname" value="${fname}" maxlength="20">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group first">
                                            <label for="lname">Last Name</label>
                                            <input type="text" class="form-control" placeholder="" id="lname" name="lname" value="${lname}" maxlength="20">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group first">
                                            <label for="email">Email Address</label>
                                            <input type="email" class="form-control" placeholder="Your-email@gmail.com" id="email" name="email" value="${email}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group first">
                                            <label for="email">Address</label>
                                            <input type="text" class="form-control" placeholder="Your Address" id="lname" name="Address" value="${Address}">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group first">
                                            <label for="lname">Birth Date</label>
                                            <input type="date" class="form-control" id="birthdate" name="birthdate" value="${birthdate}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group first">
                                            <label for="lname">Gender</label><br>
                                            <div class="hihi">
                                                <input type="radio" name="gender" id="lname" value="1" <c:if test="${gender==1}">checked</c:if> >Male
                                                <input type="radio" name="gender" id="lname" value="0" <c:if test="${gender==0}">checked</c:if>>Female
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group first">
                                                <label for="lname">Phone Number</label>
                                                <div id="phone-error" style="color: red;"></div>
                                                <input type="tel" class="form-control" placeholder="Your phone number" id="phone-number" name="Phone" value="${Phone}">
                                        </div>
                                    </div>



                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group last mb-3">
                                            <label for="password">Password</label>
                                            <input type="password" class="form-control" placeholder="Your Password" id="password" name="password" value="${password}">
                                            <div id="password-error" style="color: red;"></div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group last mb-3">
                                            <label for="re-password">Confirm Password</label>
                                            <input type="password" class="form-control" placeholder="Your Password" id="re-password" name="re_password" value="${re_password}">
                                            <div id="password-match-error" style="color: red;"></div>
                                        </div>
                                    </div>

                                </div>

                                <div class="d-flex mb-5 mt-4 align-items-center">
                                    <div class="d-flex align-items-center">
                                        <label class="control control--checkbox mb-0"><span class="caption">Creating an account means you're
                                                okay with our <a href="#">Terms and Conditions</a> and our <a href="#">Privacy Policy</a>.</span>
                                            <input type="checkbox" checked="checked" />
                                            <div class="control__indicator"></div>
                                        </label>
                                    </div>
                                </div>

                                <input type="submit" value="Sign Up" class="btn btn-block btn-info">
                                <div class="signup text-center mt-3">
                                    You have account? <span class="signup-underline" ><a href="login" style="color: blue">Sign In</a></span>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <script>
            const passwordInput = document.getElementById('password');
            const rePasswordInput = document.getElementById('re-password');
            const passwordError = document.getElementById('password-error');
            const passwordMatchError = document.getElementById('password-match-error');

            passwordInput.addEventListener('input', function () {
                const passwordValue = passwordInput.value;
                if (passwordValue.length < 6 || passwordValue.length > 16) {
                    passwordError.textContent = 'Please enter 6 - 16 character';
                } else {
                    passwordError.textContent = '';
                }
            });

            rePasswordInput.addEventListener('input', function () {
                const passwordValue = passwordInput.value;
                const rePasswordValue = rePasswordInput.value;

                if (rePasswordValue !== passwordValue) {
                    passwordMatchError.textContent = 'Password not match';
                } else {
                    passwordMatchError.textContent = '';
                }
            });

            const phoneInput = document.getElementById('phone-number');
            const phoneError = document.getElementById('phone-error');

            phoneInput.addEventListener('input', function () {
                const phoneValue = phoneInput.value;
                if (isNaN(phoneValue)) {
                    phoneError.textContent = 'Please enter correct format';
                } else {
                    const regex = /^\d{10}$/;
                    if (!regex.test(phoneValue)) {
                        phoneError.textContent = 'Please enter 10 numbers';
                    } else {
                        phoneError.textContent = '';
                    }
                }
            });
        </script>

        <script src="<%=url%>/login/js/jquery-3.3.1.min.js"></script>
        <script src="<%=url%>/login/js/popper.min.js"></script>
        <script src="<%=url%>/login/js/bootstrap.min.js"></script>
        <script src="<%=url%>/login/js/main.js"></script>
    </body>

</html>