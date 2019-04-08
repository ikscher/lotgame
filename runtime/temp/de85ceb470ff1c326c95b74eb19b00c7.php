<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"D:\mywork\lotgame\public/../app/admin\view\prize\publish.html";i:1554618950;}*/ ?>
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
        <li><a href="<?php echo url('admin/prize/index'); ?>" class="a_menu">奖品管理</a></li>
        <li class="layui-this">新增奖品</li>
      </ul>
    </div> 
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block" style="max-width:600px;">
          <select name="prize_cate_id" lay-filter="aihao">
            <option value="">请选择分类</option>
            <?php if(is_array($prizecates) || $prizecates instanceof \think\Collection || $prizecates instanceof \think\Paginator): $i = 0; $__LIST__ = $prizecates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <option value="<?php echo $vo['id']; ?>" <?php if(!(empty($prize['prize_cate_id']) || (($prize['prize_cate_id'] instanceof \think\Collection || $prize['prize_cate_id'] instanceof \think\Paginator ) && $prize['prize_cate_id']->isEmpty()))): if($prize['prize_cate_id'] == $vo['id']): ?> selected=""<?php endif; endif; ?>><?php echo $vo['str']; ?><?php echo $vo['name']; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="name" lay-verify="title" autocomplete="off" lay-verify="required" placeholder="请输入标题" class="layui-input" type="text" <?php if(!(empty($prize['name']) || (($prize['name'] instanceof \think\Collection || $prize['name'] instanceof \think\Paginator ) && $prize['name']->isEmpty()))): ?>value="<?php echo $prize['name']; ?>"<?php endif; ?>>
        </div>
      </div>
      
      <div class="layui-upload" id="upload-thumb">
        <label class="layui-form-label">缩略图</label>
        <button type="button" class="layui-btn" id="thumb">上传图片</button>
        <div class="layui-upload-list">
          <label class="layui-form-label"></label>
          <img class="layui-upload-img" id="demo1" width="150" height="150" <?php if(!(empty($prize['thumb']) || (($prize['thumb'] instanceof \think\Collection || $prize['thumb'] instanceof \think\Paginator ) && $prize['thumb']->isEmpty()))): ?>src="<?php echo geturl($prize['thumb']); ?>"<?php endif; ?>><?php if(!(empty($prize['thumb']) || (($prize['thumb'] instanceof \think\Collection || $prize['thumb'] instanceof \think\Paginator ) && $prize['thumb']->isEmpty()))): ?><input type="hidden" name="thumb" value="<?php echo $prize['thumb']; ?>"><?php endif; ?>
          <p id="demoText"></p>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">奖品价值</label>
        <div class="layui-input-block" style="max-width:300px;">
          <input name="price" autocomplete="off"  class="layui-input layui-input-fix" type="text" <?php if(!(empty($prize['price']) || (($prize['price'] instanceof \think\Collection || $prize['price'] instanceof \think\Paginator ) && $prize['price']->isEmpty()))): ?>value="<?php echo $prize['price']; ?>"<?php endif; ?>>（元）
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">奖品价值</label>
        <div class="layui-input-block" style="max-width:300px;">
          <input name="price" autocomplete="off"  class="layui-input layui-input-fix" type="text" <?php if(!(empty($prize['price']) || (($prize['price'] instanceof \think\Collection || $prize['price'] instanceof \think\Paginator ) && $prize['price']->isEmpty()))): ?>value="<?php echo $prize['price']; ?>"<?php endif; ?>>（元）
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">扣除经验</label>
        <div class="layui-input-block" style="max-width:300px;">
          <input name="de_exp" autocomplete="off"  class="layui-input layui-input-fix" type="text" <?php if(!(empty($prize['de_exp']) || (($prize['de_exp'] instanceof \think\Collection || $prize['de_exp'] instanceof \think\Paginator ) && $prize['de_exp']->isEmpty()))): ?>value="<?php echo $prize['de_exp']; ?>"<?php else: ?>value="0"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">扣除积分</label>
        <div class="layui-input-block" style="max-width:300px;">
          <input name="de_point" autocomplete="off"  class="layui-input layui-input-fix" type="text" <?php if(!(empty($prize['de_point']) || (($prize['de_point'] instanceof \think\Collection || $prize['de_point'] instanceof \think\Paginator ) && $prize['de_point']->isEmpty()))): ?>value="<?php echo $prize['de_point']; ?>"<?php else: ?>value="0"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">每次兑奖审核</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="must_check" lay-filter="check" title="" <?php if(!(empty($prize['must_check']) || (($prize['must_check'] instanceof \think\Collection || $prize['must_check'] instanceof \think\Paginator ) && $prize['must_check']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">对应卡类型</label>
        <div class="layui-input-block" style="max-width:300px;">
          <select name="card_cate_id"  lay-filter="catesel" >
            <?php if(is_array($cardcates) || $cardcates instanceof \think\Collection || $cardcates instanceof \think\Paginator): if( count($cardcates)==0 ) : echo "" ;else: foreach($cardcates as $key=>$vo): ?>
            <option value="<?php echo $vo['id']; ?>" <?php if(!(empty($prize['card_cate_id']) || (($prize['card_cate_id'] instanceof \think\Collection || $prize['card_cate_id'] instanceof \think\Paginator ) && $prize['card_cate_id']->isEmpty()))): if($prize['card_cate_id'] == $vo['id']): ?>selected<?php endif; endif; ?>><?php echo $vo['name']; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>

      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block" style="max-width:1000px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="desc" id="container" style="border:0;padding:0;z-index: -9999"><?php if(!(empty($prize['desc']) || (($prize['desc'] instanceof \think\Collection || $prize['desc'] instanceof \think\Paginator ) && $prize['desc']->isEmpty()))): ?><?php echo $prize['desc']; endif; ?></textarea>
        </div>
      </div>
      

      <?php if(!(empty($prize) || (($prize instanceof \think\Collection || $prize instanceof \think\Paginator ) && $prize->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $prize['id']; ?>">
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
                      url:"<?php echo url('admin/prize/publish'); ?>",
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

           laydate.render({
              elem: '#create_time',
              type: 'datetime'
            });

          //取反
          form.on('checkbox(check)',function(data){
             var x=$("input[name='must_check']");
             if(x.prop('checked')){
                x.val(1);
             }else{
                x.val(0);
             }
          })
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