<%-- 
    Document   : main
    Created on : Sep 22, 2022, 9:49:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"><link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap" rel="stylesheet">
        <title>Here We Go</title>
    </head>
    <body>
        <div class="hd">
            <section class="header">
                <!-- Menu -->
                <nav>
                    <!-- Logo -->
                    <a href="<c:url value="/home/index.do"/>">
                        <img src="<c:url value="/images/Logo1.png"/>" class="logo">
                    </a>
                    <!-- NavBar -->
                    <div class="nav-links" id="navLinks">
                        <i class="fa fa-times" onclick="hideMenu()"></i>
                        <ul>
                            <li class="mb">
                                <a class="mb-text" href="/">MY BOOKING</a>
                            </li>
                            <c:if test="${sessionScope.LOGIN_CUSTOMER == null}">
                                <li>
                                    <!-- <a href="">LOGIN OR CREATE ACCOUNT</a> -->   
                                    <div class="dropdown">
                                        <button class="button1">LOGIN OR CREATE ACCOUNT</button>
                                        <div class="dropdown-content">
                                            <a class="choose" href="<c:url value="/user/login.do"/>">Personal Account</a>
                                            <a class="choose" href="<c:url value="/company/login.do"/>">Transportation Company</a>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_CUSTOMER != null}">
                                <li>
                                    <div class="dropdown">
                                        <button class="button1">Hello ${sessionScope.LOGIN_CUSTOMER_NAME}</button>
                                        <div class="dropdown-content">
                                            <a class="choose" href="<c:url value="/"/>">My Profile</a>
                                            <a class="choose" href="<c:url value="/user/logout.do"/>">Log Out</a>
                                        </div>
                                    </div>
                                </li>
                            </c:if>

                            <li>
                                <div>
                                    <select class="form-select">
                                        <option>English</option>
                                        <option>Vietnamese</option>                                      
                                    </select>
                                </div>
                            </li>
                        </ul>

                    </div>
                    <i class="fa fa-bars" onclick="showMenu()"></i>
                </nav>
                <!-- Content -->
            </section>
        </div>
        <!-- Header -->

        <div class="ct">
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>
        </div>

        <div class="ft">
            <footer class="footer">
                <div class="footer__addr">
                    <img class="footer__logo" src="<c:url value="/images/My project.png"/>" alt="">
                </div>

                <ul class="footer__nav">
                    <li class="nav__item">
                        <h2 class="nav__title">About Us</h2>

                        <ul class="nav__ul">
                            <li>
                                <a href="#">Contact Us</a>
                            </li>

                            <li>
                                <a href="#">Help Center</a>
                            </li>

                            <li>
                                <a href="#">Here We Go!</a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav__item">
                        <h2 class="nav__title">Products</h2>

                        <ul class="nav__ul">
                            <li>
                                <a href="#">Bus Tickets</a>
                            </li>

                            <li>
                                <a href="#">Bus Operator</a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav__item">
                        <h2 class="nav__title">About Us</h2>
                        <div class="social">
                            <ul class="nav__ul">
                                <li>
                                    <a href="#">
                                        <img src="<c:url value="/images/Facebook - Negative.png"/>" alt="">                                       
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <img src="<c:url value="/images/Twitter - Negative.png"/>" alt="">
                                    </a>
                                </li>

                            </ul>
                        </div>

                    </li>
                </ul>

                <div class="legal">
                    <p>Copyright &copy; 2022 Here We Go Co.</p>
                </div>
            </footer>
        </div>


        <script src="<c:url value="/js/script.js"/>"></script>

        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    </body>
</html>
