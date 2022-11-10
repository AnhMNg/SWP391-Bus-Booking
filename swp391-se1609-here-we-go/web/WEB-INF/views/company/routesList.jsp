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
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <!----======== CSS ======== -->
        <link rel="stylesheet" href="<c:url value="/css/route_list.css"/>" />

        <!----===== Iconscout CSS ===== -->
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
            />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link
            href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"
            rel="stylesheet"
            />
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <title>Routes List</title>
    </head>
    <body>
        <div class="container" style="padding-top: 150px; min-height: 100vh;">
            <div class="activity">
                <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                    <thead>
                        <tr>
                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Bus Type</th>
                            <th>Departure Time</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Ho Chi Minh</td>
                            <td>Da Lat, Lam Dong</td>
                            <td>Sleeper Bus</td>
                            <td>7:00 AM</td>
                            <td>
                                <button
                                    class="btn btn-danger"
                                    data-bs-toggle="modal"
                                    data-bs-target="#myModal"
                                    >
                                    Delete
                                </button>
                            </td>
                        </tr>

                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Departure</th>
                            <th>Destination</th>
                            <th>Bus Type</th>
                            <th>Departure Time</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content pay-modal">
                        <!-- Modal Header -->

                        <!-- Modal body -->
                        <div class="modal-body pay-cf-msg">
                            Do you want to delete this route?
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <div class="pay-cf">
                                <input
                                    type="submit"
                                    value="Yes"
                                    class="pay-cf-btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#myModalPaying"
                                    />
                                <button
                                    type="button"
                                    class="pay-cf-btn"
                                    data-bs-dismiss="modal"
                                    >
                                    NO
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
