<%-- 
    Document   : bodyImage
    Created on : Oct 22, 2018, 1:13:25 PM
    Author     : Vova
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ImageModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% ArrayList<ImageModel> imageModels = (ArrayList<ImageModel>) request.getAttribute("imageModels"); %>
    </head>
    <body>
        <% for (int j = 0; j < imageModels.size(); j++) {%>
        <a href="imageDetail?id=<%= imageModels.get(j).getId() %>" class="col-md-2 eachImage">
            <img class="insideImage" src="http://localhost:8080/FinalProject/image?id=<%= imageModels.get(j).getId()%>"/>
            <div class="imageInfo">
                <div class="rounded-avatar" 
                     style="background-image: url(http://localhost:8080/FinalProject/avatar?id=<%= imageModels.get(j).getCreatedBy().getId()%>)
                     ">  
                </div>
                <div class="imageInfo-nameTitle" >
                    <p class="imageInfo-name" ><%= imageModels.get(j).getCreatedBy().getUsername()%></p>
                    <p class="imageInfo-title"><%= imageModels.get(j).getTitle()%></h6>
                </div>
            </div>
        </a>
        <%}%>
    </body>
</html>
