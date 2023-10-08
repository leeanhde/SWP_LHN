
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
        <title>Profile</title>
        <link rel="stylesheet" href="css/all.min.css" />
        <link rel="stylesheet" href="css/framework.css" />
        <link rel="stylesheet" href="css/master.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet" />
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
                <h1 class="p-relative">Profile of ${getUserByID.getFullName()}</h1>
                <div class="profile-page m-20">
                    <!-- Start Overview -->
                    <div class="overview bg-white rad-10 d-flex align-center">
                        <div class="avatar-box txt-c p-20">
                            <img class="rad-half mb-10" src="imgs/avatar.png" alt="" />
                            <h3 class="m-0">${getUserByID.getFullName()}</h3>
                            <p class="c-grey mt-10">${getUserByID.getRoleid().getRoleName()}</p>
                            <div class="level rad-6 bg-eee p-relative">
                                <span style="width: 70%"></span>
                            </div>
                            <div class="rating mt-10 mb-10">
                                <i class="fa-solid fa-star c-orange fs-13"></i>
                                <i class="fa-solid fa-star c-orange fs-13"></i>
                                <i class="fa-solid fa-star c-orange fs-13"></i>
                                <i class="fa-solid fa-star c-orange fs-13"></i>
                                <i class="fa-solid fa-star c-orange fs-13"></i>
                            </div>
                            <p class="c-grey m-0 fs-13">
                                <script type="text/javascript">
                                    function checkBanStatus(timeBan) {
                                        if (timeBan == null) {
                                            return '<span class="label btn-shape bg-green c-white">Active</span>';
                                        } else {
                                            var currentTime = new Date();
                                            var banTime = new Date(timeBan);
                                            if (banTime > currentTime) {
                                                return '<span class="label btn-shape bg-red c-white">Ban</span>';
                                            } else {
                                                return '<span class="label btn-shape bg-green c-white">Active</span>';
                                            }
                                        }
                                    }
                                    document.write(checkBanStatus("${getUserByID.getTimeBan()}"));
                                </script>
                            </p>
                        </div>
                        <div class="info-box w-full txt-c-mobile">
                            <!-- Start Information Row -->
                            <div class="box p-20 d-flex align-center">
                                <h4 class="c-grey fs-15 m-0 w-full">General Information</h4>
                                <div class="fs-14">
                                    <span class="c-grey">Full Name</span>
                                    <span>${getUserByID.getFullName()}</span>
                                </div>
                                <div class="fs-14">
                                    <span class="c-grey">Gender:</span>
                                    <span>
                                        ${getUserByID.getGender() ? 'Male' : 'Female'}
                                    </span>

                                </div>
                                <div class="fs-14">
                                    <span class="c-grey">Country:</span>
                                    <span><span>${getUserByID.getAddress()}</span></span>
                                </div>                                
                            </div>
                            <!-- End Information Row -->
                            <!-- Start Information Row -->
                            <div class="box p-20 d-flex align-center">
                                <h4 class="c-grey w-full fs-15 m-0">Personal Information</h4>
                                <div class="fs-14">
                                    <span class="c-grey">Email:</span>
                                    <span>${getUserByID.getEmail()}</span>
                                </div>
                                <div class="fs-14">
                                    <span class="c-grey">Phone:</span>
                                    <span>${getUserByID.getPhone()}</span>
                                </div>
                                <div class="fs-14">
                                    <span class="c-grey">Date Of Birth:</span>
                                    <span>${getUserByID.getDateOfBirth()}</span>
                                </div>

                            </div>
                            <!-- End Information Row -->
                            <!-- Start Information Row -->
                            <div class="box p-20 d-flex align-center">
                                <h4 class="c-grey w-full fs-15 m-0">Job Information</h4>
                                <div class="fs-14">
                                    <span class="c-grey">Title:</span>
                                    <span>Full Stack Developer</span>
                                </div>
                                <div class="fs-14">
                                    <span class="c-grey">Programming Language:</span>
                                    <span>Python</span>
                                </div>
                                <div class="fs-14">
                                    <span class="c-grey">Years Of Experience:</span>
                                    <span>15+</span>
                                </div>

                            </div>
                            <!-- End Information Row -->
                            <!-- Start Information Row -->

                            <form action="profile" method="post">
                                <div class="box p-20 d-flex align-center">
                                    <h4 class="c-grey w-full fs-15 m-0">Update Role of Name: ${getUserByID.getFullName()}</h4>
                                    <input value="${getUserByID.getUserId()}" name="ID" type="hidden">
                                    <div class="fs-14">
                                        <span class="c-grey" >Role:</span>
                                        <select name="userRole" value="${getUserByID.getRoleid()}">

                                            <option value="0" ${getUserByID.getRoleid().getRoleId() == 0 ? 'selected="selected"' : ''}>User</option>                                           
                                            <option value="1" ${getUserByID.getRoleid().getRoleId() == 1 ? 'selected="selected"' : ''}>Teacher</option>                                            
                                            <option value="2" ${getUserByID.getRoleid().getRoleId() == 2 ? 'selected="selected"' : ''}>Moderator</option>
                                            <option value="3" ${getUserByID.getRoleid().getRoleId() == 3 ? 'selected="selected"' : ''}>Admin</option>
                                        </select>
                                    </div>
                                    <div class="fs-14">
                                        <button class="label btn-shape bg-green c-white" type="button" onclick="confirmSave()">Save</button>
                                    </div>
                                    <script>
                                        function confirmSave() {
                                            if (confirm("Are you sure with this change?")) {

                                                document.forms[0].submit();
                                            } else {

                                            }
                                        }
                                    </script>                                    

                                </div>
                            </form>    
                            <form action="ban" method="post">
                                <div class="box p-20 d-flex align-center">
                                    <h4 class="c-grey w-full fs-15 m-0">Restrict user: ${getUserByID.getUserId()}</h4>
                                    <input value="${getUserByID.getUserId()}" name="ID" type="hidden">
                                    <div class="fs-14">
                                        <span class="c-grey" >Reason : </span>
                                        <input type="text" name="reasonBan">

                                    </div>
                                    <div class="fs-14">
                                        <span class="c-grey" >Time  : </span>
                                        <input type="text" name="timeBan">

                                    </div>
                                    <div class="fs-14">
                                        <button class="label btn-shape bg-green c-white" type="button" onclick="confirmSaveBan()">Save</button>
                                    </div>
                                    <script>
                                        function confirmSaveBan() {
                                            if (confirm("Are you sure with this change?")) {

                                                document.forms[0].submit();
                                            } else {

                                            }
                                        }
                                    </script>                                    <div class="fs-14">

                                    </div>

                                </div>
                            </form> 

                            <!-- End Information Row -->
                        </div>
                    </div>
                    <!-- End Overview -->
                    <!-- Start Other Data -->
                    <div class="other-data d-flex gap-20">                        
                        <div class="activities p-20 bg-white rad-10 mt-20">
                            <h2 class="mt-0 mb-10">Latest Activities</h2>
                            <p class="mt-0 mb-20 c-grey fs-15">Latest Activities Done By The User</p>
                            <div class="activity d-flex align-center txt-c-mobile">
                                <img src="imgs/activity-01.png" alt="" />
                                <div class="info">
                                    <span class="d-block mb-10">Store</span>
                                    <span class="c-grey">Bought The Mastering Python Course</span>
                                </div>
                                <div class="date">
                                    <span class="d-block mb-10">18:10</span>
                                    <span class="c-grey">Yesterday</span>
                                </div>
                            </div>
                            <div class="activity d-flex align-center txt-c-mobile">
                                <img src="imgs/activity-02.png" alt="" />
                                <div class="info">
                                    <span class="d-block mb-10">Academy</span>
                                    <span class="c-grey">Got The PHP Certificate</span>
                                </div>
                                <div class="date">
                                    <span class="d-block mb-10">16:05</span>
                                    <span class="c-grey">Yesterday</span>
                                </div>
                            </div>
                            <div class="activity d-flex align-center txt-c-mobile">
                                <img src="imgs/activity-03.png" alt="" />
                                <div class="info">
                                    <span class="d-block mb-10">Badges</span>
                                    <span class="c-grey">Unlocked The 10 Skills Badge</span>
                                </div>
                                <div class="date">
                                    <span class="d-block mb-10">18:05</span>
                                    <span class="c-grey">Yesterday</span>
                                </div>
                            </div>
                            <div class="activity d-flex align-center txt-c-mobile">
                                <img src="imgs/activity-01.png" alt="" />
                                <div class="info">
                                    <span class="d-block mb-10">Store</span>
                                    <span class="c-grey">Bought The Typescript Course</span>
                                </div>
                                <div class="date">
                                    <span class="d-block mb-10">12:05</span>
                                    <span class="c-grey">Yesterday</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Other Data -->
                </div>
            </div>
        </div>
    </body>
</html>
