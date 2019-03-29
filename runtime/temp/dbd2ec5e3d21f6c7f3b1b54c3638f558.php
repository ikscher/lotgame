<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:68:"D:\mywork\lotgame\public/../app/admin\view\chargeconfig\publish.html";i:1552872538;}*/ ?>
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
        <li><a href="<?php echo url('admin/chargeconfig/index'); ?>" class="a_menu">手续费规则管理</a></li>
        <li class="layui-this">新增规则</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin" >

      <div class="layui-form-item">
        <label class="layui-form-label">计费方式</label>
        <div class="layui-input-block">
          <input id="exchange_times" type="radio" name="type" value="1" title="兑奖次数" <?php if(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty())): ?>checked<?php else: if($chargeconfig['type'] != 2): ?>checked<?php endif; endif; ?>>
          <input id="exchange_quantity" type="radio" name="type" value="2" title="兑奖件数" <?php if(!(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty()))): if($chargeconfig['type'] == 2): ?>checked<?php endif; endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">最小数</label>
        <div class="layui-input-inline">
          <input name="lower" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($chargeconfig['lower']) || (($chargeconfig['lower'] instanceof \think\Collection || $chargeconfig['lower'] instanceof \think\Paginator ) && $chargeconfig['lower']->isEmpty()))): ?>value="<?php echo $chargeconfig['lower']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">最大数</label>
        <div class="layui-input-inline">
          <input name="upper" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($chargeconfig['upper']) || (($chargeconfig['upper'] instanceof \think\Collection || $chargeconfig['upper'] instanceof \think\Paginator ) && $chargeconfig['upper']->isEmpty()))): ?>value="<?php echo $chargeconfig['upper']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
          <label class="layui-form-label">开关</label>
          <div class="layui-input-block">
            <input type="checkbox"  name="status" lay-skin="switch" lay-text="ON|OFF" lay-filter="status" <?php if(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty())): ?>checked<?php else: if($chargeconfig['status'] == 1): ?>checked<?php endif; endif; ?> value="1">
          </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">百分比</label>
        <div class="layui-input-block">
          <input  type="radio" name="by" value="1" title="固定数额"  lay-filter="fix-percent" <?php if(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty())): ?>checked<?php else: if($chargeconfig['by'] != 2): ?>checked<?php endif; endif; ?>>
          <input  type="radio" name="by" value="2" title="百分比例"  lay-filter="fix-percent" <?php if(!(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty()))): if($chargeconfig['by'] == 2): ?>checked<?php endif; endif; ?>>
        </div>
      </div>
      
      <div class="layui-form-item">
        <label class="layui-form-label">手续费</label>
        <div class="layui-input-inline">
          <input name="charge" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($chargeconfig['charge']) || (($chargeconfig['charge'] instanceof \think\Collection || $chargeconfig['charge'] instanceof \think\Paginator ) && $chargeconfig['charge']->isEmpty()))): ?>value="<?php echo $chargeconfig['charge']; ?>"<?php endif; ?>>
        </div>
        <div class="layui-form-mid layui-word-aux fix-percent"><?php if(!(empty($chargeconfig) || (($chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator ) && $chargeconfig->isEmpty()))): if($chargeconfig['by'] == 2): ?>%<?php endif; endif; ?></div>
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
                    url:"<?php echo url('admin/chargeconfig/publish'); ?>",
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
        form.on('switch(status)',function(){
          if($(this).prop('checked')==true){
            $(this).val(1);
          }else{
            $(this).val(0);
          }
        })

        form.on('radio(fix-percent)',function(data){
          // console.log(data.value)
          if(data.value==1){
            $('.fix-percent').text('');
          }else if(data.value==2){
            $('.fix-percent').text('%');
          }
          $("input[name='charge']").focus();
        });
      });
    </script>
  </div>
</body>
</html>