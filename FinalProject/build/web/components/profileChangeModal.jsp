

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="changeProfile" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog" 
         style="top: 30%;"
         role="document">
        <div class="modal-content" style="border-radius: 12px" >
            <c:choose>
                <c:when test="${user.email eq null}" >
                    <a href="changeEmail?uid=${sessionScope.user.id}" class="changeModalLink" >Add email</a>
                    </c:when>
                    <c:otherwise>
                    <a href="changeEmail?uid=${sessionScope.user.id}&email=${user.email}" class="changeModalLink" >Change email</a>
                </c:otherwise>
            </c:choose>
            <a href="changePassword?uid=${sessionScope.user.id}" class="changeModalLink">Change password</a>
        </div>
    </div>
</div>    
