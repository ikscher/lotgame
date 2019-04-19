<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:61:"D:\mywork\lotgame\public/../app/admin\view\cardpwd\index.html";i:1555311814;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1553048572;}*/ ?>
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
        <li class="layui-this">卡密管理</li>
        <li><a href="<?php echo url('admin/cardpwd/publish'); ?>" class="a_menu">新增卡密</a></li>
      </ul>
    </div> 
      <form class="layui-form serch" action="<?php echo url('admin/cardpwd/index'); ?>" method="post">
        <div class="layui-inline">
          <div class="layui-input-inline">
            <input type="text" name="keywords" lay-verify="title" autocomplete="off" placeholder="请输入关键词" class="layui-input layui-btn-sm" <?php if(!(empty($keywords) || (($keywords instanceof \think\Collection || $keywords instanceof \think\Paginator ) && $keywords->isEmpty()))): ?>value="<?php echo $keywords; ?>"{/eq}<?php endif; ?>>
          </div>
          
          
          <button class="layui-btn layui-btn-primary layui-btn-sm" lay-submit="" lay-filter="serch">查询</button>
        </div>

        <div class="layui-inline">
          <label class="layui-form-label">分类查询</label>
          <div class="layui-input-inline">
              <select name="card_cate_id"  lay-filter="catesel">
                <option  value="">全部卡</option>
                <?php if(is_array($cates) || $cates instanceof \think\Collection || $cates instanceof \think\Paginator): if( count($cates)==0 ) : echo "" ;else: foreach($cates as $key=>$vo): ?>
                <option value="<?php echo $vo['id']; ?>" <?php if(!(empty($card_cate_id) || (($card_cate_id instanceof \think\Collection || $card_cate_id instanceof \think\Paginator ) && $card_cate_id->isEmpty()))): if($card_cate_id == $vo['id']): ?>selected<?php endif; endif; ?>><?php echo $vo['name']; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
              </select>
          </div>
        </div>
        
        <div class="layui-inline" style="margin-left:20px;">
          <a href="index?status=3">已回收</a>
          <a href="index?status=4">已充值</a>
          <a href="index?status=1">未充值</a>
          <a href="index?status=2">已兑出</a>
        </div>
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
      </colgroup>
      <thead>
        <tr>
          <th>ID</th>
          <th>卡号</th>
          <th>密码</th>
          <th>充值卡类型</th>
          <th>所属代理</th>
          <th>状态</th>
          <th>兑奖用户</th>
          <th>生成时间</th>
          <th>使用时间</th>
          <th>操作</th>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($cardpwds) || $cardpwds instanceof \think\Collection || $cardpwds instanceof \think\Paginator): $i = 0; $__LIST__ = $cardpwds;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>

          <td><?php echo $vo['id']; ?></td>
          <td><?php echo $vo['card_no']; ?></td>
          <td><?php echo $vo['card_pwd']; ?></td>
          <td><?php echo $vo['cate']['name']; ?></td>
          <td><?php if(!(empty($vo['agent']['name']) || (($vo['agent']['name'] instanceof \think\Collection || $vo['agent']['name'] instanceof \think\Paginator ) && $vo['agent']['name']->isEmpty()))): ?><?php echo $vo['agent']['name']; else: ?>官方<?php endif; ?></td>
          <td><?php echo $card_status[$vo['status']]; ?></td>
          <td><?php echo $vo['user']['username']; ?></td>
          <td><?php echo $vo['create_time']; ?></td>
          <td><?php if(!(empty($vo['use_time']) || (($vo['use_time'] instanceof \think\Collection || $vo['use_time'] instanceof \think\Paginator ) && $vo['use_time']->isEmpty()))): ?><?php echo date('Y-m-d H:i:s',$vo['use_time']); endif; ?></td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary delete" id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $cardpwds->render(); ?></div> 
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
