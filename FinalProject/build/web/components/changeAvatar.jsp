<%-- 
    Document   : changeAvatar
    Created on : Oct 17, 2018, 10:12:29 PM
    Author     : Vova
--%>

<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Change avatar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="avatar?id=${param.id}" method="POST" enctype='multipart/form-data'>
                <div class="modal-body">
                    <input type="file" name="avatar" accept="image/*" class="form-control-file" id="avatarFile" style="margin-top: 10px">
                    <image id="image_upload_preview" src="" class="preImage" />
                    <input type="hidden" name="uid" value="${sessionScope.user.id}">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary submitChangeAva">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>    
