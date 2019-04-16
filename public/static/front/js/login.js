var countdown=60;
var t;
$(document).ready(function(){
    // $("#loginBtn").click(function () {
        
    // });


    layui.use(['layer', 'form'], function(){
      var layer = layui.layer
      ,form = layui.form;
      
        
        form.on('submit(login)',function(){
       
            var type=parseInt($("#logintype").val());
            if(type==2){
                var mobile=$('#mobile').val();
                if(!checkmob(mobile)){
                    salert("手机号码格式不正确！",$("#mobile"));
                    return false;
                }

                if($("#code").val()==""){
                    salert("请输入验证码!",$('#code'));
                    return false;
                }
                // $("#loginbox").showLoading();
               
            }else if (type==1){
                var account=$('#usernametb').val();
                if(!checkmob(account) && !checkmail(account)){
                   salert('您输入的账号格式不正确！',$('#usernametb'));
                   return false;
                }

                var pwd=$('#pwdtb').val();
                if(!pwd){
                    salert("请输入密码",$('#pwdtb'));
                    return false;
                }
                //$("#form1").submit();
            }

            $.ajax({
                url:"/common/login",
                data:$('#loginform').serialize(),
                type:'post',
                async: false,
                dataType:'json',
                success:function(res) {
                  // console.log(res);

                    if(res.code == 1) {
                          //layer.msg(res.msg, function(index){
                            location.href = res.url;
                          //})
                    } else {
                          layer.msg(res.msg);
                    }
                }
            })
            return false;
        })
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
        $("#popup-submit").attr("class","send_btn");
        countdown--;
        t=setTimeout("settime()",1000);
    }

}

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

var handlerPopup = function (captchaObj) {
    captchaObj.onReady(function () {
        $("#wait").hide();
    }).onSuccess(function () {
        
        var result = captchaObj.getValidate();
        if (!result) {
            salert('请先完成滑动验证！');
            return;
        }

        $("#loginbox").showLoading();
        $.ajax({
            url: "/common/sendmsg",
            type: "post",
            data: {
                geetest_challenge: result.geetest_challenge,
                geetest_validate: result.geetest_validate,
                geetest_seccode: result.geetest_seccode,
                mobile: $('#mobile').val(),
                action: "login"
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

function checkmail(email){
    var pattern_ = new RegExp("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$", "i");
    if(!email || !pattern_.test(email)){
        // salert('输入的邮箱格式有误！',$('#usernametb'));
        return false;
    }
    return true;
}