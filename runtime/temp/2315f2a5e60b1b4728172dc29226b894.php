<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:64:"D:\mywork\lotgame\public/../app/admin\view\cardcate\publish.html";i:1553094216;}*/ ?>
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
        <li class="layui-this">新增卡类</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      <div class="layui-form-item">
        <label class="layui-form-label">充值卡名称</label>
        <div class="layui-input-block" style="max-width:500px;">
          <input name="name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($cardcaate['name']) || (($cardcaate['name'] instanceof \think\Collection || $cardcaate['name'] instanceof \think\Paginator ) && $cardcaate['name']->isEmpty()))): ?>value="<?php echo $cardcaate['name']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">价格（元）</label>
        <div class="layui-input-inline" >
          <input name="price" autocomplete="off" placeholder="请输入价格" class="layui-input" type="text" <?php if(!(empty($cardcaate['price']) || (($cardcaate['price'] instanceof \think\Collection || $cardcaate['price'] instanceof \think\Paginator ) && $cardcaate['price']->isEmpty()))): ?>value="<?php echo $cardcate['price']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">自定义卡头</label>
        <div class="layui-input-inline" >
          <input name="header" autocomplete="off" placeholder="0~3位英文或数字,推荐2位" class="layui-input" type="text" <?php if(!(empty($cardcaate['header']) || (($cardcaate['header'] instanceof \think\Collection || $cardcaate['header'] instanceof \think\Paginator ) && $cardcaate['header']->isEmpty()))): ?>value="<?php echo $cardcate['header']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">随机位数</label>
        <div class="layui-input-block" style="max-width:600px;">
          <select name="random_bits" lay-filter="aihao">
            <?php if(is_array($card_random_bits) || $card_random_bits instanceof \think\Collection || $card_random_bits instanceof \think\Paginator): if( count($card_random_bits)==0 ) : echo "" ;else: foreach($card_random_bits as $k=>$vo): ?>
            <option value="<?php echo $k; ?>" <?php if($k == '8'): ?> selected<?php endif; ?>><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">随机数类型</label>
        <div class="layui-input-block" style="max-width:600px;">
          <select name="random_bits" lay-filter="aihao">
            <?php if(is_array($card_random_type) || $card_random_type instanceof \think\Collection || $card_random_type instanceof \think\Paginator): if( count($card_random_type)==0 ) : echo "" ;else: foreach($card_random_type as $k=>$vo): ?>
            <option value="<?php echo $k; ?>" ><?php echo $vo; ?></option>
            <?php endforeach; endif; else: echo "" ;endif; ?>
          </select>
        </div>
      </div>



      <div class="layui-form-item">
        <label class="layui-form-label">等级</label>
        <div class="layui-input-block" style="max-width:500px;">
          <input name="grade" autocomplete="off" placeholder="标签之间用,隔开" class="layui-input" type="text" <?php if(!(empty($usergrade['grade']) || (($usergrade['grade'] instanceof \think\Collection || $usergrade['grade'] instanceof \think\Paginator ) && $usergrade['grade']->isEmpty()))): ?>value="<?php echo $usergrade['grade']; ?>"<?php endif; ?>>
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