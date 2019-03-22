<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:64:"D:\mywork\lotgame\public/../app/admin\view\cardcate\publish.html";i:1553221770;}*/ ?>
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
        <li><a href="<?php echo url('admin/cardcate/index'); ?>" class="a_menu">卡类管理</a></li>
        <li class="layui-this">新增/修改卡类</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      <div class="layui-form-item">
        <label class="layui-form-label">充值卡名称</label>
        <div class="layui-input-block" style="max-width:500px;">
          <input name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($cardcate['name']) || (($cardcate['name'] instanceof \think\Collection || $cardcate['name'] instanceof \think\Paginator ) && $cardcate['name']->isEmpty()))): ?>value="<?php echo $cardcate['name']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">价格（元）</label>
        <div class="layui-input-inline" >
          <input name="price" autocomplete="off" placeholder="请输入价格" class="layui-input" type="text" <?php if(!(empty($cardcate['price']) || (($cardcate['price'] instanceof \think\Collection || $cardcate['price'] instanceof \think\Paginator ) && $cardcate['price']->isEmpty()))): ?>value="<?php echo $cardcate['price']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">自定义卡头</label>
        <div class="layui-input-inline" >
          <input name="header" autocomplete="off" placeholder="0~3位英文或数字,推荐2位" class="layui-input" type="text" <?php if(!(empty($cardcate['header']) || (($cardcate['header'] instanceof \think\Collection || $cardcate['header'] instanceof \think\Paginator ) && $cardcate['header']->isEmpty()))): ?>value="<?php echo $cardcate['header']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">随机位数</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <select name="random_bits" lay-filter="aihao">
            <?php if(is_array($card_random_bits) || $card_random_bits instanceof \think\Collection || $card_random_bits instanceof \think\Paginator): if( count($card_random_bits)==0 ) : echo "" ;else: foreach($card_random_bits as $k=>$vo): ?>
            <option value="<?php echo $k; ?>" <?php if(!(empty($cardcate['random_bits']) || (($cardcate['random_bits'] instanceof \think\Collection || $cardcate['random_bits'] instanceof \think\Paginator ) && $cardcate['random_bits']->isEmpty()))): if($cardcate['random_bits'] == $k): ?>selected<?php endif; endif; ?>><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">随机数类型</label>
        <div class="layui-input-inline" style="max-width:600px;">
          <select name="random_type" lay-filter="aihao">
            <?php if(is_array($card_random_type) || $card_random_type instanceof \think\Collection || $card_random_type instanceof \think\Paginator): if( count($card_random_type)==0 ) : echo "" ;else: foreach($card_random_type as $k=>$vo): ?>
            <option value="<?php echo $k; ?>" <?php if(!(empty($cardcate['random_type']) || (($cardcate['random_type'] instanceof \think\Collection || $cardcate['random_type'] instanceof \think\Paginator ) && $cardcate['random_type']->isEmpty()))): if($cardcate['random_type'] == $k): ?>selected<?php endif; endif; ?>><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">升级VIP</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_vip" lay-filter="vip" title="" <?php if(!(empty($cardcate['is_vip']) || (($cardcate['is_vip'] instanceof \think\Collection || $cardcate['is_vip'] instanceof \think\Paginator ) && $cardcate['is_vip']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">领取天数</label>
        <div class="layui-input-inline" >
          <input name="valid_time" autocomplete="off" placeholder="在这个天数内有效" class="layui-input" type="text"  <?php if(!(empty($cardcate['valid_time']) || (($cardcate['valid_time'] instanceof \think\Collection || $cardcate['valid_time'] instanceof \think\Paginator ) && $cardcate['valid_time']->isEmpty()))): if($cardcate['valid_time'] >= 0): ?>value="<?php echo $cardcate['valid_time']; ?>"<?php endif; else: ?>value="0"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">使用获得金币</label>
        <div class="layui-input-inline" >
          <input name="coin" autocomplete="off" placeholder="" lay-verify="number" class="layui-input" type="text" <?php if(!(empty($cardcate['coin']) || (($cardcate['coin'] instanceof \think\Collection || $cardcate['coin'] instanceof \think\Paginator ) && $cardcate['coin']->isEmpty()))): if($cardcate['coin'] >= 0): ?>value="<?php echo $cardcate['coin']; ?>"<?php endif; else: ?>value="0"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">使用获得经验</label>
        <div class="layui-input-inline" >
          <input name="experiment" autocomplete="off" placeholder=""  lay-verify="number" class="layui-input" type="text" <?php if(!(empty($cardcate['experiment']) || (($cardcate['experiment'] instanceof \think\Collection || $cardcate['experiment'] instanceof \think\Paginator ) && $cardcate['experiment']->isEmpty()))): if($cardcate['experiment'] >= 0): ?>value="<?php echo $cardcate['experiment']; ?>"<?php endif; else: ?>value="0"<?php endif; ?> />
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">每日领取金币</label>
        <div class="layui-input-inline" >
          <input type="text" name="day_coin"  placeholder="" autocomplete="off" class="layui-input" <?php if(!(empty($cardcate['day_coin']) || (($cardcate['day_coin'] instanceof \think\Collection || $cardcate['day_coin'] instanceof \think\Paginator ) && $cardcate['day_coin']->isEmpty()))): if($cardcate['day_coin'] >= 0): ?>value="<?php echo $cardcate['day_coin']; ?>"<?php endif; else: ?>value="0"<?php endif; ?>>
          <!-- <input name="day_coin" 　class="layui-input" type="text" <?php if(!(empty($cardcate['day_coin']) || (($cardcate['day_coin'] instanceof \think\Collection || $cardcate['day_coin'] instanceof \think\Paginator ) && $cardcate['day_coin']->isEmpty()))): ?>value="<?php echo $cardcate['day_coin']; ?>"<?php endif; ?> /> -->
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">每日领取经验</label>
        <div class="layui-input-inline" >
          <input type="text" name="day_experiment"  placeholder="" autocomplete="off" class="layui-input" <?php if(!(empty($cardcate['day_experiment']) || (($cardcate['day_experiment'] instanceof \think\Collection || $cardcate['day_experiment'] instanceof \think\Paginator ) && $cardcate['day_experiment']->isEmpty()))): if($cardcate['day_experiment'] >= 0): ?>value="<?php echo $cardcate['day_experiment']; ?>"<?php endif; else: ?>value="0"<?php endif; ?>>
          <!-- <input name="day_experiment" autocomplete="off" placeholder=""  lay-verify="number"　class="layui-input" type="text" <?php if(!(empty($cardcate['day_experiment']) || (($cardcate['day_experiment'] instanceof \think\Collection || $cardcate['day_experiment'] instanceof \think\Paginator ) && $cardcate['day_experiment']->isEmpty()))): ?>value="<?php echo $cardcate['day_experiment']; ?>"<?php endif; ?> /> -->
        </div>
      </div>

      <div class="layui-upload" id="upload-thumb">
        <label class="layui-form-label">缩略图</label>
        <button type="button" class="layui-btn" id="thumb">上传图片</button>
        <div class="layui-upload-list">
          <label class="layui-form-label"></label>
          <img class="layui-upload-img" id="demo1" width="150" height="150" <?php if(!(empty($cardcate['thumb']) || (($cardcate['thumb'] instanceof \think\Collection || $cardcate['thumb'] instanceof \think\Paginator ) && $cardcate['thumb']->isEmpty()))): ?>src="<?php echo geturl($cardcate['thumb']); ?>"<?php endif; ?>><?php if(!(empty($cardcate['thumb']) || (($cardcate['thumb'] instanceof \think\Collection || $cardcate['thumb'] instanceof \think\Paginator ) && $cardcate['thumb']->isEmpty()))): ?><input type="hidden" name="avatar" value="<?php echo $cardcate['thumb']; ?>"><?php endif; ?>
          <p id="demoText"></p>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">代理可生成</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_agent" lay-filter="agent" title="" <?php if(!(empty($cardcate['is_agent']) || (($cardcate['is_agent'] instanceof \think\Collection || $cardcate['is_agent'] instanceof \think\Paginator ) && $cardcate['is_agent']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>


      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">卡类介绍</label>
        <div class="layui-input-block" style="max-width:1000px;">
          <textarea placeholder="请输入内容" class="layui-textarea" name="desc" id="container" style="border:0;padding:0"><?php if(!(empty($cardcate['desc']) || (($cardcate['desc'] instanceof \think\Collection || $cardcate['desc'] instanceof \think\Paginator ) && $cardcate['desc']->isEmpty()))): ?><?php echo $cardcate['desc']; endif; ?></textarea>
        </div>
      </div>

     
      
      <?php if(!(empty($cardcate) || (($cardcate instanceof \think\Collection || $cardcate instanceof \think\Paginator ) && $cardcate->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $cardcate['id']; ?>">
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
                      url:"<?php echo url('admin/cardcate/publish'); ?>",
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
                      url:"<?php echo url('admin/cardcate/publish'); ?>",
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
          form.on('checkbox(proxy)',function(data){
             var x=$("input[name='is_agent']");
             if(x.prop('checked')){
                x.val(1);
             }else{
                x.val(0);
             }
          })
          
          //取反
          form.on('checkbox(vip)',function(data){
             var x=$("input[name='is_vip']");
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