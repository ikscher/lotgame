<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"D:\mywork\lotgame\public/../app/admin\view\board\publish.html";i:1552552609;}*/ ?>
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
        <li><a href="<?php echo url('admin/board/index'); ?>" class="a_menu">公告管理</a></li>
        <li class="layui-this">新增公告</li>
      </ul>
    </div> 
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" type="text" <?php if(!(empty($board['title']) || (($board['title'] instanceof \think\Collection || $board['title'] instanceof \think\Paginator ) && $board['title']->isEmpty()))): ?>value="<?php echo $board['title']; ?>"<?php endif; ?>>
        </div>
      </div>


      <!-- <div class="layui-form-item">
        <label class="layui-form-label">标签</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="tag" autocomplete="off" placeholder="标签之间用,隔开" class="layui-input" type="text" <?php if(!(empty($article['tag']) || (($article['tag'] instanceof \think\Collection || $article['tag'] instanceof \think\Paginator ) && $article['tag']->isEmpty()))): ?>value="<?php echo $article['tag']; ?>"<?php endif; ?>>
        </div>
      </div> -->

      <!-- <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block" style="max-width:600px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="description"><?php if(!(empty($article['description']) || (($article['description'] instanceof \think\Collection || $article['description'] instanceof \think\Paginator ) && $article['description']->isEmpty()))): ?><?php echo $article['description']; endif; ?></textarea>
        </div>
      </div> -->


      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block" style="max-width:1000px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="content" id="container" style="border:0;padding:0"><?php if(!(empty($board['content']) || (($board['content'] instanceof \think\Collection || $board['content'] instanceof \think\Paginator ) && $board['content']->isEmpty()))): ?><?php echo $board['content']; endif; ?></textarea>
        </div>
      </div>
      
      <div class="layui-form-item">
          <label class="layui-form-label">状态</label>
          <div class="layui-input-block">
            <input type="checkbox" name="status" lay-skin="switch" lay-text="ON|OFF"  <?php if(empty($board['status']) || (($board['status'] instanceof \think\Collection || $board['status'] instanceof \think\Paginator ) && $board['status']->isEmpty())): ?>checked=""<?php endif; ?> value="1">
          </div>
      </div>
      <div class="layui-form-item">
          <div class="layui-input-block">
            <input type="checkbox" name="is_top" title="置顶" <?php if(empty($board['is_top']) || (($board['is_top'] instanceof \think\Collection || $board['is_top'] instanceof \think\Paginator ) && $board['is_top']->isEmpty())): ?>checked=""<?php endif; ?> value="0" >
          </div>
      </div>
     
      <?php if(!(empty($board) || (($board instanceof \think\Collection || $board instanceof \think\Paginator ) && $board->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $board['id']; ?>">
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
                      url:"<?php echo url('admin/board/publish'); ?>",
                      data:$('#admin').serialize(),
                      type:'post',
                      async: false,
                      success:function(res) {
                          console.log(res);
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
    <script id="container" name="content" type="text/plain">
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