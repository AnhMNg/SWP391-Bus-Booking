<%-- 
    Document   : notification
    Created on : Oct 12, 2022, 8:46:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
        <title>Admin Notification Panel</title>
    </head>
    <body>
        <div class="overview">
            <div class="title">
                <i class="uil uil-bell"></i>
                <span class="text">Notification</span>
            </div>
        </div>

        <div class="activity">
            <!-- Hoverable Table rows -->
            <div class="card">
                <form action="">
                    <div class="card-header">
                        <label for="sel1" class="form-label">Sorting by</label>
                        <select
                            class="btn btn-outline-light text-dark"
                            id="sel1"
                            name="sellist1"
                            >
                            <option>Day</option>
                            <option>Week</option>
                            <option>Month</option>
                            <option>Year</option>
                        </select>
                        <select
                            class="btn btn-outline-light text-dark"
                            id="sel1"
                            name="sellist1"
                            >
                            <option>Latest</option>
                            <option>Oldest</option>
                        </select>
                    </div>
                    <div class="list-group">
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <div class="col-md-6">
                                <ul class="d-flex list-unstyled nt-ct">
                                    <li class="logo-image">
                                        <img src="Images/profile1.png" alt="Avatar"/>
                                    </li>
                                    <li>User 23 has changed password</li>
                                </ul>
                            </div>
                            <div class="col-md-6 nt-ct-time">
                                <p>23:13 02/10/2022</p>
                            </div>                
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <div class="col-md-6">
                                <ul class="d-flex list-unstyled nt-ct">
                                    <li class="logo-image">
                                        <img src="Images/profile1.png" alt="Avatar"/>
                                    </li>
                                    <li>User 200 has created a new account</li>
                                </ul>
                            </div>
                            <div class="col-md-6 nt-ct-time">
                                <p>23:13 02/10/2022</p>
                            </div>                
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <div class="col-md-6">
                                <ul class="d-flex list-unstyled nt-ct">
                                    <li class="logo-image">
                                        <img src="Images/profile1.png" alt="Avatar"/>
                                    </li>
                                    <li>User 25 has changed password</li>
                                </ul>
                            </div>
                            <div class="col-md-6 nt-ct-time">
                                <p>23:13 02/10/2022</p>
                            </div>                
                        </div>
                    </div>
                </form>

            </div>
            <!--/ Hoverable Table rows -->
        </div>
    </body>
</html>
