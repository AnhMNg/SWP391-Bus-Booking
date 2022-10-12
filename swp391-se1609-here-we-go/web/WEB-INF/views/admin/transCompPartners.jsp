<%-- 
    Document   : transCompPartners
    Created on : Oct 12, 2022, 9:08:52 PM
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
        <link rel="stylesheet" href="<c:url value="/css/style_admin.css"/>"/>
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
            />
        <title>Admin - Transportation Company Partners Panel</title>
    </head>
    <body>
        <div class="overview">
            <div class="title">
                <i class="uil uil-bus-alt"></i>
                <span class="text">My Partners</span>
            </div>
        </div>

        <div class="activity">
            <!-- Hoverable Table rows -->
            <div class="card">
                <form action="">
                    <div class="card-header tc-head">
                        <div class="col-md-6">
                            <label for="sel1" class="form-label">Sorting by</label>
                            <select
                                class="btn btn-outline-light text-dark"
                                id="sel1"
                                name="sellist1"
                                >
                                <option>A -> Z</option>
                                <option>Z -> A</option>
                                <option>The Most Routes</option>
                                <option>The Least Routes</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <div class="input-group mb-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="Transportation Company's Name"
                                    aria-label="Transportation Company's Name"
                                    aria-describedby="button-addon2"
                                    />
                                <button
                                    class="btn btn-outline-secondary tc-s-btn"
                                    type="button"
                                    id="button-addon2"
                                    >
                                    Search
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="list-group">
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Thanh Buoi Bus</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Phuong Trang Bus (Futa Bus)</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Ha Noi Rides On Time</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Sapa Dragon</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Hoang Long Bus</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Hue Tourist Bus</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Mai Linh Express Bus</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Hai Van Bus</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Interbus Lines</p>
                        </div>
                        <div class="list-group-item list-group-item-action nt-ct-group">
                            <p>Sapa Bus Lines</p>
                        </div>
                    </div>
                </form>
            </div>
            <!--/ Hoverable Table rows -->
        </div>
    </body>
</html>
