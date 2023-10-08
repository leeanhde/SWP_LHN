


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
        <title>Settings</title>
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
                <h1 class="p-relative">User Management</h1>


                <!-- Start Projects Table -->
                <div class="projects p-20 bg-white rad-10 m-20">

                    <div class="head bg-white p-15 between-flex">
                        <h2 class="mt-0 mb-20">Users</h2>
                        <form action="user" method="post">
                            <div class="search p-relative" type="submit">

                                <input class="p-10" type="search" name="txtSearch" placeholder="Type A Keyword" />

                            </div>     
                        </form>
                    </div>
                    <div class="responsive-table">
                        <table class="fs-14 w-full ">
                            <thead>
                                <tr>
                                    <td class="w-10">User ID</td>
                                    <td>User Name</td>
                                    <td>Email</td>
                                    <td>Access</td>                                    
                                    <td>Role</td>                                    
                                    <td>Reason</td>
                                    <td>Time Ban</td>
                                    <td>Action</td>



                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listUsers}" var="user">
                                    <tr>
                                        <td>${user.getUserId()}</td>
                                        <td>${user.getFullName()}</td>
                                        <td>${user.getEmail()}</td>
                                        <td>
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
                                                document.write(checkBanStatus("${user.getTimeBan()}"));
                                            </script>
                                        </td>
                                        <td>${user.getRoleid().getRoleName()}</td>
                                        <td>${user.getReason()}</td>
                                        <td>${user.getTimeBan()}</td>
                                        <td>                                         
                                            <a class="fa-regular fa-edit delete" style="cursor: pointer; color: black;" onmouseover="this.style.color = 'red'" onmouseout="this.style.color = 'black'" onclick="confirmEdit(${user.getUserId()})"></a>
                                        </td>

                                <script>
                                    function confirmEdit(userId) {
                                        if (confirm("Are you sure you want to edit?")) {
                                            window.location.href = "profile?userID=" + userId;
                                        } else {
                                            // Người dùng đã chọn "Cancel" trong hộp thoại
                                        }
                                    }
                                </script>


                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- End Projects Table -->
                <c:forEach begin="1" end="${endPage}" var="i">
                    <div>
                        <a href="#">${i}</a>
                    </div>                    
                </c:forEach>

            </div>
        </div>
    </body> 
</html>
