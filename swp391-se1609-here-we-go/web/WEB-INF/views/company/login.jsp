<%-- 
    Document   : login
    Created on : Sep 25, 2022, 7:11:16 PM
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
        <link rel="stylesheet" href="<c:url value="/css/login_tc.css"/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"><link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap" rel="stylesheet">
        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
                <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>-->
        <style>
            .img-left{
                width: 45%;
                background: url("<c:url value="/images/hello-from-other-side-social-distancing_53876-97946.jpg"/>") center;
                background-size: cover;
            }
        </style>
        <title>Transportation Comp. login</title>
    </head>
    <body>
        <main>
            <div class="container">
                <div class="row px-3">
                    <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
                        <div class="img-left d-none d-md-flex"></div>

                        <div class="card-body">
                            <h4 class="title text-center mt-4">
                                Welcome Partner!
                            </h4>
                            <form class="form-box px-3">
                                <div class="form-input">
                                    <span><i class="fa fa-user-o"></i></span>
                                    <input type="text" name="phone" placeholder="Your phone" tabindex="10" required>
                                </div>
                                <div class="form-input">
                                    <span><i class="fa fa-key"></i></span>
                                    <input type="password" name="password" placeholder="Password" required>
                                </div>
                                <input type="submit" value="Login" class="sign-btn" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </body>
</html>
