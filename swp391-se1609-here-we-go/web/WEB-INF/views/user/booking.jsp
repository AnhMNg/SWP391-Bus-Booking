<%-- 
    Document   : booking
    Created on : Oct 14, 2022, 7:47:02 AM
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
        <link rel="stylesheet" href="./css/style.css" />
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
    </head>
    <body>
        <div class="col-md-12 col-sm-12 container-fluid sticky-route-selection">
            <div class="col-md-9 col-sm-8 sticky-input-route">
                <div class="col-md-4 col-sm-4 element">
                    <span>From</span>
                    <select class="form-select">
                        <option value="" disabled selected>Select Departure</option>
                        <option>#</option>
                    </select>
                </div>
                <div class="col-md-4 col-sm-4 element">
                    <span>To</span>
                    <select class="form-select">
                        <option value="" disabled selected>Select Destination</option>
                        <option>#</option>
                    </select>
                </div>
                <div class="col-md-4 col-sm-4 element">
                    <span>Departure Date</span>
                    <input
                        class="form-control"
                        type="date"
                        placeholder="Departure Date"
                        />
                </div>
            </div>
            <div class="col-md-3 col-sm-12 sticky-route-search">
                <button class="btn btn-secondary sticky-route-search-btn">
                    SEARCH
                </button>
            </div>
        </div>
        <section class="seat-booking">
            <div class="col-md-12 col-sm-12 seat-booking-ct">
                <div class="col-md-2 col-sm-12 seat-booking-filter">
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
                                                    value="something"
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
                                                    value="something"
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
                                                    value="something"
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
                                                    value="something"
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
                                        <li>
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="check1"
                                                    name="option1"
                                                    value="something"
                                                    />
                                                <label class="form-check-label">Thanh Buoi Bus</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="check1"
                                                    name="option1"
                                                    value="something"
                                                    />
                                                <label class="form-check-label"
                                                       >Phuong Trang Bus (Futa Bus)</label
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
                                                    value="something"
                                                    />
                                                <label class="form-check-label"
                                                       >Ha Noi Rides On Time</label
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
                                                    value="something"
                                                    />
                                                <label class="form-check-label"
                                                       >Sapa Dragon Express</label
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
                                                    value="something"
                                                    />
                                                <label class="form-check-label">Hoang Long Bus</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="check1"
                                                    name="option1"
                                                    value="something"
                                                    />
                                                <label class="form-check-label"
                                                       >Hue Tourist Bus</label
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
                                                    value="something"
                                                    />
                                                <label class="form-check-label"
                                                       >Mai Linh Express Bus</label
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
                                                    value="something"
                                                    />
                                                <label class="form-check-label">Hai Van Bus</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="check1"
                                                    name="option1"
                                                    value="something"
                                                    />
                                                <label class="form-check-label">Interbus Lines</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="check1"
                                                    name="option1"
                                                    value="something"
                                                    />
                                                <label class="form-check-label">Sapa Bus</label>
                                            </div>
                                        </li>
                                    </ul>
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
                                    <div class="price-input">
                                        <div class="field">
                                            <span>Min</span>
                                            <input type="number" class="input-min" value="2500" />
                                        </div>
                                        <div class="separator">-</div>
                                        <div class="field">
                                            <span>Max</span>
                                            <input type="number" class="input-max" value="7500" />
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
                                            max="10000"
                                            value="2500"
                                            step="100"
                                            />
                                        <input
                                            type="range"
                                            class="range-max"
                                            min="0"
                                            max="10000"
                                            value="7500"
                                            step="100"
                                            />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <div class="search-filter">
                                <button class="btn btn-secondary search-filter-btn">
                                    APPLY
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid col-md-10 col-sm-12 seat-booking-form">
                    <div class="seat-booking-form-dt">
                        <div class="seat-booking-form-dt-header">
                            <div class="col-md-6 seat-booking-form-dt-tt">
                                <h2>Thanh Buoi Bus</h2>
                                <div class="type-amt">
                                    <p class="col-md-6 type">Sleeper Bus</p>
                                    <p class="col-md-6 amt">14 Seats Left</p>
                                </div>
                            </div>
                            <div class="col-md-6 seat-booking-form-dt-pc">
                                <h3 class="price">270,000VND</h3>
                            </div>
                        </div>
                        <div class="seat-booking-form-dt-ct">
                            <div class="col-md-5 seat-booking-form-dt-ct-t-pt">
                                <p>6:00 AM</p>
                                <hr style="width: 200px" />
                                <div class="seat-point">
                                    <span>Select Pickup Point</span>
                                    <select class="form-select seat-point-select">
                                        <option>266, Le Hong Phong</option>
                                        <option>#</option>
                                    </select>
                                </div>
                                <div class="seat-point">
                                    <span>Select Drop Point</span>
                                    <select class="form-select seat-point-select">
                                        <option>06 Lu Gia, Da Lat</option>
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
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="disable-checkbox" />
                                                        <span class="checkmark disable-checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span> 
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
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
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
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
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
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
                                                    <label class="seat-ctn">
                                                        <input type="disable-checkbox" />
                                                        <span class="checkmark disable-checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="disable-checkbox" />
                                                        <span class="checkmark disable-checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="disable-checkbox" />
                                                        <span class="checkmark disable-checkmark"></span>
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                                <div class="seat-row">
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="disable-checkbox" />
                                                        <span class="checkmark disable-checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="checkbox" />
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="seat-ctn">
                                                        <input type="disable-checkbox" />
                                                        <span class="checkmark disable-checkmark"></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="seat-pick-btn">
                                    <input id="spt" type="submit" class="seat-pick-btn-b" value="book">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
