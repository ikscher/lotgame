<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:69:"D:\mywork\lotgame\public/../app/admin\view\prizeflowcharge\index.html";i:1552912333;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1552567281;}*/ ?>
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
        <li class="layui-this">流水手续（投注）</li>
        <li><a href="<?php echo url('admin/prizeflowcharge/adduserrule'); ?>" class="a_menu">新增特殊用户</a></li>
      </ul>
    </div> 
      <form class="layui-form " id="admin">
        <div class="layui-form-item" style="float: left;">
          <div class="layui-form-item">
            <label class="layui-form-label">流水计算天数</label>
            <div class="layui-input-block">
             <input name="flow_days" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($web_config['flow_days']) || (($web_config['flow_days'] instanceof \think\Collection || $web_config['flow_days'] instanceof \think\Paginator ) && $web_config['flow_days']->isEmpty()))): ?>value="<?php echo $web_config['flow_days']; ?>"<?php endif; ?>>
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">额外兑奖手续费比例</label>
            <div class="layui-input-inline">
              <input name="charge_ratio" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($web_config['charge_ratio']) || (($web_config['charge_ratio'] instanceof \think\Collection || $web_config['charge_ratio'] instanceof \think\Paginator ) && $web_config['charge_ratio']->isEmpty()))): ?>value="<?php echo $web_config['charge_ratio']; ?>"<?php endif; ?>>
            </div>
          </div>

          <div class="layui-form-item">
            <label class="layui-form-label">流水倍数要求</label>
            <div class="layui-input-inline">
              <input name="flow_times" autocomplete="off" placeholder="请输入" class="layui-input" type="text" <?php if(!(empty($web_config['flow_times']) || (($web_config['flow_times'] instanceof \think\Collection || $web_config['flow_times'] instanceof \think\Paginator ) && $web_config['flow_times']->isEmpty()))): ?>value="<?php echo $web_config['flow_times']; ?>"<?php endif; ?>>
            </div>
          </div>
          
          <div class="layui-form-item">
            <label class="layui-form-label">自动投注算流水</label>
            <div class="layui-input-block">
              <input type="checkbox" name="flow_autobid" lay-skin="switch" value="1" <?php if(!(empty($web_config['flow_autobid']) || (($web_config['flow_autobid'] instanceof \think\Collection || $web_config['flow_autobid'] instanceof \think\Paginator ) && $web_config['flow_autobid']->isEmpty()))): ?>checked<?php endif; ?>>
            </div>
          </div>

          <button class="layui-btn" lay-submit lay-filter="save">保存</button>
        </div>
      </form> 
    <hr class="layui-bg-red">
    <table class="layui-table" lay-size="sm">
      <span>特殊用户</span>
      <colgroup>
        <col width="50">
        <col width="100">
        <col width="200">
        <col width="200">
        <col width="200">
      </colgroup>
      <thead>
        <tr>
          <th>UID</th>
          <th>用户名</th>
          <th>流水倍数要求</th>
          <th>手续费比例</th>
          <th>操作</th>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($chargeconfig) || $chargeconfig instanceof \think\Collection || $chargeconfig instanceof \think\Paginator): $i = 0; $__LIST__ = $chargeconfig;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>
          <td><?php echo $vo['user_id']; ?></td>
          <td><?php echo $vo['user']['username']; ?></td>
          <td><?php echo $vo['flow_times']; ?></td>
          <td><?php echo $vo['charge_ratio']; ?></td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <!-- <a href="<?php echo url('admin/prize/publish',['id'=>$vo['id']]); ?>" class="layui-btn layui-btn-xs a_menu layui-btn-primary" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a> -->
              <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary delete" id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $chargeconfig->render(); ?></div> 
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
        var id = $(this).attr('id');
        layer.confirm('确定要删除?', function(index) {
          $.ajax({
            url:"<?php echo url('admin/prizeflowcharge/deleteuserrule'); ?>",
            data:{id:id},
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
      });

      layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;
            $(window).on('load', function() {
                form.on('submit(save)', function(data) {
                    $.ajax({
                        url:"<?php echo url('admin/prizeflowcharge/publish'); ?>",
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

  </div>
</body>
</html>
