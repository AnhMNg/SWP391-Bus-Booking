<%-- 
    Document   : changePass
    Created on : Nov 4, 2022, 7:56:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/forgot_pass.css"/>">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    </head>
    <body>
        <main>
            <div class="container">
                <div class="row px-3">
                    <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">

                        <div class="card-body">
                            <h4 class="title text-center mt-4">
                                Change your password!
                            </h4>
                            <form action="<c:url value="/user/reset.do"/>" class="form-box px-3">
                                <div class="form-input">
                                    <span><i class="fa fa-key"></i></span>
                                    <input type="password" name="resetPass" value="${resetPass}" placeholder="New password" tabindex="10" required>
                                </div>
                                <div class="form-input">
                                    <span><i class="fa fa-key"></i></span>
                                    <input type="password" name="confirmRPass" value="${confirmRPass}" placeholder="Confirm new password" tabindex="10" required>
                                </div>
                                <i style="color: red;">${message}</i>
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-block" style="margin-top: 20px;">
                                        Reset
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
