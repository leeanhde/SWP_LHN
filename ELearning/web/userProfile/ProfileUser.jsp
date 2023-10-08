<%-- 
    Document   : ProfileUser
    Created on : Sep 18, 2023, 4:32:51 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Profile</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../asset/CSS/avatar.css"/>
        <style>
            body {
                background: #06BBCC;
            }

            .ui-w-80 {
                width : 80px !important;
                height: auto;
            }

            .btn-default {
                border-color: rgba(24, 28, 33, 0.1);
                background  : rgba(0, 0, 0, 0);
                color       : #4E5155;
            }

            label.btn {
                margin-bottom: 0;
            }

            .btn-outline-primary {
                border-color: #26B4FF;
                background  : transparent;
                color       : #26B4FF;
            }

            .btn {
                cursor: pointer;
            }

            .text-light {
                color: #babbbc !important;
            }

            .btn-facebook {
                border-color: rgba(0, 0, 0, 0);
                background  : #3B5998;
                color       : #fff;
            }

            .btn-instagram {
                border-color: rgba(0, 0, 0, 0);
                background  : #000;
                color       : #fff;
            }

            .card {
                background-clip: padding-box;
                box-shadow     : 0 1px 4px rgba(24, 28, 33, 0.012);
            }

            .row-bordered {
                overflow: hidden;
            }

            .account-settings-fileinput {
                position  : absolute;
                visibility: hidden;
                width     : 1px;
                height    : 1px;
                opacity   : 0;
            }

            .account-settings-links .list-group-item.active {
                font-weight: bold !important;
            }

            html:not(.dark-style) .account-settings-links .list-group-item.active {
                background: transparent !important;
            }

            .account-settings-multiselect~.select2-container {
                width: 100% !important;
            }

            .light-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .light-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

            .material-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .material-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

            .dark-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(255, 255, 255, 0.03) !important;
            }

            dark-style .account-settings-links .list-group-item.active {
                color: #fff !important;
            }

            .light-style .account-settings-links .list-group-item.active {
                color: #4E5155 !important;
            }

            .light-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

        </style>

    </head>

    <body>

        <%@include file= "../component/header.jsp" %>
        <div class="container light-style flex-grow-1 container-p-y">
            <form action="UpdateProfile?aid=${requestScope.up.userId}" method="post" id="formUpdate"  onsubmit=" return checkPassword()">
                <input type="hidden" name="update" id="updateField" value="">
                <h4 class="font-weight-bold py-3 mb-4">
                    My Profile
                </h4>
                <% if (request.getAttribute("updateSuccess") != null && (boolean) request.getAttribute("updateSuccess")) { %>
                <div class="alert alert-success">
                    Cập nhật thông tin thành công!
                </div>
                <% } %>

                <div class="card overflow-hidden">
                    <div class="row no-gutters row-bordered row-border-light">
                        <div class="col-md-3 pt-0">
                            <div class="list-group list-group-flush account-settings-links">
                                <a class="list-group-item list-group-item-action active" data-toggle="list"
                                   href="#account-general">My Profile</a>
                                <a class="list-group-item list-group-item-action" data-toggle="list"
                                   href="#account-change-password">Change password</a>
                                <a class="list-group-item list-group-item-action" data-toggle="list"
                                   href="#account-connections">Certificate</a>

                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="tab-content">
                                <div class="tab-pane fade active show" id="account-general">
                                    <div class="card-body media align-items-center">
                                        <img src="<%=url%>/imageStorage/user/${requestScope.up.avatar}" alt
                                             class="d-block ui-w-80">
                                        <div class="media-body ml-4">
                                            <label class="btn btn-outline-primary">
                                                Upload image
                                                <input type="file" class="account-settings-fileinput">
                                            </label> &nbsp;
                                            <button type="button" class="btn btn-default md-btn-flat">Reset</button>
                                            <div class="text-light small mt-1">${requestScope.up.fullName}</div>
                                        </div>
                                    </div>
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-label">Username</label>
                                            <input type="text" class="form-control mb-1" value="${requestScope.up.fullName}" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Phone</label>
                                            <input type="text" class="form-control" value="${requestScope.up.phone}"name="mobile">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">E-mail</label>
                                            <input type="text" class="form-control mb-1" value="${requestScope.up.email}" name="email">
                                            <!--                                    <div class="alert alert-warning mt-3">
                                                                                    Your email is not confirmed. Please check your inbox.<br>
                                                                                    <a href="javascript:void(0)">Resend confirmation</a>
                                                                                </div>-->
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Address</label>
                                            <input type="text" class="form-control" value="${requestScope.up.address}"name="address">
                                        </div>                                      
                                        <div class="form-group">
                                            <label class="labels">Gender</label>
                                            <select id="profile-gender" name="gender" class="form-control">
                                                <option value="">-Select Gender-</option>
                                                <option value="Male" 
                                                        ${requestScope.up.gender ? 'selected' : ''}>Male</option>
                                                <option value="Female" 
                                                        ${!requestScope.up.gender ? 'selected' : ''}>Female</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <div class="mt-5 text-center" style="margin-bottom: 50px">
                                            <button class="btn btn-primary profile-button" type="submit" name="update" value="profile" >Save Profile</button></div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="account-change-password">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label">Current password</label>
                                            <input type="password" class="form-control" id="current-password" name="oldpass">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input type="password" class="form-control" id="new-password" name="newpass">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Repeat new password</label>
                                            <input type="password" class="form-control" id="repeat-password" name="repass">
                                        </div>
                                        <div id="password-error" style="color: red;"></div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary"  name="update" value="pass">Change Password</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="account-connections">

                                    <section id="testimonials" >
                                        <div class="testimonials-box-container">
                                            <div class="testimonials-box" style="padding-bottom:  5px">

                                                <div class="box-top">
                                                    <a href="http://localhost:9999/ELearning/certification/certificate.jsp" target="_blank" style="text-decoration: none">
                                                        <div class="profile">

                                                            <div class="profile-img">
                                                                <img
                                                                    src="https://img.freepik.com/premium-vector/certificate-icon-with-ribbon-medal-flat-design_115464-65.jpg"
                                                                    />
                                                            </div>
                                                            <div class="name-user">
                                                                <div style="cursor: pointer">
                                                                    <strong style="color:#0066e5">Software Development Lifecycle</strong>
                                                                    <p style="color:black; margin-bottom:0px" >University of Minnesota</p>
                                                                </div>

                                                            </div>
                                                        </div>                                                        
                                                    </a>

                                                </div>
                                                <hr style="margin-bottom:5px">
                                                <div class="text-center">
                                                    <p style="color: #979797;font-size: 0.8rem; margin-bottom: 0px;display: inline-block;cursor: pointer ">Share <i class="fa-solid fa-angle-down" style="font-size:10px"></i></p>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                    <section id="testimonials" >
                                        <div class="testimonials-box-container">
                                            <div class="testimonials-box" style="padding-bottom:  5px">

                                                <div class="box-top">
                                                    <a href="http://localhost:9999/ELearning/certification/certificate.jsp" target="_blank" style="text-decoration: none">
                                                        <div class="profile">

                                                            <div class="profile-img">
                                                                <img
                                                                    src="https://img.freepik.com/premium-vector/certificate-icon-with-ribbon-medal-flat-design_115464-65.jpg"
                                                                    />
                                                            </div>
                                                            <div class="name-user">
                                                                <div style="cursor: pointer">
                                                                    <strong style="color:#0066e5">Software Development Lifecycle</strong>
                                                                    <p style="color:black; margin-bottom:0px" >University of Minnesota</p>
                                                                </div>

                                                            </div>
                                                        </div>                                                        
                                                    </a>

                                                </div>
                                                <hr style="margin-bottom:5px">
                                                <div class="text-center">
                                                    <p style="color: #979797;font-size: 0.8rem; margin-bottom: 0px;display: inline-block;cursor: pointer ">Share <i class="fa-solid fa-angle-down" style="font-size:10px"></i></p>
                                                </div>
                                            </div>
                                        </div>
                                    </section> <section id="testimonials" >
                                        <div class="testimonials-box-container">
                                            <div class="testimonials-box" style="padding-bottom:  5px">

                                                <div class="box-top">
                                                    <a href="http://localhost:9999/ELearning/certification/certificate.jsp" target="_blank" style="text-decoration: none">
                                                        <div class="profile">

                                                            <div class="profile-img">
                                                                <img
                                                                    src="https://img.freepik.com/premium-vector/certificate-icon-with-ribbon-medal-flat-design_115464-65.jpg"
                                                                    />
                                                            </div>
                                                            <div class="name-user">
                                                                <div style="cursor: pointer">
                                                                    <strong style="color:#0066e5">Software Development Lifecycle</strong>
                                                                    <p style="color:black; margin-bottom:0px" >University of Minnesota</p>
                                                                </div>

                                                            </div>
                                                        </div>                                                        
                                                    </a>

                                                </div>
                                                <hr style="margin-bottom:5px">
                                                <div class="text-center">
                                                    <p style="color: #979797;font-size: 0.8rem; margin-bottom: 0px;display: inline-block;cursor: pointer ">Share <i class="fa-solid fa-angle-down" style="font-size:10px"></i></p>
                                                </div>
                                            </div>
                                        </div>
                                    </section> <section id="testimonials" >
                                        <div class="testimonials-box-container">
                                            <div class="testimonials-box" style="padding-bottom:  5px">

                                                <div class="box-top">
                                                    <a href="http://localhost:9999/ELearning/certification/certificate.jsp" target="_blank" style="text-decoration: none">
                                                        <div class="profile">

                                                            <div class="profile-img">
                                                                <img
                                                                    src="https://img.freepik.com/premium-vector/certificate-icon-with-ribbon-medal-flat-design_115464-65.jpg"
                                                                    />
                                                            </div>
                                                            <div class="name-user">
                                                                <div style="cursor: pointer">
                                                                    <strong style="color:#0066e5">Software Development Lifecycle</strong>
                                                                    <p style="color:black; margin-bottom:0px" >University of Minnesota</p>
                                                                </div>

                                                            </div>
                                                        </div>                                                        
                                                    </a>

                                                </div>
                                                <hr style="margin-bottom:5px">
                                                <div class="text-center">
                                                    <p style="color: #979797;font-size: 0.8rem; margin-bottom: 0px;display: inline-block;cursor: pointer ">Share <i class="fa-solid fa-angle-down" style="font-size:10px"></i></p>
                                                </div>
                                            </div>
                                        </div>
                                    </section>



                                </div>           

                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>



        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var formUpdate = document.getElementById("formUpdate");
                    var saveProfileButton = document.querySelector("button[name='update'][value='profile']");
                    var changePasswordButton = document.querySelector("button[name='update'][value='pass']");
                    var currentPasswordInput = document.getElementById("current-password");
                    var newPasswordInput = document.getElementById("new-password");
                    var repeatPasswordInput = document.getElementById("repeat-password");
                    var passwordError = document.getElementById("password-error");
                    var emailInput = document.querySelector("input[name='email']");
                    var phoneInput = document.querySelector("input[name='mobile']");
                    var usernameInput = document.querySelector("input[name='name']");
                    var addressInput = document.querySelector("input[name='address']");
                    var passAcc = '<%= request.getAttribute("passAcc") %>';


                    saveProfileButton.addEventListener("click", function (event) {
                        event.preventDefault();

                        // Hỏi người dùng trước khi cập nhật hồ sơ
                        if (!confirm("Bạn có chắc muốn cập nhật hồ sơ không?")) {
                            return; // Nếu người dùng nhấn "Cancel", hàm sẽ dừng lại ở đây
                        }
                        // Check email format
                        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                        if (!emailRegex.test(emailInput.value)) {
                            alert("Please enter a valid email address.");
                            return;
                        }

                        // Check phone number format (10 digits)
                        var phoneRegex = /^\d{10}$/;
                        if (!phoneRegex.test(phoneInput.value)) {
                            alert("Phone number must be 10 digits.");
                            return;
                        }

                        // Check username and address for special characters
                        var specialCharRegex = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
                        if (specialCharRegex.test(usernameInput.value) || specialCharRegex.test(addressInput.value)) {
                            alert("Username and Address must not contain special characters.");
                            return;
                        }

                        // If all validations pass, set the update field and submit the form
                        document.getElementById("updateField").value = "profile";
                        formUpdate.submit();
                    });

                    changePasswordButton.addEventListener("click", function (event) {
                        event.preventDefault();
                        if (!confirm("Bạn có chắc muốn thay đổi mật khẩu không?")) {
                            return; // Nếu người dùng nhấn "Cancel", hàm sẽ dừng lại ở đây
                        }
                        if (currentPasswordInput.value !== passAcc) {
                            passwordError.textContent = "Current password is incorrect.";
                            return;
                        }

                        // Check if new password and repeat password match and are longer than 6 characters
                        if (newPasswordInput.value !== repeatPasswordInput.value || newPasswordInput.value.length < 6) {
                            passwordError.textContent = "New password and Repeat new password must match and be longer than 6 characters.";
                            return;
                        }

                        // If all validations pass, set the update field and submit the form
                        document.getElementById("updateField").value = "pass";
                        formUpdate.submit();
                    });
                });


        </script>



    </body>

</html>