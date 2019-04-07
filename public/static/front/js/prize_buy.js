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
    var mny=fmoney(parseInt($("#oneprice").html())*parseInt($("#tbExchangedCount").val()),2);
    $("#price").html(mny);
}
function minus(){
    if(parseInt($("#tbExchangedCount").val()) <= 1){
        $("#tbExchangedCount").val("1");
    }else{
        $("#tbExchangedCount").val(parseInt($("#tbExchangedCount").val())-1);
    }
    $("#price").html(fmoney(parseInt($("#oneprice").html())*parseInt($("#tbExchangedCount").val()),2));
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
        $("#price").html(fmoney(parseInt($("#oneprice").html())*parseInt($("#tbExchangedCount").val()),2));

}
var countdown=60;
var t;
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
        t=setTimeout("settime()",1000);
        if(t==0) clearTimeout(t);
    }

}



//======================================================//
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

        $("body").showLoading();
        $.ajax({
            url: "/common/sendmsg",
            type: "post",
            data: {
                geetest_challenge: result.geetest_challenge,
                geetest_validate: result.geetest_validate,
                geetest_seccode: result.geetest_seccode,
                action: "order"
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
                $("body").hideLoading();
            }
        });
    });
    $('#popup-submit').click(function () {
       
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



layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
  
  form.on('submit(order)',function(){
     
     var code=$('#code').val();
     var safe_a=$('#safe_a').val()

     if(!safe_a){
        salert_f("请输入密保答案！",$('#safe_a'));
        return false;
     }

     if(!code && $('#code').length>0){
        salert_f("请输入验证码！",$('#code'));
        return false;
     }
     // $("body").showLoading();
     var num=$('#tbExchangedCount').val();
     var aggregate=rmoney($('#price').html());
     var prize_id=$("input[name='prizeid']").val();
     var price=$("input[name='prizeprice']").val();

     $.ajax({
          url:'/shop/order',
          data:{prize_id:prize_id,num:num,aggregate:aggregate,code:code,safe_a:safe_a,price:price},
          type:'post',
          async: false,
          success:function(res) {
              console.log(res);
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