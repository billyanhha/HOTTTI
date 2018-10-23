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
        <title>Detail</title>
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
    </head>
    <body>

        <jsp:include page="../components/facebookShare.jsp"/>

        <div class="padding backgroundColor">
            <div class="detail-div">

                <a href="home"  class="btn btn-primary backButton">
                    <i class="fas fa-chevron-left"></i>
                    Home
                </a>

                <div class="detail-div-in">

                    <div style="width: 100%; text-align: right">
                        <div class="fb-share-button" 
                             data-href="http://localhost:8080/FinalProject/screens/imageDetail.jsp" data-layout="button_count" data-size="small" data-mobile-iframe="true">
                            <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share
                            </a>
                        </div>
                    </div>

                    <img src="images/e2cd971d2b0866968dc0994119ec0d12.jpg" class="detail-div-image">

                    <jsp:include page="../components/toProfile.jsp"/>

                    <hr>

                    <div class="detail-comment">
                        <h4>Comment</h4>
                        <div class="form-group">
                            <textarea class="form-control" style="resize: none;" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                        <div class="detail-comment-content">

                            <%for (int i = 0; i < 10; i++) {%>
                            <div class="detail-comment-content-each">
                                <jsp:include page="../components/toProfile.jsp"/>
                                <p class="text">What are you doing todeiWhat </p>
                            </div>
                            <%}%>

                        </div>
                    </div>


                </div>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
