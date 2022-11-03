<%-- 
    Document   : myBooking
    Created on : Nov 3, 2022, 10:00:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/css/my_booking.css"/>"/>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
            rel="stylesheet"
            />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
            />
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap"
            rel="stylesheet"
            />
        <style>
            .main-my-booking {
                background-image: url('<c:url value="/images/tou-removebg-preview.png"/>');
                background-position: center bottom;
                background-repeat: no-repeat;
            }

            .banner-my-booking {
                background-image: url('<c:url value="/images/bannermb2.png"/>');
                background-position: center bottom;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
        <title>My Booking</title>
    </head>
    <body>
        <section class="my-booking">
            <div class="container main-my-booking">
                <div class="col-md-3 banner-my-booking">

                </div>
                <div class="col-md-9 my-booking-content">
                    <div class="my-booking-info">
                        <div class="my-ava">
                            <img src="<c:url value="/uploads/${sessionScope.LOGIN_CUSTOMER_IMG}"/>" alt="">
                        </div>
                        <div class="my-info">
                            <p>${sessionScope.LOGIN_CUSTOMER_NAME}</p>
                        </div>
                    </div>
                    <ul class="tabs">
                        <li><i class="uil uil-ticket"></i> Upcoming</li>
                        <li><i class="uil uil-suitcase"></i> Completed</li>
                    </ul>

                    <div class="container myb-ct">
                        <div class="content">
                            <div class="detail mb-2 mt-4">
                                <div class="booking-detail ml-3 mt-2">
                                    <p class="address">Ha Noi <i class="fa fa-long-arrow-right"></i> Trang An, Ninh Binh</p>
                                    <p class="bus-name">Hoang Long Bus</p>
                                    <p class="bus-type">47 Seats</p>
                                    <p class="bus-time">10/11/2022 11:00</p>
                                </div>
                                <div class="button-group-myb">
                                    <div class="myb-btn mx-2 md-3">
                                        <button type="submit" class="btn my-btn-ch text-uppercase">
                                            Change 
                                        </button>
                                    </div>
                                    <div class="myb-btn mx-5 md-4">
                                        <button type="submit" class="btn my-btn-dl text-uppercase">
                                            Cancel
                                        </button>
                                    </div>
                                </div>        
                            </div>
                            <div class="detail mb-2 mt-4">
                                <div class="booking-detail ml-3 mt-2">
                                    <p class="address">Ha Noi <i class="fa fa-long-arrow-right"></i> Trang An, Ninh Binh</p>
                                    <p class="bus-name">Hoang Long Bus</p>
                                    <p class="bus-type">47 Seats</p>
                                    <p class="bus-time">10/11/2022 11:00</p>
                                </div>
                                <div class="button-group-myb">
                                    <div class="myb-btn mx-2 md-3">
                                        <button type="submit" class="btn my-btn-ch text-uppercase">
                                            Change 
                                        </button>
                                    </div>
                                    <div class="myb-btn mx-5 md-4">
                                        <button type="submit" class="btn my-btn-dl text-uppercase">
                                            Cancel
                                        </button>
                                    </div>
                                </div>        
                            </div>
                            <div class="detail-null mb-2 mt-4">
                                <div class="detail-null-img">
                                    <img src="<c:url value="/images/suitcase-trv.png"/>" alt="" />
                                </div>
                                <div class="detail-null-ctn">
                                    <p>Looks empty, you've no upcoming bookings.</p>
                                    <button class="plan-btn">Plan a trip</button>
                                </div>
                            </div>
                        </div>

                        <div class="content">
                            <div class="detail mb-2 mt-4">
                                <div class="booking-detail ml-3 mt-2">
                                    <p class="address">Ha Noi <i class="fa fa-long-arrow-right"></i> Sapa, Lao Cai</p>
                                    <p class="bus-name">Sapa Dragon Bus</p>
                                    <p class="bus-type">47 Seats</p>
                                    <p class="bus-time">4/11/2022 12:00</p>
                                </div>
                                <div class="button-group-myb">
                                    <div class="myb-btn mx-5 md-4">
                                        <button type="submit" class="btn my-btn-dl text-uppercase">
                                            Delete
                                        </button>
                                    </div>
                                </div>        
                            </div>
                            <div class="detail-null mb-2 mt-4">
                                <div class="detail-null-img">
                                    <img src="<c:url value="/images/suitcase-trv.png"/>" alt="" />
                                </div>
                                <div class="detail-null-ctn">
                                    <p>Looks empty, you've no upcoming bookings.</p>
                                    <button class="plan-btn">Plan a trip</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="<c:url value="/js/tabs.js"/>"></script>
    </body>
</html>
