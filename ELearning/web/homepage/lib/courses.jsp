<%-- 
    Document   : courses
    Created on : Sep 13, 2023, 1:14:53 AM
    Author     : NhatAnh
--%>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>eLEARNING - eLearning HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="<%=url%>/homepage/lib/animate/animate.min.css" rel="stylesheet">

        <link href="<%=url%>/homepage/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="<%=url%>/homepage/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="<%=url%>/homepage/css/style.css" rel="stylesheet">
        <style>
            .navbar-search-wrap {
                position: relative;
            }
            .navbar-search-icon {
                position: absolute;
                left: 8px;
                top: 8px;
                cursor: pointer;
            }
            .navbar-search-wrap input {
                border: 1px solid #06bbcc;
                border-radius: 8px;
                padding: 8px 16px 8px 32px;
                min-width: 360px;
            }
            .navbar-search-wrap input::placeholder {
                color: #06bbcc;
            }
            .navbar-search-wrap input:focus {
                outline: #06bbcc;
                color: #06bbcc;
            }
            @media all and (max-width: 991px) {
                .navbar-search-wrap {
                    display: none !important;
                }
            }

            .main {
                background: #f5f7f8;
            }

            .custom-checkbox {
                transform: scale(1.5); /* Adjust the scale factor to change the size */
                margin: 0 1rem;
            }

            /* Change the color of the checkmark to blue-white */
            .custom-checkbox + label::before {
                border: 2px solid #007bff; /* Blue border for the checkbox */
                background-color: #fff; /* White background for the checkbox */
            }

            .card-container {
                background: #fff;
                border: 1px solid lightgrey;
                border-radius: 8px;
                width: 30.33333% !important;
                margin: 10px 5px;
                cursor: pointer;
            }

            .card-container:hover {
                transform: scale(1.05);
                box-shadow: 0 0 11px rgba(33,33,33,.2);
                transition-duration: 0.5s;
            }

            .card-img {
                aspect-ratio: 16/9;
                margin-bottom: 8px;
                overflow: hidden;
                border-bottom-right-radius: 8px !important;
                border-bottom-left-radius: 8px !important;
            }

            img {
                margin-top: 8px;
                border-radius: 8px; /* Apply border-radius to all corners of the image */
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .card-icon-container {
                align-items: center;
                gap: 4px;
                margin: 1rem 0;
            }

            .card-icon {
                width: 24px;
                height: 24px;
                border: 1px solid lightgray;
                padding: 2px;
                user-select: none;
                box-sizing: content-box;
            }

            .text-eclipse-1 {
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .text-eclipse-3 {
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                overflow: hidden;
            }

            .card-bottom {
                display: flex;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
                gap: 4px;
                -webkit-flex: 1;
                -ms-flex: 1;
                flex: 1;
                -webkit-box-pack: end;
                -ms-flex-pack: end;
                -webkit-justify-content: end;
                justify-content: end;
                padding: 1rem 0;
            }

            .card-bottom-review {
                align-items: initial;
                margin-bottom: 4px;
            }

            .description-text{
                font-size: 13px
            }
            
            a {
                text-decoration: none !important;
                color: black !important;
            }
            
            a:hover{
                color: none !important;
            }
        </style>
    </head>
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Header start-->
        <%@include file= "../component/header.jsp" %>
        <!-- Header End -->



        <!-- Header Start -->
        <div class="container-fluid bg-primary py-5 mb-5 page-header">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1 class="display-3 text-white animated slideInDown">Courses</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                                <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Courses</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->

        <!-- main start -->
        <div class="main">
            <div class="container d-flex col-12">
                <div class="col-3" style="padding-right: 16px">
                    <h4 class="mt-3">Filter by</h4>
                    <div class="m-3">
                        <input type="checkbox" class="custom-checkbox" />
                        <span>Credit Eligible</span>
                    </div>
                    <h5>Subject</h5>
                    <div class="m-3">
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Arts and Humanities</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Business</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Computer Science</span><br/>
                        <input type="checkbox" class="custom-checkbox"/>
                        <span>Data Science</span><br/>
                    </div>
                    <h5>Skills</h5>
                    <div class="m-3">
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Account Management</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Accounting</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Accounts Payable and Receivable</span><br/>
                        <input type="checkbox" class="custom-checkbox"/>
                        <span>Adaptability</span><br/>
                    </div>
                    <h5>Level</h5>
                    <div class="m-3">
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Beginner</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Intermediate</span><br/>
                        <input type="checkbox" class="custom-checkbox"/>
                        <span>Advanced</span><br/>
                    </div>
                    <h5>Duration</h5>
                    <div class="m-3">
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>1-3 Months</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>3-6 Months</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>6-12 Months</span><br/>
                        <input type="checkbox" class="custom-checkbox"/>
                        <span>1-4 Years</span><br/>
                    </div>
                    <h5>Learning Product</h5>
                    <div class="m-3">
                        <div class="d-flex align-items-baseline">
                            <input type="checkbox" class="custom-checkbox "/>
                            <span><strong>Specializations </strong><br/>
                                <span style="font-family: emoji">Get in-depth knowledge of a subject by completing a series of courses and projects.
                                </span>                                   
                            </span><br/>                  
                        </div>
                        <div class="d-flex align-items-baseline">
                            <input type="checkbox" class="custom-checkbox "/>
                            <span><strong>Professional Certificates </strong><br/>
                                <span style="font-family: emoji">Earn career credentials from industry leaders that demonstrate your expertise.
                                </span>                                   
                            </span><br/>                  
                        </div>
                        <div class="d-flex align-items-baseline">
                            <input type="checkbox" class="custom-checkbox "/>
                            <span><strong>MasterTrack® Certificates </strong><br/>
                                <span style="font-family: emoji">Earn career credentials while taking courses that count towards your Master’s degree.
                                </span>                                   
                            </span><br/>                  
                        </div>
                        <div class="d-flex align-items-baseline">
                            <input type="checkbox" class="custom-checkbox "/>
                            <span><strong>Degrees </strong><br/>
                                <span style="font-family: emoji">Earn your Bachelor’s or Master’s degree online for a fraction of the cost of in-person learning.
                                </span>                                   
                            </span><br/>                  
                        </div>
                        <div class="d-flex align-items-baseline">
                            <input type="checkbox" class="custom-checkbox "/>
                            <span><strong>Graduate Certificates </strong><br/>
                                <span style="font-family: emoji">Earn a university-issued career credential in a flexible, interactive format.
                                </span>                                   
                            </span><br/>                  
                        </div>
                    </div>
                    <h5>Educator</h5>
                    <div class="m-3">
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Advancing Women in Tech</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Ball State University</span><br/>
                        <input type="checkbox" class="custom-checkbox "/>
                        <span>Birla Institute of Technology and Science, Pilani</span><br/>
                        <input type="checkbox" class="custom-checkbox"/>
                        <span>BITS Pilani</span><br/>
                    </div>
                </div>
                <div class="col-10">
                    <h4 class="mt-3">12,419 results for "a"</h4>
                    <div class="row col-12">
                        <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                         <a href="#" class="card-container col-4">
                            <div class="card-img">
                                <img src="https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/bd/69fc60bd454b1485955c680232bd95/082421_Karrim0066-1.png?auto=format%2Ccompress%2C%20enhance&dpr=2&w=265&h=216&fit=crop&q=50" alt="logo"/>
                            </div>
                            <div class="d-flex card-icon-container">
                                <div class="card-icon">
                                    <img style="margin-top: 0" alt="google_logo" src="http://coursera-university-assets.s3.amazonaws.com/4a/cb36835ae3421187080898a7ecc11d/Google-G_360x360.png"/>
                                </div>
                                <p style=" margin: 0 0 0 4px">Google</p>
                            </div>
                            <p style="font-weight: 500" class="text-eclipse-1">Google Data Analytics</p>
                            <div class="text-eclipse-3">
                                <span class="description-text"><b>Skills you'll gain: </b>
                                    Data Analysis, SQL, Spreadsheet Software, Data Visualization, R Programming, Statistical Visualization, Business Analysis, Business Communication, Communication, Data Management, Data Structures, Tableau Software, Big Data, Cloud Computing, General Statistics, Leadership and Management, Plot (Graphics), Small Data, Algorithms, Application Development, Budget Management, Computational Logic, Computer Architecture, Computer Networking, Computer Programming, Computer Programming Tools, Conflict Management, Cryptography, Data Analysis Software, Data Mining, Data Model, Data Science, Data Visualization Software, Data Warehousing, Database Administration, Database Application, Database Design, Databases, Decision Making, Design and Product, Distributed Computing Architecture, Entrepreneurship, Exploratory Data Analysis, Extract, Transform, Load, Feature Engineering, Finance, Full-Stack Web Development, Interactive Data Visualization, Machine Learning, Mathematical Theory & Analysis, Mathematics, Microsoft Excel, Network Security, Other Programming Languages, Probability & Statistics, Problem Solving, Product Design, Professional Development, Programming Principles, Project Management, Research and Design, Security Engineering, Security Strategy, Software Engineering, Software Security, Statistical Analysis, Statistical Programming, Storytelling, Theoretical Computer Science, Visual Design, Visualization (Computer Graphics), Web Development
                                </span>
                            </div>
                            <div class="card-bottom">
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="16" viewBox="0 0 16 16" width="16" class="css-us1a98" id="cds-react-aria-7">
                                    <path d="M13.63 6.32h-4L8.3 2.22a.33.33 0 00-.547-.143.35.35 0 00-.083.123L6.32 6.32h-4a.34.34 0 00-.32.32.36.36 0 00.12.27L5.5 9.49l-1.3 4.08a.33.33 0 00.23.41.358.358 0 00.3-.05L8 11.39l3.28 2.54a.33.33 0 00.46 0 .3.3 0 00.06-.31l-1.31-4.13 3.37-2.58a.32.32 0 00.08-.45.34.34 0 00-.136-.112c-.055-.024-.063-.034-.123-.028h-.051z" fill="#F2D049"></path>
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M7.723 1.525a.83.83 0 011.054.546L9.993 5.82h3.668a.635.635 0 01.317.058l.02.01.012.005a.84.84 0 01.336.275l.001.002a.82.82 0 01-.191 1.143l-3.083 2.36 1.2 3.786a.8.8 0 01-.166.81l-.009.01-.01.01a.83.83 0 01-1.131.023L8 12.022l-2.975 2.312-.012.008a.86.86 0 01-1.007-.026.832.832 0 01-.286-.885l.003-.013 1.194-3.744L1.8 7.296l-.014-.013a.86.86 0 01-.287-.645V6.61a.84.84 0 01.791-.79l.015-.001h3.652L7.2 2.029l.006-.016a.85.85 0 01.51-.485l.007-.003zM4.298 14.462h-.002l.134-.482-.132.482zM7.98 2.857L6.682 6.82H2.826l3.257 2.486-1.244 3.907 3.16-2.456 3.14 2.431-1.232-3.882 3.248-2.486H9.267L7.98 2.857zm5.75 3.96z" fill="#7C6919"></path>
                                    </svg>
                                    <p class="mx-1 mb-0"><b>4.8</b></p>
                                    <p class=" mb-0">(127k reviews)</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <svg aria-hidden="true" fill="none" focusable="false" height="20" viewBox="0 0 20 20" width="20" id="cds-react-aria-8" class="css-pvulhp"><path fill-rule="evenodd" clip-rule="evenodd" d="M.5 2.5h19.05v15H.5v-15zm1 1v13h17.05v-13H1.5z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.61 10.59h1v2.593l.89-.454.89.454V10.59h1v4.227l-1.89-.966-1.89.966V10.59z" fill="currentColor"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13.5 6.51a2 2 0 100 4 2 2 0 000-4zm-3 2a3 3 0 116 0 3 3 0 01-6 0z" fill="currentColor"></path></svg>
                                    <p class="mx-2 description-text mb-0">Credit Eligible</p>
                                </div>
                                <div class="card-bottom-review d-flex">
                                    <p class="description-text mb-0">Beginner · Professional Certificate · 3 - 6 Months</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- main end --> 

        <!-- Footer Start -->
        <%@include file= "../component/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=url%>/homepage/lib/wow/wow.min.js"></script>
        <script src="<%=url%>/homepage/lib/easing/easing.min.js"></script>
        <script src="<%=url%>/homepage/lib/waypoints/waypoints.min.js"></script>
        <script src="<%=url%>/homepage/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="<%=url%>/homepage/js/main.js"></script>
    </body>
</html>
