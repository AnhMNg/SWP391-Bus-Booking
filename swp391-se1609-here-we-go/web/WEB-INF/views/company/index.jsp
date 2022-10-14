<%-- 
    Document   : index
    Created on : Sep 28, 2022, 11:37:18 PM
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
        <link rel="stylesheet" href="<c:url value="/css/style_tc.css"/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"><link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap" rel="stylesheet">
        <style>
            .banner {
                background: url('<c:url value="/images/Vietnam-sleeper-bus-seat.jpg"/>');
                background-position: center;
                background-size: cover;
            }
        </style>
        <title>Transportation Company Home Page</title>
    </head>
    <body>
        <div class="ct">
            <section class="banner">
                <div class="text-box">
                    <h1>Management Page</h1>
                    <a href="#bs" class="book-btn">Manage my routes</a>
                </div>
            </section>


            <!-- Booking -->
            <section id="bs" class="rt-mg">
                <!-- Title -->
                <h1>Routes Management</h1>
                <!-- Route Selection -->
                <div class="container col-md-12 routes-mag">
                    
                    <div class="col-md-6 routes-mag-dt">
                        <div class="bus-img">
                            <img src="<c:url value="/images/Bus3.png"/>" alt="bus"> 
                        </div>
                        
                        <div class="mag-btn">
                            <form action="<c:url value="/company/upload.do"/>" method="post">
                                <input type="submit" value="UPLOAD NEW ROUTE" class="mag-btn-dt">
                            
                            </form>
                            
                        </div>
                    </div>
                    <div class="col-md-6 routes-mag-dt">
                        <div class="bus-img">
                            <img src="<c:url value="/images/dl5.png"/>" alt="bus">
                        </div>
                        <div class="mag-btn">
                            <input type="submit" value="DELETE ROUTE" class="mag-btn-dt">
                        </div>
                    </div>
                </div>
            </section>

            <!-- Popular Routes -->
            <section class="popular-routes">
                <div class="container-fluid content-pr">
                    <!-- Title -->
                    <div class="content-pr-tt">
                        <h1>Popular Routes</h1>
                        <img class="img-fluid" src="<c:url value="/images/MAP.png"/>" alt="map">
                    </div>
                    <!-- Popular Route -->
                    <div class="col-lg-12 row content-pr-bd">
                        <div class="col-lg-6">
                            <div class="col-md-6">
                                <div class="card card-left">
                                    <div class="image">
                                        <img class="img-fluid card-img-top" src="<c:url value="/images/DaLat.jpg"/>" alt="Card image" style="width:100%">
                                        <i class="fa fa-search fa-5x"></i>
                                    </div>                        
                                    <div class="card-body">
                                        <a href="/"><h4 class="card-title">Ho Chi Minh City - Da Lat</h4></a>                   
                                    </div>   
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-right">
                                    <div class="image">
                                        <img class="img-fluid card-img-top" src="<c:url value="/images/DaNang.jpg"/>" alt="Card image" style="width:100%">
                                        <i class="fa fa-search fa-5x"></i>
                                    </div>                               
                                    <div class="card-body">
                                        <a href="/"><h4 class="card-title">Da Nang - Hue</h4></a>  
                                    </div>   
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="col-md-6">
                                <div class="card card-left">
                                    <div class="image">
                                        <img class="img-fluid card-img-top" src="<c:url value="/images/Sapa.png"/>" alt="Card image" style="width:100%">
                                        <i class="fa fa-search fa-5x"></i>
                                    </div>                                
                                    <div class="card-body">
                                        <a href="/"><h4 class="card-title">Ha Noi - Sa Pa</h4></a>                         
                                    </div>   
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card card-right">
                                    <div class="image">
                                        <img class="img-fluid card-img-top" src="<c:url value="/images/CanTho.jpg"/>" alt="Card image" style="width:100%">
                                        <i class="fa fa-search fa-5x"></i>
                                    </div>                              
                                    <div class="card-body">
                                        <a href="/"><h4 class="card-title">Ho Chi Minh City - Can Tho</h4></a>
                                    </div>   
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
