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
        <% String error = (String) request.getAttribute("error"); %>
    </head>
    <body>
        <% for (int j = 0; j < imageModels.size(); j++) {%>
        <a href="imageDetail" class="col-md-2 eachImage">
                <img class="insideImage" src="http://localhost:8080/FinalProject/image?id=<%= imageModels.get(j).getId()%>"/>
                <div class="imageInfo">
                    <h6><%= imageModels.get(j).getCreatedBy().getUsername()%></h6>
                    <h6><%= imageModels.get(j).getTitle()%></h6>
                </div>
        </a>
        <%}%>
        <c:if test="${error != null}">
            <input type="hidden" class="outOfImage" value="<%= error%>"/>
        </c:if>
    </body>
</html>
