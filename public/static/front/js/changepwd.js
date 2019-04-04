$(document).ready(function(){

    $("#secondBtn").click(function (){
        var newpwd1=$("#tbNewPwd").val();
        var newpwd2=$("#tbRePwd").val();
        var oldpwd = $("#tbOldPwd").val();
        if(newpwd1!="" && newpwd2!=""){
            if(newpwd2!=newpwd1){
                salert("两次输入的密码不一致,请检查!");
                return false;
            }else if (newpwd1==oldpwd) {
                salert("不能设置成 和原先一样的密码!");
                return false;
            }else{
                var data = {action:'change',newpwd:newpwd1};
                $.ajax({
                    url: "/User/Changepwd",
                    type: "post",
                    dataType:"json",
                    data: data,
                    success: function(rs){
                        if(rs.code==1){
                            $("#pwd_wrap").hide();
                            $("#success_wrap").show();
                        }else{
                            salert(rs.msg);
                        }
                    }
                });
            }
        }else{
            salert("请输入密码!");
        }
    });
    

    //第一步
    $("#firstBtn").click(function(){
        var answer = $("#answer").val();
        var password = $("#password").val();
        var code = $('#code').val();

        if(!password){
            salert_f("请输入原密码！", $("#password"));
            return false;
        }
        if(!answer){
            salert("请输入密保答案！",$("#answer"));
            return false;
        }

        if(!code){
            salert("请输入验证码！",$('#code'));
            return false;
        }

        $.ajax({
            url: "/user/changepwd",
            type: "post",
            data: {
                action: "validate",
                answer: answer,
                password:password,
                code:code
            },
            dataType:'json',
            success: function(res){
                switch(res.code){
                    case 'RA':
                        $("#safe_wrap").hide();
                        $("#pwd_wrap").show();
                        $("#tbOldPwd").val( $("#password").val() );
                        break;
                    case 'EC':
                        salert('对不起,您的手机验证码错误!');
                        break;
                    case 'EA':
                        salert('对不起,您的密保答案错误!');
                        break;
                    case 'EP':
                        salert('对不起,原密码输入错误!');
                        break;
                    default:
                        salert('未知错误');
                }
            },
            complete: function () {
                $('#user_tradpwd').hideLoading();
            }
        });
    });
    

    //短信验证
    $('#popup-submit').click(function(){
        $.ajax({
            url: "/common/sendmsg",
            type: "post",
            data: {
                action: "changepwd",
                code: $("#code").val()
            },
            dataType:'json',
            success: function(res){
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
                    default:
                        salert("短信发送失败:未知错误");
                }
            }
        });
    })

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
        $("#popup-submit").attr("class","btn_model_send");
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