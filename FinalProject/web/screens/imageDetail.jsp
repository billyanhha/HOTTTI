<%-- 
    Document   : login
    Created on : Oct 15, 2018, 1:59:56 PM
    Author     : Vova
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<%@page import="model.CommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ImageModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <title>Detail</title>
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
        <% ImageModel image = (ImageModel) request.getAttribute("image");%>
    </head>
    <body>

        <jsp:include page="../components/facebookShare.jsp"/>
        <jsp:include page="../components/deleteModal.jsp"/>
        <jsp:include page="../components/deleteComment.jsp"/>
        <jsp:include page="../components/editModal.jsp">
            <jsp:param name="title" value="<%= image.getTitle()%>" />
        </jsp:include>
        <input type="hidden" id="id" value="<%= request.getParameter("id")%>"/>
        <input type="hidden" id="comment" value="${commentNum}"/>
        <div class="padding backgroundColor" style="min-height: 100%" >
            <div class="detail-div">

                <a href="home"  class="btn btn-primary backButton">
                    <i class="fas fa-chevron-left"></i>
                    Home
                </a>

                <div class="detail-div-in">

                    <div style="width: 100%; display: flex ; flex-direction: row ; justify-content: space-between ; align-items: center">
                        <div style="display: flex; flex-direction: row ; align-items: center" >
                            <jsp:include page="../components/toProfile.jsp">
                                <jsp:param name="uid" value="<%= image.getCreatedBy().getId()%>" />
                                <jsp:param name="username" value="<%= image.getCreatedBy().getUsername()%>" />
                                <jsp:param name="date" value="<%= image.getCreatedAt()%>" />
                            </jsp:include>
                            <c:if test="${image.getCreatedBy().getId() eq sessionScope.user.id }" >
                                <button class="profile-header" style="; margin-left: 10px"
                                        type="button" id="edit" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-chevron-circle-down" style="color: #333 " ></i>
                                </button> 
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" data-toggle="modal" data-target="#editModal">Edit</a>
                                    <a class="dropdown-item" title="Confirm" data-toggle="modal" data-target="#deleteModal">Delete</a>
                                </div>
                            </c:if>
                        </div>
                        <div class="fb-share-button" 
                             data-href="http://localhost:8080/FinalProject/screens/imageDetail.jsp" data-layout="button_count" data-size="small" data-mobile-iframe="true">
                            <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share
                            </a>
                        </div>
                    </div>

                    <h5 style="margin-top: 15px; margin-bottom: 0" ><%= image.getTitle()%></h5>

                    <a href="http://localhost:8080/FinalProject/image?id=<%= image.getId()%>" download="<%= image.getTitle()%>" class="download" >
                        <img src="http://localhost:8080/FinalProject/image?id=<%= image.getId()%>" class="detail-div-image">
                    </a>

                    <div class="detail-comment">
                        <h4>Comment <span style="font-size: 18px" > ${commentNum} </span>  </h4>
                        <form method="POST">
                            <div class="input-group">
                                <textarea class="form-control custom-control commentText" rows="3"  style="resize:none ; border-radius: 0"></textarea>     
                                <button type="button" class="btn btn-primary submitComment" style="display: flex ; align-items: center ; border-radius: 0" >Send</button>
                            </div>
                        </form>
                        <div class="detail-comment-content">
                            <div class="commentShow" style="margin-top: 10px" >
                                <!--getComment-->
                            </div>
                            <c:choose >
                                <c:when test="${commentNum > 0}">
                                    <a href="" style="margin-left: 10px;" class="loadMoreComment" />Load more comment</a>
                                </c:when>
                                <c:when test="${commentNum == 0}">
                                    <h6>Be the first comment to this image</h6>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    <script type="text/javascript" src ="js/imageDetail.js" ></script>
</html>
