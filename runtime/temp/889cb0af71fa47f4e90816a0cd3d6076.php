<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:64:"D:\mywork\lotgame\public/../app/agent\view\operate\retracty.html";i:1555070402;s:49:"D:\mywork\lotgame\app\agent\view\public\left.html";i:1555073719;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/static/public/layui/css/layui.css">
	<script src="/static/public/layui/layui.js"></script>
	<title>卡密回收</title>
</head>
<body>
	<style type="text/css">
   .left,.right{float:left;}
   .right{margin:50px 40px;width:70%;}
</style>
<div class="left">
	<ul class="layui-nav layui-nav-tree" lay-filter="test">
		<li style="line-height:100px;background-color:#5398e6;height:100px;text-align: center;font-size: 40px;">代理后台</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">常用操作</a>
			<dl class="layui-nav-child">
				<dd><a href="/agent/operate/retract">卡密回收</a></dd>
				<dd><a href="/agent/operate/recharge">金币代充</a></dd>
				<!-- <dd><a href="/agent/operate/gencard">生产卡密</a></dd> -->
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">其他功能</a>
			<dl class="layui-nav-child">
				<dd><a href="/agent/index">代理信息</a></dd>
				<dd><a href="/agent/other/bussiness">业务统计</a></dd>
				<!-- <dd><a href="/agent/other/rank">排行榜</a></dd> -->
				<dd><a href="/agent/other/transfer">资金互转</a></dd>
<!-- 				<dd><a href="/agent/other/allstock">库存管理（全部）</a></dd>
				<dd><a href="/agent/other/unsalestock">库存管理（未售）</a></dd> -->
				<dd><a href="/agent/other/cancel">代充撤回</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">代理记录</a>
			<dl class="layui-nav-child">
				<dd><a href="/agent/record/all">全部记录</a></dd>
				<!-- <dd><a href="/agent/record/generate">制卡记录</a></dd> -->
				<!-- <dd><a href="/agent/record/sale">售卡记录</a></dd> -->
				<dd><a href="/agent/record/retract">收卡记录</a></dd>
				<dd><a href="/agent/record/recharge">代充记录</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">资金管理</a>
			<dl class="layui-nav-child">
				<dd><a href="javascript:;" id="selfcharge">自助充值</a></dd>
				<dd><a href="/agent/capital/withdraw">资金提现</a></dd>
			</dl>
		</li>
	</ul>
</div>
<script tyep="text/javascript">
layui.use(['layer','jquery','form'], function(){
  var layer = layui.layer,form=layui.form, $=layui.jquery;
  

  $('#selfcharge').click(function(){
  	 layer.msg('暂不支持，请联系管理员进行充值！')
  })
});
</script> 

	<div class="right">
		<h1>卡密回收</h1>
	    <hr>
	    <form id="agentform">
		<table class="layui-table">
		  <colgroup>
		    <col width="240">
		    <col width="240">
		    <col width="200">
		    <col width="100">
		    <col width="200">
		    <col width="200">
		    <col width="200">
		    <col width="150">
		  </colgroup>
		  <thead>
		    <tr>
		      <th>卡号</th>
		      <th>卡密</th>
		      <th>面额</th>
		      <!-- <th>数量</th> -->
		      <th>兑奖用户</th>
		      <th>QQ</th>
		      <th>支付宝</th>
		      <th>状态</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr>
		      <td><?php echo $cardpwd['card_no']; ?></td>
		      <td><?php echo $cardpwd['card_pwd']; ?></td>
		      <td><?php echo $userexchange['price']; ?></td>
		      <!-- <td>1</td> -->
		      <td><?php echo $userexchange->user->username; ?></td>
		      <td><?php echo $userexchange->user->qq; ?></td>
		      <td><?php echo $userexchange->user->alipay; ?></td>
		      <td><?php if($cardpwd['status'] == 2): ?>可回收<?php else: ?>不可回收<?php endif; ?></td>
		    </tr>
		    <tr><td colspan="7" align="center">总面额：<?php echo $userexchange['price']; ?></td></tr>

		  </tbody>
        </table>

        <button class="layui-btn layui-btn-primary" data-enabled="<?php echo $enabled; ?>" lay-submit lay-filter="reclaim">确定回收</button>
        </form>
	</div>
</body>
<script type="text/javascript">
	layui.use(['form','jquery'], function(){
	    var form=layui.form,$=layui.jquery;

        form.on('submit(reclaim)',function(){
        	var enabled=$(this).attr('data-enabled');
        	if(!enabled){
                layer.msg('不可回收');
        	    return false;
        	}
      	    $.ajax({
                url:"<?php echo url('agent/operate/retracty'); ?>",
                data:$('#agentform').serialize(),
                type:'post',
                async: false,
                dataType:'json',
                success:function(res) {
                    if(res.code == 1) {
                        // layer.alert(res.msg, function(index){
                           location.href = res.url;
                        // })
                    } else {
                        layer.msg(res.msg);
                    }
                }
            })
            return false;
        })

	});
</script>
</html>