<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <title>Recover password</title>
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
    </head>
    <body>
        <div class="backgroundImage">
        </div>
        <div class="layout padding recover">

            <jsp:include page="../components/alert.jsp"/>

            <div class="loginDiv">
                <H3>Recover password</H3>
                <br/>
                <form>
                    <div class="form-group">
                        <input type="text" required="" class="form-control username"   placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <input type="email" required="" class="form-control email"   placeholder="Enter email address">
                    </div>
                    <button type="submit" id="button1" class="btn btn-block btn-primary">
                        Submit
                    </button>
                </form>
            </div>

        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/recover.js"></script>
</html>


