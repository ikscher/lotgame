<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:59:"D:\mywork\lotgame\public/../app/admin\view\prize\index.html";i:1552637544;s:49:"D:\mywork\lotgame\app\admin\view\public\foot.html";i:1553048572;}*/ ?>
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
        <li class="layui-this">奖品管理</li>
        <li><a href="<?php echo url('admin/prize/publish'); ?>" class="a_menu">新增奖品</a></li>
      </ul>
    </div> 
      <form class="layui-form serch" action="<?php echo url('admin/prize/index'); ?>" method="post">
        <div class="layui-form-item" style="float: left;">
          <div class="layui-input-inline">
            <input type="text" name="keywords" lay-verify="title" autocomplete="off" placeholder="请输入关键词" class="layui-input layui-btn-sm">
          </div>
          <div class="layui-input-inline">
            <div class="layui-inline">
                <select name="prize_cate_id" lay-search="">
                  <option value="">分类</option>
                  <?php if(is_array($info['cate']) || $info['cate'] instanceof \think\Collection || $info['cate'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['cate'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                  <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                  <?php endforeach; endif; else: echo "" ;endif; ?>
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
          <button class="layui-btn layui-btn-danger layui-btn-sm" lay-submit="" lay-filter="serch">查询</button>
        </div>
      </form> 
    <table class="layui-table" lay-size="sm">
      <colgroup>
        <col width="50">
        <col width="200">
        <col width="50">
        <col width="100">
        <col width="100">
        <col width="150">
        <col width="100">
        <col width="150">
        <col width="50">
        <col width="50">
        <col width="100">
      </colgroup>
      <thead>
        <tr>
          <th>ID</th>
          <th>奖品名称</th>
          <th>奖品类别</th>
          <th>奖品价格</th>
          <th>金币</th>
          <th>兑换次数</th>
          <th>剩余库存</th>
          <th>操作</th>
        </tr> 
      </thead>
      <tbody>
        <?php if(is_array($prizes) || $prizes instanceof \think\Collection || $prizes instanceof \think\Paginator): $i = 0; $__LIST__ = $prizes;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <tr>

          <td><?php echo $vo['id']; ?></td>
          <td><?php echo $vo['name']; ?></td>
          <td><?php echo $vo['cate']['name']; ?></td>
          <td><?php echo $vo['price']; ?></td>
          <td><?php echo $vo['units']; ?></td>
          <td><?php echo $vo['num']; ?></td>
          <td><?php echo $vo['stock']; ?></td>
          <td class="operation-menu">
            <div class="layui-btn-group">
              <a href="<?php echo url('admin/prize/publish',['id'=>$vo['id']]); ?>" class="layui-btn layui-btn-xs a_menu layui-btn-primary" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
              <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary delete" id="<?php echo $vo['id']; ?>" style="margin-right: 0;font-size:12px;"><i class="layui-icon"></i></a>
            </div>
          </td>
        </tr>
        <?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
    <div style="padding:0 20px;"><?php echo $prizes->render(); ?></div> 
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
          url:"<?php echo url('admin/prize/delete'); ?>",
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

    // $('.is_top').click(function(){
    //   var val = $(this).attr('data-val');
    //   var id = $(this).attr('data-id');
    //   var i = $(this).find('i');
    //   var the = $(this);
    //   if(val == 1){
    //     var is_top = 0;
    //   } else {
    //     var is_top = 1;
    //   }
    //   $.ajax({
    //     type:"post",
    //     url:"<?php echo url('admin/prize/is_top'); ?>",
    //     data:{is_top:is_top,id:id},
    //     success:function(res){
          
    //       if(res.code == 1) {
    //         top();
    //       } else {
    //         layer.msg(res.msg);
    //       }
    //     }
    //   })

    //   function top(){
    //     if(val == 1){
    //       i.attr("class","fa fa-toggle-off");
    //       the.attr('data-val',0);
    //     } else {
    //       i.attr("class","fa fa-toggle-on");
    //       the.attr('data-val',1);
    //     }
    //   }
    // })


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
        url:"<?php echo url('admin/prize/status'); ?>",
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
    </script>
  </div>
</body>
</html>
