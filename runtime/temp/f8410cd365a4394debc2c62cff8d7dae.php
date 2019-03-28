<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\mywork\lotgame\public/../app/front\view\prize\draw.html";i:1553694124;s:51:"D:\mywork\lotgame\app\front\view\public\header.html";i:1553692502;s:51:"D:\mywork\lotgame\app\front\view\public\footer.html";i:1553609915;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta name="renderer" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<?php if($controller != 'Index'): ?>
	<link href="/static/front/css/base.css" type="text/css" rel="stylesheet" />
	<?php endif; ?>
    <link href="/static/front/css/common.css" type="text/css" rel="stylesheet" />
	<script src="/static/public/jquery/jquery.min.js"></script>
	<script src="/static/public/layui/layui.js"></script>
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<title><?php echo $title; ?></title>
</head>
<body>
	<script>
		layui.use(['layer', 'form'], function(){
			var layer = layui.layer
			,form = layui.form;
		});
	</script> 
	<style type="text/css">
	#callboard {    width: 150px;
		overflow: hidden;
		display: inline-block;
		vertical-align: middle;
		font-size: 12px;
		position: relative;
		top: -1px;
		margin-left: 30px;float:left}
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
					<li><a href="/Shop/Center" class="nli">兑换商城</a></li>
					<li><a href="/Article/Index" class="nli">活动专场</a></li>
					<div class="dropdown fl">
						<li>
							<a href="#" class="nli">福利时代</a>
							<div class="dropdown-main">
								<div class="dropdown-content">
									<a href="/Hd/Qiangka">抢卡风暴</a>
									<a href="/Prize/Shatter">砸金蛋</a>
									<a href="/Prize/Draw">抽奖转盘</a>
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
				if(pNall.toLowerCase().indexOf("hd/round") > 0){
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
				if(pNall.toLowerCase().indexOf("prize/") > 0){
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
<script type="text/javascript" src="/static/public/jquery/awardRotate.js"></script>
<script type="text/javascript" src="/static/public/jquery/ajaxrequest.js"></script>

<script type="text/javascript">
  var turnplate = {
    restaraunts: [],
    outsideRadius: 260, //大转盘外圆的半径
    textRadius: 155, //大转盘奖品位置距离圆心的距离
    insideRadius: 83, //大转盘内圆的半径
    startAngle: 0, //开始角度
    bRotate: false, //false:停止;ture:旋转
    rotateFn: function () {
      $.ajax({ 
            type: 'GET', 
            url: '/prize/start', 
            dataType: 'json', 
            cache: false, 
            error: function(){ 
                alert('出错了！'); 
                return false; 
            }, 
            success:function(result){ 
                var angles = result.angle; //角度 
                var txt = result.prize; //奖项 
                var cjcs = result.cjcs;
                if (angles < 270) {
            angles = 270 - angles;
          } else {
            angles = 360 - angles + 270;
          }           
                if(cjcs>0){
                  turnplate.bRotate = !turnplate.bRotate;
                  $('#wheelcanvas').stopRotate();
                  $("#wheelcanvas").rotate({ 
                     duration:8000, //转动时间 
                     angle: 0, 
                     animateTo:angles + 1800, //转动角度 
                     // easing: $.easing.easeOutSine, 
                     callback: function(){ 
                        alert('恭喜你，中得'+txt+'');
                        location.reload();
                        turnplate.bRotate = !turnplate.bRotate;
                    } 
                  }); 
                }else{
                  alert("您的抽奖次数已用完，请再次充值！");
                }
                
            } 
         }); 
    },
    /*setText: function (t) {
      this.Div.innerHTML = t;
    },*/
    drawRouletteWheel: function (prize) {
      this.restaraunts = prize;
      var num1=360/prize.length;
      var num = Math.PI/180;
      var canvas = document.getElementById("wheelcanvas");
      if (canvas.getContext) {
        //根据奖品个数计算圆周角度
        var arc = Math.PI / (turnplate.restaraunts.length / 2);
        var ctx = canvas.getContext("2d");
        //在给定矩形内清空一个矩形
        ctx.clearRect(0, 0, 240, 240);
        //strokeStyle 属性设置或返回用于笔触的颜色、渐变或模式 
        ctx.strokeStyle = "#FFBE04";
        //font 属性设置或返回画布上文本内容的当前字体属性
        ctx.font = '26px Microsoft YaHei';
        for (var i = 0; i < turnplate.restaraunts.length; i++) {
          var angle = turnplate.startAngle + i * arc;
          if(i%2==0){
              ctx.fillStyle = "#ffffff";
          }else{
              ctx.fillStyle = "#79cbde";
          }
          ctx.beginPath();
          //arc(x,y,r,起始角,结束角,绘制方向) 方法创建弧/曲线（用于创建圆或部分圆） 
          ctx.arc(260, 260, turnplate.outsideRadius, angle, angle + arc, false);
          ctx.arc(260, 260, turnplate.insideRadius, angle + arc, angle, true);
          ctx.stroke();
          ctx.fill();
          //锁画布(为了保存之前的画布状态)
          ctx.save();
          //----绘制奖品开始----
          ctx.fillStyle = "#ff2727";
          var text = turnplate.restaraunts[i];

          var line_height = 17;
          ctx.translate(260, 260);
          ctx.rotate((i*num1+40)*num);
          ctx.fillText(text, 110, 0);
          ctx.restore();
        }
      }
    }
  };
  window.onload=function(){
    $.ajax({
          type: "POST",
          url: "/prize/init",
          dataType: 'json', 
          cache: false,
          success: function(result){
            var prize=[];
            for(var i=0;i<result.sum.length;i++){
                    prize.push(result.sum[i].prize);
                 }
        turnplate.drawRouletteWheel(prize);
      }
      });
  };

  </script>
 </head>
 <body style="min-width: 1310px;">

<div class="cjbg">
  <div class="w1000" style="width: 1310px;">
      <div class="turntable-bg">
        <div class="rotate" >
          <img src="/static/front/image/turntable-bg-shadow.png" class="turntable-bg-shadow">
        <canvas class="item" id="wheelcanvas" width="520px" height="520px"></canvas>
        <img class="pointer" src="/static/front/image/pointer-pc.png?v=1.2" alt="pointer" id="pointer" onclick='turnplate.rotateFn()'/>
         </div>
      </div>
      <div class="cjstate" >
          <h5 class="cjstate_tit">活动说明：</h5>
          <div class="cjstate_con">
            <div><font color="#ff0000" size="4"><b>活动期间大转盘福利！充值200元即可抽奖一次！快去抽！</b></font></div>
<div><font color="#ff0000" size="4"><b>最高能获得888000金币，以及彩豆大礼包一份！</b>&lt
          </div>
          <p>活动时间：2018-10-01-2019-05-07</p>
            <p>您剩余的抽奖次数：<span>0</span>次</p>
      </div>
  </div>
  <div class="cjbg-bottom"></div>
</div>  

<style>
.cjbg{
    background: url(/static/front/image/cjbg.jpg?v=1.2) no-repeat top center;
    width: 100%;
    padding-top: 660px;
    height: 1575px;
    position: relative;
    box-sizing: border-box;
}
.cjbg-bottom{
  width: 100%;
  position: absolute;
  bottom: 50px;
  left: 0;
  background: url('/static/front/image/cjbg-bottom.png') no-repeat center center;
  z-index: 999;
  height: 100px;
}
.turntable-bg {
  width: 619px;
  height: 768px;
  float: left;
  display:block;
}
.turntable-bg-shadow{
  width: 520px;
  height: 520px;
  position: absolute;
  top: 140px;
  left: 65px;
  z-index: 3;
}
.turntable-bg .rotate {
  width: 631px;
  height: 788px;
  position: relative;
  background: url('/static/front/image/turntable-bg-pc.png?v=1.1') no-repeat center center;
  background-size: 100% 100%;
}
.turntable-bg .rotate .item{
    position: absolute;
    top: 140px;
    left: 65px;
    z-index: 1;
}

.turntable-bg .rotate .pointer {
  width: 224px;
  height: 265px;
  position: absolute;
  left: 50%;
  top: 250px;
  margin-left: -103px;
  z-index: 8;
}
.cjstate{
    background-color: #fff;
    width: 600px;
    border-radius: 10px;
    padding: 20px 34px;
    float: right;
    height: 350px;
    text-align: left;
    box-sizing: border-box;
    box-shadow: 0 0 25px rgba(0,0,0,0.3);
    margin-top: 250px;
}
.cjstate h5{
    font-weight: normal;
    font-size: 30px;
    line-height: 50px;
    display: inline-block;
    width: 475px;
    color: #ff2727;
    border-bottom: 1px solid #ff2727;
}
.cjstate .cjstate_con{
  font-size: 22px;
  line-height: 37px;
  color: #ff2727;
  margin: 10px 0 20px;
}
.cjstate  p{
    display: inline-block;
    width: 100%;
    font-size: 22px;
    color: #656565;
    line-height: 37px;
}
.cjstate p span{color: #ff2727;}

</style>
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