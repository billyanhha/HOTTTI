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

$(document).ready(function () {
    $('.btn-primary').on('click', (e) => {
        e.preventDefault();
        $('.recover').attr("style", "  cursor: wait;");
        $("#button1").attr("disabled", "true");
        $("#button1").html("Sending");
        let username = $(".username").val();
        let email = $(".email").val();
        ajaxCalling(username, email);
    });
});

const ajaxCalling = (username, email) => {

    if (!validate(username, email)) {
        $('.recover').attr("style", "  cursor: normal;");
        $("#button1").removeAttr("disabled");
        $("#button1").html("Submit");
        return;
    }
    ;

    $.ajax({
        url: '/FinalProject/recover',
        type: 'POST',
        data: {
            username,
            email
        },
        success: (responseText) => {
            $(".textMessage").html("");
            $('.recover').attr("style", "  cursor: normal;");
            $("#button1").html("Check mail");
            $(".messageDiv").attr("style", "display: block");
            $(".messageDiv").html("Request has been sent , check your email");
            setTimeout(() => {
                let successUrl = "login"; // might be a good idea to return this URL in the successful AJAX call
                window.location.href = successUrl;
            }, 2000);
        }
    }).catch(err => {
        $(".textMessage").html("");
        $('.recover').attr("style", "  cursor: normal;");
        $("#button1").removeAttr("disabled");
        $("#button1").html("Submit");
        let errMsg = err.statusText;
        $(".messageDiv").attr("style", "display: block");
        $(".textMessage").html(errMsg);
        setTimeout(() => {
            $(".messageDiv").attr("style", "display: none");
        }, 2000);
    });
};



const validate = (username, email) => {
    let err = "";

    let regexUn = new RegExp("^(?=.{5,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
    let testUn = regexUn.test(username);

    if (!testUn) {
        err += "<p class=\"textMessage\">Not valid username</p>";
        $(".username").attr("style", "border-color: red");
    }

    let regexEm = new RegExp("[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$");
    let testEm = regexEm.test(email);

    if (!testEm) {
        err += "<p class=\"textMessage\">Not valid email address</p>";
        $(".email").attr("style", "border-color: red");
    }


    $(".username").on("focus", () => $(".username").attr("style", "border-color: #ced4da"));
    $(".email").on("focus", () => $(".email").attr("style", "border-color: #ced4da"));

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








