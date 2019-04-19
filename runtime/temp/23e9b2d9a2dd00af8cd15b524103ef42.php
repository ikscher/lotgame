<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:58:"D:\mywork\lotgame\public/../app/agent\view\other\info.html";i:1554889404;s:49:"D:\mywork\lotgame\app\agent\view\public\left.html";i:1555501924;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/static/public/layui/css/layui.css">

	<script src="/static/public/layui/layui.js"></script>
	<title>Document</title>
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
				<dd><a href="/agent/other/info">代理信息</a></dd>
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
		<h1>代理信息</h1>
		<hr>
        
		<div class="layui-form-item">
		    <label class="layui-form-label">代理ID：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="id" disabled value="<?php echo $agent['id']; ?>" class="layui-input">
		    </div>
		    <!-- <div class="layui-form-mid layui-word-aux"><a href="">查询</a></div> -->
		</div>

		<div class="layui-form-item">
		    <label class="layui-form-label">代理名称：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="name"  disabled  value="<?php echo $agent['name']; ?>" class="layui-input">
		    </div>
		</div>

		<div class="layui-form-item">
		    <label class="layui-form-label" >账户余额：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="balance"    value="<?php echo $agent['balance']; ?>" class="layui-input">
		    </div>
		</div>

		<div class="layui-form-item">
		    <label class="layui-form-label" >制卡折扣：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="discount"    value="<?php echo $agent['discount']; ?>" class="layui-input">
		    </div>
		</div>

		<div class="layui-form-item">
		    <label class="layui-form-label" >收卡额外奖励比例(%)：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="reclaim_reward"  value="<?php echo $agent['reclaim_reward']; ?>" class="layui-input">
		    </div>
		</div>

		<div class="layui-form-item">
		    <label class="layui-form-label" >铺货金额：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="advance"   value="<?php echo $agent['advance']; ?>"  class="layui-input">
		    </div>
		</div>

		<div class="layui-form-item">
		    <label class="layui-form-label" >可提现金额：</label>
		    <div class="layui-input-inline">
		      <input type="text" name="candebitcount"  value="<?php echo $agent['balance']-$agent['advance']+$agent['stock']*$agent['discount']; ?>"   class="layui-input">
		    </div>
		</div>


		<!-- <div class="result-box">
			<div class="agent-info">
				<img src="/413768708825.png">
				<p>表妹点卡></p>
				<a href="shoucardweb.php">进入收卡</a>
			</div>
			<div class="agent-xc">
				<form action="?act=save" method='post'>
					<label>宣传语：</label><input type="text" name="xcy" value=""/>
					<button type="submit">保 存</button>
				</form>
			</div>
			<div class="agent-con">
				<div class="agent-con-div">
					<div class="con1">
						<span>158</span>
						<p>代理ID</p>
					</div>
					<div class="con1" style="margin-top: 70px">
						<span>¥ 8,849.56</span>
						<p>账户余额</p>
					</div>
				</div>
				<div class="line"></div>
				<div class="agent-con-div">
					<div class="con1">
						<span>0.98</span>
						<p>制卡折扣</p>
					</div>
					<div class="con1" style="margin-top: 70px">
						<span>0%</span>
						<p>收卡额外奖励比例</p>
					</div>
				</div>
				<div class="line"></div>
				<div class="agent-con-div">
					<div class="con1">
						<span>¥ 10,000</span>
						<p>铺货金额</p>
					</div>
					<div class="con1" style="margin-top: 70px">
						<span>¥ -1,150.44</span>
						<p>可提现余额</p>
					</div>
				</div>
			</div>
		</div> -->

	</div>
</body>
</html>