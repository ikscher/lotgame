$(document).ready(function(){
    layui.use(['layer', 'form'], function(){
      var layer = layui.layer
      ,form = layui.form;
      
        
        form.on('submit(register)',function(){
       
            var mobile=$('#mobile').val();
            if(!checkmob(mobile)){
                salert("手机号码格式不正确！",$("#mobile"));
                return false;
            }

            if($("#tbSafeCode").val()==""){
                salert("请输入验证码!",$('#tbSafeCode'));
                return false;
            }
            // $("#loginbox").showLoading();
           if($('#tbUserNick').val()==''){
                salert("请输入昵称!",$('#tbUserNick'));
                return false;
           }

            var pwd1=$('#tbUserPwd').val();
            if(!pwd1){
                salert("请输入密码",$('#tbUserPwd'));
                return false;
            }
            var pwd2=$('#tbRePwd').val();
            if(pwd1!=pwd2){
                salert("两次输入的密码不一致",$('#tbRePwd'));
                return false;
            }


            $.ajax({
                url:"/common/register",
                data:$('#regform').serialize(),
                type:'post',
                async: false,
                dataType:'json',
                success:function(res) {
                  // console.log(res);
                    if(res.code == 1) {
                          layer.msg(res.msg, function(index){
                            location.href = res.url;
                          })
                    } else {
                          layer.msg(res.msg);
                    }
                }
            })
            return false;
        })
    });
});

function salert_f(str,x){
    layui.use('form',function(){
        var layer=layui.layer;
        layer.alert(str,function(index){
            x.focus();
            layer.close(index)
        });
    })
}

function salert(str){
    layui.use('form',function(){
        var layer=layui.layer;
        layer.alert(str);
    })
}

var countdown=60;
var t;
function settime(){
    if(countdown == 0){
        $("#popup-submit").removeAttr("disabled");
        $("#popup-submit").attr("class","send_btn");
        $("#popup-submit").html("重新发送");
        countdown=60;
        return;
    }else{
        $("#popup-submit").html("重新发送 ("+ countdown+")");
        countdown--;
        t=setTimeout("settime()",1000);
        if(countdown==0) clearTimeOut(t);
    }

}


var handlerPopup = function (captchaObj) {
    captchaObj.onReady(function () {
        $("#wait").hide();
    }).onSuccess(function () {
 
        var result = captchaObj.getValidate();
        if (!result) {
            salert('请先完成滑动验证！');
            return;
        }

        $('body').bodyshowLoading();
        $.ajax({
            url: "/common/sendmsg",
            type: "post",
            data: {
                geetest_challenge: result.geetest_challenge,
                geetest_validate: result.geetest_validate,
                geetest_seccode: result.geetest_seccode,
                mobile: $('#mobile').val(),
                action: "register"
            },
            dataType:'json',
            success: function (res) {
                // result=parseInt(result);
                switch (res.code){
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
                        salert("该手机号已注册,请直接登录!");
                        break;
                    default:
                        salert("短信发送失败:未知错误");
                        break;
                }
            },
            complete: function () {
                $("body").hideLoading();
            }
        });
        
    });
    $('#popup-submit').click(function () {
        var mobile=$('#mobile').val();
        if(checkmob(mobile)==false){
            salert_f("手机号码格式不正确！",$("#mobile"));
            return false;
        }
       
        captchaObj.verify();
    })
    // 更多前端接口说明请参见：http://docs.geetest.com/install/client/web-front/
};

$.ajax({
    url: "/common/gtValidate?t=" + (new Date()).getTime(),
    type: "get",
    dataType: "json",
    success: function (data) {
        $('#text').hide();
        $('#wait').show();
        initGeetest({
            gt: data.gt,
            challenge: data.challenge,
            product: "bind",
            timeout: '5000',
            new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
            offline: !data.success
        }, handlerPopup);
    }
});

function checkmob(mobile){
    if (!mobile) {
        // salert("手机号码不能为空！",$("#mobile"));
        // $("#mobile").focus();
        return false;
    }

    if (!mobile.match(/^1[3|4|5|7|8]\d{9}$/)) {
        // salert("手机号码格式不正确！",$("#mobile"));
        // $("#mobile").focus();
        return false;
    }

    return true;
}