<%-- 
    Document   : booking
    Created on : Oct 14, 2022, 7:47:02 AM
    Author     : Admin
--%>

<%@page import="manager.CompanyManager"%>
<%@page import="model.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manager.RouteDetailManager"%>
<%@page import="model.RouteDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/css/seat-booking.css"/>" />
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
        <link
            href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap"
            rel="stylesheet"
            />
        <title>Bus Booking</title>
        <script>
            function myFunction() {
                document.getElementById("deNum").defaultValue = "0";
            }
        </script>
    </head>
    <body>
        <div class="col-md-12 col-sm-12 container-fluid sticky-route-selection">
            <form action="<c:url value="/user/search.do"/>" class="container">
                <div class="col-md-9 sticky-input-route">
                    <div class="col-md-4 element">
                        <span>From</span>
                        <div class="pl-select">
                            <select class="form-select form-select-md mb-3" id="cityfrom" aria-label=".form-select-md" name="cityfrom">
                                <option value="" selected>Select Province/City</option>
                            </select>
                            <select class="form-select form-select-md mb-3" id="districtfrom" aria-label=".form-select-md" name="districtfrom">
                                <option value="" selected>Select City</option>
                            </select>

                        </div>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
                        <script>


            var citis = document.getElementById("cityfrom");
            var districts = document.getElementById("districtfrom");


            //var wards = document.getElementById("ward");
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };
            var promise = axios(Parameter);
            promise.then(function (result) {
                renderCity(result.data);
            });

            function renderCity(data) {
                for (const x of data) {
                    citis.options[citis.options.length] = new Option(x.Name, x.Name);
                }

                citis.onchange = function () {
                    districts.length = 1;
                    // ward.length = 1;
                    if (this.value != "") {
                        const result = data.filter(n => n.Name === this.value);

                        for (const k of result[0].Districts) {
                            districts.options[districts.options.length] = new Option(k.Name, k.Name);
                        }
                    }
                };

            }


                        </script>
                    </div>
                    <div class="col-md-4 element">
                        <span>To</span>
                        <div class="pl-select">
                            <select class="form-select form-select-md mb-3" id="cityto" aria-label=".form-select-md" name="cityto">
                                <option value="" selected>Select Province/City</option>           
                            </select>
                            <select class="form-select form-select-md mb-3" id="districtto" aria-label=".form-select-md" name="districtto">
                                <option value="" selected>Select City</option>
                            </select>
                        </div>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
                        <script>
            var citis2 = document.getElementById("cityto");
            var districts2 = document.getElementById("districtto");
            //var wards = document.getElementById("ward");
            var Parameter2 = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };
            var promise2 = axios(Parameter2);
            promise2.then(function (result) {
                renderCity2(result.data);
            });

            function renderCity2(data) {
                for (const x of data) {
                    citis2.options[citis2.options.length] = new Option(x.Name, x.Name);
                }
                citis2.onchange = function () {
                    districts2.length = 1;
                    // ward.length = 1;
                    if (this.value != "") {
                        const result = data.filter(n => n.Name === this.value);

                        for (const k of result[0].Districts) {
                            districts2.options[districts2.options.length] = new Option(k.Name, k.Name);
                        }
                    }
                };

            }
                        </script>

                    </div>
                    <div class="col-md-4 element">
                        <span>Departure Date</span>
                        <input class="form-control" type="date" placeholder="Departure Date" name="startDate">
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 sticky-route-search">
                    <button class="btn btn-secondary sticky-route-search-btn">
                        SEARCH
                    </button>
                </div>
            </form>
        </div>
        <section class="seat-booking">
            <div class="col-md-12 col-sm-12 seat-booking-ct">

                <div class="col-md-2 col-sm-12 seat-booking-filter">
                    <form action="<c:url value="/user/filter.do"/>" class="container">
                        <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                                <h3 class="accordion-header" id="panelsStayOpen-headingOne">
                                    <a
                                        href="/"
                                        class="accordion collapsed"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseOne"
                                        aria-expanded="true"
                                        aria-controls="panelsStayOpen-collapseOne"
                                        >
                                        Pickup Time
                                    </a>
                                </h3>
                                <div
                                    id="panelsStayOpen-collapseOne"
                                    class="accordion-collapse collapse show"
                                    aria-labelledby="panelsStayOpen-headingOne"
                                    >
                                    <div class="accordion-body">
                                        <ul>
                                            <li>
                                                <div class="form-check">
                                                    <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="check1"
                                                        name="option1"
                                                        value="6:00,11:00"
                                                        />
                                                    <label class="form-check-label"
                                                           >Morning (6AM to 11AM)</label
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-check">
                                                    <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="check1"
                                                        name="option1"
                                                        value="11:00,18:00"
                                                        />
                                                    <label class="form-check-label"
                                                           >Afternoon (11AM to 6PM)</label
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-check">
                                                    <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="check1"
                                                        name="option1"
                                                        value="18:00,23:00"
                                                        />
                                                    <label class="form-check-label"
                                                           >Evening (6PM to 11PM)</label
                                                    >
                                                </div>
                                            </li>
                                            <li>
                                                <div class="form-check">
                                                    <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="check1"
                                                        name="option1"
                                                        value="23:00,6:00"
                                                        />
                                                    <label class="form-check-label"
                                                           >Night (11PM to 6AM)</label
                                                    >
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h3 class="accordion-header" id="panelsStayOpen-headingTwo">
                                    <a
                                        href="/"
                                        class="accordion collapsed"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseTwo"
                                        aria-expanded="false"
                                        aria-controls="panelsStayOpen-collapseTwo"
                                        >
                                        Bus Operator
                                    </a>
                                </h3>
                                <div
                                    id="panelsStayOpen-collapseTwo"
                                    class="accordion-collapse collapse show"
                                    aria-labelledby="panelsStayOpen-headingTwo"
                                    >
                                    <div class="accordion-body">
                                        <ul>

                                            <%
                                                ArrayList<Company> listCom = CompanyManager.getTopCompany(15);
                                                for (Company com : listCom) {
                                            %>
                                            <li>
                                                <div class="form-check">
                                                    <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="check1"
                                                        name="option2"
                                                        value="<%= com.getName()%>"
                                                        />
                                                    <label class="form-check-label"><%= com.getName()%></label>
                                                </div>
                                            </li>
                                            <%
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h3 class="accordion-header" id="panelsStayOpen-headingFour">
                                    <a
                                        href="/"
                                        class="accordion collapsed"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseFour"
                                        aria-expanded="false"
                                        aria-controls="panelsStayOpen-collapseFour"
                                        >
                                        Desired Number Of Seats
                                    </a>
                                </h3>
                                <div
                                    id="panelsStayOpen-collapseFour"
                                    class="accordion-collapse collapse show"
                                    aria-labelledby="panelsStayOpen-headingFour"
                                    >
                                    <div class="accordion-body">
                                        <div class="input-group">
                                            <span class="input-group-text">Number</span>
                                            <input type="number" id="deNum" name="deNum" class="form-control" value="${deNum}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h3 class="accordion-header" id="panelsStayOpen-headingThree">
                                    <a
                                        href="/"
                                        class="accordion collapsed"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#panelsStayOpen-collapseThree"
                                        aria-expanded="false"
                                        aria-controls="panelsStayOpen-collapseThree"
                                        >
                                        Price
                                    </a>
                                </h3>
                                <div
                                    id="panelsStayOpen-collapseThree"
                                    class="accordion-collapse collapse show"
                                    aria-labelledby="panelsStayOpen-headingThree"
                                    >
                                    <div class="accordion-body">
                                        <p class="currency">Currency: VND</p>
                                        <div class="price-input">
                                            <div class="field">
                                                <input type="number" class="input-min" value="0" name="minPrice"/>
                                            </div>
                                            <div class="separator">-</div>
                                            <div class="field">
                                                <input type="number" class="input-max" value="5000000" name="maxPrice"/>
                                            </div>
                                        </div>
                                        <div class="slider">
                                            <div class="progress"></div>
                                        </div>
                                        <div class="range-input">
                                            <input
                                                type="range"
                                                class="range-min"
                                                min="0"
                                                max="5000000"
                                                value="0"
                                                step="1000"
                                                />
                                            <input
                                                type="range"
                                                class="range-max"
                                                min="0"
                                                max="5000000"
                                                value="5000000"
                                                step="1000"
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <div class="search-filter">
                                    <button class="btn btn-secondary search-filter-btn" onclick="myFunction()">
                                        APPLY
                                    </button>
                                </div>
                            </div>
                            <input type="hidden" name="depart" value="${depart}"/>
                            <input type="hidden" name="destination" value="${destination}"/>
                        </div>
                    </form>

                </div>



                <div class="container-fluid col-md-10 col-sm-12 seat-booking-form">   
                    <c:if test="${(empty listSearch) and (empty notification)}">
                        <h2 class="amt">No products are available</h2>
                    </c:if>
                    <h2  class="amt">${notification}</h2>
                    <%
                        ArrayList<RouteDetail> listReturn = (ArrayList<RouteDetail>) request.getAttribute("listSearch");
                        request.getSession().setAttribute("listReturn", listReturn);

                    %>
                    <c:forEach var="rd" items="${listSearch}">
                        <c:if test="${(rd.kindBus == 'Normal Bus') and (rd.cappacity == 29)}">
                            <%--29 Seats--%>
                            <form action="<c:url value="/user/selectChangeTicket.do"/>" class="container">
                                <input type="hidden" name="routeDe" value="${rd.routeDetailId}"/>
                                <div class="seat-booking-form-dt">
                                    <div class="seat-booking-form-dt-header">
                                        <div class="col-md-6 seat-booking-form-dt-tt">
                                            <h2>${rd.companyName}</h2>
                                            <div class="type-amt">
                                                <p class="col-md-6 type">${rd.kindBus}</p>
                                                <p class="col-md-6 amt">${rd.remaningPosition} Seats Left</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6 seat-booking-form-dt-pc">
                                            <h3 class="price">${rd.price}VND</h3>
                                        </div>
                                    </div>
                                    <div class="seat-booking-form-dt-ct">
                                        <div class="col-md-5 seat-booking-form-dt-ct-t-pt">
                                            <div class="route-name" style="display: flex">
                                                <h6 style="padding-right: 5px">${rd.depart}</h6>
                                                <i
                                                    class="fa fa-long-arrow-right"
                                                    style="padding-top: 5px"
                                                    ></i>
                                                <h6 style="padding-left: 5px">${rd.destination}</h6>
                                            </div>
                                            <p>${rd.startTime}</p>
                                            <hr style="width: 200px" />
                                            <div class="seat-point">
                                                <span>Select Pickup Point</span>
                                                <select class="form-select seat-point-select">
                                                    <option>${rd.departDetail}</option>
                                                    <option>#</option>
                                                </select>
                                            </div>
                                            <div class="seat-point">
                                                <span>Select Drop Point</span>
                                                <select class="form-select seat-point-select">
                                                    <option>${rd.destinationDetail}</option>
                                                    <option>#</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-7 seat-pick">
                                            <p class="seat-pick-tt">Select Seats</p>
                                            <div class="seat-rule">
                                                <ul class="seat-rule-ins">
                                                    <li>
                                                        <div class="seat"></div>
                                                        <small>N/A</small>
                                                    </li>

                                                    <li>
                                                        <div class="selected"></div>
                                                        <small>Selected</small>
                                                    </li>

                                                    <li>
                                                        <div class="seat occupied"></div>
                                                        <small>Occupied</small>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="seat-map">
                                                <div class="col-md-6">
                                                    <div class="seat-pos">
                                                        <div class="">
                                                            <p>29 Seats Bus</p>
                                                        </div>

                                                        <div class="seat-pos-map">
                                                            <div class="seat-row">
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 1}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="1"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>


                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 2}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="2"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 3}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="3"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 4}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="4"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 5}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="5"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 6}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="6"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 7}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="7"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div class="seat-row">
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 8}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="8"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 9}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="9"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 10}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="10"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 11}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="11"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 12}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="12"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 13}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="13"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 14}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="14"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div class="seat-row">
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 15}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="15"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div class="seat-row">
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 16}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="16"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 17}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="17"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 18}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="18"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 19}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="19"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 20}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="20"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 21}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="21"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 22}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="22"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div class="seat-row">
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 23}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="23"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 24}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="24"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 25}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="25"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 26}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="26"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 27}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="27"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 28}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="28"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <c:set var="contains" value="false" />
                                                                <c:forEach var="pos" items="${rd.listPosition}">
                                                                    <c:if test="${pos == 29}">
                                                                        <c:set var="contains" value="true" />

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${contains == true}">
                                                                        <label class="seat-ctn">
                                                                            <input type="disable-checkbox" />
                                                                            <span class="checkmark disable-checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${contains == false}">
                                                                        <label class="seat-ctn">
                                                                            <input type="radio" name="seat" value="29"/>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="seat-pick-btn">
                                                <input
                                                    id="spt"
                                                    type="submit"
                                                    class="seat-pick-btn-b"
                                                    value="change"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </from>  
                                <%--29 Seats--%>
                            </c:if>
                            <c:if test="${(rd.kindBus == 'Sleeper Bus') and (rd.cappacity == 52)}">
                                <%--Sleeper Bus Form--%>
                                <form action="<c:url value="/user/selectChangeTicket.do"/>" class="container">

                                    <input type="hidden" name="routeDe" value="${rd.routeDetailId}"/>
                                    <div class="seat-booking-form-dt">
                                        <div class="seat-booking-form-dt-header">
                                            <div class="col-md-6 seat-booking-form-dt-tt">
                                                <h2>${rd.companyName}</h2>
                                                <div class="type-amt">
                                                    <p class="col-md-6 type">${rd.kindBus}</p>
                                                    <p class="col-md-6 amt">${rd.remaningPosition} Seats Left</p>
                                                </div>
                                            </div>
                                            <div class="col-md-6 seat-booking-form-dt-pc">
                                                <h3 class="price">${rd.price}VND</h3>
                                            </div>
                                        </div>
                                        <div class="seat-booking-form-dt-ct">
                                            <div class="col-md-5 seat-booking-form-dt-ct-t-pt">
                                                <div class="route-name" style="display: flex;">
                                                    <h6 style="padding-right: 5px;">${rd.depart}</h6><i class="fa fa-long-arrow-right" style="padding-top: 4px;"></i><h6 style="padding-left: 5px;">${rd.destination}</h6>
                                                </div>   
                                                <p>${rd.startTime}</p>
                                                <hr style="width: 200px" />
                                                <div class="seat-point">
                                                    <span>Select Pickup Point</span>
                                                    <select class="form-select seat-point-select">
                                                        <option>${rd.departDetail}</option>
                                                        <option>#</option>
                                                    </select>
                                                </div>
                                                <div class="seat-point">
                                                    <span>Select Drop Point</span>
                                                    <select class="form-select seat-point-select">
                                                        <option>${rd.destinationDetail}</option>
                                                        <option>#</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-7 seat-pick">
                                                <p class="seat-pick-tt">Select Seats</p>
                                                <div class="seat-rule">
                                                    <ul class="seat-rule-ins">
                                                        <li>
                                                            <div class="seat"></div>
                                                            <small>N/A</small>
                                                        </li>

                                                        <li>
                                                            <div class="selected"></div>
                                                            <small>Selected</small>
                                                        </li>

                                                        <li>
                                                            <div class="seat occupied"></div>
                                                            <small>Occupied</small>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="seat-map">
                                                    <div class="col-md-6">
                                                        <div class="seat-pos">
                                                            <div class="">
                                                                <p>Lower Berth</p>
                                                            </div>
                                                            <div class="seat-pos-map">
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 1}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio"  name="seat" value="1"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 2}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="2"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 3}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="3"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 4}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="4"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 5}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="5"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 6}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="6"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 7}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="7"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 8}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="8"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 9}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="9"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 10}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="10"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 11}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="11"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 12}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="12"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 13}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="13"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 14}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="14"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 15}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="15"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 16}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="16"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 17}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="17"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 18}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="18"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 19}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="19"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 20}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="20"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 21}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="21"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 22}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="22"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 23}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="23"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 24}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="24"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 25}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="25"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 26}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="26"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="seat-pos">
                                                            <div class="">
                                                                <p>Upper Berth</p>
                                                            </div>
                                                            <div class="seat-pos-map">
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 27}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="27"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 28}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="28"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 29}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="29"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 30}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="30"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 31}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="31"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 32}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="32"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 33}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="33"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 34}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="34"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 35}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="35"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 36}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="36"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 37}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="37"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 38}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="38"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 39}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="39"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 40}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="40"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 41}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="41"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 42}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="42"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 43}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="43"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 44}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="44"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 45}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="45"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 46}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="46"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 47}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="47"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 48}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="48"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 49}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="49"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 50}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="50"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 51}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="51"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 52}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="52"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="seat-pick-btn">
                                                    <input id="spt" type="submit" class="seat-pick-btn-b" value="change">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <%--Sleeper Bus Form--%>
                            </c:if>
                            <c:if test="${(rd.kindBus == 'Sleeper Room Bus') and (rd.cappacity == 20)}">
                                <%--Sleeper Room--%>
                                <form action="<c:url value="/user/selectChangeTicket.do"/>" class="container">

                                    <input type="hidden" name="routeDe" value="${rd.routeDetailId}"/>
                                    <div class="seat-booking-form-dt">
                                        <div class="seat-booking-form-dt-header">
                                            <div class="col-md-6 seat-booking-form-dt-tt">
                                                <h2>${rd.companyName}</h2>
                                                <div class="type-amt">
                                                    <p class="col-md-6 type">${rd.kindBus}</p>
                                                    <p class="col-md-6 amt">${rd.remaningPosition} Seats Left</p>
                                                </div>
                                            </div>
                                            <div class="col-md-6 seat-booking-form-dt-pc">
                                                <h3 class="price">${rd.price}VND</h3>
                                            </div>
                                        </div>
                                        <div class="seat-booking-form-dt-ct">
                                            <div class="col-md-5 seat-booking-form-dt-ct-t-pt">
                                                <div class="route-name" style="display: flex">
                                                    <h6 style="padding-right: 5px">${rd.depart}</h6>
                                                    <i
                                                        class="fa fa-long-arrow-right"
                                                        style="padding-top: 5px"
                                                        ></i>
                                                    <h6 style="padding-left: 5px">${rd.destination}</h6>
                                                </div>
                                                <p>${rd.startTime}</p>
                                                <hr style="width: 200px" />
                                                <div class="seat-point">
                                                    <span>Select Pickup Point</span>
                                                    <select class="form-select seat-point-select">
                                                        <option>${rd.departDetail}</option>
                                                        <option>#</option>
                                                    </select>
                                                </div>
                                                <div class="seat-point">
                                                    <span>Select Drop Point</span>
                                                    <select class="form-select seat-point-select">
                                                        <option>${rd.destinationDetail}</option>
                                                        <option>#</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-7 seat-pick">
                                                <p class="seat-pick-tt">Select Seats</p>
                                                <div class="seat-rule">
                                                    <ul class="seat-rule-ins">
                                                        <li>
                                                            <div class="seat"></div>
                                                            <small>N/A</small>
                                                        </li>

                                                        <li>
                                                            <div class="selected"></div>
                                                            <small>Selected</small>
                                                        </li>

                                                        <li>
                                                            <div class="seat occupied"></div>
                                                            <small>Occupied</small>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="seat-map">
                                                    <div class="col-md-6">
                                                        <div class="seat-pos">
                                                            <div class="">
                                                                <p>Lower Berth</p>
                                                            </div>
                                                            <div class="seat-pos-map-room">
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 1}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="1"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 2}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="2"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 3}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="3"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 4}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="4"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 5}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="5"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 6}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="6"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 7}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="7"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 8}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="8"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 9}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="9"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 10}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="10"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="seat-pos">
                                                            <div class="">
                                                                <p>Upper Berth</p>
                                                            </div>
                                                            <div class="seat-pos-map-room">
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 11}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="11"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 12}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="12"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 13}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="13"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 14}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="14"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 15}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="15"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="seat-row">
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 16}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="16"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 17}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="17"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 18}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="18"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 19}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="19"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                    <c:set var="contains" value="false" />
                                                                    <c:forEach var="pos" items="${rd.listPosition}">
                                                                        <c:if test="${pos == 20}">
                                                                            <c:set var="contains" value="true" />

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${contains == true}">
                                                                            <label class="seat-ctn">
                                                                                <input type="disable-checkbox" />
                                                                                <span class="checkmark disable-checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                        <c:when test="${contains == false}">
                                                                            <label class="seat-ctn">
                                                                                <input type="radio" name="seat" value="20"/>
                                                                                <span class="checkmark"></span>
                                                                            </label>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="seat-pick-btn">
                                                    <input
                                                        id="spt"
                                                        type="submit"
                                                        class="seat-pick-btn-b"
                                                        value="change"
                                                        />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--Sleeper Room--%>
                                    </from>
                                </c:if>





                            </c:forEach>
                            </div>


                            </div>
                            </section>
                            <script src="<c:url value="/js/script.js"/>"></script>
                            </body>
                            </html>
