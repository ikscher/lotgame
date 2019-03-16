<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:67:"D:\mywork\lotgame\public/../app/admin\view\prizeexchange\index.html";i:1552734484;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1552567281;}*/ ?>
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
td span a{
  margin:0 5px;
}
</style>
</head>
<body style="padding:10px;">
  <div class="tplay-body-div">
    <div class="layui-tab">
      <ul class="layui-tab-title">
        <li class="layui-this">奖品兑换审查</li>
        <!-- <li><a href="<?php echo url('admin/prize/publish'); ?>" class="a_menu">新增奖品</a></li> -->
      </ul>
    </div> 
      <form name="searchForm" class="layui-form serch" action="<?php echo url('admin/prizeexchange/index'); ?>" method="post">
        <div class="layui-form-item" style="float: left;">
          <div class="layui-input-inline">
            <input type="text" name="keywords_u" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input layui-btn-sm" <?php if(!(empty($post['keywords_u']) || (($post['keywords_u'] instanceof \think\Collection || $post['keywords_u'] instanceof \think\Paginator ) && $post['keywords_u']->isEmpty()))): ?>value="<?php echo $post['keywords_u']; ?>"<?php endif; ?>>
          </div>

          <div class="layui-input-inline">
            <input type="text" name="keywords_p" lay-verify="title" autocomplete="off" placeholder="请输入奖品名称" class="layui-input layui-btn-sm" <?php if(!(empty($post['keywords_p']) || (($post['keywords_p'] instanceof \think\Collection || $post['keywords_p'] instanceof \think\Paginator ) && $post['keywords_p']->isEmpty()))): ?>value="<?php echo $post['keywords_p']; ?>"<?php endif; ?>>
          </div>
         
          <div class="layui-input-inline">
            <div class="layui-inline">
                <select name="status" lay-search="">
                  <option value="">状态</option>
                  <option value="0">待审核</option>
                  <option value="1">已审核通过</option>
                  <option value="2">审核未通过</option>
                </select>
            </div>
          </div>
          
          <div class="layui-input-inline">
            <div class="layui-inline">
              <div class="layui-input-inline">
                <input type="text" class="layui-input" id="create_time" placeholder="创建时间" name="create_time" <?php if(!(empty($post['create_time']) || (($post['create_time'] instanceof \think\Collection || $post['create_time'] instanceof \think\Paginator ) && $post['create_time']->isEmpty()))): ?>value="<?php echo $post['create_time']; ?>"<?php endif; ?>>
              </div>
            </div>
          </div>
          
          <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="serch">查询</button>
          <button type="reset" class="layui-btn layui-btn-primary reset">重置</button>
        </div>
      </form> 
      
    <table class="layui-table" lay-size="sm">
      <colgroup>
        <col width="50">
        <col width="50">
        <col width="50">
        <col width="100">
        <col width="150">
        <col width="100">
        <col width="150">
        <col width="100">
        <col width="100">
      </colgroup>
      <thead>
        <tr>
          <th>ID</th>
          <th>用户ID</th>
          <th>用户名</th>
          <th>用户邮箱</th>
          <th>兑换奖品</th>
          <th>兑换价格</th>
          <th>兑换时间</th>
          <th>审核</th>
          <th>操作</thS>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($exchanges) || $exchanges instanceof \think\Collection || $exchanges instanceof \think\Paginator): $i = 0; $__LIST__ = $exchanges;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>

          <td><?php echo $vo['id']; ?></td>
          <td><?php echo $vo['user_id']; ?></td>
          <td><?php echo $vo['username']; ?></td>
          <td><?php echo $vo['email']; ?></td>
          <td><?php echo $vo['name']; ?></td>
          <td><?php echo $vo['ex_price']; ?></td>
          <td><?php echo date('Y-m-d H:i:s',$vo['create_time']); ?></td><!--如果是model不是Db::name创建的 A non well formed numeric value encountered  不需要用date转换  -->
          <td>
             <?php if($vo['status'] == 1): ?>
              已通过
             <?php elseif($vo['status'] == 2): ?>
             未通过
             <?php else: ?>
             <span><a class="exchange"  data-id="<?php echo $vo['id']; ?>" data-status="1" href="javascript:;">通过</a><a class="exchange"  data-id="<?php echo $vo['id']; ?>" data-status="2" href="javascript:;">拒绝</a></span>
             <?php endif; ?>
          </td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <!-- <a href="<?php echo url('admin/prizeexchange/publish',['id'=>$vo['id']]); ?>" class="layui-btn layui-btn-xs a_menu layui-btn-primary" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a> -->
              <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary delete" id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $page; ?></div> 
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
            url:"<?php echo url('admin/prizeexchange/delete'); ?>",
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
      $('.exchange').click(function(){
          var status = $(this).attr('data-status');
          var id = $(this).attr('data-id');
          var that = $(this);
          var str='';
          if(status==1){
            str='已通过';
          }else if(status==2){
            str='未通过';
          }
          layer.confirm("您确定"+str+"吗?", {btn: ['确定', '取消'], title: "提示"}, function (index) {
            $.ajax({
              type:"post",
              url:"<?php echo url('admin/prizeexchange/status'); ?>",
              data:{status:status,id:id},
              success:function(res){
                layer.close(layer.index);
                if(res.code == 1) {
                  that.parent('span').html(str);
                } else {
                  layer.msg(res.msg);
                }
              }
            })
          })
      })
    </script>
  </div>
</body>
</html>
