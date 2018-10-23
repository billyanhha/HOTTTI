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
            <form>
                <div class="modal-body">
                    <form>
                        <!--                        <div class="rounded-avatar changeAvatar" style="background-image: url(images/authBackground.jpg) ; width: 100px ; height: 100px ; border-radius: 100px">  
                                                    <input type="file" class="input-change" name="pic" accept="image/*">
                                                    </input>
                                                    <p class="uploadText" >Upload image <i class="fas fa-upload"></i></p>
                                                </div>-->
                        <input type="file" name="pic" accept="image/* class="form-control-file" id="exampleFormControlFile1" style="margin-top: 10px">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>    
