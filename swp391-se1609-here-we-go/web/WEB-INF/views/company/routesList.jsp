<%-- 
    Document   : routesList
    Created on : Oct 14, 2022, 1:54:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="description">
        <meta content="Author" name="MJ Maraz">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">

        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/datatables.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Routes List</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="card-bus col-12">
                    <div class="header-title">
                        <h4 class="title-header text-left mt-3 ml-4">
                            Thanh Buoi Bus
                        </h4>
                        <p class=" routes text-left mt-3 ml-4">Routes List</p>
                    </div>
                    <div class="data_table">
                        <table id="example" class="display" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Depature</th>
                                    <th>Destination</th>
                                    <th>Bus Type</th>
                                    <th>Departure Time</th>
                                    <th>Request</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">
                                            <button type="button" class="button-delete"
                                                    onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>
                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ho Chi Minh</td>
                                    <td>Da Lat, Lam Dong</td>
                                    <td>Sleeper Bus</td>
                                    <td>7:00 AM</td>
                                    <td>

                                        <div class="button-del">

                                            <button type="button" class="button-delete" onclick="document.getElementById('pop-up').style.display = 'inline-block'">
                                                <div class="but-content">
                                                    <span class="delete">
                                                        Delete
                                                    </span>
                                                </div>
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div id="pop-up" class="pop-up">
                        <div class="pop-up-content">
                            <div class="pop-up-container">
                                <div class="ques">
                                    <div class="form-field">
                                        <input class="form-input" type="text" placeholder=" ">
                                        <label class="form-label">
                                            <i class="fa fa-question-circle-o" aria-hidden="true"></i>
                                            What is the problem with this route?
                                        </label>
                                    </div>

                                    <p class="notication">After deleting, your bus route will be no longer available on Here
                                        We Go website,
                                        Continue?</p>
                                    <div class="click">
                                        <button class="yes" type="submit">Yes</button>
                                        <button class="no" type="submit"
                                                onclick="document.getElementById('pop-up').style.display = 'none'">No</button>
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
