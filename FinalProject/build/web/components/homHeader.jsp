<%-- 
    Document   : homHeader
    Created on : Oct 16, 2018, 8:19:15 PM
    Author     : Vova
--%>

<div class="header row">
    <div class="col-md-3 col-12 header-3">
        <a href="home">
            <img src="images/vova.jpg" class="homeLogo" />
        </a>
    </div>
    <div class="col-md-5 col-12 header-3">
        <form style="width: 100%" class="col-md-7">
            <input type="search" class="form-control" style="border-radius:20px" id="formGroupExampleInput" placeholder="Search...">
        </form>
    </div>
    <div class=" col-md-3 col-12 toProfile header-3" >
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="profile?id=${sessionScope.user.getId()}">View profile</a>
            <a class="dropdown-item" href="logout">Logout</a>
        </div>
        <button class="header-3 profile-header" 
                type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="rounded-avatar" 
                 style="background-image: url(http://localhost:8080/FinalProject/avatar?id=${sessionScope.user.getId()})">  
            </div>
            ${sessionScope.user.getUsername()}
            <i  style="margin-left: 10px"
                class="fas fa-caret-down"></i>
        </button> 
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal">
            Upload image
        </button>
    </div>
</div>
