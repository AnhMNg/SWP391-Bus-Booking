<%-- 
    Document   : info
    Created on : Oct 13, 2022, 10:56:06 PM
    Author     : Admin
--%>

<%@page import="manager.UserManager"%>
<%@page import="model.Company"%>
<%@page import="manager.FeedbackManager"%>
<%@page import="model.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <title>Transportation Company Profile</title>
        <style>
            .selected::after {
                content: "";
                background: url('<c:url value="/images/arrow-down.svg"/>');
                background-size: contain;
                background-repeat: no-repeat;

                position: absolute;
                height: 100%;
                width: 32px;
                right: 10px;
                top: 5px;

                transition: all 0.4s;
            }

            .rating label {
                width: 48px;
                height: 48px;
                padding: 48px 0 0;
                overflow: hidden;
                background: url('<c:url value="/images/stars.svg"/>') no-repeat top left;
            }
        </style>
    </head>
    <body>
        <%
            Company com = (Company) request.getSession().getAttribute("COMPANY");
            ArrayList<Feedback> listfb = null;
            listfb = FeedbackManager.getFeedbackbyComId(com.getCompanyId());
        %>
        <main>
            <div class="container">
                <div class="container mt-5 px-5 py-5 header-comp">
                    <div class="tc-logo-img ml-3">
                        <img src="<c:url value="/images/${sessionScope.COMPANY_LOGO}"/>" />
                    </div>
                    <div class="tc-header">
                        <h1 style="text-transform: uppercase; font-weight: bold">
                            ${sessionScope.COMPANY_NAME}
                        </h1>
                    </div>
                </div>
                <section class="tc-info-des-sec">
                    <div class="tc-info-des container">
                        <!--General information-->
                        <div class="col-md-4 transportation-comp-content">
                            <h1 class="">General Information</h1>
                            <p class="content">
                                Established in 2000 until now, with more than 10 years of
                                experience in the field of transportation, Thanh Buoi has served
                                more than thousands of bus routes across the country. With the
                                motto "Serving customers from a dedicated heart", Thanh Buoi
                                always constantly improves, improves service quality and expands
                                the size of its company every day in order to bring customers
                                the best service and most diverse.
                                <span class="read-more-text">
                                    With the unremitting efforts and efforts of the staff of
                                    company during its operation, Thanh Buoi has achieved many
                                    great achievements, being voted by consumers as "Enterprise
                                    providing transportation services". most satisfied in 2008,
                                    2010, 2011, 2013" and won the title of "Prestigious Brand
                                    2009". Not stopping there, the size of the company also
                                    increased significantly. From a company specializing in
                                    transporting passengers and goods, Thanh Buoi has now become a
                                    multi-industry, multi-field company across the country.
                                </span>
                            </p>
                            <span class="read-more-btn" style="margin-bottom: 50px;">Read More...</span>
                            <br />
                            <!-- Only TC role can view and edit data from routes list -->
                            <c:if test="${sessionScope.LOGIN_COMPANY != null}">
                                <a href="/swp391-se1609-here-we-go/company/routesList.do" 
                                   >Routes List <i class="fa fa-bus"></i
                                    ></a>
                                </c:if>

                            <!--  -->
                        </div>

                        <!--Bus Type-->
                        <div class="col-md-8 bus-type-comp">
                            <div class="img-slider">
                                <div class="slide active">
                                    <img
                                        src="<c:url value="/images/vị-trí-số-ghế-xe-giường-nằm-1024x563.jpg"/>"
                                        alt=""
                                        />
                                    <div class="info">
                                        <h2>Sleeper Bus</h2>
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="<c:url value="/images/xe-phong-nam-di-da-lat-4.jpg"/>" alt="" />
                                    <div class="info">
                                        <h2>Sleeper Room Bus</h2>
                                    </div>
                                </div>
                                <div class="slide">
                                    <img src="<c:url value="/images/xe-khach-29-cho-4.jpg"/>" alt="" />
                                    <div class="info">
                                        <h2>29 Seats - Normal Bus</h2>
                                    </div>
                                </div>
                                <div class="navigation">
                                    <div class="btn active"></div>
                                    <div class="btn"></div>
                                    <div class="btn"></div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                var slides = document.querySelectorAll(".slide");
                                var btns = document.querySelectorAll(".btn");
                                let currentSlide = 1;

                                // Javascript for image slider manual navigation
                                var manualNav = function (manual) {
                                    slides.forEach((slide) => {
                                        slide.classList.remove("active");

                                        btns.forEach((btn) => {
                                            btn.classList.remove("active");
                                        });
                                    });

                                    slides[manual].classList.add("active");
                                    btns[manual].classList.add("active");
                                };

                                btns.forEach((btn, i) => {
                                    btn.addEventListener("click", () => {
                                        manualNav(i);
                                        currentSlide = i;
                                    });
                                });

                                // Javascript for image slider autoplay navigation
                                var repeat = function (activeClass) {
                                    let active = document.getElementsByClassName("active");
                                    let i = 1;

                                    var repeater = () => {
                                        setTimeout(function () {
                                            [...active].forEach((activeSlide) => {
                                                activeSlide.classList.remove("active");
                                            });

                                            slides[i].classList.add("active");
                                            btns[i].classList.add("active");
                                            i++;

                                            if (slides.length == i) {
                                                i = 0;
                                            }
                                            if (i >= slides.length) {
                                                return;
                                            }
                                            repeater();
                                        }, 10000);
                                    };
                                    repeater();
                                };
                                repeat();
                            </script>
                        </div>

                    </div>
                    <div style="margin-top: 100px;">
                        <img src="<c:url value="/images/Here we go (1).jpg"/>" alt="">
                    </div>
                    <div style="margin-top: 50px;">
                        <img src="<c:url value="/images/Here we go2.png"/>" alt="">
                    </div>
                </section>

                <!-- Review -->
                <section class="review">
                    <!-- Only Customer can use -->
                    <div class="contribute">
                        <h2>Contribute</h2>
                        <button
                            class="btn"
                            data-bs-toggle="modal"
                            data-bs-target="#myModal"
                            >
                            Write a review
                        </button>
                    </div>
                    <!--  -->
                    <div class="review-cm">
                        <h2>Reviews</h2>
                        <hr />
                        <div class="rate-ov">

                            <%
                                if (listfb != null) {
                                    int avg = FeedbackManager.getAVGRatebyComId(com.getCompanyId());
                            %>
                            <p>Average Rate: <%= avg%>/5</p>
                            <br/>
                            <span><%= listfb.size()%> review</span>
                            <%
                            } else {
                            %>
                            <span>0 review</span>
                            <%
                                }
                            %>

                        </div>
                        <%
                            if (listfb != null) {
                                for (Feedback fb : listfb) {
                        %>
                        <hr />
                        <div class="comment">
                            <div class="user-info">
                                <%
                                    String s = "/uploads/" + UserManager.getUserById(fb.getUserId()).getAvtLink();
                                %>
                                <img src="<c:url value="<%= s%>"/>" alt="">
                                <p><%= UserManager.getUserById(fb.getUserId()).getName()%></p>    
                                <p class="date-cm" style="font-weight: 400"><%= fb.getDate()%></p>
                            </div>
                            <%
                                switch (fb.getStar()) {
                                    case 0:
                            %>
                            <span class="rate-cm">Not rate</span>
                            <%
                                    break;
                                case 1:
                            %>
                            <div class="seat-row">
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                            </div>
                            <span class="rate-cm">So bad</span>
                            <%
                                    break;
                                case 2:
                            %>
                            <div class="seat-row">
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>

                            </div>
                            <span class="rate-cm">Bad</span>
                            <%
                                    break;
                                case 3:
                            %>
                            <div class="seat-row">
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                            </div>
                            <span class="rate-cm">Not bad</span>
                            <%
                                    break;
                                case 4:
                            %>
                            <div class="seat-row">
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                            </div>
                            <span class="rate-cm">Good</span>
                            <%
                                    break;
                                case 5:
                            %>
                            <div class="seat-row">
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                                <label class="seat-ctn">
                                    <input type="disable-checkbox" />
                                    <span class="checkmark disable-checkmark"></span>
                                </label>
                            </div>
                            <span class="rate-cm">Greate, nothing</span>
                            <%
                                        break;
                                }
                            %>           

                            <p class="re-cm">
                                <%= fb.getDescription()%>
                            </p>
                            <hr />
                        </div>
                        <%
                                }
                            }
                        %> 


                    </div>
                    <!-- The Modal -->
                    <%
                        User us = null;
                        us = (User) request.getSession().getAttribute("LOGIN_CUSTOMER");
                        if (us != null) {
                    %>
                    <form action="<c:url value="/user/feedback.do"/>"  method="post">
                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog modal-dialog-centered">
                                <div
                                    class="modal-content pay-modal"
                                    style="border-radius: 20px; background: #e7f0f3"
                                    >
                                    <!-- Modal Header -->
                                    <div
                                        class="modal-header"
                                        style="font-size: 30px; font-weight: bold"
                                        >
                                        My review
                                    </div>
                                    <!-- Modal body -->
                                    <div
                                        class="modal-body pay-cf-msg"
                                        style="font-size: 20px; font-weight: 500"
                                        >
                                        <p>Rate Your Experience</p>
                                        <div class="rating">
                                            <input id="rating1" type="radio" name="rating" value="1" checked="checked"/>
                                            <label for="rating1"></label>
                                            <input id="rating2" type="radio" name="rating" value="2" />
                                            <label for="rating2"></label>
                                            <input id="rating3" type="radio" name="rating" value="3" />
                                            <label for="rating3"></label>
                                            <input id="rating4" type="radio" name="rating" value="4" />
                                            <label for="rating4"></label>
                                            <input id="rating5" type="radio" name="rating" value="5" />
                                            <label for="rating5"></label>
                                        </div>
                                        <hr />
                                        <p>Bus Type</p>
                                        <input
                                            checked="checked"
                                            type="radio"
                                            class="radio"
                                            id="normal-bus"
                                            name="category"
                                            value="29 Seats"
                                            />
                                        <label for="normal-bus">29 Seats</label>
                                        <br/>
                                        <input
                                            type="radio"
                                            class="radio"
                                            id="sleeper-bus"
                                            name="category"
                                            value="Sleeper Bus"
                                            />
                                        <label for="sleeper-bus">Sleeper Bus</label>
                                        <br/>
                                        <input
                                            type="radio"
                                            class="radio"
                                            id="sleeper-room-bus"
                                            name="category"
                                            value="Sleeper Room Bus"
                                            />
                                        <label for="sleeper-room-bus">Sleeper Room Bus</label>
                                        <hr />
                                        <p style="font-size: 20px; font-weight: 500">
                                            Leave a review(required)
                                        </p>
                                        <!-- <input class="cm-txt" type="text" placeholder="Tell people about what your experience!"/> -->

                                        <textarea
                                            class="cm-txt"
                                            id="myTextarea"
                                            placeholder="Tell people about what your experience!..."
                                            name="feedback"
                                            ></textarea>


                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <div class="pay-cf">
                                            <button
                                                type="submit"
                                                value="SUBMIT"
                                                class="pay-cf-btn"
                                                data-bs-toggle="modal"
                                                data-bs-target="#myModalPaying"> Submit </button>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <%
                        }
                    %>

                </section>
            </div>
        </main>
        <script src="<c:url value="/js/tc_info.js"/>"></script>
    </body>
</html>
