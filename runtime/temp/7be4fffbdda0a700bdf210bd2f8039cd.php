<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"D:\mywork\lotgame\public/../app/admin\view\game\publish.html";i:1553318072;}*/ ?>
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
        <li><a href="<?php echo url('admin/game/index'); ?>" class="a_menu">游戏管理</a></li>
        <li class="layui-this">新增/修改游戏</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      

      <div class="layui-form-item">
        <label class="layui-form-label">游戏名称</label>
        <div class="layui-input-inline" >
          <input name="name" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($game['name']) || (($game['name'] instanceof \think\Collection || $game['name'] instanceof \think\Paginator ) && $game['name']->isEmpty()))): ?>value="<?php echo $game['name']; ?>"<?php endif; ?>>
        </div>
      </div>

      

      

      <!-- <div class="layui-form-item">
        <label class="layui-form-label">冻结</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_freeze" lay-filter="freeze" title="" <?php if(!(empty($agent['is_freeze']) || (($agent['is_freeze'] instanceof \think\Collection || $agent['is_freeze'] instanceof \think\Paginator ) && $agent['is_freeze']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div> -->

      <div class="layui-form-item">
        <label class="layui-form-label">开关</label>
        <div class="layui-input-block">
          <input name="onff" type="checkbox" lay-filter="onff"   <?php if(!(empty($game['onff']) || (($game['onff'] instanceof \think\Collection || $game['onff'] instanceof \think\Paginator ) && $game['onff']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?>>
        </div>
      </div>

      
      
      <?php if(!(empty($game) || (($game instanceof \think\Collection || $game instanceof \think\Paginator ) && $game->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $game['id']; ?>">
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
 
    <script>
      layui.use(['layer', 'form','laydate'], function() {
          var layer = layui.layer,
          $ = layui.jquery,
          form = layui.form,
          laydate = layui.laydate;
          $(window).on('load', function() {
              form.on('submit(admin)', function(data) {
                  $.ajax({
                      url:"<?php echo url('admin/game/publish'); ?>",
                      data:$('#admin').serialize(),
                      type:'post',
                      async: false,
                      success:function(res) {
                          // console.log(res);
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


          //取反
          form.on('checkbox(onff)',function(data){
             // console.log(data)
             var x=$("input[name='onff']");
             if(x.prop('checked')){
                x.val(1);
             }else{
                x.val(0);
             }
          })
          
      });
    </script>

  </div>
</body>
</html>