<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:58:"D:\mywork\lotgame\public/../app/admin\view\user\index.html";i:1554363744;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1553048572;}*/ ?>
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

/* tooltip */
#tooltip{
  position:absolute;
  border:1px solid #ccc;
  background:#333;
  padding:2px;
  display:none;
  color:#fff;
}
</style>
</head>
<body style="padding:10px;">
  <div class="tplay-body-div">
    <div class="layui-tab">
      <ul class="layui-tab-title">
        <li class="layui-this">用户管理</li>
        <li><a href="<?php echo url('admin/user/publish'); ?>" class="a_menu">修改用户</a></li>
      </ul>
    </div> 
      <form class="layui-form serch" action="<?php echo url('admin/user/index'); ?>" method="post">
        <div class="layui-form-item" style="float: left;">
          <div class="layui-input-inline">
            <input type="text" name="uid" lay-verify="title" autocomplete="off" placeholder="请输入UID" class="layui-input layui-btn-sm">
          </div>

          <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input layui-btn-sm">
          </div>

          <div class="layui-input-inline">
            <input type="text" name="mobile" lay-verify="title" autocomplete="off" placeholder="请输入手机号码" class="layui-input layui-btn-sm">
          </div>



          <div class="layui-input-inline">
            <div class="layui-inline">
                <select name="user_type" lay-search="">
                  <option value="">用户类型</option>
                  <option value="1">普通类型</option>
                  <option value="2">VIP类型</option>
                </select>
            </div>
          </div>
          <div class="layui-input-inline">
            <div class="layui-inline">
                <select name="status" lay-search="">
                  <option value="">冻结状态</option>
                  <option value="1">正常</option>
                  <option value="2">冻结</option>
                </select>
            </div>
          </div>
          
          
          <!-- <div class="layui-input-inline">
            <div class="layui-inline">
              <div class="layui-input-inline">
                <input type="text" class="layui-input" id="create_time" placeholder="创建时间" name="create_time">
              </div>
            </div>
          </div> -->
          <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="serch">查询</button>
        </div>
      </form> 
    <table class="layui-table" lay-size="sm">
      <colgroup>
        <col width="30">
        <col width="50">
        <col width="50">
        <col width="50">
        <col width="50">
        <col width="50">
        <col width="50">
        <col width="60">
        <col width="100">
        <col width="60">
        <col width="140">
      </colgroup>
      <thead>
        <tr>
          <th>ID</th>
          <th>用户</th>
          <th>邮箱</th>
          <th>手机号</th>
          <th>金币</th>
          <th>银行</th>
          <th>兑奖数</th>
          <th>充值/兑出</th>
          <th>登录信息</th>
          <th>是否冻结</th>
          <th>操作</th>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($users) || $users instanceof \think\Collection || $users instanceof \think\Paginator): $i = 0; $__LIST__ = $users;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>
          <td><input type="checkbox" name="uid[]" value="<?php echo $vo['uid']; ?>"></td>
          <td><?php echo $vo['username']; ?>(<?php echo $vo['uid']; ?>)</td>
          <td><?php echo $vo['email']; ?></td>
          <td><?php echo $vo['mobile']; ?></td>
          <td><?php echo $vo['coin']; ?></td>
          <td><?php echo $vo['bank']; ?></td>
          <td></td>
          <td></td>
          <td><?php echo getAddressByIp($vo['login_ip']); ?></td>
          <td><?php if($vo['is_freeze'] == 1): ?>正常<?php elseif($vo['is_freeze'] == 2): ?>冻结<?php endif; ?></td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <!-- <a href="<?php echo url('admin/user/edit',['uid'=>$vo['uid']]); ?>" class="layui-btn layui-btn-xs a_menu layui-btn-primary" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
              <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary delete" id="<?php echo $vo['uid']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a> -->
              <a href="javascript:;"  class="flogin" id="<?php echo $vo['uid']; ?>" style="margin: 0;font-size:12px;">进入</a><span style="margin:0 3px;"></span>
              <a href="<?php echo url('admin/user/publish',['uid'=>$vo['uid']]); ?>" class="a_menu" style="margin: 0;font-size:12px;">修改</a><span style="margin:0 3px;"></span>
              <?php if($vo['is_freeze'] == 1): ?>
                 <a href="javascript:;" class="freeze" id="<?php echo $vo['uid']; ?>" data-val="2" style="margin: 0;font-size:12px;">冻结</a><span style="margin:0 3px;"></span>
              <?php elseif($vo['is_freeze'] == 2): ?>
                 <a href="javascript:;" class="freeze" id="<?php echo $vo['uid']; ?>" data-val="1" style="margin: 0;font-size:12px;">解冻</a><span style="margin:0 3px;"></span>
              <?php endif; ?>
              <a href="javascript:;" class="delete" id="<?php echo $vo['uid']; ?>" style="margin: 0 ;font-size:12px;">删除</a><span style="margin:0 3px;"></span>
              <a href="<?php echo url('admin/userprofit/index',['uid'=>$vo['uid']]); ?>" class="a_menu"  id="<?php echo $vo['uid']; ?>" style="margin: 0 ;font-size:12px;">盈亏</a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $users->render(); ?></div> 
        <script src="/static/public/layui/layui.js" charset="utf-8"></script>
    <script src="/static/public/jquery/jquery.min.js"></script>
    <script>
            // var message;
        layui.config({
            base: '/static/admin/js/',
            version: '1.0.1'
        }).use(['app', 'message','laydate'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer,
                //将message设置为全局以便子页面调用
                message = layui.message,
                laydate = layui.laydate;
            //主入口
            app.set({
                type: 'iframe'
            }).init();


            laydate.render({
              elem: '#create_time'
            });

            laydate.render({
              elem: '#begin_time'
            });

            laydate.render({
              elem: '#end_time'
            });

        });
        
        
    </script> 
    <script type="text/javascript">
    $(function(){
      var x = 10;
      var y = 20;
      $(".tooltip").mouseover(function(e){ 
        var tooltip = "<div id='tooltip'><img src='"+ this.href +"' alt='产品预览图' height='200'/>"+"<\/div>"; //创建 div 元素
        $("body").append(tooltip);  //把它追加到文档中             
        $("#tooltip")
          .css({
            "top": (e.pageY+y) + "px",
            "left":  (e.pageX+x)  + "px"
          }).show("fast");    //设置x坐标和y坐标，并且显示
        }).mouseout(function(){  
        $("#tooltip").remove();  //移除 
        }).mousemove(function(e){
        $("#tooltip")
          .css({
            "top": (e.pageY+y) + "px",
            "left":  (e.pageX+x)  + "px"
          });
      });
    })
    </script>
    <script type="text/javascript">
    $('.a_menu').click(function(){
      var url = $(this).attr('href');
      var id = $(this).attr('id');
      var a = true;
      if(id) {
        $.ajax({
          url:url
          ,async:false
          ,data:{id:id}
          ,success:function(res){
            if(res.code == 0) {
              layer.msg(res.msg);
              a = false;
            }
          }
        })
      } else {
        $.ajax({
          url:url
          ,async:false
          ,success:function(res){
            if(res.code == 0) {
              layer.msg(res.msg);
              a = false;
            }
          }
        })
      }
      return a;
    })
    </script>

    <script type="text/javascript">

    $('.delete').click(function(){
      var uid = $(this).attr('id');
      layer.confirm('确定要删除?', function(index) {
        $.ajax({
          url:"<?php echo url('admin/user/delete'); ?>",
          data:{uid:uid},
          success:function(res) {
            layer.msg(res.msg);
            if(res.code == 1) {
              setTimeout(function(){
                location.href = res.url;
              },1500)
            }
          }
        })
      })
    })

    $('.flogin').click(function(){
       var uid = $(this).attr('id');
        $.ajax({
          url:"<?php echo url('admin/user/login'); ?>",
          data:{uid:uid},
          success:function(res) {
            if(res.code == 1) {
              layer.msg(res.msg);
              setTimeout(function(){
                 window.open(res.url);
              },1500)
            }
          }
        })

    });

    $('.freeze').click(function(){
      var uid = $(this).attr('id');
      var is_freeze=$(this).data('val');
      var msg=(is_freeze==1)?'解冻':'冻结';
      layer.confirm('确定要'+msg+'用户吗?', function(index) {
        $.ajax({
          url:"<?php echo url('admin/user/freeze'); ?>",
          data:{uid:uid,is_freeze:is_freeze},
          success:function(res) {
            layer.msg(res.msg);
            if(res.code == 1) {
              setTimeout(function(){
                location.href = res.url;
              },1500)
            }
          }
        })
      })
    })
    </script>
   <!--  <script type="text/javascript">

    $('.is_top').click(function(){
      var val = $(this).attr('data-val');
      var id = $(this).attr('data-id');
      var i = $(this).find('i');
      var the = $(this);
      if(val == 1){
        var is_top = 0;
      } else {
        var is_top = 1;
      }
      $.ajax({
        type:"post",
        url:"<?php echo url('admin/user/is_freeze'); ?>",
        data:{is_top:is_top,id:id},
        success:function(res){
          
          if(res.code == 1) {
            top();
          } else {
            layer.msg(res.msg);
          }
        }
      })

      function top(){
        if(val == 1){
          i.attr("class","fa fa-toggle-off");
          the.attr('data-val',0);
        } else {
          i.attr("class","fa fa-toggle-on");
          the.attr('data-val',1);
        }
      }
    })


    $('.status').click(function(){
      var val = $(this).attr('data-val');
      var id = $(this).attr('data-id');
      var i = $(this).find('i');
      var the = $(this);
      if(val == 1){
        var status = 0;
      } else {
        var status = 1;
      }
      $.ajax({
        type:"post",
        url:"<?php echo url('admin/article/status'); ?>",
        data:{status:status,id:id},
        success:function(res){
          
          if(res.code == 1) {
            tostatus();
          } else {
            layer.msg(res.msg);
          }
        }
      })

      function tostatus(){
        if(val == 1){
          i.attr("class","fa fa-toggle-off");
          the.attr('data-val',0);
        } else {
          i.attr("class","fa fa-toggle-on");
          the.attr('data-val',1);
        }
      }
    })
    </script> -->
  </div>
</body>
</html>
