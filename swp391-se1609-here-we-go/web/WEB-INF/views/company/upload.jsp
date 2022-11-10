
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="<c:url value="/css/upload_route.css"/>">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
                  integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
                  crossorigin="anonymous" referrerpolicy="no-referrer" />
            <title>Upload Route</title>
        </head>
  <body>
            <div class="ct color">
                <div class="container">
                    <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
                        <div class="img-left d-none d-md-flex"></div>
                        <div class="container-upload upload-trans">
                            <div class="body-header">
                                <h4 class="title-header text-left ml-4">
                                    Thanh Buoi Bus
                                </h4>
                            </div>
                            <header class="header-upload">Upload Form</header>
                            <div class="progress-upload">
                                <div class="step">
                                    <p>
                                        Route
                                    </p>
                                    <div class="bullet">
                                        <span>1</span>
                                    </div>
                                    <div class="check fas fa-check"></div>
                                </div>
                                <div class="step">
                                    <p>
                                        Type
                                    </p>
                                    <div class="bullet">
                                        <span>2</span>
                                    </div>
                                    <div class="check fas fa-check"></div>
                                </div>
                                <div class="step">
                                    <p>
                                        Time
                                    </p>
                                    <div class="bullet">
                                        <span>3</span>
                                    </div>
                                    <div class="check fas fa-check"></div>
                                </div>
                                <div class="step">
                                    <p>
                                        Station
                                    </p>
                                    <div class="bullet">
                                        <span>4</span>
                                    </div>
                                    <div class="check fas fa-check"></div>
                                </div>
                            </div>
                            <div class="form-outer">
                                <form action="<c:url value="/company/upload.do"/>" method="post">
                                    <div class="page slide-page">
                                        <div class="title">
                                            Select Route:
                                        </div>
                                        <div class="field-form">
                                            <div class="label">
                                                From
                                            </div>
  <div class="select-from">
                                                <select id="cityfrom" name="cityfrom">
                                                    <option value="" selected>Select Province/City</option>
                                                </select>
                                            </div>
                                            <div class="select-from">
                                                <select  id="districtfrom"  name="districtfrom">
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
                                        <div class="field-form">
                                            <div class="label">
                                                To
                                            </div>
                                            <div class="select-from">
                                                <select  id="cityto" name="cityto">
                                                    <option value="" selected>Select Province/City</option>           
                                                </select>
                                            </div>
                                            <div class="select-from">
                                                <select id="districtto"  name="districtto">
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
                                        <div class="field-btn">
                                            <button class="firstNext next">Next</button>
                                        </div>
                                        <%
                                            if (request.getAttribute("mes") != null){
                                            %>
                                        <p style="color: red"><%= request.getAttribute("mes") %></p>
                                        <%
                                            }
                                        %>
                                        
                                    </div>
                                    <div class="page">
                                        <div class="title">
                                            Bus Type:
                                        </div>
                                        <div class="field-type">
                                            <div class="label">
                                                <input type="radio" id="47-seats" name="type-bus" class="cheked-typed" checked="checked" value="Sleeper Bus" />
                                                <label class="input-check" for="47-seats"> 52 - Sleeper Bus</label>

                                                <input type="radio" id="sleeper-bus" name="type-bus" class="cheked-typed" value="Normal Bus"/>
                                                <label class="input-check" for="sleeper-bus"> 29 - Seats Bus</label>

                                                <input type="radio" id="sleeper-room-bus" name="type-bus" class="cheked-typed" value="Sleeper Room Bus"/>
                                                <label class="input-check" for="sleeper-room-bus">20 - Sleeper Room Bus</label>
                                            </div>
                                        </div>
                                        <div class="title">
                                            Cost:
                                        </div>
                                        <div class="field-type">
                                            <div class="label">
                                                <input class="form-control" type="number" name="currency-field" id="currency-field" step="100000"
                                                       value="100000" placeholder="100.000 VND" >
                                            </div>
                                        </div>
                                        <div class="field-btn btns">
                            
                                            <button class="next-1 next">Next</button>
                                        </div>
                                    </div>
                                    <div class="page">
                                        <div class="title">
                                            Pickup Time:
                                        </div>
                                        <div class="field-form">
                                            <div class="label">
                                                <input name="startTime" class="form-control" type="datetime-local">
                                            </div>
                                        </div>
                                        <div class="field-btn btns">
                                         
                                            <button class="next-2 next">Next</button>
                                        </div>
                                    </div>

                                    <div class="page">
                                        <div class="title">
                                            Station:
                                        </div>
                                        <div class="field-form">
                                            <div class="label">
                                                Pickup Point
                                            </div>
                                            <div class="input-wrap">
                                                <input name="pickuppoint" type="text" minlength="4" class="input-field" autocomplete="off"
                                                       id="pickup-point" />
                                                <label for="fullname">Pickup Point</label>

                                            </div>
                                        </div>
                                        <div class="field-form">
                                            <div class="label drop">
                                                Drop Point
                                            </div>
                                            <div class="input-wrap">
                                                <input name="droppoint" type="text" minlength="4" class="input-field" autocomplete="off" 
                                                       id="drop-point" />
                                                <label for="fullname">Drop Point</label>

                                            </div>
                                        </div>
                                        <div class="field-btn btns">
                                            
                                            <button class="upload">Upload</button>
                                        </div>
                                        <div id="pop-up" class="pop-up-noti">
                                            <div class="popup center">
                                                <div class="icon">
                                                    <i class="fa fa-check" aria-hidden="true"></i>
                                                </div>
                                                <div class="title-check">Uploading Successfully!</div>
                                                <div class="dismiss-btn">
                                                    <button id="ok" type="submit" value="submit" class="ok">Ok</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="pop-up" class="pop-up-noti">
                                            <div class="popup-ques center">
                                                <div class="title-check">Are you sure to upload this bus? </div>
                                                <div class="dismiss-btn">
                                                    <button id="yes">Yes</button>
                                                    <button id="no">No</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
    <script src="<c:url value="/js/upload_routes.js"/>"></script>
            <script type="text/javascript">
                                                $("input[data-type='currency']").on({
                                                    keyup: function () {
                                                        formatCurrency($(this));
                                                    },
                                                    blur: function () {
                                                        formatCurrency($(this), "blur");
                                                    }
                                                });


                                                function formatNumber(n) {
                                                    // format number 1000000 to 1,234,567
                                                    return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                                                }


                                                function formatCurrency(input, blur) {
                                                    // appends $ to value, validates decimal side
                                                    // and puts cursor back in right position.

                                                    // get input value
                                                    var input_val = input.val();

                                                    // don't validate empty input
                                                    if (input_val === "") {
                                                        return;
                                                    }

                                                    // original length
                                                    var original_len = input_val.length;

                                                    // initial caret position 
                                                    var caret_pos = input.prop("selectionStart");

                                                    // check for decimal
                                                    if (input_val.indexOf(".") >= 0) {

                                                        // get position of first decimal
                                                        // this prevents multiple decimals from
                                                        // being entered
                                                        var decimal_pos = input_val.indexOf(".");

                                                        // split number by decimal point
                                                        var left_side = input_val.substring(0, decimal_pos);
                                                        var right_side = input_val.substring(decimal_pos);

                                                        // add commas to left side of number
                                                        left_side = formatNumber(left_side);

                                                        // validate right side
                                                        right_side = formatNumber(right_side);

                                                        // On blur make sure 2 numbers after decimal
                                                        if (blur === "blur") {
                                                            right_side;
                                                        }

                                                        // Limit decimal to only 2 digits
                                                        right_side = right_side.substring(0, 2);

                                                        // join number by .
                                                        input_val = left_side + "." + right_side + " VND";

                                                    } else {
                                                        // no decimal entered
                                                        // add commas to number
                                                        // remove all non-digits
                                                        input_val = formatNumber(input_val);


                                                        // final formatting
                                                        if (blur === "blur") {
                                                            input_val = input_val + " VND";
                                                        }
                                                    }

                                                    // send updated string to input
                                                    input.val(input_val);

                                                    // put caret back in the right position
                                                    var updated_len = input_val.length;
                                                    caret_pos = updated_len - original_len + caret_pos;
                                                    input[0].setSelectionRange(caret_pos, caret_pos);
                                                }
            </script>
        </body>

    </html>