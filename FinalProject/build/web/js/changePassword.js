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
        let oldpass = $(".oldpass").val();
        let newpass = $(".newpass").val();
        let cfnewpass = $(".cfnewpass").val();
        ajaxCalling(oldpass, newpass, cfnewpass);
    });
});

const ajaxCalling = (oldpass, newpass, cfnewpass) => {
    let uid = parseInt($('.uid').val());
    if (!validate(oldpass, newpass, cfnewpass)) {
        $("#button1").removeAttr("disabled");
        $("#button1").html("Change");
        return;
    };

    $.ajax({
        url: '/FinalProject/changePassword',
        type: 'POST',
        data: {
            newpass,
            password: oldpass,
            uid
        },
        success: (responseText) => {
            $(".textMessage").html("");
            $("#button1").html("Change success");
            $("#button1").attr("style", "background-color: #00FF00");
            $(".messageDiv").attr("style", "display: block");
            $(".messageDiv").html("Change success");
            setTimeout(() => {
                let successUrl = "profile?id=" + uid; // might be a good idea to return this URL in the successful AJAX call
                window.location.href = successUrl;
            }, 1000);
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



const validate = (oldpass, newpass, cfnewpass) => {
    let err = "";
    
    if (!oldpass || oldpass.length < 6) {
        err += "<p class=\"textMessage\">Not valid password</p>";
        $(".oldpass").attr("style", "border-color: red");
    }
    
    if (!newpass || newpass.length < 6 || oldpass === newpass) {
        err += "<p class=\"textMessage\">Choose appropriate password</p>";
        $(".newpass").attr("style", "border-color: red");
    }

    if (newpass !== cfnewpass) {
        err += "<p class=\"textMessage\">Password confirm not match</p>";
        $(".cfnewpass").attr("style", "border-color: red");
    }

    $(".oldpass").on("focus", () => $(".oldpass").attr("style", "border-color: #ced4da"));
    $(".newpass").on("focus", () => $(".newpass").attr("style", "border-color: #ced4da"));
    $(".cfnewpass").on("focus", () => $(".cfnewpass").attr("style", "border-color: #ced4da"));
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








