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
        <title>Sign Up</title>
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
    </head>
    <body>
        <div class="backgroundImage">
        </div>
        <div class="layout padding">
            <div class="loginDiv">

                <jsp:include page="../components/alert.jsp"/>

                <img src="images/vova.jpg" class="authLogo" />
                <h6 class="inspire" style="margin-bottom: 15px" >
                    Create an account to join the big community
                </h6>
                <form>
                    <div class="form-group">
                        <input type="text" id="username" name="username" required class="username form-control"  placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <input type="text" id="fullname" name="fullname"  required class="form-control"  placeholder="Enter fullname">
                    </div>
                    <div class="form-group">
                        <input type="password" id="password" name="password"  required class="form-control"  placeholder="Enter password">
                    </div>
                    <div class="form-group">
                        <input type="password" id="cfpassword" name="cfpassword" required class="form-control"  placeholder="Confirm Password">
                    </div>
                    <button type="submit" id="signUpButton" class="btn btn-block btn-primary">Submit</button>
                </form>
                <span class="smallText">By clicking sumbit , you're agreed with our 
                    <span class="term" >Term & Service</span>
                    and
                    <span class="term">Policy</span>
                </span>
                <hr/>
                <span class="smallText">Already have an account ?
                    <a href="login" class="term">Login</a>
                </span>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/signUp.js"></script>
</html>
