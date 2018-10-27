



<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Upload image</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="POST" action="./home" enctype='multipart/form-data' >
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" name="title" placeholder="Image description">
                        <input type="file" id="inputFile" class="filePost"  name="file" accept="image/*" style="margin-top: 10px">
                        <image id="image_upload_preview" src="" class="preImage" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary postImage">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>    
