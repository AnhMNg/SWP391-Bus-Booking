<%-- 
    Document   : transCompPartners
    Created on : Oct 12, 2022, 9:08:52 PM
    Author     : Admin
--%>

<%@page import="manager.CompanyManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Company"%>
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

                <form action="<c:url value="/admin/search.do"/>" method="post">   
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
                                    name ="nameCom"
                                    type="text"
                                    class="form-control"
                                    placeholder="Transportation Company's Name"
                                    aria-label="Transportation Company's Name"
                                    aria-describedby="button-addon2"
                                    />
                                <input type="submit" value="search"  class="btn btn-outline-secondary tc-s-btn"
                                       type="button"
                                       id="button-addon2"  />

                            </div>


                        </div>

                    </div>
                </form>

                <div class="list-group">
                    <form action="<c:url value="/company/infoFind.do"/>" method="POST">
                        <%
                            ArrayList<Company> listSearch = (ArrayList<Company>) request.getAttribute("listSearch");
                            if (listSearch == null) {
                                ArrayList<Company> listcom = CompanyManager.getAllCompany();
                                for (Company company : listcom) {
                        %>  <label for="<%=  company.getCompanyId()%>" class="list-group-item list-group-item-action"><%= company.getName()%></label>
                        <input id="<%=  company.getCompanyId()%>" type="submit" hidden  name="comP" value="<%=  company.getCompanyId()%>"/>
                        <%

                            }
                        } else if (listSearch.size() > 0) {
                            for (Company company : listSearch) {
                        %>  <label for="<%=  company.getCompanyId()%>" class="list-group-item list-group-item-action"><%= company.getName()%></label>
                        <input id="<%=  company.getCompanyId()%>" type="submit" hidden  name="comP" value="<%=  company.getCompanyId()%>"/><%

                            }
                        } else {
                        %>
                        <p>Don't find your company</p>
                        <%
                            }

                        %>
                    </form>

                </div>
            </div>
            <!--/ Hoverable Table rows -->
        </div>
    </body>
</html>
