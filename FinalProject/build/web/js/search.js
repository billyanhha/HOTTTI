/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(() => {
     $('.searchForm').on('submit' , (e) => {
         e.preventDefault();
         if ($('.searchInput').val().trim()) {
            window.location.href = `search?query=` + $('.searchInput').val().trim();
        }
     });
});

const search = () => {
    $('.searchInput').on('focus' , () => {
        $("datalist").replaceAll();
    });
    $('.searchInput').keyup(_.debounce(() => {
        if ($('.searchInput').val()) {
            searchAjax($('.searchInput').val());
        }
    } , 500));
};


const searchAjax = (query) => {
    $.ajax({
        url: '/FinalProject/search',
        type: 'GET',
        data: {
            query
        },
        success: (res) => {
            appendResult(res);
        }
    });
};

const appendResult = async (res) => {
    await $("datalist").append(res);
};
