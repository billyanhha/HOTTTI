<%-- 
    Document   : comment
    Created on : Oct 25, 2018, 12:34:43 PM
    Author     : Vova
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page import="model.CommentModel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% ArrayList<CommentModel> comments = (ArrayList<CommentModel>) request.getAttribute("comments");%>
    </head>
    <body>
        <c:if test="${comments != null }" >
            <%for (int i = 0; i < comments.size(); i++) {%>
            <div class="detail-comment-content-each">
                <jsp:include page="../components/toProfile.jsp">
                    <jsp:param name="uid" value="<%= comments.get(i).getCreatedBy().getId()%>" />
                    <jsp:param name="username" value="<%= comments.get(i).getCreatedBy().getUsername()%>" />
                </jsp:include>
                <p class="text"><%= comments.get(i).getContent()%></p>
            </div>
            <%}%>
        </c:if>
        <jsp:include page="../components/loader.jsp"/>
        <c:if test="${error != null}">
            <input type="hidden" value="outOfComment" id="outOfComment" />
        </c:if>
    </body>
</html>
