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
        <div class="overview">
            <div class="title">
                <i class="uil uil-tachometer-fast-alt"></i>
                <span class="text">Admin Dashboard</span>
            </div>

            <div class="boxes">
                <div class="box box1">
                    <i class="uil uil-user"></i>
                    <span class="text">Customers</span>
                    <span class="number">50,120</span>
                </div>
                <div class="box box2">
                    <i class="uil uil-ticket"></i>
                    <span class="text">Tickets Sold</span>
                    <span class="number">20,120</span>
                </div>
                <div class="box box3">
                    <i class="uil uil-share"></i>
                    <span class="text">TC Partners</span>
                    <span class="number">10</span>
                </div>
            </div>
        </div>

        <div class="activity">
            <div class="title">
                <i class="uil uil-clock-three"></i>
                <span class="text">Recent Activity</span>
            </div>

            <table class="table table-responsive-sm table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone Number</th>
                        <th>Joined</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Nguyen Bao Long</td>
                        <td>089345768</td>
                        <td>25/09/2022</td>
                        <td>Memeber</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Do Hoang Huy</td>
                        <td>085634988</td>
                        <td>25/09/2022</td>
                        <td>Memeber</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Jane Le</td>
                        <td>083992343</td>
                        <td>01/10/2022</td>
                        <td>New</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
