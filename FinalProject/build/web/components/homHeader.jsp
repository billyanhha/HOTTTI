<%-- 
    Document   : homHeader
    Created on : Oct 16, 2018, 8:19:15 PM
    Author     : Vova
--%>

<div class="header row">
    <div class="col-md-6 col-12 header-3 row">
        <a href="home" class="col-md-3" >
            <img src="images/vova.jpg" class="homeLogo" />
        </a>
        <form style="width: 100%" class="col-md-7">
            <input type="text" class="form-control" style="border-radius:20px;background-color: #fafafa" id="formGroupExampleInput" placeholder="Search...">
        </form>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="profile?id=${user.getId()}">View profile</a>
            <a class="dropdown-item" href="logout">Logout</a>
        </div>
        <button class="header-3 profile-header col-md-2" 
                type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="rounded-avatar" 
                 style="background-image: url(http://localhost:8080/FinalProject/image/avatar?id=${user.getId()})">  
            </div>
            ${user.getUsername()}
            <i  style="margin-left: 10px"
                class="fas fa-caret-down"></i>
        </button> 
    </div>
    <div class="col-md-4 col-12 header-3">
    </div>
    <div class=" col-md-2 col-12 toProfile header-3" >
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">
            Upload image
        </button>
    </div>
</div>
