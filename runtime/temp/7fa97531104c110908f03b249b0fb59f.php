<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:63:"D:\mywork\lotgame\public/../app/agent\view\operate\gencard.html";i:1553613651;s:49:"D:\mywork\lotgame\app\agent\view\public\left.html";i:1553613559;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/static/public/layui/css/layui.css">
	<script src="/static/public/layui/layui.js"></script>
	<title>卡密收回</title>
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
				<dd><a href="">代理信息</a></dd>
				<dd><a href="">业务统计</a></dd>
				<dd><a href="">排行榜</a></dd>
				<dd><a href="">资金互转</a></dd>
				<dd><a href="">库存管理（全部）</a></dd>
				<dd><a href="">库存管理（未售）</a></dd>
				<dd><a href="">代充撤回</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">代理记录</a>
			<dl class="layui-nav-child">
				<dd><a href="javascript:;">全部记录</a></dd>
				<dd><a href="javascript:;">制卡记录</a></dd>
				<dd><a href="javascript:;">售卡记录</a></dd>
				<dd><a href="javascript:;">收卡记录</a></dd>
				<dd><a href="javascript:;">代充记录</a></dd>
			</dl>
		</li>
		<li class="layui-nav-item layui-nav-itemed">
			<a href="javascript:;">资金管理</a>
			<dl class="layui-nav-child">
				<dd><a href="javascript:;">自助充值</a></dd>
				<dd><a href="javascript:;">资金提现</a></dd>
			</dl>
		</li>
	</ul>
</div>
    <div class="right">
	<form class="layui-form" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">充值卡类型</label>
	    <div class="layui-input-inline">
	      <select></select>
	    </div>
	  </div>

	  <div class="layui-form-item">
	    <label class="layui-form-label">生成张数</label>
	    <div class="layui-input-block">
	      <input type="text" name="title" disabled  lay-verify="required" placeholder="请输入生成张数" autocomplete="off" class="layui-input">
	    </div>
	  </div>

	  

	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	  </div>
	</form>
    </div>
</body>
</html>