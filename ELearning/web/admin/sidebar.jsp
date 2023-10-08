<%-- 
    Document   : sidebar
    Created on : Sep 22, 2023, 3:34:27 PM
    Author     : KinNhun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- sidebar start -->
        <div class="sidebar bg-white p-20 p-relative">
            <h3 class="p-relative txt-c mt-0"><a href="<%=url%>/">Admin</a></h3>
            <ul>
                <li>
                    <a class="active d-flex align-center fs-14 c-black rad-6 p-10" href="dashboard">
                        <i class="fa-regular fa-chart-bar fa-fw"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a class="d-flex align-center fs-14 c-black rad-6 p-10" href="user">
                        <i class="fa-regular fa-user fa-fw"></i>
                        <span>User management</span>
                    </a>
                </li>
                <li>
                    <a class="d-flex align-center fs-14 c-black rad-6 p-10" href="courses.html">
                        <i class="fa-solid fa-graduation-cap fa-fw"></i>
                        <span>Course management</span>
                    </a>
                </li>

                <li>
                    <a class="d-flex align-center fs-14 c-black rad-6 p-10" href="projects.html">
                        <i class="fa-solid fa-diagram-project fa-fw"></i>
                        <span>Projects</span>
                    </a>
                </li>

                <li>
                    <a class="d-flex align-center fs-14 c-black rad-6 p-10" href="friends.html">
                        <i class="fa-regular fa-circle-user fa-fw"></i>
                        <span>Friends</span>
                    </a>
                </li>
                <li>
                    <a class="d-flex align-center fs-14 c-black rad-6 p-10" href="files.html">
                        <i class="fa-regular fa-file fa-fw"></i>
                        <span>Files</span>
                    </a>
                </li>
               
            </ul>
        </div>
        <!-- end sidebar -->
    </body>