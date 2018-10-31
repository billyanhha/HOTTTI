/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let index = 1;

$(document).ready(() => {
    $('.editPost').attr('disabled', 'true');
    let intialTitle = $(".title").val();
    if ($("#comment").val() > 0) {
        preLoad();
    }
    $('.submitComment').click((e) => {
        e.preventDefault();
        $(".submitComment").attr("disabled", "true");
        setTimeout(() => {
            $(".submitComment").removeAttr("disabled");
        }, 500);
        postComment();
    });
    $('.deletePost').click((e) => {
        deletePost(e);
    });


    $("#inputFile").change(function () {
        readURL(this);
    });
    $(".title").on('keyup', () => {
        if ($(".title").val() !== intialTitle) {
            $(".editPost").removeAttr("disabled");
        } else {
            $('.editPost').attr('disabled', 'true');
        }
    });
});

function readURL(input) {
    $(".editPost").attr("disabled", "true");
    if (input.files && input.files[0]) {
        $(".editPost").removeAttr("disabled");
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#image_upload_preview').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

const deletePost = (e) => {
    e.preventDefault();
    let id = $('#id').val();
    $.ajax({
        url: '/FinalProject/deletePost',
        type: 'Post',
        data: {
            id
        },
        success: (res) => {
            window.location.href = "home";
        }
    });
};


const preLoad = async () => {
    loadComment();
    $('.loadMoreComment').on('click', (e) => {
        e.preventDefault();
        loadComment();
    });

};

const postComment = () => {
    let comment = $('.commentText').val();
    let id = $('#id').val();
    if (!comment) {
        return;
    }
    $(".submitComment").removeAttr("disabled");
    $.ajax({
        url: '/FinalProject/comment',
        type: 'POST',
        data: {
            id,
            comment
        },
        success: (res) => {
            window.location.reload();
        }
    });
};

const loadComment = () => {
    $('.detail-div-image').imagesLoaded(() => {
        let id = $('#id').val();
        $(".spinner").attr("style", "display: block");
        $.ajax({
            url: '/FinalProject/comment',
            type: 'GET',
            data: {
                id,
                index: index++
            },
            success: (res) => {
                fixCommentWidth(res);
            }
        });
    });
};

const fixCommentWidth = (res) => {
    $('.detail-div-image').imagesLoaded(function () {
        const width = $('.detail-div-image').width();
        append(res, width);
    });
};

const append = (res, width) => {
    if (index === 2 && !$(res).hasClass('detail-comment-content-each')) {
        $('.loadMoreComment').attr('style', 'display: none');
    }
    $(".commentShow").append(res);
    $('.detail-comment-content-each').attr('style', "width: " + width + "px");
    if ($('#outOfComment').val() === 'outOfComment' || parseInt($('#comment').val()) === $('.detail-comment-content-each').length) {
        $('.loadMoreComment').attr('style', 'display: none');
    }
    $('.openModalDelete').on('click', function () {
        let id = $(this).attr('id');
        var href = $(`#${id} input`).attr('value');
        $(".deleteComment").attr('href', href);
    });

    $(".spinner").attr("style", "display: none");
};

