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
    <div class="col-md-6 col-12 header-3">
        <form style="width: 100%" >
            <input type="text" class="form-control" style="border-radius:20px;background-color: #fafafa" id="formGroupExampleInput" placeholder="Search...">
        </form>
    </div>
    <div class=" col-md-3 col-12 toProfile header-3" >
        <button class="header-3 profile-header" 
                type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Hi, 
            <div class="rounded-avatar" 
                 style="background-image: url(http://localhost:8080/FinalProject/image/avatar?id=${user.getId()})">  
            </div>
            ${user.getUsername()}
        </button> 
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="profile?id=${user.getId()}">View profile</a>
            <a class="dropdown-item" href="logout">Logout</a>
        </div>
    </div>
</div>
