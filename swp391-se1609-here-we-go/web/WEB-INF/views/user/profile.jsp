<%-- 
    Document   : profile
    Created on : Sep 28, 2022, 9:01:40 PM
    Author     : Admin
--%>
<%@page import="model.User"%>
<%@page import="manager.UserManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="<c:url value="/css/profile_user.css"/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"><link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Roboto:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
              integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
                integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <title>User Profile Page</title>
    </head>
    <body>
        <%
            String phone = (String) session.getAttribute("LOGIN_CUSTOMER_PHONE");
            User user = UserManager.getUserByPhone(phone);
        %>
        <main >
            <div class="  profile profile-body">
                <form action="<c:url value="/user/edit.do"/>"  method="post" enctype="multipart/form-data">
                    <div class="content">
                        <div class="profile-detail">
                            <div class="profile-col">
                                <div class="profile-content">
                                    <div class="profile-photo">
                                        <div class="photo">
                                            <img name="userDisplay" src="<c:url value="/uploads/${sessionScope.LOGIN_CUSTOMER_IMG}"/>" " class="user-photo" id="user-photo" value="">
                                        </div>
                                        <span class="avatar">
                                            <img src="<c:url value="/images/Edit Square.png"/>" class="upload-photo" >
                                            <input type="file" name="userDisplayPic" accept=".jpg,.jpeg,.bmp,.gif,.png,.PNG,.JPG,.JPEG,.BMP,.GIF" class="inputUpload" id="inputUpload" value="">
                                        </span>
                                    </div>
                                    <div class="profile-name">
                                        <p class="name">${sessionScope.LOGIN_CUSTOMER_NAME}</p>
                                        <p class="personal-profile">PERSONAL PROFILE</p>
                                    </div>
                                    <ul class="sideBarNav">
                                        <li class="profile-attribute">
                                            <a class="bar-nav-icon" href="#profile"><img src="<c:url value="/images/Profile.png"/>" class="profile-img">Profile</a>
                                        </li>
                                        <li class="profile-attribute">
                                            <a class="bar-nav-icon" href="#login-detail"><img src="<c:url value="/images/3580168.png"/>" class="profile-img">Login
                                                Detail</a>
                                        </li>
                                        <li class="profile-attribute">
                                            <a class="bar-nav-icon" href="<c:url value="/user/logout.do"/>"><img src="<c:url value="/images/3580175.png"/>" class="logout">Logout</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="profile-detail-2">
                            <div class="progess-profile">
                                <div class="profile-slogan">
                                    <div class="profile-box">
                                        <img class="box-img" src="<c:url value="/images/2206_w037_n003_436b_p1_436.jpg"/>">
                                        <div class="box-detail">
                                            <h5 class="line anim-typewriter">Get the best out of <span class="project-name"> HereWeGo</span></h5>
                                            <h5 class="line anim-typewriter">by adding the remaining details!</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <section id="profile">
                                <div class="profile-page-1">
                                    <div class="profile-header">
                                        <div>
                                            <h4>Profile</h4>
                                            <p>Basic info, for a faster booking experience</p>
                                        </div>
                                        <div>
                                            <button type="button" class="edit-profile" id="edit-profile">
                                                <span class="edit-icon"><i class="fa-regular fa-pen-to-square"></i></span>
                                                Edit
                                            </button>
                                        </div>
                                    </div>
                                    <ul class="information-list">
                                        <li class="information-item">
                                            <div class="information-content-first">
                                                <span class="information-name">Name</span>
                                                <span class=" mr-2 information-detail text-break d1">${sessionScope.LOGIN_CUSTOMER_NAME}</span>
                                            </div>
                                        </li>
                                        <li class="information-item">
                                            <div class="information-content">
                                                <span class="information-name">Gender</span>
                                                <%
                                                    if (user.getGender() == null) {
                                                %>
                                                <span class=" mr-2 add-button" id="add-button">+ Add</span>
                                                <% } else {%>
                                                <span class=" mr-2 information-detail text-capitalize"><%= user.getGender()%></span>
                                                <% }%>
                                                
                                            </div>
                                        </li>
                                        <li class="information-item">
                                            <div class="information-content">
                                                <span class="information-name">Status</span>
                                                <span class=" mr-2 information-detail text-break d1"><%= UserManager.getTypeOfUser(user.getUserId())%></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </section>
                            <section id="login-detail">
                                <div class="login-detail-profile">
                                    <div class="detail-information">
                                        <div class="profile-style">
                                            <h4>Login Details</h4>
                                            <p>Manage your email address mobile number and password</p>
                                        </div>
                                    </div>
                                    <ul class="information-list">
                                        <li class="information-item">
                                            <div class="information-content-first">
                                                <span class="information-name">Mobile Number</span>
                                                <%  if (user.getPhone() != null) {%>
                                                <span class=" mr-2 information-value">${sessionScope.LOGIN_CUSTOMER_PHONE}</span>
                                                <% } else { %>
                                                <span class=" mr-2 add-button" id="add-button">+ Add</span>
                                                <% } %>
                                            </div>
                                        </li>
                                        <li class="information-item">
                                            <div class="information-content">
                                                <span class="information-name">Email ID</span>

                                                <span class=" mr-2 information-detail text-break d2">${sessionScope.LOGIN_EMAIL}</span>
                                                <%
                                                    String email = (String) request.getSession().getAttribute("LOGIN_EMAIL");
                                                    if (email == "" || email == null || email.equals("")) {
                                                %>
                                                <span class=" mr-2 add-button" id="add-button">+ Add</span>
                                                <% } else {
                                                %>            
                                                <span class="check-verified">
                                                    <span class="verified"></span>Verified
                                                </span>
                                                <% }%>
                                            </div>
                                        </li>
                                        <li class="information-item">
                                            <div class="information-content">
                                                <span class="information-name">Password</span>
                                                <span class=" mr-2 information-detail text-break d1">******</span>
                                                <a class="change-profile-password text-decoration-none" href="<c:url value="/user/changePassProfile.do"/>">Change Password?</a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </section>
                        </div>


                    </div>

                    <div id="pop-up" class="pop-up-profile">
                        <div class="popup-ques center">
                            <div class="title-check">Edit Profile </div>
                            <div class="profile-input">
                                <p class="input-name">Full Name<span class="redText">*</span></p>
                                <div class="input-wrap">
                                    <input type="text" minlength="4" class="input-field" autocomplete="off" id="fullname" required="required"
                                           name="newName" value="${sessionScope.LOGIN_CUSTOMER_NAME}"/>
                                    <label for="fullname">Name </label>

                                </div>
                            </div>
                            <div class="gender-select">
                                <p class="input-name">Gender</p>
                                <div class="dropdown-profile">
                                    <input type="text" class="profile-textbox text-capitalize " placeholder="Gender" readonly  name="gender" value="<%= user.getGender()%>">
                                    <div class="option">
                                        <div class="profile-gender" onclick="show('Man')"><i class="fa-solid fa-mars"></i>Man</div>
                                        <div class="profile-gender" onclick="show('Woman')"><i class="fa-solid fa-venus"></i>Woman</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mobile-input">
                                <p class="input-name">Mobile Number</p>
                                <div class="phone-add">
                                    <span class="icon-password"><i class="fa-solid fa-phone"></i></span>
                                    <input class="phone-input" type="text" name="newPhone" placeholder="Enter Mobile Number" required value="${ sessionScope.LOGIN_CUSTOMER_PHONE}">
                                </div>
                            </div>
                            <div class="mobile-input">
                                <p class="input-name">Email ID</p>
                                <div class="phone-add">
                                    <span class="icon-password"><i class="fa-solid fa-envelope"></i></span>
                                    <input class="phone-input" type="email" name="newEmail" placeholder="Enter Email ID"  value="">
                                </div>
                            </div>
                            <div class="dismiss-btn">
                                <button id="yes" type="submit">Save</button>
                                <button id="no">Cancel</button>
                            </div>
                        </div>
                    </div>


                    <div class="profile-button">
                        <button class="save-button" type="submit">
                            <span class="save"></span>
                            <span class="save"></span>
                            <span class="save"></span>
                            <span class="save"></span>
                            Update
                        </button>
                    </div>         
                </form>
            </div>
        </div>
    </main>
    <script src="<c:url value="/js/user_profile.js"/>" type="text/javascript"></script>
</body>
</html>

