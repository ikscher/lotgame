<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"D:\mywork\lotgame\public/../app/admin\view\agent\publish.html";i:1553477457;}*/ ?>
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
        <li><a href="<?php echo url('admin/agent/index'); ?>" class="a_menu">代理管理</a></li>
        <li class="layui-this">新增/修改代理</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      <?php if(!(empty($agent['id']) || (($agent['id'] instanceof \think\Collection || $agent['id'] instanceof \think\Paginator ) && $agent['id']->isEmpty()))): ?>
      <div class="layui-form-item">
        <label class="layui-form-label">代理编号</label>
        <div class="layui-input-block" style="max-width:500px;">
          <label><?php echo $agent['id']; ?></label>
        </div>
      </div>
      <?php endif; ?>
      <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline" >
          <input name="password" autocomplete="off" placeholder="" class="layui-input" type="pasword" <?php if(!(empty($agent['user']['pasword']) || (($agent['user']['pasword'] instanceof \think\Collection || $agent['user']['pasword'] instanceof \think\Paginator ) && $agent['user']['pasword']->isEmpty()))): ?>value="<?php echo $agent['user']['password']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">代理名</label>
        <div class="layui-input-inline" >
          <input name="name" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['name']) || (($agent['name'] instanceof \think\Collection || $agent['name'] instanceof \think\Paginator ) && $agent['name']->isEmpty()))): ?>value="<?php echo $agent['name']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">余额</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="balance" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['balance']) || (($agent['balance'] instanceof \think\Collection || $agent['balance'] instanceof \think\Paginator ) && $agent['balance']->isEmpty()))): ?>value="<?php echo $agent['balance']; ?>"<?php endif; ?>>
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">QQ</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="qq" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['qq']) || (($agent['qq'] instanceof \think\Collection || $agent['qq'] instanceof \think\Paginator ) && $agent['qq']->isEmpty()))): ?>value="<?php echo $agent['qq']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">铺货量(元)</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="advance" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['advance']) || (($agent['advance'] instanceof \think\Collection || $agent['advance'] instanceof \think\Paginator ) && $agent['advance']->isEmpty()))): ?>value="<?php echo $agent['advance']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">库存量</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="stock" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['stock']) || (($agent['stock'] instanceof \think\Collection || $agent['stock'] instanceof \think\Paginator ) && $agent['stock']->isEmpty()))): ?>value="<?php echo $agent['stock']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">制卡，代充折扣</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="discount" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['discount']) || (($agent['discount'] instanceof \think\Collection || $agent['discount'] instanceof \think\Paginator ) && $agent['discount']->isEmpty()))): ?>value="<?php echo $agent['discount']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">收卡奖励百分比</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="reclaim_reward" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['reclaim_reward']) || (($agent['reclaim_reward'] instanceof \think\Collection || $agent['reclaim_reward'] instanceof \think\Paginator ) && $agent['reclaim_reward']->isEmpty()))): ?>value="<?php echo $agent['reclaim_reward']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">绑定前台UID</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <input name="user_id" autocomplete="off" placeholder="" class="layui-input" type="text" <?php if(!(empty($agent['user_id']) || (($agent['user_id'] instanceof \think\Collection || $agent['user_id'] instanceof \think\Paginator ) && $agent['user_id']->isEmpty()))): ?>value="<?php echo $agent['user_id']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">在代理列表显示</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_show" lay-filter="show" title="" <?php if(!(empty($agent['is_show']) || (($agent['is_show'] instanceof \think\Collection || $agent['is_show'] instanceof \think\Paginator ) && $agent['is_show']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">冻结</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_freeze" lay-filter="freeze" title="" <?php if(!(empty($agent['is_freeze']) || (($agent['is_freeze'] instanceof \think\Collection || $agent['is_freeze'] instanceof \think\Paginator ) && $agent['is_freeze']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>

      <div class="layui-upload" id="upload-thumb">
        <label class="layui-form-label">代理头像</label>
        <button type="button" class="layui-btn" id="thumb">上传图片</button>
        <div class="layui-upload-list">
          <label class="layui-form-label"></label>
          <img class="layui-upload-img" id="demo1" width="150" height="150" <?php if(!(empty($agent['thumb']) || (($agent['thumb'] instanceof \think\Collection || $agent['thumb'] instanceof \think\Paginator ) && $agent['thumb']->isEmpty()))): ?>src="<?php echo geturl($agent['thumb']); ?>"<?php endif; ?>><?php if(!(empty($agent['thumb']) || (($agent['thumb'] instanceof \think\Collection || $agent['thumb'] instanceof \think\Paginator ) && $agent['thumb']->isEmpty()))): ?><input type="hidden" name="thumb" value="<?php echo $agent['thumb']; ?>"><?php endif; ?>
          <p id="demoText"></p>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">代理分类</label>
        <div class="layui-input-block" style="max-width:600px;">
            <select name="agent_cate_id">
              <?php if(is_array($cates) || $cates instanceof \think\Collection || $cates instanceof \think\Paginator): if( count($cates)==0 ) : echo "" ;else: foreach($cates as $k=>$vo): ?>
              <option value="<?php echo $k; ?>" <?php if(!(empty($agent['agent_cate_id']) || (($agent['agent_cate_id'] instanceof \think\Collection || $agent['agent_cate_id'] instanceof \think\Paginator ) && $agent['agent_cate_id']->isEmpty()))): if($agent['agent_cate_id'] == $k): ?>selected<?php endif; endif; ?>><?php echo $vo['name']; ?></option>
              <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
        </div>
      </div>
      
      <?php if(!(empty($agent) || (($agent instanceof \think\Collection || $agent instanceof \think\Paginator ) && $agent->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $agent['id']; ?>">
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
                      url:"<?php echo url('admin/agent/publish'); ?>",
                      data:$('#admin').serialize(),
                      type:'post',
                      async: false,
                      success:function(res) {
                          console.log(res)
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
                      url:"<?php echo url('admin/agent/publish'); ?>",
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

          //取反
          form.on('checkbox(freeze)',function(data){
             var x=$("input[name='is_freeze']");
             if(x.prop('checked')){
                x.val(1);
             }else{
                x.val(0);
             }
          })
          
          //取反
          form.on('checkbox(show)',function(data){
             var x=$("input[name='is_show']");
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