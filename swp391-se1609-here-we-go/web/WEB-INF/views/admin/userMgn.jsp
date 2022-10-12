<%-- 
    Document   : userMgn
    Created on : Oct 12, 2022, 9:00:38 PM
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
        <title>Admin - User Management Panel</title>
    </head>
    <body>
        <div class="overview">
            <div class="title">
                <i class="uil uil-clipboard-notes"></i>
                <span class="text">User Management</span>
            </div>
        </div>

        <div class="activity">
            <table id="example" class="table table-hover table-responsive-md" style="width: 100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Account Creation Date</th>
                        <th>Number Of Tickets Purchased</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Tiger Nixon</td>
                        <td>2011-04-25</td>
                        <td>2</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Garrett Winters</td>
                        <td>2011-07-25</td>
                        <td>5</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Ashton Cox</td>
                        <td>2009-01-12</td>
                        <td>3</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Cedric Kelly</td>
                        <td>2012-03-29</td>
                        <td>6</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>Airi Satou</td>
                        <td>2008-11-28</td>
                        <td>3</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>Brielle Williamson</td>
                        <td>2012-12-02</td>
                        <td>8</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>Herrod Chandler</td>
                        <td>2012-08-06</td>
                        <td>5</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>Rhona Davidson</td>
                        <td>2010-10-142</td>
                        <td>8</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>Colleen Hurst</td>
                        <td>2009-09-15</td>
                        <td>4</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>Sonya Frost</td>
                        <td>2008-12-13</td>
                        <td>4</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td>Jena Gaines</td>
                        <td>2008-12-19</td>
                        <td>10</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>12</td>
                        <td>Quinn Flynn</td>
                        <td>2013-03-03</td>
                        <td>8</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>13</td>
                        <td>Charde Marshall</td>
                        <td>2008-10-16</td>
                        <td>9</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>14</td>
                        <td>Haley Kennedy</td>
                        <td>2012-12-18</td>
                        <td>7</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>15</td>
                        <td>Tatyana Fitzpatrick</td>
                        <td>2010-03-17</td>
                        <td>19</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>16</td>
                        <td>Michael Silva</td>
                        <td>2012-11-27</td>
                        <td>3</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>17</td>
                        <td>Paul Byrd</td>
                        <td>2010-06-09</td>
                        <td>4</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>18</td>
                        <td>Gloria Little</td>
                        <td>2009-04-10</td>
                        <td>11</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>19</td>
                        <td>Bradley Greer</td>
                        <td>2012-10-13</td>
                        <td>8</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>Dai Rios</td>
                        <td>2012-09-2</td>
                        <td>5</td>
                        <td>
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Account Creation Date</th>
                        <th>Number Of Tickets Purchased</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </body>
</html>
