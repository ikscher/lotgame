<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"D:\mywork\lotgame\public/../app/front\view\index\index.html";i:1554257468;s:51:"D:\mywork\lotgame\app\front\view\public\header.html";i:1554686874;s:51:"D:\mywork\lotgame\app\front\view\public\footer.html";i:1554342636;}*/ ?>

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
				<?php if($uid != 0): ?>
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
<link href="/static/front/css/style.css" type="text/css" rel="stylesheet" />
<!--[if lt IE 7]>
	<script src="/static/front/js/oldbowers.js" type="text/javascript"></script>
<![endif]-->
<script src="/static/front/js/gt.js"></script>
<script src="/static/front/js/jquery.showLoading.min.js"></script>
<script type="text/javascript" src="/static/front/js/jeeslide.js"></script>
<script type="text/javascript" src="/static/front/js/login.js"></script>

<script type="text/javascript">
	function setCookie(name,value) 
	{ 
		var Days = 30; 
		var exp = new Date(); 
		exp.setTime(exp.getTime() + Days*24*60*60*1000); 
		document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
	}
</script>

<div class="banner">
	<div class="loginbg"></div>
	<div id="loginbox" class="alogin">
		<?php if(!(empty($uid) || (($uid instanceof \think\Collection || $uid instanceof \think\Paginator ) && $uid->isEmpty()))): ?>
			<div class="logtit"><strong>登录成功</strong></div>
			<div style="height:20px;"></div>
			<div class="logtit" style="font-size:14px;">登录账号：ikscher (891435)</div>
			<div class="captcha mt10 mb10">
				<label>账户余额：500 </label>
			</div>
			<a href="/User/Index" class="sub mt20">会员中心</a>
			<a href="/Game/Index" class="sub mt20">游戏中心</a>

			<div class="forget fr mt10">
				<a id="LinkButton1" class="outlink" href="/common/logout">退出</a>
			</div>
        <?php else: ?>
            <div class="logtit"><strong>登录</strong> <em>手机快捷登录</em></div>
			<form id="loginform"  method="post">
			<input type="hidden" name="logintype" id="logintype" value="1">
		    <div class="id mt20">
					<label><span class="idi icon fl">用户名：</span></label>
					<input type="text"  class="input" name="tbUserAccount"  value="" autocomplete="off" maxlength="100" placeholder="邮箱/手机号" id="usernametb">
					
			</div>
			<div class="pass oo mt20">
					<label><span class="passi icon fl">密码：</span></label>
					<input type="password"  class="input" name="tbUserPwd"  value="" autocomplete="off" maxlength="100" placeholder="密码" id="pwdtb">	
			</div>

			<div class="send_mobi oo mt20" style="display:none">
			    <label><span class="idi icon fl">用户名：</span></label>
				<input id="mobile" class="input" type="text" placeholder="手机号" name="mobile">
			</div>
		    
			<div class="send_num mt20" style="display:none">
				<label><span class="passi icon fl">验证码：</span></label>
				<input id="code" class="input" type="text" maxlength="6"  placeholder="验证码" name="code" style="width:105px;border-bottom-right-radius: 5px; border-top-right-radius: 5px;"><button type="button" id="popup-submit" class="send_btn">获取验证码</button>
			</div>
			<div id="popup-captcha"></div>

            
			<div class="reg oo mt10"><a href="/User/FindPwd" class="fl">找回密码</a> <a href="/User/Reg" class="fr"> 5 秒注册</a></div>
			<!-- <input id="loginBtn" type="button" value="登 录" class="sub mt10" > -->
			<button id="loginBtn" lay-submit lay-filter="login"   class="sub mt10">登录</button>
			
            </form>
        <?php endif; ?>
	</div>
	<script type="text/javascript">
		$('.logtit em').click(function(){
			$(this).css({"color": "#FFD77D","font-size": "18px","font-weight": "700"});
			$(this).prev().css({"color": "#f1f1f1","font-size": "14px","font-weight": "100"});
			$('.send_mobi, .send_num').show();
			$('.id, .pass').hide();
			$("#logintype").attr("value","2");
		});
		$('.logtit strong').click(function(){
			$(this).css({"color": "#FFD77D","font-size": "18px","font-weight": "700"});
			$(this).next().css({"color": "#f1f1f1","font-size": "14px","font-weight": "100"});
			$('.send_mobi, .send_num').hide();
			$('.id, .pass').show();
			$("#logintype").attr("value","1");
		});
	</script>

	<div id="slideBox" class="slideBox">
		<div class="hd">
			<ul>
				<li>优势</li>
				<li>上线</li>
				<li>活动</li>
				<li>奖品</li>
				<li>抽奖</li>
			</ul>
		</div>
		<div class="bd">
			<ul>
				<li><a href="#" target="_blank"><img src="/static/front/image/banner1.jpg" /></a></li>
				<li><a href="/User/Reg" target="_blank"><img src="/static/front/image/banner2.jpg" /></a></li>
				<li><a href="/Hd/List" target="_blank"><img src="/static/front/image/banner3.jpg" /></a></li>
				<li><a href="/Prize/Center" target="_blank"><img src="/static/front/image/banner4.jpg" /></a></li>
				<li><a href="/Hd/Round" target="_blank"><img src="/static/front/image/banner5.jpg" /></a></li>
			</ul>
		</div>

		<!-- 下面是前/后按钮代码，如果不需要删除即可 -->
		<a class="prev" href="javascript:void(0)"></a>
		<a class="next" href="javascript:void(0)"></a>

	</div>

	<script type="text/javascript">
		$(".slideBox").slide({mainCell:".bd ul",effect:"left",autoPlay:true});
	</script>	
</div>



<div class="yoo-service w100">
	<ul class="col3">
		<li>
			<i class="service-1">
			</i>
			<div class="text">
				<h3>
					平台安全稳定
				</h3>
				<p>
					实力平台 提供安全稳定的游戏环境
					<br>
					信誉第一 口碑上佳
				</p>
			</div>
		</li>
		<li>
			<i class="service-2">
			</i>
			<div class="text">
				<h3>
					服务高效优质
				</h3>
				<p>
					最全面的游戏体验 以种类第一为保证
					<br>
					领先行业最高质量
				</p>
			</div>
		</li>
		<li>
			<i class="service-3">
			</i>
			<div class="text">
				<h3>
					简单方便快捷
				</h3>
				<p>
					全天7x24小时服务 最快的响应速度
					<br>
					支持手机在线游戏
				</p>
			</div>
		</li>
		<li>
			<i class="service-4">
			</i>
			<div class="text">
				<h3>
					活动礼品丰富
				</h3>
				<p>
					活动丰富多彩 奖励别具一格
					<br>
					尽情畅玩 奖励不断
				</p>
			</div>
		</li>
	</ul>
</div>

<div class="w100 f1 mt10">
	<div class="w1000 forumHots">
		<div class="news fl">
			<h2 class="h2">最新公告<a href="board/index">MORE</a></h2>
			<div class="textLeft">
				<ul class="simpleList">
					<?php if(is_array($boards) || $boards instanceof \think\Collection || $boards instanceof \think\Paginator): $i = 0; $__LIST__ = $boards;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<li>
					<a class="ellipsis hover-line fl" href="/News/Detail/115" target="_blank">
					<span>[ <?php echo date('Y-m-d',strtotime($vo['create_time'])); ?> ] </span><?php echo $vo['title']; ?></a>
					</li>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>

			</div>
		</div>

		<div class="imgRight fr">
			<h2 class="h2">最新活动<a href="/Hd/List">MORE</a></h2>
			<ul class="hdul">
				<li class="fl">
					<a href="#"><img src="/static/front/image/hd1.jpg"><span>立即参加</span></a>
				</li>
				<li class="fr">
					<a href="#"><img src="/static/front/image/hd2.jpg"><span>立即参加</span></a>
				</li>
				<li class="fl">
					<a href="#"><img src="/static/front/image/hd3.jpg"><span>立即参加</span></a>
				</li>
				<li class="fr">
					<a href="#"><img src="/static/front/image/hd4.jpg"><span>立即参加</span></a>
				</li>
			</ul>
		</div>

	</div>
</div>

<div class="clear"></div>

<div class="w100 f2">
	<div class="w1000">
		<h2 class="h2" style="padding: 30px 0;"><span style="margin-left:5px;">奖品兑换</span><a href="/Prize/Center" style="color:#fff">MORE</a></h2>
		<div class="gwfl fl">
			<div class="gwl fr">
				<a href="#" class="gwlu"><img src="/static/front/image/gwl.jpg"><p>好礼换不停</p></a>
				<a href="#" class="gwld"><div class="tit">奖品兑换中心</div><div class="in">点击进入</div></a>
			</div>
			<div class="gwr fl">
				<a class="first" href="#">
					<div class="tit1">苹果12英寸MacBook 256GB</div>
					<div class="tit2">轻薄学习办公笔记本电脑</div>
					<img src="/static/front/image/gw6.jpg">
				</a><a href="#">
					<div class="tit1">Apple/苹果iPhone7</div>
					<div class="tit2"> 国行全网通4G版手机</div>
					<img src="/static/front/image/gw1.jpg">
				</a><a href="#">
					<div class="tit1">Apple/苹果iPad Pro</div>
					<div class="tit2">苹果9.7英寸 WLAN 128GB</div>
					<img src="/static/front/image/gw3.jpg">
				</a><a href="#">
					<div class="tit1">微软Arc无线鼠标 </div>
					<div class="tit2">mini可折叠激光鼠标</div>
					<img src="/static/front/image/gw4.jpg">
				</a><a href="#">
					<div class="tit1">头戴式无线蓝牙B耳机</div>
					<div class="tit2">Beats Beats Solo3 Wireless</div>
					<img src="/static/front/image/gw7.jpg">
				</a><a href="#">
					<div class="tit1">360小水滴智能摄像头</div>
					<div class="tit2">wifi远程监控夜视版</div>
					<img src="/static/front/image/gw8.jpg">
				</a><a href="#">
					<div class="tit1">飞科剃须刀FS373</div>
					<div class="tit2">全身水洗充电式电动剃须</div>
					<img src="/static/front/image/gw2.jpg">
				</a>
			</div>

		</div>

	</div>
</div>


<div class="w100 rk oo">
	<div class="w1000">
		<div class="rank-list-main clearfix">
			<div class="rank-box rank-today">
				<div class="rank-box-top">
					<h3>牛人排行榜</h3>
					<p><a href="/Game/Top">今日牛人排行榜，更多排行榜及奖励请点击查看</a></p>
				</div>
				<div class="rank-box-main">
					<ul>
						<li  >
							<span class="num first"><i>1</i></span>
							<span class="name">滑翔起飞</span>
							<span class="account">142,237,934</span>
						</li>

						<li  class="fr"  >
							<span class="num second"><i>2</i></span>
							<span class="name">黑旋风李逵</span>
							<span class="account">131,449,468</span>
						</li>

						<li  >
							<span class="num third"><i>3</i></span>
							<span class="name">希望的田野</span>
							<span class="account">117,199,854</span>
						</li>

						<li  class="fr"  >
							<span class="num fourth"><i>4</i></span>
							<span class="name">善良的死神</span>
							<span class="account">112,158,875</span>
						</li>

						<li  >
							<span class="num "><i>5</i></span>
							<span class="name">我的爱赤裸裸</span>
							<span class="account">108,135,478</span>
						</li>

						<li  class="fr"  >
							<span class="num "><i>6</i></span>
							<span class="name">春去东来</span>
							<span class="account">76,728,666</span>
						</li>

						<li  >
							<span class="num "><i>7</i></span>
							<span class="name">我叫28</span>
							<span class="account">74,252,422</span>
						</li>

						<li  class="fr"  >
							<span class="num "><i>8</i></span>
							<span class="name">飞起666</span>
							<span class="account">72,119,929</span>
						</li>

						<li  >
							<span class="num "><i>9</i></span>
							<span class="name">牛逼克拉斯</span>
							<span class="account">66,525,745</span>
						</li>

						<li  class="fr"  >
							<span class="num "><i>10</i></span>
							<span class="name">面朝大海</span>
							<span class="account">64,202,607</span>
						</li>

					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	layui.use(['layer', 'form'], function(){
      var layer = layui.layer
      ,form = layui.form;
      
      
      form.on('submit(login)',function(){
         $.ajax({
              url:"<?php echo url('/common/login'); ?>",
              data:$('#loginform').serialize(),
              type:'post',
              async: false,
              success:function(res) {
                  // console.log(res);
                  if(res.code == 1) {
                      layer.msg(res.msg, function(index){
                        location.href = res.url;
                      })
                  } else {
                      layer.msg(res.msg);
                  }
              }
          })
          return false;
      })
    });
</script>
<div class="client">
	<div class="text-block">
		<h1>合作伙伴</h1>
	</div>
	<div class="container-large">
		<div class="client-list">
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
			<div class="brand"><div class="logo"></div></div>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(".container-large").slide({mainCell:".client-list",autoPlay:true,effect:"leftMarquee",vis:7,interTime:50});
	</script>
</div>

<div class="clear"></div>
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
						<!--
						<div class="leftbar" id="moveBar">
							<ul class="leftbar-main">
								<li class="lbar1" style="border-top: 1px dashed #fff;">
									<a href="/User/Index">
										<i style="margin-right: 4px;"></i>ikscher			</a>
									</li>
									<li class="lbar2">
										<a href="/User/Sign?act=qd"><i></i>签到</a>
									</li>
									<li class="lbar3">
										<a href="/User/Sms">
											<i></i>消息<span></span>
										</a>
									</li>
									<li class="lbar4">
										<a href="/Hd/List"><i></i>活动</a>
									</li>
									<li class="lbar5">
										<a href="/Game/Index"><i></i>游戏</a>
									</li>
									<li class="lbar6">
										<a href="/Prize/Center"><i></i>兑换</a>
									</li>
									<li class="lbar7">
										<a href="https://ssl.pop800.com/chat/368923" target="_blank"><i></i>客服</a>
									</li>
									<li class="lbar1">
										<a href="https://ssl.pop800.com/chat/368923" target="_blank"><i></i>QQ群</a>
									</li>
									<li class="lbar8">
										<a href="/appDownload.php"><i></i>APP</a>
									</li>
									<div class="leftbar-top">
										<a href="#">TOP</a>
									</div>
								</ul>
							</div>
							<script type="text/javascript">
								$(function () {
        //创建小方块的jquery对象
        var $box = $("#moveBar");
        //创建小方块的鼠标点按下事件
        $box.mousedown(function (event) {
            //获取鼠标按下的时候左侧偏移量和上侧偏移量
            var old_left = event.pageX;//左侧偏移量
            var old_top = event.pageY;//竖直偏移量

            //获取鼠标的位置
            var old_position_left = $(this).position().left;
            var old_position_top = $(this).position().top;

            //鼠标移动
            $(document).mousemove(function (event) {
                var new_left = event.pageX;//新的鼠标左侧偏移量
                var new_top = event.pageY;//新的鼠标竖直方向上的偏移量

                //计算发生改变的偏移量是多少
                var chang_x = new_left - old_left;
                var change_y = new_top - old_top;

                //计算出现在的位置是多少

                var new_position_left = old_position_left + chang_x;
                var new_position_top = old_position_top + change_y;
                //加上边界限制
                if(new_position_top<0)
                //如果向下的偏移量大于文档对象的高度减去自身的高度，就让它等于这个高度
                if(new_position_top>$(document).height()-$box.height()){
                	new_position_top=$(document).height()-$box.height();
                }
                //右限制
                if(new_position_left>$(document).width()-$box.width()){
                	new_position_left=$(document).width()-$box.width();
                }
                if(new_position_left<0)

                $box.css({
                	left: new_position_left + 'px',
                	top: new_position_top + 'px'
                })
            });
            $box.mouseup(function(){
            	$(document).off("mousemove");
            })
        });
    })
</script>-->

<script>
	$(document).ready(function(){
		$('<audio id="chatAudio"><source src="/static/front/sound/notify.ogg" type="audio/ogg"> <source src="/static/front/sound/sound/tips.wav" type="audio/wav"></audio>').appendTo('body');
	});

	Notification.requestPermission( function(status) {
		
	});
	
    //数字加千分位符号fmoney(“12345.675910”, 3)，返回12,345.676
    function fmoney(s, n) {
    	n = n > 0 && n <= 20 ? n : 2;
    	f = s < 0 ? "-" : "";
    	s = parseFloat((Math.abs(s) + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    	var l = s.split(".")[0].split("").reverse(),
    	r = s.split(".")[1];
    	t = "";
    	for (i = 0; i < l.length; i++) {
    		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    	}
    	return f + t.split("").reverse().join("");
    }
	//数字去掉千分位符号
	function rmoney(s){   
		return parseFloat(s.replace(/[^\d\.-]/g, ""));   
	}

	function getSimpleResult(game,text){
		var result = new Array();
		result = text.split("|");
		if(game.indexOf("36") > 0 ){
			switch (parseInt(result[result.length-1])){
				case 1:
				return	"豹";
				case 2:
				return 	"顺";
				case 3:
				return "对";
				case 4:
				return 	"半";
				case 5:
				return 	"杂";
				default :
				return  "";
			}
		}
		return result[result.length-1];

	}

	function setCk(name,value)
	{
		var Days = 30;
		var exp = new Date();
		exp.setTime(exp.getTime() + Days*24*60*60*1000);
		document.cookie = name + "="+ escape (value) + ";path=/;expires=" + exp.toGMTString();
	}
	function getCk(name)
	{
		var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
		if(arr=document.cookie.match(reg))
			return unescape(arr[2]);
		else
			return null;
	}
	function reflushPoints(){
		var html = "";
		$.ajax({
			url:"/User/Ajaxpoint",
			dataType:"json",
			type:"get",
			success: function (rs) {
				if ( $("#myxnb").length > 0 ) { 
					$("#myxnb").html(fmoney(rs.xnb,0));
				}
				mymoney = rs.points;
				$("#footpoints").html(fmoney(rs.points,0));
				$("#topmoney").html(fmoney(rs.points,0));
				
				if(rs.gpgg && $("#gpgg").length == 0){
					$("html").append('<marquee id="gpgg" scrollamount=10 onmouseover="this.stop()" onmouseout="this.start()" style="position: fixed;z-index: 1;top: 35px;background: rgba(50, 52, 54, 0.11);        padding: 4px 0px;pointer-events: none;    line-height: initial;">'+rs.gpgg+'</marquee>');
					setTimeout(function(){
						$("#gpgg").remove();
					},rs.gpgg_stay*1000);
					Notification.requestPermission( function(status) {
						
						if(getCk("noticTime") != rs.gpgg_start){
							setCk("noticTime",rs.gpgg_start);
							var notic = new Notification("彩豆28", {tag:"彩豆28",renotify:true,icon:"/favicon.ico",body: rs.gpgg_text});
							setTimeout(function(){
								notic.close();
							},10000);
						}
						
					});	
				}
				
				if(fmoney(rs.points,0) != $("#footpoints").html()){
					$("#footpoints").css("background-color","green");
				}
				if(rs.nearBetList.length == 0){
					//$("#nearBet").html('<span class="nobet">您暂无进行中投注,快去投注吧！</span>');
				}else{
					var nearhtml = "";
					for(var i=0;i<rs.nearBetList.length;i++){
						nearhtml += rs.nearBetList[i].gamechname+ "：" +rs.nearBetList[i].profit + "\r\n";
					}
					Notification.requestPermission( function(status) {
						if(status == 'granted'){
							var notic2 = new Notification("彩豆28开奖通知", {noscreen:true,tag:"彩豆28",renotify:true,icon:"/favicon.ico",body: nearhtml});
							setTimeout(function(){
								notic2.close();
							},6000);
							$('#chatAudio')[0].play();
							notic2.onclick = function() {
								window.open("/User/Edit");   
								notic2.close();  
							};  
						}
					});	

				}
			}

		});
	}
	setInterval("reflushPoints()",10000);
	reflushPoints();
</script>


<div id="sytc" style="display:none"></div>
<script>
	function ssetCookie(name,value) 
	{ 
		var Days = 30; 
		var exp = new Date(); 
		exp.setTime(exp.getTime() + Days*24*60*60*1000); 
		document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
	}

	function sgetCookie(name)
	{
		var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
		if(arr=document.cookie.match(reg))
			return unescape(arr[2]);
		else
			return null;
	}
	$(document).ready(function(){
		var timestamp = Date.parse(new Date());
		timestamp = timestamp / 1000;
		console.log(parseInt(timestamp) - parseInt(sgetCookie('sytcTime')));
	});
</script>

<body>
	</html>
	<!-- Start of LiveChat (www.livechatinc.com) code -->
	<script type="text/javascript">
		// window.__lc = window.__lc || {};
		// window.__lc.license = 8642154;
		// (function() {
		// 	var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
		// 	lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
		// 	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
		// })();
	</script>
<!-- End of LiveChat code -->					