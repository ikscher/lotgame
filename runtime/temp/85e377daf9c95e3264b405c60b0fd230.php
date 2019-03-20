<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:64:"D:\mywork\lotgame\public/../app/admin\view\prize\editremark.html";i:1552872538;}*/ ?>
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
        <li><a href="<?php echo url('admin/prize/remark'); ?>" class="a_menu">奖品评论管理</a></li>
        <li class="layui-this">编辑奖品评论</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      

      <div class="layui-form-item">
        <label class="layui-form-label">评论奖品</label>
        <div class="layui-input-inline">
          <label style="color:#ccc;"><?php if(!(empty($remark['prize']['name']) || (($remark['prize']['name'] instanceof \think\Collection || $remark['prize']['name'] instanceof \think\Paginator ) && $remark['prize']['name']->isEmpty()))): ?><?php echo $remark['prize']['name']; endif; ?></label>
          <!-- <input name="prize_id" lay-verify="required" disabled placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($cate['name']) || (($cate['name'] instanceof \think\Collection || $cate['name'] instanceof \think\Paginator ) && $cate['name']->isEmpty()))): ?>value="<?php echo $cate['name']; ?>"<?php endif; ?>> -->
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">评论用户</label>
        <div class="layui-input-block" style="max-width:500px;">
          <label style="color:#ccc;"><?php if(!(empty($remark['user']['username']) || (($remark['user']['username'] instanceof \think\Collection || $remark['user']['username'] instanceof \think\Paginator ) && $remark['user']['username']->isEmpty()))): ?><?php echo $remark['user']['username']; endif; ?></label>
          <!-- <input name="tag" autocomplete="off" placeholder="标签之间用,隔开" class="layui-input" type="text" <?php if(!(empty($cate['tag']) || (($cate['tag'] instanceof \think\Collection || $cate['tag'] instanceof \think\Paginator ) && $cate['tag']->isEmpty()))): ?>value="<?php echo $cate['tag']; ?>"<?php endif; ?>> -->
        </div>
      </div>

      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block" style="max-width:1000px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="content" id="container" style="border:0;padding:0"><?php if(!(empty($remark['content']) || (($remark['content'] instanceof \think\Collection || $remark['content'] instanceof \think\Paginator ) && $remark['content']->isEmpty()))): ?><?php echo $remark['content']; endif; ?></textarea>
        </div>
      </div>
      
      <?php if(!(empty($remark) || (($remark instanceof \think\Collection || $remark instanceof \think\Paginator ) && $remark->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $remark['id']; ?>">
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
                      url:"<?php echo url('admin/prize/editremark'); ?>",
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


    <!-- 加载编辑器的容器 -->
    <script id="container" name="desc" type="text/plain">
        这里写你的初始化内容
    </script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="/static/public/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/static/public/ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
  </div>
</body>
</html>