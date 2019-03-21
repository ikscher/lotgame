<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:68:"D:\mywork\lotgame\public/../app/admin\view\userquestion\publish.html";i:1553047272;}*/ ?>
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
        <li><a href="<?php echo url('admin/userquestion/index'); ?>" class="a_menu">用户工单管理</a></li>
        <li class="layui-this">新增/编辑工单</li>
      </ul>
    </div> 
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      <div class="layui-form-item">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="user_id" lay-verify="title" autocomplete="off" required lay-verify="number" placeholder="请输入UID" class="layui-input" type="text" <?php if(!(empty($userquestion['user_id']) || (($userquestion['user_id'] instanceof \think\Collection || $userquestion['user_id'] instanceof \think\Paginator ) && $userquestion['user_id']->isEmpty()))): ?>value="<?php echo $userquestion['user_id']; ?>" disabled <?php endif; ?>>
        </div>
      </div>
  
      <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="title" lay-verify="title" autocomplete="off" required lay-verify="required" placeholder="请输入标题" class="layui-input" type="text" <?php if(!(empty($userquestion['title']) || (($userquestion['title'] instanceof \think\Collection || $userquestion['title'] instanceof \think\Paginator ) && $userquestion['title']->isEmpty()))): ?>value="<?php echo $userquestion['title']; ?>"<?php endif; ?>>
        </div>
      </div>
      
      <!-- <div class="layui-upload" id="upload-thumb">
        <label class="layui-form-label">缩略图</label>
        <button type="button" class="layui-btn" id="thumb">上传图片</button>
        <div class="layui-upload-list">
          <label class="layui-form-label"></label>
          <img class="layui-upload-img" id="demo1" width="150" height="150" <?php if(!(empty($prize['thumb']) || (($prize['thumb'] instanceof \think\Collection || $prize['thumb'] instanceof \think\Paginator ) && $prize['thumb']->isEmpty()))): ?>src="<?php echo geturl($prize['thumb']); ?>"<?php endif; ?>><?php if(!(empty($prize['thumb']) || (($prize['thumb'] instanceof \think\Collection || $prize['thumb'] instanceof \think\Paginator ) && $prize['thumb']->isEmpty()))): ?><input type="hidden" name="thumb" value="<?php echo $prize['thumb']; ?>"><?php endif; ?>
          <p id="demoText"></p>
        </div>
      </div> -->

      <div class="layui-form-item">
        <label class="layui-form-label">问题内容</label>
        <div class="layui-input-block" style="max-width:600px;">
          <textarea name="question" autocomplete="off"  class="layui-textarea" required lay-verify="required" ><?php if(!(empty($userquestion['question']) || (($userquestion['question'] instanceof \think\Collection || $userquestion['question'] instanceof \think\Paginator ) && $userquestion['question']->isEmpty()))): ?><?php echo $userquestion['question']; endif; ?></textarea>
        </div>
      </div>
      
      <?php if(!(empty($userquestion['user_id']) || (($userquestion['user_id'] instanceof \think\Collection || $userquestion['user_id'] instanceof \think\Paginator ) && $userquestion['user_id']->isEmpty()))): ?>
      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">回复内容</label>
        <div class="layui-input-block" style="max-width:1000px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="answer" id="container" style="border:0;padding:0"><?php if(!(empty($userquestion['answer']) || (($userquestion['answer'] instanceof \think\Collection || $userquestion['answer'] instanceof \think\Paginator ) && $userquestion['answer']->isEmpty()))): ?><?php echo $userquestion['answer']; endif; ?></textarea>
        </div>
      </div>
      <?php endif; ?>
      
      <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block" style="max-width:300px;">
          <select name="status" lay-filter="aihao">
            <?php if(is_array($status_arr) || $status_arr instanceof \think\Collection || $status_arr instanceof \think\Paginator): if( count($status_arr)==0 ) : echo "" ;else: foreach($status_arr as $k=>$vo): ?>
            <option value="<?php echo $k; ?>" <?php if(!(empty($userquestion['status']) || (($userquestion['status'] instanceof \think\Collection || $userquestion['status'] instanceof \think\Paginator ) && $userquestion['status']->isEmpty()))): if($userquestion['status'] == $k): ?> selected<?php endif; endif; ?>><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>

      <?php if(!(empty($userquestion) || (($userquestion instanceof \think\Collection || $userquestion instanceof \think\Paginator ) && $userquestion->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $userquestion['id']; ?>">
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
    layui.use('upload', function(){
      var upload = layui.upload;
      //执行实例
      var uploadInst = upload.render({
        elem: '#thumb' //绑定元素
        ,url: "<?php echo url('common/upload'); ?>" //上传接口
        ,data:{use:'prize_thumb'}
        ,done: function(res){
          //上传完毕回调
          if(res.code == 2) {
            $('#demo1').attr('src',res.src);
            $('#upload-thumb').append('<input type="hidden" name="thumb" value="'+ res.id +'">');
          } else {
            layer.msg(res.msg);
          }
        }
        ,error: function(){
          //请求异常回调
          //演示失败状态，并实现重传
          var demoText = $('#demoText');
          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
          demoText.find('.demo-reload').on('click', function(){
            uploadInst.upload();
          });
        }
      });
    });
    </script>
    <script>
      layui.use(['layer', 'form','laydate'], function() {
          var layer = layui.layer,
              $ = layui.jquery,
              form = layui.form,
              laydate = layui.laydate;
          $(window).on('load', function() {
              form.on('submit(admin)', function(data) {
                  $.ajax({
                      url:"<?php echo url('admin/userquestion/publish'); ?>",
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
    <?php if(!(empty($userquestion['user_id']) || (($userquestion['user_id'] instanceof \think\Collection || $userquestion['user_id'] instanceof \think\Paginator ) && $userquestion['user_id']->isEmpty()))): ?>
    <!-- 加载编辑器的容器 -->
    <script id="container" name="answer" type="text/plain">
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
    <?php endif; ?>
  </div>
</body>
</html>