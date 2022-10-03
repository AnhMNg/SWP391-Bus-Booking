<%-- 
    Document   : index
    Created on : Sep 29, 2022, 6:49:01 PM
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
        <link rel="stylesheet" href="<c:url value="/css/style_ad.css"/>">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".profile .icon_wrap").click(function () {
                    $(this).parent().toggleClass("active");
                    $(".notifications").removeClass("active");
                });

                $(".notifications .icon_wrap").click(function () {
                    $(this).parent().toggleClass("active");
                    $(".profile").removeClass("active");
                });

                $(".show_all .link").click(function () {
                    $(".notifications").removeClass("active");
                    $(".popup").show();
                });

                $(".close").click(function () {
                    $(".popup").hide();
                });
            });
        </script>
        <title>Admin Page</title>
    </head>
    <body>
        <div class="ad">
            <div class="wrapper">
                <div class="navbar">
                    <div class="navbar_left">
                        <div class="hl-ad">
                            <h1>Hello Administrator</h1>
                        </div>
                    </div>

                    <div class="navbar_right">
                        <div class="notifications">
                            <div class="icon_wrap"><i class="far fa-bell"></i></div>

                            <div class="notification_dd">
                                <ul class="notification_ul">
                                    <li class="user success">
                                        <div class="notify_icon">
                                            <span class="icon"></span>  
                                        </div>
                                        <div class="notify_data">
                                            <div class="title">
                                                User ID 1 
                                            </div>
                                            <div class="sub_title">
                                                has changed password
                                            </div>
                                        </div>
                                        <div class="notify_status">
                                            <p>Success</p>  
                                        </div>
                                    </li>  
                                    <li class="user failed">
                                        <div class="notify_icon">
                                            <span class="icon"></span>  
                                        </div>
                                        <div class="notify_data">
                                            <div class="title">
                                                User ID 2 
                                            </div>
                                            <div class="sub_title">
                                                has changed password
                                            </div>
                                        </div>
                                        <div class="notify_status">
                                            <p>Failed</p>  
                                        </div>
                                    </li> 
                                    <li class="show_all">
                                        <p class="link">Show All Activities</p>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="popup">
                    <div class="shadow"></div>
                    <div class="inner_popup">
                        <div class="notification_dd">
                            <ul class="notification_ul">
                                <li class="title">
                                    <p>All Notifications</p>
                                    <p class="close"><i class="fas fa-times" aria-hidden="true"></i></p>
                                </li> 
                                <li class="user success">
                                    <div class="notify_icon">
                                        <span class="icon"></span>  
                                    </div>
                                    <div class="notify_data">
                                        <div class="title">
                                            User ID 1 
                                        </div>
                                        <div class="sub_title">
                                            has changed password
                                        </div>
                                    </div>
                                    <div class="notify_status">
                                        <p>Success</p>  
                                    </div>
                                </li>  
                                <li class="user failed">
                                    <div class="notify_icon">
                                        <span class="icon"></span>  
                                    </div>
                                    <div class="notify_data">
                                        <div class="title">
                                            User ID 2 
                                        </div>
                                        <div class="sub_title">
                                            has changed password
                                        </div>
                                    </div>
                                    <div class="notify_status">
                                        <p>Failed</p>  
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
            <div class="search-box" style="top: 250px; left: 160px;">
                <input class="search-txt" type="text" name="" placeholder="Type to search">
                <a class="search-btn1" href="#">
                    <i class="fa fa-search"></i>
                </a>
            </div>

            <section class="cs-list">         
                <div class="container cs-list-dt">
                    <table class="table table-responsive-sm table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer's Name</th>
                                <th>Account Creation Date</th>
                                <th>Number Of Tickets Purchased</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Do Hoang Huy</td>
                                <td>24/09/2022</td>
                                <td>2</td>
                                <td><button class="btn btn-outline-primary">MANAGE</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <a href="<c:url value="/user/login.do"/>">test</a>
        </div>
    </body>
</html>
