<%-- 
    Document   : test
    Created on : Sep 21, 2022, 4:28:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1" cellspacing="0">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Phone</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="comp" items="${list}" varStatus="loop">
                    <tr>
                        <td>${comp.companyId}</td>
                        <td>${comp.name}</td>
                        <td>${comp.phone}</td>
                    </tr>
                </c:forEach>     
            </tbody>
        </table>
    </body>
</html>
