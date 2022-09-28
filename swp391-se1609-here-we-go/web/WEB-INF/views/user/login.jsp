<%-- 
    Document   : login
    Created on : Sep 25, 2022, 2:46:26 PM
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
        <link rel="stylesheet" href="<c:url value="/css/login.css"/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"><link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap" rel="stylesheet">
        <title>Login & Register Page</title>
    </head>
    <body>
        <main>
            <div class="box">
                <div class="inner-box">
                    <div class="forms-wrap">
                        <form action="<c:url value="/user/submit.do"/>" autocomplete="off" class="sign-in-form" method="POST">

                            <div class="heading">
                                <h2>Welcome Back</h2>
                                <h6>Not register yet?</h6>
                                <a href="#" class="toggle">Sign up</a>
                            </div>

                            <div class="actual-form">
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        name="phone"
                                        />
                                    <label>Phone Number</label>
                                </div>

                                <div class="input-wrap">
                                    <input
                                        type="password"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        name="password"
                                        />
                                    <label>Password</label>
                                </div>

                                <input type="submit" value="Booking Now" class="sign-btn" />
                                <i style="color: red">${message}</i>
                                <p class="forgot-pass">Forgot Password ?</p>

                                <div class="social-media">
                                    <p>Or Login With</p>
                                    <ul>
                                        <img class="google-img" src="<c:url value="/images/Google - Original.png"/>">
                                    </ul>
                                </div>
                            </div>
                        </form>

                        <form action="<c:url value="/user/save.do"/>" autocomplete="off" class="sign-up-form" method="POST">

                            <div class="heading">
                                <h2>Join  Here We Go Member</h2>
                                <h6>Already have an account?</h6>
                                <a href="#" class="toggle">Sign in</a>
                            </div>

                            <div class="actual-form2">
                                <div class="input-wrap">
                                    <input
                                        type="text"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        name="name"
                                        />
                                    <label>Name</label>
                                </div>

                                <div class="input-wrap">
                                    <input
                                        type="phone"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        name="phone"
                                        />
                                    <label>Phone Number</label>
                                </div>

                                <div class="input-wrap">
                                    <input
                                        type="password"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        name="password"
                                        />
                                    <label>Password</label>
                                </div>

                                <div class="input-wrap">
                                    <input
                                        type="password"
                                        minlength="4"
                                        class="input-field"
                                        autocomplete="off"
                                        required
                                        name="confirmPassword"
                                        />
                                    <label>Confirm Password</label>
                                </div>

                                <input type="submit" value="Sign Up" class="sign-btn2" />

                                <p class="text">
                                    By signing up, I agree to the
                                    <a href="#">Terms of Services</a> and
                                    <a href="#">Privacy Policy</a>
                                </p>
                            </div>
                        </form>
                    </div>

                    <div class="carousel">
                        <div class="images-wrapper">
                            <img src="<c:url value="/images/Hoi-An-Ancient-Town-Hoi-An-Private-Taxi-2.jpg"/>" class="image img-1 show" alt="" />
                            <img src="<c:url value="/images/shutterstockRF_433429591.jpg"/>" class="image img-2" alt="" />
                            <img src="<c:url value="/images/tà-xùa.jpg"/>" class="image img-3" alt="" />            
                        </div>

                        <div class="text-slider">
                            <div class="text-wrap">
                                <div class="text-group">
                                    <h2>Hoi An Ancient Town</h2>
                                    <h2>Ha Long Bay</h2>
                                    <h2>Ta Xua, Paradise in the Clouds</h2>
                                </div>
                            </div>

                            <div class="bullets">
                                <span class="active" data-value="1"></span>
                                <span data-value="2"></span>
                                <span data-value="3"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value="/js/login.js"/>"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    </body>
</html>
