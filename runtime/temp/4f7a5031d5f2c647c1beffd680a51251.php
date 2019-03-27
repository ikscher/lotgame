<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:59:"D:\mywork\lotgame\public/../app/agent\view\record\sale.html";i:1553661708;s:49:"D:\mywork\lotgame\app\agent\view\public\left.html";i:1553670421;}*/ ?>
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
   .right{margin:50px 40px;}
</style>
<div class="left">
	<ul class="layui-nav layui-nav-tree" lay-filter="test">
		<li style="line-height:100px;background-color:#5398e6;height:100px;text-align: center;font-size: 40px;">代理后台</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">常用操作</a>
			<dl class="layui-nav-child">
				<dd><a href="/agent/operate/retract">卡密回收</a></dd>
				<dd><a href="/agent/operate/recharge">金币代充</a></dd>
				<dd><a href="/agent/operate/gencard">生产卡密</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">其他功能</a>
			<dl class="layui-nav-child">
				<dd><a href="/agent/other/info">代理信息</a></dd>
				<dd><a href="/agent/other/bussiness">业务统计</a></dd>
				<dd><a href="/agent/other/rank">排行榜</a></dd>
				<dd><a href="/agent/other/transfer">资金互转</a></dd>
				<dd><a href="/agent/other/allstock">库存管理（全部）</a></dd>
				<dd><a href="/agent/other/unsalestock">库存管理（未售）</a></dd>
				<dd><a href="/agent/other/cancel">代充撤回</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">代理记录</a>
			<dl class="layui-nav-child">
				<dd><a href="/agent/record/all">全部记录</a></dd>
				<dd><a href="/agent/record/generate">制卡记录</a></dd>
				<dd><a href="/agent/record/sale">售卡记录</a></dd>
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
		<h1>售卡记录</h1>
		<hr>
		<div style="margin:40px 0 0 0;">
			<form class="layui-form" action="" id="agent">
				<div class="layui-form-item" style="display:inline;">
				    <label class="layui-form-label" style="width: 200px;">备注(支持模糊查找)</label>
				    <div class="layui-input-inline" style="width: 300px;">
				      <input type="text" name="keyword" autocomplete="off" class="layui-input">
				    </div>
				
		            <button class="layui-btn layui-btn-primary" lay-submit lay-filter="formAgent">查询</button>
		        </div>
	        </form>
        </div>
	    
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="150">
		    <col width="200">
		    <col width="200">
		    <col width="200">
		    <col width="200">
		    <col width="200">
		  </colgroup>
		  <thead>
		    <tr>
		      <th>记录号</th>
		      <th>类型</th>
		      <th>涉及金额</th>
		      <th>余额</th>
		      <th>时间</th>
		      <th>IP</th>
		      <th>备注</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr>
		      <td>贤心</td>
		      <td>2016-11-29</td>
		      <td>人生就像是一场修行</td>
		      <td>人生就像是一场修行</td>
		      <td>人生就像是一场修行</td>
		      <td>人生就像是一场修行</td>
		      <td>人生就像是一场修行</td>
		    </tr>
		    
		  </tbody>
        </table>
	</div>
</body>

</html>