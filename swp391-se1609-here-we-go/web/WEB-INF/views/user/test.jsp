<%-- 
    Document   : basketball_info
    Created on : Jul 4, 2022, 9:50:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/css/styleindex.css"/>" rel="stylesheet" />
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/bootstrap.bundle.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">       
        <link href="<c:url value="/html/styleindex.css" />" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value="/css/button.css"/>">
        <script>
            function checkSize() {
                var x = document.getElementById("sell").value;
                document.getElementById("size").innerHTML = x;
            }
            function checkQuantity() {
                var x = document.getElementById("qtn").value;
                document.getElementById("quantity").innerHTML = x;
            }
        </script>
        <title>Basketball Shoes Page</title>
    </head>
    <body>
        <form action="<c:url value="/shoes/basketball_info.do"/>">
            <div style="width: 100vw; display: flex; align-items: center; justify-content: right;" class="container">
                <div>
                    <input type="text" placeholder="Search" class="search" name="searchText" value="${searchText}">
                    <button type="submit" class="button-1" name="op" value="search">Search</button>
                </div>
            </div>
        </form>
        <br/>
        <div style="width: 100vw " class="container">
            <div class="row">
                <c:if test="${empty list}">
                    <i>No products are available</i>
                </c:if>
                <c:forEach var="shoes" items="${list}">
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <form action="<c:url value="/shoes/basketball_info.do"/>">
                            <div class="card" style="width:100%">
                                <img class="card-img-top" src="<c:url value="/image/${shoes.img}"/>" alt="Card image" style="width:100%">
                                <div class="card-body">
                                    <h4 class="card-title">${shoes.name}</h4>
                                    <h5 class="card-text">${shoes.price}$</h5>
                                    <div class="form-floating">
                                        <select class="form-select" id="sel1" name="size">
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>
                                        <label for="sel1" class="form-label">Select size (US):</label>
                                    </div>
                                    <br/>
                                    <div class="form-floating">
                                        <select class="form-select" id="qtn" name="quantity">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>
                                        <label for="sel1" class="form-label">Quantity:</label>
                                    </div>
                                    <br/>
                                    <input type="hidden" name="id" value="${shoes.shoeId}"/>
<!--                                    <input type="hidden" id="size" name="size" value="${shoes.size}"/>-->
                                    <button type="submit" onclick="checkSize()" name="op" value="addToCart" class="btn btn-dark">Add to Cart</button>
                                </div>
                            </div>
                        </form>
                        <br>
                    </div>
                </c:forEach> 
            </div>   
        </div>
    </body>
</html>