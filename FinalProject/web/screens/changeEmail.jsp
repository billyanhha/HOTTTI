<%-- 
    Document   : changeEmail
    Created on : Nov 8, 2018, 1:24:27 PM
    Author     : Vova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <title>Change email</title>
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
    </head>
    <body>
        <div class="padding backgroundColor" style="min-height: 100% ; display: flex" >
            <input type="hidden" class="uid" value="${param.uid}"/>
            <input type="hidden" class="oldmail" value="${param.email}"/>
            <div class="detail-div">
                <a href="profile?id=${param.uid}"  class="btn btn-primary backButton">
                    <i class="fas fa-chevron-left"></i>
                    Profile
                </a>
                <jsp:include page="../components/alert.jsp"/>
                <div class="setting">
                    <div class="header-3" >
                        <div class="rounded-avatar"
                             style="background-image: url(http://localhost:8080/FinalProject/avatar?id=${sessionScope.user.getId()}) ; width: 45px ; height: 45px">  
                        </div>
                        <span style="font-size: 20px ; font-weight: normal" >${sessionScope.user.getUsername()}</span>
                    </div> 
                    <br/>
                    <form>
                        <div class="form-group">
                            <p>Password </p>
                            <input type="password" class="form-control password">
                        </div>
                        <div class="form-group">
                            <p for="pwd">New email </p>
                            <input type="email" placeholder="${param.email}" class="form-control email">
                        </div>
                        <button type="submit"  id="button1" class="btn btn-block btn-primary">Change</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/changeEmail.js"></script>
</html>
