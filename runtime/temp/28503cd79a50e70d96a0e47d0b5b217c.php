<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:65:"D:\mywork\lotgame\public/../app/admin\view\usergrade\publish.html";i:1554446495;}*/ ?>
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
        <li><a href="<?php echo url('admin/usergrade/index'); ?>" class="a_menu">用户级别管理</a></li>
        <li class="layui-this">新增级别</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      <div class="layui-form-item">
        <label class="layui-form-label">级别名称</label>
        <div class="layui-input-inline">
          <input name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($usergrade['name']) || (($usergrade['name'] instanceof \think\Collection || $usergrade['name'] instanceof \think\Paginator ) && $usergrade['name']->isEmpty()))): ?>value="<?php echo $usergrade['name']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">最小经验值</label>
        <div class="layui-input-block" style="max-width:500px;">
          <input name="exp_min" autocomplete="off" placeholder="标签之间用,隔开" class="layui-input" type="text" <?php if(!(empty($usergrade['exp_min']) || (($usergrade['exp_min'] instanceof \think\Collection || $usergrade['exp_min'] instanceof \think\Paginator ) && $usergrade['exp_min']->isEmpty()))): ?>value="<?php echo $usergrade['exp_min']; ?>"<?php else: ?>value="0"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">最大经验值</label>
        <div class="layui-input-block" style="max-width:500px;">
          <input name="exp_max" autocomplete="off" placeholder="标签之间用,隔开" class="layui-input" type="text" <?php if(!(empty($usergrade['exp_max']) || (($usergrade['exp_max'] instanceof \think\Collection || $usergrade['exp_max'] instanceof \think\Paginator ) && $usergrade['exp_max']->isEmpty()))): ?>value="<?php echo $usergrade['exp_max']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">等级</label>
        <div class="layui-input-block" style="max-width:500px;">
          <input name="grade" autocomplete="off" placeholder="标签之间用,隔开" class="layui-input" type="text" <?php if(!(empty($usergrade['grade']) || (($usergrade['grade'] instanceof \think\Collection || $usergrade['grade'] instanceof \think\Paginator ) && $usergrade['grade']->isEmpty()))): ?>value="<?php echo $usergrade['grade']; ?>"<?php else: ?>value="0"<?php endif; ?>>
        </div>
      </div>

     
      
      <?php if(!(empty($usergrade) || (($usergrade instanceof \think\Collection || $usergrade instanceof \think\Paginator ) && $usergrade->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $usergrade['id']; ?>">
      <?php endif; ?>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="admin">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
      
    </form>


    <script src="/static/public/layui/layui.js"></script>
    <script src="/static/public/jquery/jquery.min.js"></script>
    <!-- <script>
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
    </script> -->
    <script>
      layui.use(['layer', 'form'], function() {
          var layer = layui.layer,
          $ = layui.jquery,
          form = layui.form;
          $(window).on('load', function() {
              form.on('submit(admin)', function(data) {
                  $.ajax({
                      url:"<?php echo url('admin/usergrade/publish'); ?>",
                      data:$('#admin').serialize(),
                      type:'post',
                      async: false,
                      success:function(res) {
                          // console.log(res)
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
      });
    </script>
  </div>
</body>
</html>