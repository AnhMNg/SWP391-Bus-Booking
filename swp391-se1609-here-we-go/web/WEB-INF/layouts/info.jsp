<%-- 
    Document   : info
    Created on : Nov 7, 2022, 3:41:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value="/css/about_us.css"/>">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"
              integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"
              integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
              integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>About us</title>
    </head>
    <body class="body-aboutus">
        <!--==================== HEADER ====================-->
        <header class="header-aboutus" id="header">
            <nav class="nav container">
                <div class="nav__logo">              
                    <a href="<c:url value="/home/index.do"/>">
                        <img src="<c:url value="/images/Logo1.png"/>">
                    </a>
                </div>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item">
                            <a href="#home" class="nav__link active-link">Home</a>
                        </li>
                        <li class="nav__item">
                            <a href="#about" class="nav__link">About</a>
                        </li>
                        <li class="nav__item">
                            <a href="#teams" class="nav__link">Our Team</a>
                        </li>
                        <li class="nav__item">
                            <a href="#faqs" class="nav__link">FAQs</a>
                        </li>
                        <li class="nav__item">
                            <a href="#contact" class="nav__link">Contact Us</a>
                        </li>
                    </ul>
                    <div class="nav__close" id="nav-close">
                        <i class="ri-close-line"></i>
                    </div>
                </div>
                <div class="nav__btns">
                    <div class="nav__toggle" id="nav-toggle">
                        <i class="ri-menu-line"></i>
                    </div>
                </div>

            </nav>
        </header>

        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home" id="home">
                <div class="home__container container grid anim">
                    <img src="<c:url value="/images/tou-removebg-preview.png"/>" alt="" class="home__img">

                    <div class="home__data">
                        <h1 class="home__title">
                            Let's <span>travel</span>
                        </h1>
                        <p class="home__description">
                            No matter you're going from we take you there
                        </p>
                        <a href="<c:url value="/home/index.do"/>" class="button-book button--flex">
                            Book Now<i class="ri-arrow-right-down-line button__icon"></i>
                        </a>

                    </div>
                </div>
            </section>

            <!--==================== ABOUT ====================-->
            <section class="about section container" id="about">
                <div class="about__container grid">
                    <img src="<c:url value="/images/logo.jpg"/>" alt="" class="about__img">

                    <div class="about__data">
                        <h2 class="section__title about__title">
                            Who we are & <br> why choose us
                        </h2>

                        <p class="about__description">
                            Here We Go is a platform that helps users discover and order a variety of
                            passenger transport
                            products and services.
                            Our mission is to help you find the right transportation that is affordable and
                            enjoyable, seamless from start to finish, contributing to your access to a list
                            of famous places across Vietnam.
                        </p>
                        <p class="about__description">
                            We will accompany your trips, helping you have many great experiences even
                            before you have started.
                            Here we go offers 24/7 customer service in local languages, a wide range of
                            payment options in the region.
                        </p>
                    </div>
                </div>
            </section>

            <!--==================== STEPS ====================-->
            <section class="steps section container">
                <div class="steps__bg">
                    <h2 class="section__title-center steps__title">
                        Steps to start your trip
                    </h2>

                    <div class="steps__container grid">
                        <div class="steps__card">
                            <div class="steps__card-number">01</div>
                            <h3 class="steps__card-title">Find Routes</h3>
                            <p class="steps__card-description">
                                Start by filling in the search information.
                            </p>
                        </div>

                        <div class="steps__card">
                            <div class="steps__card-number">02</div>
                            <h3 class="steps__card-title">Choose routes and book tickets</h3>
                            <p class="steps__card-description">
                                Route information (transport company, departure schedule, fares, etc.) is displayed on the
                                search results page.
                            </p>
                        </div>

                        <div class="steps__card">
                            <div class="steps__card-number">03</div>
                            <h3 class="steps__card-title">Fill in contact information and passenger information</h3>
                            <p class="steps__card-description">
                                After you have selected the correct routes, you need to fill in the booking information and
                                passenger information.
                            </p>
                        </div>
                        <div class="steps__card">
                            <div class="steps__card-number">04</div>
                            <h3 class="steps__card-title">Payment</h3>
                            <p class="steps__card-description">
                                There are many payment methods available. Please choose the method you want.
                            </p>
                        </div>
                        <div class="steps__card">
                            <div class="steps__card-number">05</div>
                            <h3 class="steps__card-title">Get e-tickets</h3>
                            <p class="steps__card-description">
                                We will send the e-ticket to your email within 60 minutes after receiving the payment
                                amount.
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <!-------------------------TEAMS-->
            <section class="product section container" id="teams">
                <h2 class="section__title-center questions__title container">Our Team</h2>
                <div class="container member" id="team">
                    <div class="row member-container mt-5">
                        <div class=" member-card">
                            <div class="member-image">
                                <img src="images/f-removebg-preview.png" class="product-thumb" alt="">
                            </div>
                            <div class="textleft">
                                <p class="name">Nguyen Anh Minh</p>
                                <p>Leader</p>
                            </div>
                        </div>

                        <div class=" member-card">
                            <div class="member-image">
                                <img src="images/f-removebg-preview.png" class="product-thumb" alt="">
                            </div>
                            <div class="textleft">
                                <p class="name">Nguyen Bao Long</p>
                                <p>Member</p>
                            </div>
                        </div>

                        <div class=" member-card">
                            <div class="member-image">
                                <img src="images/f-removebg-preview.png" class="product-thumb" alt="">
                            </div>
                            <div class="textleft">
                                <p class="name">Do Hoang Huy</p>
                                <p>Member</p>
                            </div>
                        </div>

                        <div class=" member-card">
                            <div class="member-image">
                                <img src="images/3.jpg" class="product-thumb" alt="">
                            </div>
                            <div class="textleft">
                                <p class="name">Tran Thi Hoang Anh</p>
                                <p>Member</p>
                            </div>
                        </div>
                        <div class=" member-card">
                            <div class="member-image">
                                <img src="images/3.jpg" class="product-thumb" alt="">
                            </div>
                            <div class="textleft">
                                <p class="name">Ho Ngoc Bao Tram</p>
                                <p>Member</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--==================== QUESTIONS ====================-->
            <section class="questions section" id="faqs">
                <h2 class="section__title-center questions__title quest-container container">
                    Do You Need Help?<br>
                    We Are Here To Help You!
                </h2>

                <div class="questions__container container quest-container grid">
                    <div class="questions__group">
                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    When will I have the confirmation email?
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    In most cases, you will receive an email within 60 minutes of booking. If you still have
                                    not received it after that time, please check your spam and/or spam filter. You can also
                                    download tickets
                                </p>
                            </div>

                        </div>

                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    Where can I check my bus ticket details?
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    You can always view your bus ticket details online by logging in and selecting "My
                                    bookings" from the account menu command. If you don't know your login details, you can
                                    follow the "My bookings" link in your confirmation email.
                                </p>
                            </div>

                        </div>

                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    I have not received my booking confirmation and cannot locate my booking online.
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    In most cases, you will receive your booking confirmation by email within 30 minutes of
                                    completing your booking. If you still have not received it after that time, please check
                                    your spam and/or spam folder. You can also view your ticket details online by logging in
                                    and selecting "My Bookings" from the account menu command. If you are still unable to
                                    locate your booking and have not received your booking confirmation after 24 hours,
                                    please contact us.
                                </p>
                            </div>

                        </div>
                    </div>

                    <div class="questions__group">
                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    How can I cancel my ticket?
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    You can cancel your reservation online on the website by logging in and selecting "My
                                    booking" from the account menu and pressing cancel.
                                </p>
                            </div>

                        </div>

                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    How do I know if my booking has been cancelled?
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    After you cancel your reservation with us, you will receive an email confirming the
                                    cancellation. Please check your inbox and junk folder.
                                </p>
                            </div>

                        </div>

                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    How soon will I get my money back?
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    The refund amount, if any, will be immediately deposited to our bank. From the date of
                                    submission/refund, it may take up to 30 days for banks to refund this amount, or until
                                    your next billing cycle. The refund will be returned to you by the credit card company.
                                </p>
                            </div>

                        </div>
                        <div class="questions__item">
                            <header class="questions__header">
                                <i class="ri-add-line questions__icon"></i>
                                <h3 class="questions__item-title">
                                    I want to change my booking date. How can I do that?
                                </h3>
                            </header>

                            <div class="questions__content">
                                <p class="questions__description">
                                    You can cancel your reservation online on the website by logging in and selecting "My
                                    booking" from the account menu and pressing cancel.
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </section>

            <!--==================== CONTACT ====================-->
            <section class="contact section container contact-section" id="contact">
                <div class="contact__container grid">
                    <div class="contact__box">
                        <h2 class="section__title">
                            Contact us today <br> via any of the given <br> information
                        </h2>
                        <div class="contact__data">
                            <div class="contact__information">
                                <h3 class="contact__subtitle">Call us for instant support</h3>
                                <span class="contact__description">
                                    <i class="ri-phone-line contact__icon"></i>
                                    1900-6978
                                </span>
                            </div>

                            <div class="contact__information">
                                <h3 class="contact__subtitle">Our Email</h3>
                                <span class="contact__description">
                                    <i class="ri-mail-line contact__icon"></i>
                                    herewego.letstravel@gmail.com
                                </span>
                            </div>
                        </div>
                    </div>

                    <form action="<c:url value="/user/send.do"/>"  class="contact__form">
                        <div class="contact__inputs">
                            <div class="contact__content">
                                <input type="email" placeholder=" " class="contact__input" name="email">
                                <label for="" class="contact__label">Email</label>
                            </div>

                            <div class="contact__content">
                                <input type="text" placeholder=" " class="contact__input" name="name">
                                <label for="" class="contact__label">Name</label>
                            </div>

                            <div class="contact__content contact__area">
                                <textarea name="message" placeholder=" " class="contact__input" name="message"></textarea>
                                <label for="" class="contact__label">Message</label>
                            </div>
                        </div>

                        <button class="button-book button--flex">
                            Send
                            <i class="ri-arrow-right-up-line button__icon"></i>
                        </button>
                    </form>
                </div>
            </section>
        </main>
        <script type="text/javascript" src="frontend/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"
                integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"
                integrity="sha512-eP8DK17a+MOcKHXC5Yrqzd8WI5WKh6F1TIk5QZ/8Lbv+8ssblcz7oGC8ZmQ/ZSAPa7ZmsCU4e/hcovqR8jfJqA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".member-container").slick({
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 1500,
                    responsive: [
                        {
                            breakpoint: 1239,
                            settings: {
                                slidesToShow: 2,
                            },
                        },
                        {
                            breakpoint: 769,
                            settings: {
                                slidesToShow: 1,
                                arrows: false,
                                infinite: false,
                            },
                        },
                    ],
                    // autoplay: true,
                    // autoplaySpeed: 1000,
                });
            });
        </script>
        <a href="#" class="scrollup" id="scroll-up">
            <i class="ri-arrow-up-fill scrollup__icon"></i>
        </a>
        <script src="<c:url value="/js/about.js"/>"></script>
    </body>
</html>
