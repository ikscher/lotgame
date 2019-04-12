<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:64:"D:\mywork\lotgame\public/../app/agent\view\operate\recharge.html";i:1555070402;s:49:"D:\mywork\lotgame\app\agent\view\public\left.html";i:1555073719;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/static/public/layui/css/layui.css">
	<link rel="stylesheet" href="/static/agent//css/main.css">
	<script src="/static/public/layui/layui.js"></script>
	<title>金币代充</title>
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
    	<h1>金币代充</h1>
    	<hr>
		<form id="agentform">
		  <div class="layui-form-item">
		    <label class="layui-form-label">用户UID</label>
		    <div class="layui-input-inline">
		      <input type="text" name="uid" id="uid" required  lay-verify="required" placeholder="请输入用户UID" autocomplete="off" class="layui-input">
		    </div>
		    <div class="layui-form-mid layui-word-aux"><a id="queryuser" href="javascript:;">查询用户</a></div>
		  </div>
          
          <div id="userinfo"  style="display: none;">
			  <div class="layui-form-item">
			    <label class="layui-form-label">用户昵称</label>
			    <div class="layui-input-block">
			      <input type="text" id="username" disabled  class="layui-input">
			    </div>
			  </div>

			  <div class="layui-form-item">
			    <label class="layui-form-label">余额</label>
			    <div class="layui-input-block">
			      <input type="text" id="balance" disabled class="layui-input">
			    </div>
			  </div>

			  <div class="layui-form-item">
			    <label class="layui-form-label">银行</label>
			    <div class="layui-input-block">
			      <input type="text" id="bank" disabled class="layui-input">
			    </div>
			  </div>

			  <div class="layui-form-item">
			    <label class="layui-form-label">等级</label>
			    <div class="layui-input-block">
			      <input type="text" id="grade" disabled  autocomplete="off" class="layui-input">
			    </div>
			  </div>

			  <div class="layui-form-item">
			   
			    <div class="layui-input-block">
			      <a class="quickcharge" href="javascript:SetQuickMoney(10)">￥10</a>
			      <a class="quickcharge" href="javascript:SetQuickMoney(100)">￥100</a>
			      <a class="quickcharge" href="javascript:SetQuickMoney(500)">￥500</a>
			      <a class="quickcharge" href="javascript:SetQuickMoney(1000)">￥1000</a>
			      <a class="quickcharge" href="javascript:SetQuickMoney(5000)">￥5000</a>
			    </div>
			  </div>
          </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">代充金额</label>
		    <div class="layui-input-block">
		      <input type="text" name="coins" onkeyup="value=value.replace(/[^\d\.]/ig,'')" id="coins" placeholder="请输入金额" autocomplete="off" class="layui-input">
		    </div>
		  </div>

		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn layui-btn-primary" lay-submit lay-filter="charge">确认充值</button>
		      <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
		    </div>
		  </div>
		</form>
    </div>
</body>
<script type="text/javascript">
	layui.use(['form','jquery'], function(){
	    var form=layui.form,$=layui.jquery;
        
        $('#queryuser').click(function(){
        	var uid=$.trim($('#uid').val());
        	$.ajax({
                url:"<?php echo url('agent/operate/queryuser'); ?>",
                data:{uid:uid},
                type:'post',
                dataType:'json',
                success:function(res) {
                	console.log(res)
                    if(res.code == 1) {
                        $('#userinfo').css('display','block');
                        $('#username').val(res.username);
                        $('#balance').val(res.balance);
                        $('#bank').val(res.bank);
                        $('#grade').val('V'+res.user_grade_id);
                    } else {
                    	$('#userinfo').css('display','none');
                        layer.msg(res.msg);
                    }
                }
            })
        })

                    
       


        form.on('submit(charge)',function(){
        	var uid=$('#uid').val();
        	if(!uid){
        		layer.msg("请输入用户UID");
        		return false;
        	}
        	var coins=$('#coins').val();
        	if(!coins){
        		layer.msg('请输入金额');
        		return false;
        	}
        	if(layer.confirm('请再次核对信息，确定代充吗？\r\n用户UID：'+uid,function(index){

        		
	      	    $.ajax({
	                url:"<?php echo url('agent/operate/recharge'); ?>",
	                data:$('#agentform').serialize(),
	                type:'post',
	                async: false,
	                dataType:'json',
	                success:function(res) {
	                    if(res.code == 1) {
	                        layer.alert(res.msg, function(index){
		                       location.href = res.url;
		                    })
	                    } else {
	                        layer.msg(res.msg);
	                    }
	                }
	            })
	            layer.close(index);
	        }))
            return false;
        })

	});
</script>
<script type="text/javascript">
	function SetQuickMoney(money){
        document.getElementById("coins").value = money;
    }
</script>
</html>