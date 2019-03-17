<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:66:"D:\mywork\lotgame\public/../app/admin\view\signinconfig\index.html";i:1552790109;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1552567281;}*/ ?>
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
        <li class="layui-this">签到管理</li>
        <li><a href="<?php echo url('admin/signinconfig/publish'); ?>" class="a_menu">新增</a></li>
      </ul>
    </div>
    <span>设置公式：签到奖励计算公式为：基数+增数*连续天数</span>
    <table class="layui-table" lay-size="sm">
      <colgroup>
        <col width="50">
        <col width="100">
        <col width="50">
        <col width="300">
        <col width="200">
        <col width="100">
        <col width="100">
        <col width="150">
      </colgroup>
      <thead>
        <tr>
          <th>编号</th>
          <th>等级</th>
          <th>增数</th>
          <th>备注</th>
          <th>创建时间</th>
          <th>最大连续天数</th>
          <th>状态</th>
          <th>操作</th>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($signinconfig) || $signinconfig instanceof \think\Collection || $signinconfig instanceof \think\Paginator): $i = 0; $__LIST__ = $signinconfig;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>
          <td><?php echo $vo['id']; ?></td>
          <td><?php echo $vo['rank']; ?></td>
          <td><?php echo $vo['increment_num']; ?></td>
          <td><?php echo $vo['menu']; ?></td>
          <td><?php echo $vo['create_time']; ?></td>
          <td><?php echo $vo['max_successive_day']; ?></td>
          <td><?php if($vo['status'] == 1): ?><span class="layui-badge">启用</span><?php else: ?><span class="layui-badge layui-bg-gray">禁用</span><?php endif; ?></td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <a class="layui-btn layui-btn-xs a_menu layui-btn-primary" href="<?php echo url('admin/signinconfig/publish',['id'=>$vo['id']]); ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
              <a class="layui-btn layui-btn-xs layui-btn-primary status" <?php if($vo['status'] == 1): ?>data-id="0"<?php else: ?>data-id="1"<?php endif; ?> id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;" ><i class="fa <?php if($vo['status'] == 1): ?>fa-toggle-on<?php else: ?>fa-toggle-off<?php endif; ?>"></i></a>
              <a class="layui-btn layui-btn-xs delete layui-btn-primary" id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $signinconfig->render(); ?></div>
            
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
          url:"<?php echo url('admin/signinconfig/delete'); ?>",
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
    })

    </script>

    <script type="text/javascript">
    layui.use('layer', function(){
      var layer = layui.layer;
      

      $('.status').click(function(){
        var id = $(this).attr('id');
        var status = $(this).attr('data-id');
        layer.confirm('确定要设置?', function(index) {
          $.ajax({
            url:"<?php echo url('admin/signinconfig/status'); ?>",
            type:'post',
            data:{id:id,status:status},
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

    }); 
    </script>
  </div>
</body>
</html>
