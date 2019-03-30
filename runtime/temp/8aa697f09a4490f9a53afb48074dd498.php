<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:60:"D:\mywork\lotgame\public/../app/admin\view\user\publish.html";i:1553947744;}*/ ?>
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
        <li><a href="<?php echo url('admin/user/index'); ?>" class="a_menu">用户管理</a></li>
        <li class="layui-this">修改用户</li>
      </ul>
    </div> 
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      <div class="layui-form-item">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="uid" lay-verify="title" autocomplete="off" disabled class="layui-input" type="text" <?php if(!(empty($user['uid']) || (($user['uid'] instanceof \think\Collection || $user['uid'] instanceof \think\Paginator ) && $user['uid']->isEmpty()))): ?>value="<?php echo $user['uid']; ?>"<?php endif; ?>>
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="username" autocomplete="off"  class="layui-input" type="text" <?php if(!(empty($user['username']) || (($user['username'] instanceof \think\Collection || $user['username'] instanceof \think\Paginator ) && $user['username']->isEmpty()))): ?>value="<?php echo $user['username']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
          <input type="radio" name="gender" value="1" title="男"  <?php if($user['gender'] == 1): ?>checked<?php endif; ?>>
          <input type="radio" name="gender" value="2" title="女"  <?php if($user['gender'] == 2): ?>checked<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">用户类型</label>
        <div class="layui-input-block" style="max-width:600px;">
          <label><?php echo $user['user_type']; ?></label>
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">用户邮箱</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="email" autocomplete="off"  class="layui-input" type="text" <?php if(!(empty($user['email']) || (($user['email'] instanceof \think\Collection || $user['email'] instanceof \think\Paginator ) && $user['email']->isEmpty()))): ?>value="<?php echo $user['email']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">邮箱验证</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_email" lay-filter="email" title="" <?php if(!(empty($user['is_email']) || (($user['is_email'] instanceof \think\Collection || $user['is_email'] instanceof \think\Paginator ) && $user['is_email']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>
      
      <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="password" autocomplete="off"  class="layui-input" type="password" <?php if(!(empty($user['password']) || (($user['password'] instanceof \think\Collection || $user['password'] instanceof \think\Paginator ) && $user['password']->isEmpty()))): ?>value="<?php echo $user['password']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">手机号码</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="mobile" autocomplete="off"  class="layui-input" lay-verify="required|phone|number" type="text" <?php if(!(empty($user['mobile']) || (($user['mobile'] instanceof \think\Collection || $user['mobile'] instanceof \think\Paginator ) && $user['mobile']->isEmpty()))): ?>value="<?php echo $user['mobile']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">手机验证</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input type="checkbox" name="is_mobile" lay-filter="mobile" title="" <?php if(!(empty($user['is_mobile']) || (($user['is_mobile'] instanceof \think\Collection || $user['is_mobile'] instanceof \think\Paginator ) && $user['is_mobile']->isEmpty()))): ?>checked value="1"<?php else: ?> value="0"<?php endif; ?> >
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">QQ</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="qq" autocomplete="off"  class="layui-input" lay-verify="required|number" type="text" <?php if(!(empty($user['qq']) || (($user['qq'] instanceof \think\Collection || $user['qq'] instanceof \think\Paginator ) && $user['qq']->isEmpty()))): ?>value="<?php echo $user['qq']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">用户金币</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="units" autocomplete="off" lay-verify="required|number"  class="layui-input" type="text" <?php if(!(empty($user['units']) || (($user['units'] instanceof \think\Collection || $user['units'] instanceof \think\Paginator ) && $user['units']->isEmpty()))): ?>value="<?php echo $user['units']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">金币银行</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="bank" autocomplete="off"  lay-verify="required|number" class="layui-input" type="text" <?php if(!(empty($user['bank']) || (($user['bank'] instanceof \think\Collection || $user['bank'] instanceof \think\Paginator ) && $user['bank']->isEmpty()))): ?>value="<?php echo $user['bank']; ?>"<?php endif; ?>>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">用户积分</label>
        <div class="layui-input-block" style="max-width:600px;">
          <input name="points" autocomplete="off"  class="layui-input"  lay-verify="required|number" type="text" <?php if(!(empty($user['points']) || (($user['points'] instanceof \think\Collection || $user['points'] instanceof \think\Paginator ) && $user['points']->isEmpty()))): ?>value="<?php echo $user['points']; ?>"<?php endif; ?>>
        </div>
      </div>


      <div class="layui-upload" id="upload-thumb">
        <label class="layui-form-label">缩略图</label>
        <button type="button" class="layui-btn" id="thumb">上传图片</button>
        <div class="layui-upload-list">
          <label class="layui-form-label"></label>
          <img class="layui-upload-img" id="demo1" width="150" height="150" <?php if(!(empty($user['avatar']) || (($user['avatar'] instanceof \think\Collection || $user['avatar'] instanceof \think\Paginator ) && $user['avatar']->isEmpty()))): ?>src="<?php echo geturl($user['avatar']); ?>"<?php endif; ?>><?php if(!(empty($user['avatar']) || (($user['avatar'] instanceof \think\Collection || $user['avatar'] instanceof \think\Paginator ) && $user['avatar']->isEmpty()))): ?><input type="hidden" name="avatar" value="<?php echo $user['avatar']; ?>"><?php endif; ?>
          <p id="demoText" ></p>
        </div>
      </div>

      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-inline birth" style="max-width:900px;">
          <select name="year" class="sel_year" rel="<?php echo date('Y',strtotime($user['birth'])); ?>" lay-filter="birth" ></select>年
          <select name="month" class="sel_month" rel="<?php echo date('m',strtotime($user['birth'])); ?>" lay-filter="birth"></select>月
          <select name="day" class="sel_day" rel="<?php echo date('d',strtotime($user['birth'])); ?>" ></select>日
        </div>
      </div>
      <style type="text/css">
         div.birth div{display: inline-block;}/*修正解决select选框出现单行显示*/
      </style>


      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">VIP到期时间</label>
        <div class="layui-input-block" style="max-width:300px;">
            <input type="text" class="layui-input" id="vip_expire" placeholder="结束时间" name="vip_expire" <?php if(!(empty($user['vip_expire']) || (($user['vip_expire'] instanceof \think\Collection || $user['vip_expire'] instanceof \think\Paginator ) && $user['vip_expire']->isEmpty()))): ?>value="<?php echo date("Y-m-d H:i:s",$user['vip_expire']); ?>"<?php endif; ?>>
        </div>
      </div>

      

      <?php if(!(empty($user) || (($user instanceof \think\Collection || $user instanceof \think\Paginator ) && $user->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $user['uid']; ?>">
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
       
    <!-- <script src="/static/public/jquery/birthday.js"></script> -->
    <script>
    layui.use('upload', function(){
      var upload = layui.upload;
      //执行实例
      var uploadInst = upload.render({
        elem: '#thumb' //绑定元素
        ,url: "<?php echo url('common/upload'); ?>" //上传接口
        ,data:{use:'user_thumb'}
        ,done: function(res){
          //上传完毕回调
          if(res.code == 2) {
            $('#demo1').attr('src',res.src);
            $('#upload-thumb').append('<input type="hidden" name="avatar" value="'+ res.id +'">');
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
       layui.config({
            base: '/static/admin/js/',
            version: '1.0.1'
        }).extend({
          birthday:'birthday'
        });
      layui.use(['layer', 'form','laydate','jquery','birthday'], function() {
          var layer = layui.layer,
          $ = layui.jquery,
          form = layui.form,
          laydate = layui.laydate,
          birthday = layui.birthday;
          $(window).on('load', function() {
              form.on('submit(admin)', function(data) {
                  $.ajax({
                      url:"<?php echo url('admin/user/publish'); ?>",
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

          laydate.render({
              elem: '#vip_expire',
              type: 'datetime'
          });

          //取反
          form.on('checkbox(email)',function(data){
             var x=$("input[name='is_email']");
             if(x.prop('checked')){
                x.val(1);
             }else{
                x.val(0);
             }
          })
          
          //取反
          form.on('checkbox(mobile)',function(data){
             var x=$("input[name='is_mobile']");
             if(x.prop('checked')){
                x.val(1);
             }else{
                x.val(0);
             }
          })
         
          // console.log(birthday)
          // birthday.init();
          birthday.ms_DatePicker();
        
 

      });
    </script>

  </div>
</body>
</html>