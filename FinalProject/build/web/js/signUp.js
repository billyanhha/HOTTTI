/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#error").attr("value", "");
    $("#signUpButton").on("click", (e) => {
        e.preventDefault();

        $("#signUpButton").attr("disabled", "true");

        setTimeout(() => {
            $("#signUpButton").removeAttr("disabled");
        }, 500);

        let username = $("#username").val();
        let fullname = $("#fullname").val();
        let password = $("#password").val();
        let cfpassword = $("#cfpassword").val();
        ajaxCalling(username, fullname, password, cfpassword);
    });
});

const ajaxCalling = (username, fullname, password, cfpassword) => {

    if (!validate(username, fullname, password, cfpassword)) {
        return;
    }
    ;

    $.ajax({
        url: '/FinalProject/signUp',
        type: 'POST',
        data: {
            username,
            fullname,
            password
        },
        success: (responseText) => {
            let successUrl = "login"; // might be a good idea to return this URL in the successful AJAX call
            window.location.href = successUrl;
        }
    }).catch(err => {
        $(".textMessage").html("");
        let errMsg = err.statusText;
        $(".messageDiv").attr("style", "display: block");
        $(".textMessage").html(errMsg);
        $(".username").attr("style", "border-color: red");
        $(".username").on("focus", () => {
            $(".username").attr("style", "border-color: #ced4da");
        });
        setInterval(() => {
            $(".messageDiv").attr("style", "display: none");
        }, 20000);

    });
};

const validate = (username, fullname, password, cfpassword) => {
    let err = "";

    let regexUn = new RegExp("^(?=.{5,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
    let testUn = regexUn.test(username);

    if (!testUn) {
        err += "<p class=\"textMessage\">Username must have more than 5 characters</p>";
        $("#username").attr("style", "border-color: red");
    }

    let regexFn = new RegExp("^[a-z]([-']?[a-z]+)*( [a-z]([-']?[a-z]+)*)+$");
    let testFn = regexFn.test(fullname);

    if (!testFn) {
        err += "<p class=\"textMessage\">You must use your real name</p>";
        $("#fullname").attr("style", "border-color: red");
    }

    let regexPw = new RegExp("^(?=.{6,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
    let testPw = regexPw.test(password);

    if (!testPw) {
        err += "<p class=\"textMessage\">Password must have more than 5 characters</p>";
        $("#password").attr("style", "border-color: red");
    }

    if (cfpassword !== password) {
        err += "<p class=\"textMessage\">Password retype not match</p>";
        $("#cfpassword").attr("style", "border-color: red");
    }

    $("#username").on("keyup", () => $("#username").attr("style", "border-color: #ced4da"));
    $("#password").on("keyup", () => $("#password").attr("style", "border-color: #ced4da"));
    $("#fullname").on("keyup", () => $("#fullname").attr("style", "border-color: #ced4da"));
    $("#cfpassword").on("keyup", () => $("#cfpassword").attr("style", "border-color: #ced4da"));


    if (err) {
        $(".messageDiv").attr("style", "display: block");
        $(".messageDiv").html(err);
        setTimeout(() => {
            $(".messageDiv").attr("style", "display: none");
        }, 5000);
        return false;
    }


    return true;

};
