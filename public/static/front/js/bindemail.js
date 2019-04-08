
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
        $("#popup-submit").attr("class","btn_model_send");
        $("#popup-submit").html("重新发送");
        countdown=60;
        return;
    }else{
        $("#popup-submit").html("重新发送 ("+ countdown+")");
        countdown--;
        t=setTimeout("settime()",1000);
        if(t==0) clearTimeout(t);
    }

}
layui.use(['layer', 'form'], function(){
    var layer = layui.layer,form = layui.form;
    form.on('submit(save)',function(){
        if($("#email").length>0 && $("#email").val()==""){
            salert('请先填写您的邮箱地址');
            return false;
        }

        if($('#code').length>0 && $("#code").val()==""){
            salert('请先填写验证码');
            return false;
        }

        $.ajax({
            url:'/user/bindemail',
            type:'post',
            data:$('#bindform').serialize(),
            dataType:'json',
            error:function(){
               salert('出错了');
            },
            success:function(res){
               if(res.code==0){
                  salert(res.msg);
                  return false;
               }else{
                  salert(res.msg);
                  location.href='/user/index';
               }
               
            }
        })
        return false;
    })
});



var handlerPopup = function (captchaObj) {
    captchaObj.onReady(function () {
        $("#wait").hide();
    }).onSuccess(function () {
        
        var result = captchaObj.getValidate();
        if (!result) {
            salert('请先完成滑动验证！');
            return;
        }

        $("#user_tradpwd").showLoading();
        $.ajax({
            url: "/common/sendmail",
            type: "post",
            data: {
                geetest_challenge: result.geetest_challenge,
                geetest_validate: result.geetest_validate,
                geetest_seccode: result.geetest_seccode,
                mobile: $('#email').val(),
                action: "post"
            },
            dataType:'json',
            success: function (res) {
                // result=parseInt(result);
                switch (res.code){
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
                $("#user_tradpwd").hideLoading();
            }
        });
    });
    $('#popup-submit').click(function () {
        var email=$('#email').val();
        if(checkmail(email)==false){
            salert_f("邮箱格式不正确！",$("#email"));
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

function checkmail(email){
    var pattern_ = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$", "i");
    if(!email || !pattern_.test(email)){
        // salert('输入的邮箱格式有误！',$('#usernametb'));
        return false;
    }
    return true;
}
