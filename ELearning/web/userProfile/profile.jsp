
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="<%=url%>/asset/CSS/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="../asset/CSS/avatar.css"/>
        <style>

            #testimonials {
                display: flex;
                justify-self: center;
                align-items: center;
                flex-direction: column;
                width: 100%;
            }


            .testimonials-box-container {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
                width: 100%;
            }
            .testimonials-box {
                width: 95%;
                box-shadow: 2px 2px 30px rgba(0, 0, 0, 0.2);
                background-color: #ffffff;
                padding: 10px;
                margin: 10px;
            }
            .profile-img {
                width: 100px;
                height: 100px;
                overflow: hidden;
                margin-right: 20px;
                margin-top: 5px;
                margin-left: 5px;

            }
            .profile-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
                cursor: pointer;
            }
            .profile {
                display: flex;
                align-self: center;
            }
            .profile strong:hover{
                text-decoration: underline;
            }
            .name-user {
                display: flex;
                flex-direction: column;
                margin-top: 1rem;
            }
            .name-user strong {
                color: #3d3d3d;
                font-size: 1.1rem;
                letter-spacing: 0.5px;
            }
            .name-user span {
                color: #979797;
                font-size: 0.8rem;
            }
            .review {
                color: #f9d81c;
            }
            .box-top {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .client-comment {
                font-size: 0.9rem;
                color: #4b4b4b;
            }

        </style>
    </head>
    <body >
        <%@include file= "../component/header.jsp" %>

        <div class="container light-style flex-grow-1 container-p-y mt-5" style=" box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);">
            <h4 class="font-weight-bold py-3 mb-4">
                Profile Settings
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0" >
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-general">General</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-change-password">Change password</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-info">Info</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-social-links">Course</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-connections">Certificate</a>

                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-notifications">Notifications</a>
                        </div>
                    </div>
                    <div class="col-md-9" style="max-height: 570px; overflow-y: scroll">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-general">
                                <div class="card-body media align-items-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt
                                         class="d-block ui-w-80">
                                    <div class="media-body ml-4">
                                        <label class="btn btn-outline-primary">
                                            Upload new photo
                                            <input type="file" class="account-settings-fileinput">
                                        </label> &nbsp;
                                        <button type="button" class="btn btn-default md-btn-flat">Reset</button>
                                        <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label class="form-label">Username</label>
                                        <input type="text" class="form-control mb-1" value="nmaxwell">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Name</label>
                                        <input type="text" class="form-control" value="Nelle Maxwell">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">E-mail</label>
                                        <input type="text" class="form-control mb-1" value="nmaxwell@mail.com">
                                        <div class="alert alert-warning mt-3">
                                            Your email is not confirmed. Please check your inbox.<br>
                                            <a href="javascript:void(0)">Resend confirmation</a>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Company</label>
                                        <input type="text" class="form-control" value="Company Ltd.">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-change-password">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Current password</label>
                                        <input type="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">New password</label>
                                        <input type="password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Repeat new password</label>
                                        <input type="password" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-info">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Bio</label>
                                        <textarea class="form-control"
                                                  rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Birthday</label>
                                        <input type="text" class="form-control" value="May 3, 1995">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Country</label>
                                        <select class="custom-select">
                                            <option>USA</option>
                                            <option selected>Canada</option>
                                            <option>UK</option>
                                            <option>Germany</option>
                                            <option>France</option>
                                        </select>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Contacts</h6>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" class="form-control" value="+0 (123) 456 7891">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Website</label>
                                        <input type="text" class="form-control" value>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-social-links">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Twitter</label>
                                        <input type="text" class="form-control" value="https://twitter.com/user">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Facebook</label>
                                        <input type="text" class="form-control" value="https://www.facebook.com/user">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Google+</label>
                                        <input type="text" class="form-control" value>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">LinkedIn</label>
                                        <input type="text" class="form-control" value>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Instagram</label>
                                        <input type="text" class="form-control" value="https://www.instagram.com/user">
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
                            <div class="tab-pane fade" id="account-notifications">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Activity</h6>
                                    <div class="form-group">
                                        <label class="switcher">
                                            <input type="checkbox" class="switcher-input" checked>
                                            <span class="switcher-indicator">
                                                <span class="switcher-yes"></span>
                                                <span class="switcher-no"></span>
                                            </span>
                                            <span class="switcher-label">Email me when someone comments on my article</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="switcher">
                                            <input type="checkbox" class="switcher-input" checked>
                                            <span class="switcher-indicator">
                                                <span class="switcher-yes"></span>
                                                <span class="switcher-no"></span>
                                            </span>
                                            <span class="switcher-label">Email me when someone answers on my forum
                                                thread</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="switcher">
                                            <input type="checkbox" class="switcher-input">
                                            <span class="switcher-indicator">
                                                <span class="switcher-yes"></span>
                                                <span class="switcher-no"></span>
                                            </span>
                                            <span class="switcher-label">Email me when someone follows me</span>
                                        </label>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Application</h6>
                                    <div class="form-group">
                                        <label class="switcher">
                                            <input type="checkbox" class="switcher-input" checked>
                                            <span class="switcher-indicator">
                                                <span class="switcher-yes"></span>
                                                <span class="switcher-no"></span>
                                            </span>
                                            <span class="switcher-label">News and announcements</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="switcher">
                                            <input type="checkbox" class="switcher-input">
                                            <span class="switcher-indicator">
                                                <span class="switcher-yes"></span>
                                                <span class="switcher-no"></span>
                                            </span>
                                            <span class="switcher-label">Weekly product updates</span>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="switcher">
                                            <input type="checkbox" class="switcher-input" checked>
                                            <span class="switcher-indicator">
                                                <span class="switcher-yes"></span>
                                                <span class="switcher-no"></span>
                                            </span>
                                            <span class="switcher-label">Weekly blog digest</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-right mt-3 mb-4" style="margin-bottom: 20px">
                <button type="button" class="btn btn-primary mb-4">Save changes</button>&nbsp;
                <button type="button" class="btn btn-default  mb-4">Cancel</button>
            </div>
        </div>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>


    </body>

</html>
