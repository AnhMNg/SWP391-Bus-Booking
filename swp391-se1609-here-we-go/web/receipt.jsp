<%-- 
    Document   : receipt
    Created on : Oct 24, 2022, 11:11:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>PayPal</title>
        <!-- google Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet"
            />
        <!-- My Style -->
        <link rel="stylesheet" href="<c:url value="/css/receipt.css"/>" />
    </head>
    <body>
        <div class="main-content">
            <div class="invoice-container">
                <div class="top">
                    <div class="top-left">
                        <img src="<c:url value="/images/paypalicon.png"/>" alt="" />
                    </div>
                    <div class="top-right">
                        <p id="p1"></p>
                        <script>
                            var date = new Date();
                            var current_date =
                                    date.getFullYear() +
                                    "-" +
                                    (date.getMonth() + 1) +
                                    "-" +
                                    date.getDate();
                            var current_time =
                                    date.getHours() +
                                    ":" +
                                    date.getMinutes() +
                                    ":" +
                                    date.getSeconds();
                            var date_time = current_date + " " + current_time;
                            document.getElementById("p1").innerHTML = date_time;
                        </script>
                    </div>
                </div>
                <div class="bill-box">
                    <div class="left">
                        <div class="text-m">Merchant:</div>
                        <div class="title">Here We Go Co.</div>
                        <div class="addr">
                            Lot E2a-7, D1 Street, ROAD. D1, Long Thanh My, Thu Duc City, Ho Chi Minh City
                        </div>
                    </div>
                </div>
                <form action="">
                    <div class="table-bill">
                        <table class="table-service">
                            <thead>
                            <th class="quantity">Payer</th>
                            <th>Service</th>
                            <th class="cost">Sub-total</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${payer.firstName} ${payer.lastName}</td>
                                    <td>${transaction.description}</td>
                                    <td class="cost">${transaction.amount.total}</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr class="total">
                                    <td class="name">Total</td>
                                    <td colspan="2" class="number">${transaction.amount.total}</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="actions">
                        <input type="submit" class="btn btn-main" value="Pay Now">
                    </div>    
                </form>

                <div class="note">
                    <p>Thank You for working with us!</p>
                </div>
            </div>
        </div>
    </body>
</html>
