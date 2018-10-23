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
    let numberOfImage = $('.numberOfImage').val();
    let pageSize = Math.round(numberOfImage / 4) < 10 ? Math.round(numberOfImage / 4) : 10;
    loadData(pageSize);
    $(window).on('scroll', _.debounce(() => {
        loadMoreData(pageSize);
    }, 200));
};
const loadMoreData = (pageSize) => {

    if ($(window).scrollTop() + $(window).height() >= $('#imageContainer').outerHeight()) {
        if (!continueLoad) {
            return;
        }
        loadData(pageSize);
    }
    ;
};
const loadData = (pageSize) => {
    console.log("load");
//    for (let i = 0; i < 5; i++) {
    if (!continueLoad) {
        return;
    }
    ajaxCalling(pageSize);
//    }
};
const ajaxCalling = (pageSize) => {
    $(".loader").attr("style", "display: block");
    $.ajax({
        url: '/FinalProject/paging',
        type: 'GET',
        data: {
            pageIndex: index++,
            pageSize
        },
        success: (res) => {
            $("#imageContainer").append(res);

            $("#imageContainer").masonry({
                // set itemSelector so .grid-sizer is not used in layout
                itemSelector: '.eachImage',
//                fitWidth: true,
                horizontalOrder: true
//                percentPosition: true
            });

            $(".loader").attr("style", "display: none");
            if ($('.outOfImage').val()) {
                continueLoad = false;
                $('.showError').html($('.outOfImage').val());
                return;
            }
        }
    }).catch(err => {
        let errMsg = err.statusText;
        $(".messageDiv").attr("style", "display: block");
        $(".textMessage").html(errMsg);
        setTimeout(() => {
            $(".messageDiv").attr("style", "display: none");
        }, 2000);
    });
};


