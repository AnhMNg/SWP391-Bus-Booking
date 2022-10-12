<%-- 
    Document   : adminDashboard
    Created on : Oct 12, 2022, 9:37:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/css/style_admin.css"/>"/>
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
            />
        <title>Admin Dashboard Panel</title>
    </head>
    <body>
        <nav>
            <div class="logo-name">
                <div class="logo-image">
                    <img src="<c:url value="/images/My project.png"/>" alt="" />
                </div>

                <span class="logo_name">Here We Go</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    <li>
                        <a href="<c:url value="/admin/index.do"/>">
                            <i class="uil uil-estate"></i>
                            <span class="link-name">Admin Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/admin/notification.do"/>">
                            <i class="uil uil-bell"></i>
                            <span class="link-name">Notification</span>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/admin/userMgn.do"/>">
                            <i class="uil uil-clipboard-notes"></i>
                            <span class="link-name">User Management</span>
                        </a>
                    </li>
                    <li>
                        <a href="<c:url value="/admin/transCompPartners.do"/>">
                            <i class="uil uil-bus-alt"></i>
                            <span class="link-name">My Partners</span>
                        </a>
                    </li>
                </ul>

                <ul class="logout-mode">
                    <li>
                        <a href="<c:url value="/user/logout.do"/>">
                            <i class="uil uil-signout"></i>
                            <span class="link-name">Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <section class="dashboard">
            <div class="top">
                <i class="uil uil-bars sidebar-toggle"></i>

                <div class="search-box">
                    <i class="uil uil-search"></i>
                    <input type="text" placeholder="Search here..." />
                </div>

                <img src="images/profile1.png" alt="" />
            </div>

            <div class="dash-content">
                <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>
            </div>
        </section>

        <script src="<c:url value="/js/script_ad.js"/>"></script>
    </body>
</html>
