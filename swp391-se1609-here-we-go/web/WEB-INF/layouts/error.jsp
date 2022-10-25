<%-- 
    Document   : error
    Created on : Oct 24, 2022, 9:09:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 Error Page | CodingNepal</title>
        <link rel="stylesheet" href="<c:url value="/css/error.css"/>">
    </head>
    <body>
        <div id="error-page">
            <div class="content">
                <h2 class="header" data-text="404">
                    404
                </h2>
                <h4 data-text="Opps! Page not found">
                    Opps! Page not found
                </h4>
                <p>
                    Sorry, the page you're looking for doesn't exist. If you think something is broken, report a problem.
                </p>
                <div class="btns">
                    <a href="">return home</a>
                    <a href="">report problem</a>
                </div>
            </div>
        </div>
    </body>
</html>
