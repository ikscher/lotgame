var countdown=60;

$(document).ready(function(){
    $("#loginBtn").click(function () {
        if(parseInt($("#logintype").val())==2){
            if($("#mobile").val()==""){
                salert("请先输入手机号!");
                return;
            }
            if($("#sjyzm").val()==""){
                salert("请先输入手机验证码!");
                return;
            }
            $("#loginbox").showLoading();
            $.ajax({
                url: "/Ajax_mobile.php",
                type: "post",
                data: {
                    action: "yz",
                    code: $("#sjyzm").val()
                },
                success: function (result) {
                    result = parseInt(result);
                    switch (result){
                        case 1:
                            $("#form1").submit();
                            break;
                        default:
                            salert("您的短信验证码错误,请检查！");
                            break;
                    }
                },
                complete: function () {
                    $("#loginbox").hideLoading();
                }
            });
        }else{
            $("#form1").submit();
        }
    });
    $('.tit1 em').click(function(){
        $(this).css({"color": "#ffd078"});
        $(this).prev().css({"color": "#fff"});
        $('.tabl li:eq(0),.tabl li:eq(1)').hide();
        $('.tabl li:eq(2),.tabl li:eq(3)').show();
        $("#logintype").attr("value","2");
    });
    $('.tit1 strong').click(function(){
        $(this).css({"color": "#ffd078"});
        $(this).next().css({"color": "#fff"});
        $('.tabl li:eq(0),.tabl li:eq(1)').show();
        $('.tabl li:eq(2),.tabl li:eq(3)').hide();
        $("#logintype").attr("value","1");
    });
});

function settime(){
    if(countdown == 0){
        $("#popup-submit").removeAttr("disabled");
        $("#popup-submit").attr("class","send_btn");
        $("#popup-submit").html("重新发送");
        countdown=60;
        return;
    }else{
        $("#popup-submit").html("重新发送("+ countdown+")");
        countdown--;
        setTimeout("settime()",1000);
    }

}

function salert(str){
    layer.alert(str);
}

var handlerPopup = function (captchaObj) {
    $("#popup-submit").click(function () {
        if(checkmob()==false){
            return;
        }
        var validate = captchaObj.getValidate();
        if (!validate) {
            salert('请先完成滑动验证！');
            return;
        }
        $("#loginbox").showLoading();
        $.ajax({
            url: "/Ajax_mobile.php",
            type: "post",
            data: {
                geetest_challenge: validate.geetest_challenge,
                geetest_validate: validate.geetest_validate,
                geetest_seccode: validate.geetest_seccode,
                number: $("#mobile").val(),
                action: "post",
                type: "login"
            },
            success: function (result) {
                result=parseInt(result);
                switch (result){
                    case -1:
                        salert('短信发送失败');
                        break;
                    case 1:
                        $("#popup-submit").attr("disabled","disabled");
                        $("#popup-submit").attr("class","send_btn_gary");
                        countdown=60;
                        salert('短信发送成功,请注意查收!');
                        settime();
                        break;
                    case -3:
                        salert("该手机号尚未注册,请先注册!");
                        break;
                    default:
                        salert("短信发送失败:未知错误");
                        break;
                }
            },
            complete: function () {
                $("#loginbox").hideLoading();
            }
        });
    });
    captchaObj.bindOn("#popup-submit");
    captchaObj.appendTo("#popup-captcha");
};

$.ajax({
    url: "/class/geetest/web/StartCaptchaServlet.php?t=" + (new Date()).getTime(),
    type: "get",
    dataType: "json",
    success: function (data) {
        initGeetest({
            gt: data.gt,
            challenge: data.challenge,
            product: "popup",
            offline: !data.success
        }, handlerPopup);
    }
});

function checkmob(){
    if ($("#mobile").val() == "") {
        salert("手机号码不能为空！");
        $("#mobile").focus();
        return false;
    }

    if (!$("#mobile").val().match(/^1[3|4|5|7|8]\d{9}$/)) {
        salert("手机号码格式不正确！");
        $("#mobile").focus();
        return false;
    }
}