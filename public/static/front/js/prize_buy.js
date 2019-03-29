function fmoney(s, n) {
    n = n > 0 && n <= 20 ? n : 2;
    f = s < 0 ? "-" : "";
    s = parseFloat((Math.abs(s) + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
        r = s.split(".")[1];
    t = "";
    for (i = 0; i < l.length; i++) {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return f + t.split("").reverse().join("");
}
function add(){
    $("#tbExchangedCount").val(parseInt($("#tbExchangedCount").val())+1);
    $("#price").html(fmoney(parseInt($("#price1").html())*parseInt($("#tbExchangedCount").val()),2));
}
function minus(){
    if(parseInt($("#tbExchangedCount").val()) <= 1){
        $("#tbExchangedCount").val("1");
    }else{
        $("#tbExchangedCount").val(parseInt($("#tbExchangedCount").val())-1);
    }
    $("#price").html(fmoney(parseInt($("#price1").html())*parseInt($("#tbExchangedCount").val()),2));
}
function adjust(){
    if(isNaN($("#tbExchangedCount").val())){
        return ;
    }
    if(parseInt($("#tbExchangedCount").val())>=100){
        alert("对不起，兑换数量不能超过100件");
        return ;
    }
    if(parseInt($("#tbExchangedCount").val()) <= 1){
        $("#tbExchangedCount").val("1");
    }
        $("#price").html(fmoney(parseInt($("#price1").html())*parseInt($("#tbExchangedCount").val()),2));

}
var countdown=60;
function settime(){
    if(countdown == 0){
        $("#popup-submit").removeAttr("disabled");
        $("#popup-submit").attr("class","send_btn");
        $("#popup-submit").html("重发");
        countdown=60;
        return;
    }else{
        $("#popup-submit").html( countdown);
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
        $('#buybox').showLoading();
        $.ajax({
            url: "/Ajax_mobile.php",
            type: "post",
            data: {
                geetest_challenge: validate.geetest_challenge,
                geetest_validate: validate.geetest_validate,
                geetest_seccode: validate.geetest_seccode,
                action: "post",
                type: "buyprize"
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
                    case -2:
                        salert("该手机号已经注册,请直接登录");
                        break;
					case -13: 
						salert("发送频率过高,请稍后发送！"); 
						break;
                    default:
                        salert("短信发送失败:未知错误");
                        break;
                }
            },
            complete: function () {
                $('#buybox').hideLoading();
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

function salert(str){
    layer.alert(str);
}
$(document).ready(function(){
    $("#qrsubmit").click(function (){
        $('#buybox').showLoading();
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
                $('#buybox').hideLoading();
            }
        });
    });

});