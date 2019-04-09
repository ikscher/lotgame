<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:63:"D:\mywork\lotgame\public/../app/front\view\common\register.html";i:1554377533;s:51:"D:\mywork\lotgame\app\front\view\public\header.html";i:1554734502;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<!-- 	<meta name="renderer" content="webkit"/> -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<?php if($controller == 'User'): ?>
	<link href="/static/front/css/user.css" type="text/css" rel="stylesheet" />
	<?php elseif($controller != 'Index'): ?>
	<link href="/static/front/css/base.css" type="text/css" rel="stylesheet" />
	<?php endif; ?>
    <link href="/static/front/css/common.css" type="text/css" rel="stylesheet" />
	<script src="/static/public/jquery/jquery.min.js"></script>
	<script src="/static/public/layui/layui.js"></script>
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<title><?php echo $title; ?></title>
</head>
<body>
<style type="text/css">
#callboard {width: 253px; overflow: hidden; display: inline-block; vertical-align: middle; font-size: 12px; position: relative; top: -1px; margin-left: 30px;float:left} 
#callboard ul { padding:0; } 
#callboard li { padding:0; } 
</style>
<div style="width: 100%;background: #fff;">
	<div class="bar">
		<div class="w1000">
			<span class="barl fl">欢迎光临！<a href="/SaveToHome.php">保存到桌面</a> <a href="/mobile.php">手机版</a><a href="/User/Sign?act=qd" class="qd">签到</a></span>
			<div id="callboard">
				<ul>
					<?php if(is_array($boardlist) || $boardlist instanceof \think\Collection || $boardlist instanceof \think\Paginator): $i = 0; $__LIST__ = $boardlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<li>
						<a style="color:red;" target="_blank" href="/Board/Detail/<?php echo $vo['id']; ?>" ><?php echo $vo['title']; ?></a>
					</li>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
			</div>
			<span class="barr fr">
				<?php if($uid > 0): ?>
					<b ><?php echo $user['username']; ?>(<?php echo $uid; ?>)</b> <b style="background:url(/static/front/image/v0.png) no-repeat right center;padding-right:18px;"></b> &nbsp; <span>余额：<b id="topmoney"><?php echo $user['coin']; ?></b></span> &nbsp;
					<a href="/User/Index">我的账号</a> <a href="/User/Msg">站内信</a>&nbsp;
					<a id="LinkButton1" href="/common/logout">退出</a>
                <?php else: ?>
                	<a href="/Common/Login" class="dl line">HI, 请登录</a>  <a href="/Common/Register" class="line">注册</a> <a href="/User/FindPwd" class="line">找回密码</a>
                <?php endif; ?>
				<!-- <a style="margin-left: -4px;" href="https://ssl.pop800.com/chat/368923" target="_blank" class="fav">在线客服</a>-->
			</span> 
		</div>
	</div>
	<div class="w1000"> 
		<div class="logobox">
			<h1 class="fl"><a href="/"><img src="/static/front/image/logo.png?v=2.3" class="logo"></a><img src="/static/front/image/logor.png" class="logor"></h1>
			<ul class="nav-ul">
				<li class="select"><a href="/" class="nli">首页</a></li>
				<li><a href="/Game/Index" class="nli">游戏中心</a></li>
				<li><a href="/Shop/Index" class="nli">兑换商城</a></li>
				<li><a href="/Article/Index" class="nli">活动专场</a></li>
				<div class="dropdown fl">
					<li>
						<a href="#" class="nli">福利时代</a>
						<div class="dropdown-main">
							<div class="dropdown-content">
								<a href="/Hd/Qiangka">抢卡风暴</a>
								<a href="/Prize/Shatter">砸金蛋</a>
								<a href="/Prize/Index">抽奖转盘</a>
							</div>
						</div>
					</li>
				</div>
				<li><a href="/Game/top" class="nli">排行榜</a></li>
				<li><a href="/User/Index" class="nli">会员中心</a></li>
				<li><a href="/site/index" class="nli">了解彩豆</a></li>
				<li><a href="/agent/index" class="nli">合作商家</a></li>
				<!-- <li><a style="color:red" href="/appdownload.php" class="nli">APP下载</a></li> -->
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>

<SCRIPT type=text/javascript>

	$('.ucen').click(function(){
		$('.nav ul .nli').fadeToggle(100);
	});
	$(document).ready(function(){
		$('.nav ul .nli').fadeToggle(100);
	});
</SCRIPT>

<script>
	$(function(){
		var pNall = window.location.pathname;
		$(".nav-ul").find('li').each(function(i) {
			$(this).attr('class','');
			if(pNall.toLowerCase().indexOf("game/top") > 0){
				if(i==5){
					$(this).attr('class','select');
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("shatter") > 0){
				if(i==4){
					$(this).attr('class','select');
					$(".dropdown-content a:eq(1)").addClass("select");
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("hd/qiangka") > 0){
				if(i==4){
					$(this).attr('class','select');
					$(".dropdown-content a:eq(0)").addClass("select");
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("prize/index") > 0){
				if(i==4){
					$(this).attr('class','select');
					$(".dropdown-content a:eq(2)").addClass("select");
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("game/") > 0){
				if(i==1){
					$(this).attr('class','select');
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("hd/") > 0){
				if(i==3){
					$(this).attr('class','select');
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("shop/") > 0){
				if(i==2){
					$(this).attr('class','select');
				}
				return;
			}
			if(pNall.toLowerCase().indexOf("user/") > 0){
				if(i==6){
					$(this).attr('class','select');
				}
				return;
			}


			if(i==0){
				$(this).attr('class','select');
			}
			return;


		});
	});
</script>

<script type="text/javascript">
	(function (win){
		var callboarTimer;
		var callboard = $('#callboard');
		var callboardUl = callboard.find('ul');
		var callboardLi = callboard.find('li');
		var liLen = callboard.find('li').length;
		var initHeight = callboardLi.first().outerHeight(true);
		win.autoAnimation = function (){
			if (liLen <= 1) return;
			var self = arguments.callee;
			var callboardLiFirst = callboard.find('li').first();
			callboardLiFirst.animate({
				marginTop:-initHeight
			}, 500, function (){
				clearTimeout(callboarTimer);
				callboardLiFirst.appendTo(callboardUl).css({marginTop:0});
				callboarTimer = setTimeout(self, 5000);
			});
		}
		callboard.mouseenter(
			function (){
				clearTimeout(callboarTimer);
			}).mouseleave(function (){
				callboarTimer = setTimeout(win.autoAnimation, 5000);
			});
		}(window));
	setTimeout(window.autoAnimation, 5000);
</script>
<script type="text/javascript" src="/static/front/js/gt.js"></script>
<script type="text/javascript" src="/static/front/js/reg.js"></script>
<script src="/static/public/jquery/jquery.showLoading.min.js"></script>
<link href="/static/front/css/register.css" rel="stylesheet"/>

<div class="regbox">
    <!--第一步-->
    <div class="register" style="background:none">


        <div class="reg_items">
            <div class="reg_items_step_1">
                <ul>
                    <form id="regform">
                        <li><span>手机号</span><input  name="mobile" id="mobile"  type="text" class="register_txt a1" placeholder="输入您的手机号">
                         <span id="info_dv_1" style="display:none;">
                            <div id="info_1" class="register_tip_box"><font id="sUserMail" class="fo fo1"></font></div>
                        </span>
                        </li>
                        <li>
                             <span>验证码</span><input  name="tbSafeCode"  id="tbSafeCode"  type="text" class="register_txt a2">
                             <button type="button" id="popup-submit" class="send_btn">获取验证码</button>
                             <div id="embed-captcha"></div>
                             <p id="wait" class="show"></p>
                             <p id="notice" class="hide">请先拖动滑块到正确位置</p>
                             <div id="popup-captcha"></div>
                             <font id="sjNumMes" class="fo fo1"></font>
                        </li>

                        <li><span>昵称</span><input  name="tbUserNick" id="tbUserNick"  type="text" class="register_txt a1" placeholder="输入您的昵称">
                          <font id="sUserNick" class="fo fo1"></font>
                        </li>
                        <li><span>密码</span><input name="tbUserPwd" id="tbUserPwd" type="password"  class="register_txt a1" placeholder="请输入密码">
                          <font id="sUserPwd" class="fo fo1"></font>
                        </li>
                        <li><span>确认密码</span><input  name="tbRePwd" id="tbRePwd" type="password"  class="register_txt a1" placeholder="请确认密码">
                          <font id="sRePwd" class="fo fo1"></font>
                        </li>

                        <li><span></span>
                            <button id="regBtn" lay-submit lay-filter="register"   class="register_btn_gary">立即注册</button>
                          
                        </li>
                    </form>
                </ul>
            </div>
        </div>
    </div> 
</div>
<div class="foot w100">
    <div class="w1000 oo">
        <div class="footl fl">

            <b>尊敬的彩豆28游戏中心玩家：</b><br />
            彩豆28游戏中心为休闲娱乐平台，倡导玩家健康游戏。禁止非法组织或个人利用本平台进行赌博或倒卖虚拟货币的非法行为，一经查证核实，将做封号处理并没收其所有虚拟货币，请广大玩家相互转告！
            祝玩家朋友们游戏愉快！<br />
            <span style="float:right">—— 彩豆28官方</span>
        </div>

        <div class="footr fr">
         <img src="/static/front/image/logo.png" style="margin-left:40px"><br />
         官方QQ群：<a href="https://ssl.pop800.com/chat/368923" target="_blank">2577000</a> <a href='http://www.miitbeian.gov.cn/'> </a><br />
         COPYRIGHT ◎2017 彩豆28 caidou28.com All Rights Reserved. 
     </div>

 </div>
</div>
</body>
</html>
