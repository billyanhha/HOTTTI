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
    </head>
    <body>
        <c:if test="${comments != null }" >
            <c:forEach var="comment" items="${comments}" >
                <div class="detail-comment-content-each">
                    <div style="display: flex ; flex-direction: row" >
                        <jsp:include page="../components/toProfile.jsp">
                            <jsp:param name="uid" value="${ comment.createdBy.id}"/>
                            <jsp:param name="username" value="${ comment.createdBy.username}" />
                        </jsp:include>
                        <c:if test="${comment.createdBy.id eq sessionScope.user.id }" >
                            <button style="background-color: transparent ; border: none ; cursor: pointer"
                                    type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-trash-alt" style="font-size: 13px ; color: #bababa" ></i>
                            </button> 
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <button 
                                    id="${comment.id}"
                                    class="dropdown-item openModalDelete"
                                    data-toggle="modal" data-target="#deleteCommentModal">
                                    Delete
                                    <input type="hidden" value="deleteComment?id=${comment.id}&failBack=${id}"/>
                                </button>
                            </div>
                        </c:if>
                    </div>
                    <p class="text"  >${comment.content}</p>
                </div>
            </c:forEach>
        </c:if>
        <jsp:include page="../components/loader.jsp"/>
        <c:if test="${error != null}">
            <input type="hidden" value="outOfComment" id="outOfComment" />
        </c:if>
    </body>
</html>
