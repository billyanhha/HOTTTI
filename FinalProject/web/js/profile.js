/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global _ */

let index = 1;
let continueLoad = true;

$(document).ready(() => {
    loadingResources();
});


const loadingResources = () => {
    uploadAvatar();
    uploadImage();
    let pageSize = 20;
    loadData(pageSize);
    $(window).on('scroll', _.debounce(() => {
        if (!continueLoad) {
            return;
        }
        loadMoreData(pageSize);
    }, 300));
};

const uploadAvatar = () => {
    $(".submitChangeAva").attr("disabled", "true");
//    load data
    function readURL(input) {
        $(".submitChangeAva").attr("disabled", "true");
        if (input.files && input.files[0]) {
            $(".submitChangeAva").removeAttr("disabled");
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_upload_preview').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#avatarFile").change(function () {
        readURL(this);
    });
};

const uploadImage = () => {
    $(".postImage").attr("disabled", "true");
//    load data
    function readURL(input) {
        $(".postImage").attr("disabled", "true");
        if (input.files && input.files[0]) {
            $(".postImage").removeAttr("disabled");
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_upload_image').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#inputFile").change(function () {
        readURL(this);
    });
};


const loadMoreData = (pageSize) => {
    if ($(window).scrollTop() + $(window).height() >= $('.grid').outerHeight()) {
        if (!continueLoad) {
            return;
        }
        loadData(pageSize);
    }
    ;
};

const loadData = (pageSize) => {
    if (!continueLoad) {
        return;
    }
    ajaxCalling(pageSize);
};

const ajaxCalling = (pageSize) => {
    let uid = $('#uid').val();
    $(".spinner").attr("style", "display: block");
    $.ajax({
        url: '/FinalProject/paging',
        type: 'GET',
        data: {
            pageIndex: index++,
            pageSize,
            uid
        },
        success: (res) => {

            append(res);
        }
    });
};

const append = async (res) => {

    var $grid = await $('.grid').masonry({
        itemSelector: '.eachImage',
        horizontalOrder: true,
        visibleStyle: {transform: 'translateY(0)', opacity: 1},
        hiddenStyle: {transform: 'translateY(100px)', opacity: 0}
    });


    $(res).imagesLoaded(async () => {
        await $grid.append(res);
        $grid.masonry("reloadItems").masonry("layout");
        checkEnd();

    });
};

const checkEnd = () => {
    let username = $('#username').val();
    if (parseInt($('.userImage').val()) === $('.eachImage').length) {
        $(".spinner").attr("style", "display: none");
        continueLoad = false;
        $('.home').append("<hr/>");
        $('.showError').html("All <span style=\"color: #007BFF\">" + username + "</span> post");
        return;
    }
};


