<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:60:"D:\mywork\lotgame\public/../app/front\view\user\safepwd.html";i:1554081941;s:51:"D:\mywork\lotgame\app\front\view\public\header.html";i:1554081941;s:49:"D:\mywork\lotgame\app\front\view\user\header.html";i:1554081941;s:47:"D:\mywork\lotgame\app\front\view\user\left.html";i:1554081941;s:51:"D:\mywork\lotgame\app\front\view\public\footer.html";i:1554081941;}*/ ?>
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
#callboard {width: 150px; overflow: hidden; display: inline-block; vertical-align: middle; font-size: 12px; position: relative; top: -1px; margin-left: 30px;float:left} 
#callboard ul { padding:0; } 
#callboard li { padding:0; } 
</style>
<div style="width: 100%;background: #fff;">
	<div class="bar">
		<div class="w1000">
			<span class="barl fl">欢迎光临！<a href="/SaveToHome.php">保存到桌面</a> <a href="/mobile.php">手机版</a><a href="/User/Sign?act=qd" class="qd">签到</a></span>
			<div id="callboard">
				<ul>
					<li>
						<a style="color:red;" target="_blank" href="/News/Detail/116" >游戏已经全部恢复！祝您游戏愉快！</a>
					</li>
					<li>
						<a style="color:red;" target="_blank" href="/News/Detail/115" >2019年春节蛋蛋/北京类游戏停机公告</a>
					</li>
					<li>
						<a style="color:red;" target="_blank" href="/News/Detail/114" >妞妞点卡解除合作</a>
					</li>
					<li>
						<a style="color:red;" target="_blank" href="/News/Detail/113" >全新界面！带给您更好的游戏体验！app正在内测！</a>
					</li>
					<li>
						<a style="color:red;" target="_blank" href="/News/Detail/111" >跨年红包中奖用户如下！</a>
					</li>

				</ul>
			</div>
			<span class="barr fr">
				<b >ikscher(891435)</b> <b style="background:url(/static/front/image/v0.png) no-repeat right center;padding-right:18px;"></b> &nbsp; <span>余额：<b id="topmoney">500</b></span> &nbsp;
				<a href="/User/Index">我的账号</a> <a href="/User/Sms">站内信</a>&nbsp;
				<a id="LinkButton1" href="/User/Login?act=logout">退出</a>

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
<style type="text/css">
	.safecard table{border-collapse:collapse;border:1px solid #000;margin:0 auto;font-family:Tahoma,verdana,sans-serif;font-size:24px;}
	.safecard table td{width:44px;height:44px;text-align:center;border:1px solid #999;color:#133FA8;}
	.safecard tr.letter_block td{font-weight:bold;font-size:26px;color:#000;}
	.safecard .mum_block{background-color:#FFF;font-weight:bold;font-size:26px;color:#000;}
	.safecard .hc{background-color:#CCCCCC;}
	.safecard .sn{color:red;}
	.safecard .coord{background-color:#e6e6e6;font-size:26px;padding:2px;}
</style>

<div id="wrapper" class="umain">
	<div class="w1200">
		<!--顶侧top-->
		<div class="utop">
	<div class="utop-head"><img src="<?php if(geturl($user['avatar'])){ ?><?php echo geturl($user['avatar']);}else{ ?>/static/front/image/user/avatar.jpg<?php }?>" width="100%" height="100%"><a href="/User/Edit" class="utop-head-btn">修改头像</a></div>
	<div class="utop-info">
		<p class="utop-info-p">欢迎回来，<span>ikscher</span>。您有 <span>0</span> 条消息。</p>
		<div class="utop-info-name">昵称：<?php echo $user['username']; ?></div>
		<div class="utop-info-name">ID:<?php echo $user['uid']; ?></div>
	</div>
	<ul class="ubase-ul">
		<li class="li1">
			<p class="p1">账户余额</p>
			<p class="p2"><?php echo $user['coin']; ?></p>
		</li>
		<li class="li2">
			<p class="p1">银行</p>
			<p class="p2"><?php echo $user['bank']; ?></p>
		</li>
		<li class="li3">
			<p class="p1">积分</p>
			<p class="p2"><?php echo $user['points']; ?></p>
		</li>
		<li class="li4">
			<p class="p1">经验</p>
			<p class="p2"><?php echo $user['experiments']; ?></p>
		</li>
	</ul>
</div>
		<!--顶侧top-->

		<!--左侧left菜单-->
		<div class="col-left">
	<div class="uleft-menu" id="side-menu">
		<p style="margin-top: 0;">用户账户</p>
		<ul>
			<li><a href='/User/Index'>个人信息</a></li>
			<li><a href='/User/Edit'>资料修改</a></li>
		</ul>
		<ul>
			<li><a href='/User/Editpwd'>密码修改</a></li>
			<li><a href='/User/Safe'>安全工具</a></li>
		</ul>
		<ul>
			<li><a href='/User/MyRecharge'>在线充值</a></li>
			<li><a href='/Cg/Getprize'>闯关奖励</a></li>
		</ul>

		<p>站内功能</p>
		<ul>
			<li><a href='/User/SelfLine'>专属域名</a></li>
			<li><a href='/User/Recharge'>点卡使用</a></li>
		</ul>
		<ul>
			<li><a href='/User/Msg'>站内信箱</a></li>
			<li><a href='/User/Bank'>金币银行</a></li>
		</ul>
		<ul>
			<li><a href='/User/Prize'>兑奖记录</a></li>
			<li><a href='/User/ReWard'>亏损返利</a></li>
		</ul>
		<ul>
			<li><a href='/User/Bonus'>首充返利</a></li>
		</ul>

		<p>推广相关</p>
		<ul>
			<li><a href='/User/Recom'>推广下线</a></li>
			<li><a href='/User/Recomprofit'>推广收益</a></li>
		</ul>

		<p>工资救济</p>
		<ul>
			<li><a href='/User/Sign'>签到中心</a></li>
			<li><a href='/User/Alms'>领取救济</a></li>
		</ul>
		<ul>
			<li><a href='/User/Wage'>工资领取</a></li>
			<li><a href='/Game/Egg'>金蛋砸取</a></li>
		</ul>

		<p>游戏功能</p>
		<ul> 
			<li><a href='/User/Auto'>方案中心</a></li>
			<li><a href='/game/top'>玩家排行</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript" language="javascript">
	var links = $("#side-menu li");
	var lilen = $("#side-menu a");
	var currenturl = document.location.href;
	var last = -1;
	for (var i=0;i<links.length;i++)
	{
		var linkurl = lilen[i].getAttribute("href");
		if(currenturl.indexOf(linkurl)!=-1)
		{
			last = i;
		}
	}

	links[last].setAttribute("class","menufirst");
</script>

		<!--左侧left菜单-->


		<div class="uright">
			<div class="ibox">
				<div class="ibox-title">
					<h5>我的密保卡</h5>
				</div>
				<p style="text-align:center;margin-bottom:10px" class="mt40">您还有<font style="color:red">53</font>分钟可查看此卡，过期将无法再查看，请尽快截图保存，或按Ctrl+S保存。</p>

				<div class="safecard">
					<table cellspacing="0" cellpadding="0">
						<tr><td colspan="10"><?php echo $title; ?>用户[<?php echo $user['uid']; ?>]密保卡</span></td></tr>
						<tr class="letter_block hc"><td>&nbsp;</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td></tr>
						<?php $i=0;if(is_array($safepwd) || $safepwd instanceof \think\Collection || $safepwd instanceof \think\Paginator): if( count($safepwd)==0 ) : echo "" ;else: foreach($safepwd as $k=>$vo): ?>
							<tr <?php if($i%2 == 1): ?>class="hc"<?php endif; ?>>
							   <td class="mum_block"><?php echo $k; ?></td>
	                           <?php if(is_array($vo) || $vo instanceof \think\Collection || $vo instanceof \think\Paginator): if( count($vo)==0 ) : echo "" ;else: foreach($vo as $key=>$vo_): ?>
	                              <td><?php echo $vo_; ?></td>
	                           <?php endforeach; endif; else: echo "" ;endif; ?>
						    </tr>
						    <?php $i++;endforeach; endif; else: echo "" ;endif; ?>
						<!-- <tr class="letter_block hc"><td>&nbsp;</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td></tr>
						<tr><td class="mum_block">A</td><td>25</td><td>92</td><td>17</td><td>06</td><td>09</td><td>53</td><td>60</td><td>47</td></tr>
						<tr class="hc"><td class="mum_block">B</td><td>27</td><td>26</td><td>29</td><td>37</td><td>34</td><td>51</td><td>73</td><td>99</td></tr>
						<tr><td class="mum_block">C</td><td>42</td><td>19</td><td>30</td><td>75</td><td>25</td><td>19</td><td>47</td><td>27</td></tr>
						<tr class="hc"><td class="mum_block">D</td><td>32</td><td>34</td><td>87</td><td>46</td><td>26</td><td>98</td><td>64</td><td>71</td></tr>
						<tr><td class="mum_block">E</td><td>85</td><td>60</td><td>45</td><td>38</td><td>25</td><td>74</td><td>35</td><td>67</td></tr>
						<tr class="hc"><td class="mum_block">F</td><td>15</td><td>08</td><td>16</td><td>64</td><td>49</td><td>59</td><td>86</td><td>59</td></tr>
						<tr><td class="mum_block">G</td><td>11</td><td>32</td><td>90</td><td>38</td><td>78</td><td>48</td><td>61</td><td>87</td></tr>
						<tr class="hc"><td class="mum_block">H</td><td>60</td><td>58</td><td>02</td><td>22</td><td>20</td><td>18</td><td>44</td><td>59</td></tr>
						<tr><td class="mum_block">I</td><td>21</td><td>55</td><td>96</td><td>54</td><td>47</td><td>69</td><td>52</td><td>97</td></tr>
						<tr class="hc"><td class="mum_block">J</td><td>42</td><td>32</td><td>30</td><td>78</td><td>43</td><td>70</td><td>12</td><td>83</td></tr> -->
						
					</table>
				</div>
			</div>
		</div>
	</div>
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
		$('<audio id="chatAudio"><source src="notify.ogg" type="audio/ogg"> <source src="/images/sound/tips.wav" type="audio/wav"></audio>').appendTo('body');
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
			// url:"/Ajax_points.php",
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