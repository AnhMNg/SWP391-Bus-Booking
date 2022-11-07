<%-- 
    Document   : info
    Created on : Oct 13, 2022, 10:56:06 PM
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
        <link rel="stylesheet" href="<c:url value="/css/tc_info.css"/>">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
              integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
                integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <title>Transportation Company Profile</title>
    </head>
    <body>
        <main>
            <div class="container-fluid mt-5 px-5 py-5 header-comp">
                <div class="tc-logo-img ml-3">
                    <img src="<c:url value="/images/${sessionScope.LOGIN_COMPANY_NAME_LOGO}"/>">
                </div>
                <div class="tc-header">
                    <h1 style="text-transform: uppercase; font-weight: bold">${sessionScope.LOGIN_COMPANY_NAME}</h1>
                </div>
            </div>
            <!--General information-->
            <div class="transportation-comp-content">
                <h1 class="text-center">General Information</h1>
                <p class="line-img text-center"><img src="<c:url value="/images/Line 16.png"/>" class="line"></p>
                <p class="content">
                    ${sessionScope.LOGIN_COMPANY_NAME_DES}
                </p>
            </div>
            <!--Bus Type-->
            <div class="bus-type-comp">
                <div class="type-header">
                    <h1 class="text-center">Bus Types</h1>
                    <p class="line-img text-center"><img src="<c:url value="/images/Line 16.png"/>" class="line"></p>
                </div>
                <div class=" row col-md-12 type-bus text-center mx-0 my-0">
                    <div class=" col-md-6 part">
                        <div class="comp-img">
                            <img src="<c:url value="/images/vị-trí-số-ghế-xe-giường-nằm-1 1.png"/>">
                        </div>
                        <div class="bus-content">
                            <h4>Sleeper Bus</h4>
                        </div>
                    </div>
                    <div class="col-md-6 part">
                        <div class="comp-img">
                            <img src="<c:url value="/images/xe-khach-limousine-giuong-nam-quy-nhon 1.png"/>">
                        </div>
                        <div class="bus-content">
                            <h4>Sleeper Room Bus</h4>
                        </div>
                    </div>
                </div>
            </div>
            <!--Routes List-->
            <div class="rout-list text-center" >
                <div class="rout-img">
                    <a href="<c:url value="/company/routesList.do"/>">
                        <img src="<c:url value="/images/I3D-01 1.png"/>" alt="Routes List">
                    </a>
                </div>
                <div class="rount-content">
                    <h1 class="text-center">Routes List</h1>
                </div>
            </div>
        </main>
    </body>
</html>
