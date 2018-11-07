<%-- 
    Document   : login
    Created on : Oct 15, 2018, 1:59:56 PM
    Author     : Vova
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <title>Profile</title>
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="../components/homHeader.jsp"/>
            <jsp:include page="../components/changeAvatar.jsp"/>
            <jsp:include page="../components/postModal.jsp"/>
            <hr/>
            <input type="hidden" id="uid" value="${param.id}"/>
            <input type="hidden" id="username" value="${user.username}"/>
            <div class="profile-div" >
                <c:choose>
                    <c:when test = "${param.id eq sessionScope.user.id}">
                        <div 
                            data-toggle="modal" data-target="#changeModal"
                            class="rounded-avatar changeAvatar"
                            style="
                            background-image: url(http://localhost:8080/FinalProject/avatar?id=${param.id})
                            ;width: 160px ; height: 160px ; border-radius: 100px">  
                            <p class="uploadText" >Upload</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div 
                            class="rounded-avatar"
                            style="
                            background-image: url(http://localhost:8080/FinalProject/avatar?id=${param.id})
                            ;width: 160px ; height: 160px ; border-radius: 100px">  
                        </div>
                    </c:otherwise>
                </c:choose>
                <div>
                    <p class="profile-div-username" >${user.username}</p>
                    <h5>${requestScope.userImage} Post</h5>
                    <p class="profile-div-fullname">${user.fullname}</p>
                </div>
            </div>

            <div class="grid  row" id="imageContainer">
            </div>
            <jsp:include page="../components/loader.jsp"/>

            <input type="hidden" class="userImage" value=${requestScope.userImage} />
            <c:if test="${requestScope.userImage > 0}">
                <center> <h3 class="showError">  </h3> </center>
                </c:if>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.5.0/lodash.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="js/profile.js"></script>
</html>
