/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $("#error").attr("value", "");
    $("#button1").on("click", (e) => {

        e.preventDefault();

        $("#button1").attr("disabled", "true");

        setTimeout(() => {
            $("#button1").removeAttr("disabled");
        }, 500);

        let username = $("#username").val();
        let password = $("#password").val();
        let rmb = $(".remember").is(":checked");


        if (!username) {
            $("#username").attr("style", "border-color: red");
        }
        if (!password) {
            $("#password").attr("style", "border-color: red");
        }
        
        $("#username").on("keyup", () => $("#username").attr("style", "border-color: #ced4da"));
        $("#password").on("keyup", () => $("#password").attr("style", "border-color: #ced4da"));

        if (username && password) {
            ajaxCalling(username, password, rmb);
        }
    });
});

const ajaxCalling = (username, password, remember) => {
    $.ajax({
        url: '/FinalProject/login',
        type: 'POST',
        data: {
            username,
            password,
            remember
        },
        success: (responseText) => {
            let successUrl = "home"; // might be a good idea to return this URL in the successful AJAX call
            window.location.href = successUrl;
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







