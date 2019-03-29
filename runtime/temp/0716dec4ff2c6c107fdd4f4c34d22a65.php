<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:75:"D:\mywork\lotgame\public/../app/admin\view\prizeflowcharge\adduserrule.html";i:1552872538;}*/ ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="/static/public/layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="/static/public/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="/static/admin/css/admin.css"  media="all">
</head>
<body style="padding:10px;">
  <div class="tplay-body-div">
    <div class="layui-tab">
      <ul class="layui-tab-title">
        <li><a href="<?php echo url('admin/prizeflowcharge/index'); ?>" class="a_menu">流水手续（投注）</a></li>
        <li class="layui-this">新增特殊用户</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin" >

      <div class="layui-form-item">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-inline">
          <input name="user_id" autocomplete="off" placeholder="请输入" class="layui-input" type="text" >
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">流水倍数要求</label>
        <div class="layui-input-inline">
          <input name="flow_times" autocomplete="off" placeholder="请输入" class="layui-input" type="text" >
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">手续费比例</label>
        <div class="layui-input-inline">
          <input name="charge_ratio" autocomplete="off" placeholder="请输入" class="layui-input" type="text" >
        </div>
      </div>
      
      <?php if(!(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $chargeconfig['id']; ?>">
      <?php endif; ?>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="admin">保存</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
      
    </form>


    <script src="/static/public/layui/layui.js"></script>
    <script src="/static/public/jquery/jquery.min.js"></script>
    <script>
        var message;
        layui.config({
            base: '/static/admin/js/',
            version: '1.0.1'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
        });
    </script>
    <script>
     
      layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form;
        $(window).on('load', function() {
            form.on('submit(admin)', function(data) {
                $.ajax({
                    url:"<?php echo url('admin/prizeflowcharge/adduserrule'); ?>",
                    data:$('#admin').serialize(),
                    type:'post',
                    async: false,
                    success:function(res) {
                        if(res.code == 1) {
                            layer.alert(res.msg, function(index){
                              location.href = res.url;
                            })
                        } else {
                            layer.msg(res.msg);
                        }
                    }
                })
                return false;
            });


        });
        // form.on('switch(status)',function(){
        //   if($(this).prop('checked')==true){
        //     $(this).val(1);
        //   }else{
        //     $(this).val(0);
        //   }
        // })

        // form.on('radio(fix-percent)',function(data){
        //   // console.log(data.value)
        //   if(data.value==1){
        //     $('.fix-percent').text('');
        //   }else if(data.value==2){
        //     $('.fix-percent').text('%');
        //   }
        //   $("input[name='charge']").focus();
        // });
      });
    </script>
  </div>
</body>
</html>