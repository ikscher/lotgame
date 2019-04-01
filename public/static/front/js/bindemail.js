$(document).ready(function(){
    $("#qrsubmit").click(function (){
        if($("#tbNewPwd").val()!="" && $("#tbRePwd").val()!=""){
            if($("#tbNewPwd").val()!=$("#tbRePwd").val()){
                salert("两次输入的密码不一致,请检查!");
            }else{
                $("#qrsubmit").attr("disabled","disabled");
                $("#qrsubmit").attr("value","正在提交");
            }
        }else{
            salert("请设置密码!");
        }
        $('#user_tradpwd').showLoading();
        $.ajax({
            url: "/Ajax_mobile.php",
            type: "post",
            data: {
                action: "yz",
                code: $("#code").val()
            },
            success: function(result){
                if(result==1){
                    $("form").submit();
                }else{
                    salert('对不起,您的手机验证码错误!');
                }
            },
            complete: function () {
                $('#user_tradpwd').hideLoading();
            }
        });
    });

});

function salert(str){
    layui.use('layer', function(){
    var layer = layui.layer;
      layer.msg(str);
    });
    // layer.alert(str);
}
var countdown=60;
function settime(){
    if(countdown == 0){
        $("#popup-submit").removeAttr("disabled");
        $("#popup-submit").attr("class","btn_model_send");
        $("#popup-submit").html("重新发送");
        countdown=60;
        return;
    }else{
        $("#popup-submit").html("重新发送 ("+ countdown+")");
        countdown--;
        setTimeout("settime()",1000);
    }

}


var handlerPopup = function (captchaObj) {
    $("#popup-submit").click(function () {
        var validate = captchaObj.getValidate();
        if (!validate) {
            salert('请先完成滑动验证！');
            return;
        }
        if($("#email").val()==""){
            salert('请先填写您的邮箱地址');
            return;
        }
        $('#user_tradpwd').showLoading();
        $.ajax({
            url: "/common/sendmail",
            type: "post",
            data: {
                geetest_challenge: validate.geetest_challenge,
                geetest_validate: validate.geetest_validate,
                geetest_seccode: validate.geetest_seccode,
                action: "post",
                email: $("#email").val()
            },
            success: function (result) {
                result=parseInt(result);
                switch (result){
                    case -1:
                        salert('邮件发送过于频繁，请等待1分钟后重试。');
                        break;
                    case -3:
                        salert('该邮箱已经被占用，请更换邮箱');
                        break;
                    case 1:
                        $("#popup-submit").attr("disabled","disabled");
                        $("#popup-submit").attr("class","btn_model_send_gary");
                        countdown=60;
                        salert('邮件发送成功,请注意查收!<br/>若收不到邮件，请联系客服。');
                        settime();
                        break;
                    default:
                        salert("邮件发送失败:未知错误");
                        break;
                }
            },
            complete: function () {
                $('#user_tradpwd').hideLoading();
            }
        });
    });
    // captchaObj.bindOn("#popup-submit");
    captchaObj.appendTo("#popup-captcha");
};
$.ajax({
    url: "/common/gtValidate?t=" + (new Date()).getTime(),
    type: "get",
    dataType: "json",
    success: function (data) {
        initGeetest({
            gt: data.gt,
            challenge: data.challenge,
            new_captcha: data.new_captcha,
            product: "popup",
            offline: !data.success
        }, handlerPopup);
    }
});
