<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:69:"D:\mywork\lotgame\public/../app/admin\view\signingconfig\publish.html";i:1552460984;}*/ ?>
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
        <li><a href="<?php echo url('admin/signingconfig/index'); ?>" class="a_menu">签到管理</a></li>
        <li class="layui-this">新增等级</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">

      <div class="layui-form-item">
        <label class="layui-form-label">等级</label>
        <div class="layui-input-inline">
          <input name="rank" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($singinconfig['rank']) || (($singinconfig['rank'] instanceof \think\Collection || $singinconfig['rank'] instanceof \think\Paginator ) && $singinconfig['rank']->isEmpty()))): ?>value="<?php echo $signinconfig['rank']; ?>"<?php endif; ?>>
        </div>
        <div class="layui-form-mid layui-word-aux">例：V0</div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">增数</label>
        <div class="layui-input-inline">
          <input name="increment_num" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($signinconfig['increment_num']) || (($signinconfig['increment_num'] instanceof \think\Collection || $signinconfig['increment_num'] instanceof \think\Paginator ) && $signinconfig['increment_num']->isEmpty()))): ?>value="<?php echo $signinconfig['increment_num']; ?>"<?php endif; ?>>
        </div>
        <div class="layui-form-mid layui-word-aux">例：1</div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">最大连续天数</label>
        <div class="layui-input-inline">
          <input name="max_successive_day" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($signinconfig['max_successive_day']) || (($signinconfig['max_successive_day'] instanceof \think\Collection || $signinconfig['max_successive_day'] instanceof \think\Paginator ) && $signinconfig['max_successive_day']->isEmpty()))): ?>value="<?php echo $signinconfig['max_successive_day']; ?>"<?php endif; ?>>
        </div>
        <div class="layui-form-mid layui-word-aux">例：7</div>
      </div>

      <div class="layui-form-item">
          <label class="layui-form-label">开关</label>
          <div class="layui-input-block">
            <input type="checkbox" name="status" lay-skin="switch" lay-text="ON|OFF" <?php if(!(empty($signinconfig['status']) || (($signinconfig['status'] instanceof \think\Collection || $signinconfig['status'] instanceof \think\Paginator ) && $signinconfig['status']->isEmpty()))): ?>checked=""<?php endif; ?> value="1">
          </div>
      </div>



      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block" style="max-width:400px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="menu"><?php if(!(empty($signinconfig['menu']) || (($signinconfig['menu'] instanceof \think\Collection || $signinconfig['menu'] instanceof \think\Paginator ) && $signinconfig['menu']->isEmpty()))): ?><?php echo $signinconfig['menu']; endif; ?></textarea>
        </div>
      </div>
      
       
      
      <?php if(!(empty($signinconfig) || (($signinconfig instanceof \think\Collection || $signinconfig instanceof \think\Paginator ) && $signinconfig->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $signinconfig['id']; ?>">
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
                      url:"<?php echo url('admin/signingconfig/publish'); ?>",
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
      });
    </script>
  </div>
</body>
</html>