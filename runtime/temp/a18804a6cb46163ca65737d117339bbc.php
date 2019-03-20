<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"D:\mywork\lotgame\public/../app/admin\view\usernote\send.html";i:1553088615;}*/ ?>
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
  <style type="text/css">
     .layui-input-fix{display: inline-block;width: auto;}
  </style>
</head>
<body style="padding:10px;">
  <div class="tplay-body-div">
    <div class="layui-tab">
      <ul class="layui-tab-title">
        <li class="layui-this">发送站内信</li>
      </ul>
    </div> 
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      <div class="layui-form-item">
        <label class="layui-form-label">发送目标</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="radio" name="type" value="1" title="所有用户" checked>
          <input type="radio" name="type" value="2" title="VIP用户" >
          <input type="radio" name="type" value="3" title="指定用户" >
        </div>
      </div>
  
      <div class="layui-form-item">
        <label class="layui-form-label">主题</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="title" lay-verify="title" autocomplete="off" required lay-verify="required" placeholder="请输入标题" class="layui-input" type="text" >
        </div>
      </div>
    

      <div class="layui-form-item">
        <label class="layui-form-label">问题内容</label>
        <div class="layui-input-block" >
          <textarea name="content" autocomplete="off" id="container" class="layui-textarea" required lay-verify="required" style="border:0;padding:0"></textarea>
        </div>
      </div>
      
    
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
                      url:"<?php echo url('admin/usernote/send'); ?>",
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

           laydate.render({
              elem: '#create_time',
              type: 'datetime'
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