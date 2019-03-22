<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:59:"D:\mywork\lotgame\public/../app/admin\view\agent\index.html";i:1553253938;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1553088615;}*/ ?>
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
        <li class="layui-this">代理管理</li>
        <li><a href="<?php echo url('admin/agent/publish'); ?>" class="a_menu">新增代理</a></li>
      </ul>
    </div> 
      <form class="layui-form serch" action="<?php echo url('admin/agent/index'); ?>" method="post">
        <div class="layui-inline">
          <div class="layui-input-inline">
            <select name="agent_id"  lay-filter="agentsel">
                <option  value="">所有代理</option>
                <?php if(is_array($agents) || $agents instanceof \think\Collection || $agents instanceof \think\Paginator): if( count($agents)==0 ) : echo "" ;else: foreach($agents as $key=>$vo): ?>
                <option value="<?php echo $k; ?>" <?php if(!(empty($agent_id) || (($agent_id instanceof \think\Collection || $agent_id instanceof \think\Paginator ) && $agent_id->isEmpty()))): if($agent_id == $k): ?>selected<?php endif; endif; ?>><?php echo $vo; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
              </select>
          </div>
        </div>

        <div class="layui-inline">
          <label class="layui-form-label">分类查询</label>
          <div class="layui-input-inline">
              <select name="agent_log_type">
                <option  value="">全部卡</option>
                <?php if(is_array($agent_log_types) || $agent_log_types instanceof \think\Collection || $agent_log_types instanceof \think\Paginator): if( count($agent_log_types)==0 ) : echo "" ;else: foreach($agent_log_types as $k=>$vo): ?>
                <option value="<?php echo $k; ?>" <?php if(!(empty($agent_log_type) || (($agent_log_type instanceof \think\Collection || $agent_log_type instanceof \think\Paginator ) && $agent_log_type->isEmpty()))): if($agent_log_type == $k): ?>selected<?php endif; endif; ?>><?php echo $vo; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
              </select>
          </div>
        </div>
        <button class="layui-btn layui-btn-primary layui-btn-sm" lay-submit="" lay-filter="serch">查询</button>
      </form> 
    
    <table class="layui-table" lay-size="sm">
      <colgroup>
        <col width="50">
        <col width="200">
        <col width="200">
        <col width="200">
        <col width="150">
        <col width="100">
        <col width="100">
        <col width="100">
        <col width="100">
        <col width="100">
        <col width="100">
        <col width="100">
        <col width="100">
      </colgroup>
      <thead>
        <tr>
          <th>ID</th>
          <th>名称</th>
          <th>铺货量（元）</th>
          <th>余额（元）</th>
          <th>库存量（元）</th>
          <th>折扣</th>
          <th>可提额</th>
          <th>操作</th>
          <th>今日业绩</th>
          <th>近7天业绩</th>
          <th>近30天业绩</th>
          <th>日志</th>
          <th>操作</th>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($agents) || $agents instanceof \think\Collection || $agents instanceof \think\Paginator): $i = 0; $__LIST__ = $agents;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>

          <td><?php echo $vo['id']; ?></td>
          <td><?php echo $vo['name']; ?></td>
          <td><?php echo $vo['advance']; ?></td>
          <td><?php echo $vo['balance']; ?></td>
          <td><?php echo $vo['stock']; ?></td>
          <td><?php echo $vo['discount']; ?></td>
          <td><?php echo $vo['balance']-$vo['advance']+$vo['stock']*$vo['discount']; ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary delete" id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $agents->render(); ?></div> 
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
      var id = $(this).attr('id');
      layer.confirm('确定要删除?', function(index) {
        $.ajax({
          url:"<?php echo url('admin/cardpwd/delete'); ?>",
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

    <script>
      layui.use(['layer', 'form','laydate'], function() {
          var layer = layui.layer,
          $ = layui.jquery,
          form = layui.form,
          laydate = layui.laydate;
          $(window).on('load', function() {
              form.on('select(catesel)', function(data) {
                  var id=data.value;
                  location.href='index?card_cate_id='+id;
              });
          });
      });
    </script>
  </div>
</body>
</html>
