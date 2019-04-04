<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"D:\mywork\lotgame\public/../app/front\view\shop\detail.html";i:1553863390;s:51:"D:\mywork\lotgame\app\front\view\public\header.html";i:1554207547;s:51:"D:\mywork\lotgame\app\front\view\public\footer.html";i:1553934667;}*/ ?>
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
				<a id="LinkButton1" href="/common/logout">退出</a>

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
<script  type="text/javascript" src="/static/front/js/jeeslide.js"></script>

<style type="text/css">

.hotgoods {margin-top:20px;width:248px;}
.hotgoods li{  text-align: center; margin: 15px 0;}
.hotgoods li img{height:230px; width: 230px;}
.hotgoods li p{ line-height: 35px; color: #666;}
.goods{margin-top: 20px;color:#666}
.goods .pic{}
.goods .ginfo{width:580px;}
.goods .ginfo h1{ color: #666; font-weight: 100; padding: 5px 0 15px 0;} 
.goods .ginfo .price{    line-height: 60px; background: #f5f5f5; padding-left: 10px;}
.goods .ginfo .price font{ color: #ff5113; font-size: 25px;}
.goods .ginfo .li{ line-height: 35px; font-size: 12px;}
.goods .ginfo table{ border-collapse: collapse; width: 100%;}
.goods .ginfo table td{ border: 1px solid #ECECEC; text-align: center;    line-height: 35px; }
.goods .ginfo .gbtn{ width: 228px; height: 45px; line-height: 45px; text-align: center; color: #FFF; background: #FF5113; border: none; border-radius: 5px; font-size: 18px; display: block; margin-top:25px;}
.intr{	padding: 10px; border: 1px solid #eee;}
#div_comment{	padding: 10px; border: 1px solid #eee;}
#div_comment dl{ margin-bottom: 10px;}
#div_comment dd{ margin-left: 15px; float: left; width: 780px;}
#div_comment dd em{  display: block; border-bottom: 1px solid #eee; background-color: #FFFFFF; color: #777; font-size: 12px;}
#div_comment dd p{padding: 6px 0; color: #333;}
#div_comment dt{float:left}
#div_comment dt img{width:80px;height:80px; border-radius: 50%;}
#div_comment dt span{ display: block; font-size: 12px; text-align: center;color: #FF5113;}
.money_bg{font-size: 12px;}
.djdt {border-bottom: 1px solid #eee;}
.newsleft .djdt ul {height: 275px; overflow: hidden;padding:0}
.newsleft .djdt ul li{background:none;padding: 10px 5px;border-bottom:#ddd dotted 1px;overflow:auto;zoom:1;margin: 0;}
.newsleft .djdt ul li:hover{background: #FBFBFB;}
.djdt ul li h3 , .mxyh ul li h3{font-size:16px;font-weight:100;color:#333;height:21px;line-height:21px; display:block; width:160px; word-break:keep-all; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; } .djdt ul li div , .mxyh ul li div{width:166px;float:right}
.djdt ul li span{font-size:13px;height:30px;line-height:30px;display:block;color:#888;overflow:hidden}
.djdt ul li em{color:#FF9100;font:12px/20px 'microsoft yahei';}
.djdt ul li .djnum{float: right;line-height: 16px;margin-right: 20px }
.djdt ul li img{width:65px;height:65px; float:left; margin: 0 0 0 5px;}
</style>
<div class="area oo">
	<div class="newsleft fl">
		<?php if(is_array($cates) || $cates instanceof \think\Collection || $cates instanceof \think\Paginator): if( count($cates)==0 ) : echo "" ;else: foreach($cates as $key=>$vo): ?>
	    <div class="help">
		    <h2><?php echo $vo['name']; ?></h2>
			<ul>
				<?php if(is_array($vo['child']) || $vo['child'] instanceof \think\Collection || $vo['child'] instanceof \think\Paginator): if( count($vo['child'])==0 ) : echo "" ;else: foreach($vo['child'] as $key=>$vo_): ?>
				<li><a href="/Shop/Index?id=<?php echo $vo_['id']; ?>"><?php echo $vo_['name']; ?></a></li>
				<?php endforeach; endif; else: echo "" ;endif; ?>
		    </ul>
		</div>
	    <?php endforeach; endif; else: echo "" ;endif; ?>
	</div>

	<div class="buybox fr">
	    <div class="top">
			<h1>奖品兑换</h1>
		</div>
	    <div class="con">
	        <div class="goods oo">
	            <div class="pic fl"><img src="<?php echo geturl($prize['thumb']); ?>" style="width:300px;" /></div>
	            <div class="ginfo fr">
			        <h1><?php echo $prize['name']; ?> </h1>
	                <div class="price">
				      您的兑换价格：<font class="money money_bg"><?php echo $prize['price']*$coefficient; ?></font>
				    </div>
	                <div class="li">兑换价格：</div>
				    <table>
					    <tr style="background-color: #F9F9F9;">
						  <td><span style='background:url(/static/front/image/v0.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
						  <td><span style='background:url(/static/front/image/v1.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
						  <td><span style='background:url(/static/front/image/v2.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
						  <td><span style='background:url(/static/front/image/v3.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
						  <td><span style='background:url(/static/front/image/v4.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
						  <td><span style='background:url(/static/front/image/v5.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
						  <td><span style='background:url(/static/front/image/v6.png) right center no-repeat;padding-right:12px;'>&nbsp;</span></td>
					    </tr>
					    <tr>
							<?php if(is_array($grade) || $grade instanceof \think\Collection || $grade instanceof \think\Paginator): if( count($grade)==0 ) : echo "" ;else: foreach($grade as $key=>$vo_): ?>
							    <td><font class="money money_bg"><?php if($vo_['grade'] == 1): ?><?php echo $prize['price']*$c1; else: ?><?php echo $prize['price']*$c2; endif; ?></font></td>
							<?php endforeach; endif; else: echo "" ;endif; ?>
						</tr>
				    </table>
				    <input type="button" onclick="javascript:window.location.href='/shop/order?id=<?php echo $id; ?>'" value="确认兑奖" class="gbtn"/>
	            </div>        
	        </div>
	        <div class="blank"> </div>
		      <div>
		         <div class="top">
				     <h1>奖品详情</h1>
			     </div>
		        <div class="intr"><?php echo $prize['desc']; ?></div>
		      </div>
	        <div style="margin-top:20px;" >
	            <div class="top"><h1>奖品评论</h1></div>
	            <div id="div_comment">
					<script type="application/javascript">
						var url=window.location.href;
						if(url.indexOf("page")>0){
							location.hash = 'div_comment';
						}
					</script>

					<?php if(is_array($remarks) || $remarks instanceof \think\Collection || $remarks instanceof \think\Paginator): if( count($remarks)==0 ) : echo "" ;else: foreach($remarks as $key=>$vo__): ?>
					    <div><?php echo $vo__['user']['username']; ?><span style="margin:0 0 0 20px;"><?php echo $vo__['create_time']; ?></span></div>
					    <div><?php echo $vo__['content']; ?></div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
		            <div style="padding:0 20px;"><?php echo $remarks->render(); ?></div> 
		        </div>
	        </div>
	        <div style="margin-top:20px; overflow: auto; zoom:1;">
		        <div class="top">
				     <h1>发表评论</h1>
			     </div>
		        <div>
		          <form action="/user/remark" method="post">
		            <TEXTAREA id="tbCommentContent" name="tbCommentContent" style="width:908px;border: 1px solid #eee;height: 100px;"></TEXTAREA>
		            <!-- <input style=" margin:10px auto;display: block;" name="btnComment" value="发表评论" type="submit" class="nbtn"> -->
		            <button style=" margin:10px auto;display: block;" class="nbtn" lay-submit lay-filter="remark">发表评论</button>
		          </form>
		        </div>
	        </div>
	    </div>
    </div>
</div>

<script type="text/javascript">
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
  
  form.on('submit(remark)',function(){
  	 layer.msg('对不起，评论功能已关闭');
  	 return false;
  })
});
</script> 


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