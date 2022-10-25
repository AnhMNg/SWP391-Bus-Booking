<%-- 
    Document   : receipt
    Created on : Oct 24, 2022, 11:11:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Receipt</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style type="text/css">
            table {
                border: 0
            }
            table td {
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div align="center">
            <h1>Payment Done. Thank you for purchasing our products</h1>
            <table>
                <tr>
                    <td>Merchant: </td>
                    <td>Here We Go Co.</td>
                </tr>
                <tr>
                    <td>Payer: </td>
                    <td>${payer.firstName} ${payer.lastName}</td>
                </tr>
                <tr>
                    <td>Description: </td>
                    <td>${transaction.description}</td>
                </tr>
                <tr>
                    <td>Total: </td>
                    <td>${transaction.amount.total}</td>
                </tr>
                <tr><td><br/></td></tr>
            </table>
        </div>
    </body>
</html>
