<%-- 
    Document   : otpSMS
    Created on : Oct 13, 2022, 8:36:33 AM
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
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="<c:url value="/css/style_otp.css"/>" />
    </head>
    <body>
        <main>
            <div class="container otp-box">
                <div class="row px-3">
                    <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
                        <div class="card-body">
                            <h4 class="title text-center mt-4">ENTER OTP</h4>
                            <form action="<c:url value="/user/checkPass.do"/>" class="form-box px-3" method="POST">
                                <div class="userInput">
                                    <input
                                        name="otp1"
                                        type="text"
                                        id="ist"
                                        maxlength="1"
                                        onkeyup="clickEvent(this, 'sec')"
                                        />
                                    <input
                                        name="otp2"
                                        type="text"
                                        id="sec"
                                        maxlength="1"
                                        onkeyup="clickEvent(this, 'third')"
                                        />
                                    <input
                                        name="otp3"
                                        type="text"
                                        id="third"
                                        maxlength="1"
                                        onkeyup="clickEvent(this, 'fourth')"
                                        />
                                    <input
                                        name="otp4"
                                        type="text"
                                        id="fourth"
                                        maxlength="1"
                                        onkeyup="clickEvent(this, 'fifth')"
                                        />
                                    <input
                                        name="otp5"
                                        type="text"
                                        id="fifth"
                                        maxlength="1"
                                        onkeyup="clickEvent(this, 'sixth')"
                                        />
                                    <input name="otp6" type="text" id="sixth" maxlength="1" />
                                </div>
                                <div class="mb-3">
                                    <input type="submit" class="btn btn-block" value="confirm"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div
        </main>
        <script type="text/javascript">
            function clickEvent(first, last) {
                if (first.value.length) {
                    document.getElementById(last).focus();
                }
            }
        </script>
    </body>
</html>
