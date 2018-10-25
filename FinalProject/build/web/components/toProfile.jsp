
<a href="profile?id=${param.uid}" class="profile">
    <div class="rounded-avatar"
         style="
         background-image: url(http://localhost:8080/FinalProject/image/avatar?id=${param.uid})
         ; width: 40px ; height: 40px ; border-radius: 40px">  
    </div>
    <div class="imageInfo-nameTitle" >
        <p class="imageInfo-name" style="font-size: 16px" >${param.username}</p>
        <p class="imageInfo-title" style="font-size: 13px">    ${param.date}</h6>
    </div>
</a> 

