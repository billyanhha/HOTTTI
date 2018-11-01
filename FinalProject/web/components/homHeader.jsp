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
        <form method="GET" action="search" class="searchForm">
            <i class="fas fa-search" style="color: #28A3FC ; font-size: 20px" ></i>
            <input type="text" name="query" required=""  class="form-control searchInput" id="search" placeholder="Search">
        </form>
    </div>
    <div class=" col-md-3 col-12 toProfile header-3" >
        <button type="button" class="btn btn-primary buttonUpload"  data-toggle="modal" data-target="#postModal">
            Upload image
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="profile?id=${sessionScope.user.getId()}">View profile</a>
            <a class="dropdown-item" href="logout">Logout</a>
        </div>
        <button class="header-3 profile-header" 
                type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="rounded-avatar"
                 style="background-image: url(http://localhost:8080/FinalProject/avatar?id=${sessionScope.user.getId()}) ; width: 45px ; height: 45px">  
            </div>
            ${sessionScope.user.getUsername()}
            <i  style="margin-left: 10px"
                class="fas fa-caret-down"></i>
        </button> 
    </div>
</div>
