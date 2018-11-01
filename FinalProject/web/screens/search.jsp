<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="gui.component.Pagger"%>
<%@page import="model.AuthModel"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <title>Search</title>
        <link rel="icon" href="images/icon.jpg"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link rel="stylesheet" href="style/styles.css"/>
        <%
          int pageIndex = (Integer) request.getAttribute("pageIndex");
          int maxPage = (Integer) request.getAttribute("maxPage");
        %>
    </head>
    <body>
        <div class="container-fluid home">

            <jsp:include page="../components/homHeader.jsp"/>
            <jsp:include page="../components/postModal.jsp"/>

            <hr/>
            <div class="padding2">
                <h3>${requestScope.rowCount} Search result for "${param.query}"</h3>
                <c:forEach var="user" items="${resultSearch}">
                    <div class="profile-search-div row">
                        <div 
                            class="rounded-avatar"
                            style="
                            background-image: url(http://localhost:8080/FinalProject/avatar?id=${user.id})
                            ;height: 150px ; width: 150px  ; border-radius: 100px">  
                        </div>
                        <div class="col-md-2 col-12" style="margin-left: 5px ; display: flex ; justify-content: space-around ; flex-direction: column" >
                            <a class="search-user-link" href="profile?id=${user.id}" >${user.username}</a>
                            <h6>${user.fullname}</h6>
                        </div>
                    </div>
                </c:forEach>

                <center><%=Pagger.generate(pageIndex, 2, maxPage, "search?query="+ request.getParameter("query")  )%></center>
                <hr/>
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
    <script type="text/javascript" src="js/search.js"></script>
</html>
