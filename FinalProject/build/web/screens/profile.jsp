<%-- 
    Document   : login
    Created on : Oct 15, 2018, 1:59:56 PM
    Author     : Vova
--%>

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

            <hr/>


            <div class="profile-div" >
                <div>
                    <h3>Ha quy anh</h3>
                    <h6>6 post</h6>
                </div>
                <div 
                    data-toggle="modal" data-target="#changeModal"
                    class="rounded-avatar changeAvatar" style="background-image: url(images/authBackground.jpg) ; width: 100px ; height: 100px ; border-radius: 100px">  
                    <p class="uploadText" >Upload <i class="fas fa-upload"></i></p>
                </div>
            </div>

            <div class="padding row" >
                <% for (int i = 0; i < 6; i++) { %>
                <div class="col-md col-sm-6 col-xs-12 ">
                    <a href="imageDetail">
                        <div class="image">
                            <img class="insideImage" src="images/43524470_390022891536572_4199342507739316224_n.jpg"/>
                            <div class="imageInfo">
                                <h6>username</h6>
                                <h6>Title</h6>
                            </div>
                        </div>
                    </a>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
