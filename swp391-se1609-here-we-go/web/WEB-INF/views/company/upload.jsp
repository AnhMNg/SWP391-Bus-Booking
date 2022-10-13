<%-- 
    Document   : upload.jsp
    Created on : Oct 13, 2022, 8:51:54 PM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
              integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
                integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Upload Routes</title>
    </head>
    <body>
        <div class="container">
            <div class="row px-3">
                <div class="col-lg-10 col-xl-9 flex-row mx-auto px-0 cd-body card-bus">
                    <div class="card-body">
                        <div class="body-header">
                            <h4 class="title-header text-left ml-4">
                                Thanh Buoi Bus
                            </h4>
                        </div>
                        <div class="content">
                            <div class="row select  ml-4">
                                <div class="col-md-4 select-header">
                                    <p>Select Route</p>
                                </div>
                                <div class="col-md-4 from">
                                    <p class="select-title">From</p>
                                    <div class="select-from">
                                        <select name="format" id="format">
                                            <option selected disabled>Choose Departure</option>
                                            <option value="hcm"> Ho Chi Minh City</option>
                                            <option value="dalat">Da Lat, Lam Dong</option>
                                            <option value="cantho">Can Tho</option>
                                            <option value="danang">Da Nang</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 to">
                                    <p class="select-title">To</p>
                                    <div class="select-from">
                                        <select name="format" id="format">
                                            <option selected disabled>Choose Departure</option>
                                            <option value="hcm">Ho Chi Minh City</option>
                                            <option value="dalat">Da Lat, Lam Dong</option>
                                            <option value="cantho">Can Tho</option>
                                            <option value="danang">Da Nang</option>
                                        </select>
                                    </div>

                                </div>
                            </div>
                            <div class="type-of-bus row ml-4">
                                <div class="col-md-4 select-header">
                                    <p>Bus Type</p>
                                </div>
                                <div class="col-md-8 select-type">
                                    <label class="input-check"><input type="checkbox" name="">   47 Seats</label>
                                    <label class="input-check"><input type="checkbox" name="">   Sleeper Bus</label>
                                    <label class="input-check"><input type="checkbox" name="">   Sleeper Room Bus</label>
                                </div>

                            </div>
                            <div class="row select-time ml-4">
                                <div class="col-md-4 select-header">
                                    <p>Pickup Time</p>
                                </div>
                                <div class="col-md-8 select-type-time">
                                    <label class="input-check"><input type="checkbox" name="">   Morning (6 AM to 11 AM)</label><br>
                                    <label class="input-check"><input type="checkbox" name="">   Afternoon (11 AM to 6 PM)</label><br>
                                    <label class="input-check"><input type="checkbox" name="">   Evening (6 PM to 11 PM)</label><br>
                                    <label class="input-check"><input type="checkbox" name="">   Night (11 PM to 6 AM)</label>
                                </div>

                            </div>
                            <div class="button-upload ml-4">
                                <a href="#" id="open-popup-btn" class="upload btn-2">Upload</a>
                            </div>
                            <div id="pop-up" class="pop-up-noti">
                                <div class="popup center">
                                    <div class="icon">
                                        <i class="fa fa-check" aria-hidden="true"></i>
                                    </div>
                                    <div class="title-check">Uploading Successfully!</div>
                                    <div class="dismiss-btn">
                                        <button id="ok" class="ok">Ok</button>
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
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
