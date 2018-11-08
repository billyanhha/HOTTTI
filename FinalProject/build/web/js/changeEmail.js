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


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#button1').on('click', (e) => {
        e.preventDefault();
        $("#button1").attr("disabled", "true");
        $("#button1").html("Processing");
        let password = $(".password").val();
        let email = $(".email").val();
        ajaxCalling(password, email);
    });
});

const ajaxCalling = (password, email) => {
    let uid = parseInt($('.uid').val());
    if (!validate(password, email)) {
        $("#button1").removeAttr("disabled");
        $("#button1").html("Change");
        return;
    }
    ;

    $.ajax({
        url: '/FinalProject/changeEmail',
        type: 'POST',
        data: {
            password,
            email,
            uid
        },
        success: (responseText) => {
            $(".textMessage").html("");
            $("#button1").html("Change success");
            $("#button1").attr("style" , "background-color: #00FF00");
            $(".messageDiv").attr("style", "display: block");
            $(".messageDiv").html("Change success");
            setTimeout(() => {
                let successUrl = "profile?id=" + uid; // might be a good idea to return this URL in the successful AJAX call
                window.location.href = successUrl;
            }, 2000);
        }
    }).catch(err => {
        $(".messageDiv").replaceAll();
        $("#button1").removeAttr("disabled");
        $("#button1").html("Change");
        let errMsg = err.statusText;
        let errdata = "<p class=\"textMessage\">" + errMsg + "</p>";
        $(".messageDiv").attr("style", "display: block");
        $(".messageDiv").html(errdata);
        setTimeout(() => {
            $(".messageDiv").attr("style", "display: none");
        }, 2000);
    });
};



const validate = (password, email) => {
    let err = "";
    console.log($('.oldmail').val())
    if (password.length < 6) {
        err += "<p class=\"textMessage\">Not valid password</p>";
        $(".password").attr("style", "border-color: red");
    }

    let regexEm = new RegExp("[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$");
    let testEm = regexEm.test(email);

    if (!testEm) {
        err += "<p class=\"textMessage\">Not valid email address</p>";
        $(".email").attr("style", "border-color: red");
    }
    
    if(email === $('.oldmail').val()){
        err += "<p class=\"textMessage\">Can't change to old password</p>";
        $(".email").attr("style", "border-color: red");
    }

    $(".email").on("focus", () => $(".email").attr("style", "border-color: #ced4da"));
    $(".password").on("focus", () => $(".password").attr("style", "border-color: #ced4da"));
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








