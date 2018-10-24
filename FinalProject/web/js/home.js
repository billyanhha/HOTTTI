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
        if (!continueLoad) {
            return;
        }
        loadMoreData(pageSize);
    }, 300));
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
    $(".spinner").attr("style", "display: block");
    $.ajax({
        url: '/FinalProject/paging',
        type: 'GET',
        data: {
            pageIndex: index++,
            pageSize
        },
        success: (res) => {

            append(res);

            if ($('.outOfImage').val()) {
                $(".spinner").attr("style", "display: none");
                continueLoad = false;
                $('.home').append("<hr/>");
                $('.showError').html($('.outOfImage').val());
                return;
            }
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
    });

};


