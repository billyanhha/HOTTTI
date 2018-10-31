
<div class="profile">
    <div class="rounded-avatar"
         alt="${param.id}"
         onerror="this.src='images/defaultUser.jpg'"
         style="
         background-image: url(http://localhost:8080/FinalProject/avatar?id=${param.uid});
         width: 40px ; height: 40px ; border-radius: 40px">  
    </div>
    <div class="imageInfo-nameTitle" >
        <a href="profile?id=${param.uid}" class="imageInfo-name" style="font-size: 16px" >${param.username}</a>
        <p class="imageInfo-title" style="font-size: 13px">    ${param.date}</h6>
    </div>
</div> 

