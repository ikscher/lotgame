<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:58:"D:\mywork\lotgame\public/../app/front\view\shop\order.html";i:1554649423;s:51:"D:\mywork\lotgame\app\front\view\public\header.html";i:1554378080;s:51:"D:\mywork\lotgame\app\front\view\public\footer.html";i:1554377533;}*/ ?>
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
<script src="/static/front/js/gt.js"></script>
<script  type="text/javascript" src="/static/front/js/js.js"></script>
<script  type="text/javascript" src="/static/public/jquery/jquery.showLoading.min.js"></script>
<script  type="text/javascript" src="/static/front/js/prize_buy.js"></script>

<style type="text/css">
    #detail .tb-key .tb-stock {position: relative; float: left; }
    #bd .tb-stock .tb-disable-increase, #bd .tb-stock .tb-disable-increase:hover, #bd .tb-stock .tb-disable-reduce, #bd .tb-stock .tb-disable-reduce:hover {color: #ccc; cursor: not-allowed; background-color: #ededed; }
    .tb-stock .tb-reduce {border-right: 0 !important; }
    .tb-stock a, #bd .tb-stock a:hover {display: block; _display: inline; float: left; width: 26px; height: 26px; border: 1px solid #ccc; line-height: 26px; padding: 0; vertical-align: top; overflow: hidden; text-align: center; background-color: #ededed; overflow: hidden; }
    #tbExchangedCount {float: left; margin: 0; padding: 0; width: 48px; height: 26px; font-size: 16px; line-height: 26px; text-align: center; color: #666; border: 1px solid #CCC; outline: 0; background: #FFF; ime-mode: disabled; }
    #bd .tb-stock .tb-increase {border-left: 0 !important; margin-right: 8px; }
    #bd .tb-stock a, #bd .tb-stock a:hover {display: block; _display: inline; float: left; width: 26px; height: 26px; border: 1px solid #ccc; line-height: 26px; padding: 0; vertical-align: top; overflow: hidden; text-align: center; background-color: #ededed; overflow: hidden; }
    .text-overflow{display:block;/*内联对象需加*/ width:31em; word-break:keep-all;/* 不换行 */ white-space:nowrap;/* 不换行 */ overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */ text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/ } 
    .sxfsm{width: 400px;  border: 1px #FF4400 dotted; float: left; border-radius: 5px; padding: 5px 10px; margin: 5px; color: #737573; font-size: 12px;}
    .ordbtn{font-size: 12px;color: #FFFFFF;width: 182px;height: 39px;background-color: #FF4400;border: none;font-weight: 900;margin-left: 100px;}
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


    <div id="buybox" class="buybox fr">
        <div class="top">
            <h1>确认下单</h1>
        </div>

        <div class="con prizec">
            <table id="ContentPlaceHolder1_DataList1" width="100%" cellspacing="15" cellpadding="0">
                <tbody>
                    <form  method="post" id="prizeform">
                        <input type="hidden" name="prizeid" value="<?php echo $id; ?>" />
                        <input type="hidden" name="prizeprice" value="<?php echo $prize['price']; ?>" />
                        <tr>
                             <td style="width: 250px"><img src="<?php echo geturl($prize['thumb']); ?>" alt="" width="250"></td>
                             <td style="vertical-align: top;background-color: #FBFCFF;border-top:1px #B2D1FF dotted;width: 100%">
                                <div style="width:175px;float:left">
                                          <h1 style="font-size: 18px;font-weight: 100;margin-top: 10px"><?php echo $prize['name']; ?></h1>

                                          <span>单价：</span><span id="oneprice" style="font-size: 21px" class="money money_bg"><?php echo $prize['price']*$coefficient; ?></span>
                                          <br>
                                         <span>额外手续费：</span><span  id="lssxf" style="color:green">-</span><span style="color:green;">金币</span><a id="sxfdetail" onmouseover="sxfdetail()" onmouseout="sxfdetail_clo()" style="display:none;background:url('/static/front/image/wenh2.png');background-size:16px;width:16px;height:16px;    position: relative;top: 2px" ></a>
                                      <div style="height:3px"></div>

                                      <span style="float: left;margin-right: 6px">数量：</span>
                                      <span class="tb-stock" id="J_Stock">
                                        <a href="javascript:minus();cacusxf();" title="减1" hidefocus="" class="tb-reduce J_Reduce tb-iconfont tb-disable-reduce" data-spm-anchor-id="2013.1.20140002.1">-</a>
                                        <input onkeyup="adjust();cacusxf();" name="tbExchangedCount" id="tbExchangedCount" type="text" class="tb-text" value="1" maxlength="8" title="请输入购买量">
                                        <a href="javascript:add();cacusxf();" hidefocus="" class="tb-increase J_Increase tb-iconfont" title="加1" data-spm-anchor-id="2013.1.20140002.2">+</a>
                                    </span>
                                </div>

                                <div id="sxfsm" class="sxfsm"></div>


                                  <div style="background-color: #F2F7FF;width: auto;clear: both;height: 128px;padding: 8px">
                                   <span><?php echo $safe_q; ?></span>
                                   <br>
                                   <input type="text" style="width: 150px;height: 28px;font-size: 16px;border: 1px solid #d5d5d5" name="safe_a" id="safe_a">
                                   <br>
                                   <?php if($smscode_show == 1): ?>
                                   <span>手机验证码</span>
                                   <br>
                                   <input id="code" type="text" style="width: 100px;height: 28px;font-size: 16px;border: 1px solid #d5d5d5" name="code"><button type="button" id="popup-submit" style="width: 50px;height: 29px;border: none;background-color: #90C626;padding:0 10px;color: #FFFFFF;font-weight: 900;position: relative;bottom: 1px">获取</button>
                                   <?php endif; ?>
                                  </div> 

                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" style="border: solid #FF4400 1px;height: 100px">
                                <div style="border: 3px solid #fff0e8;width: 100%;height: 100%;line-height: 100px">
                                    <span style="display: none" id="price1"><?php echo $prize['price']*$coefficient; ?></span>
                                    <div id="embed-captcha"></div>
                                    <p id="wait" class="show"></p>
                                    <p id="notice" class="hide"></p>
                                    <div id="popup-captcha"></div>
                                    <span style="margin-left: 10px;font-weight: 900">实付款：</span><span style="font-size: 30px;position: relative;top: 5px" class="money_bg" id="price"><?php echo $prize['price']*$coefficient; ?></span>
                                    <button lay-submit lay-filter="order" class="ordbtn">提交订单</button>
                                </div>
                            </td>
                        </tr>
                    </form>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script> 
      var lssxfopen = 1; //按照流水   手续费开

      var cssxfopen = <?php echo $charge_times['id']; ?>; //按次数     手续费关
      var oldprice;
      var lsbs = <?php echo $charge_f['flow_times']; ?>; //流水倍数
      var yxls = <?php echo $bidmoney; ?>; //7天内一共有的游戏流水
      var lssxbl = <?php echo $charge_f['charge_ratio']; ?>; //流水手续比例
      var days=<?php echo $charge_f['flow_days']; ?>;
      var prized=0;//近7天兑奖总额
      var xsf;
      var tipsStr='';
      var sumSxf;
      function cacusxf(){
           tipsStr='';
           sumSxf = 0;
           oldprice = parseInt($("#price").html().replace(/,/g,""));
           if(lssxfopen == 1){
              var freeprice = parseInt(yxls/lsbs);


              if(oldprice+prized>freeprice){ //正兑换的+已兑换的>免费限额
                 var exceed=prized>freeprice?oldprice:(oldprice+prized-freeprice);
                 xsf = exceed*lssxbl/100;

                 sumSxf = xsf;
                 tipsStr = '●游戏流水手续费:您最近'+days+'日游戏流水：0,可免额外手续费兑奖'+fmoney(freeprice)+'金币<br/>您最近'+days+'日兑奖：'+prized+'<br/>本次兑奖'+fmoney(oldprice)+"金币,超出部分："+fmoney(exceed)+"按"+lssxbl+"%收取手续费："+fmoney(parseInt(xsf))+"金币";
              }else{
                 $("#lssxf").html('无');
                 tipsStr = '●游戏流水手续费:您最近'+days+'日游戏流水：0,可免额外手续费兑奖'+fmoney(freeprice)+'金币<br/>您最近'+days+'日兑奖：'+prized+'<br/>,本次兑奖'+fmoney(oldprice)+"金币,不收取额外手续费！";
              }
         }
         if(cssxfopen){
             var feetype = <?php echo $charge_times['by']; ?>;//按比例还是固定金额收取
             if(feetype == 1){
                var curfee = parseInt(<?php echo $charge_times['charge']; ?>);
                sumSxf += parseInt(curfee);
                tipsStr += '<br/>●兑奖次数手续费:您今天是第'+<?php echo $today_exchange_times; ?>+'次兑奖，需收取'+curfee+'金币的手续费!';
            }else{
                var curfee = parseInt(<?php echo $charge_times['charge']; ?>*oldprice/100);
                sumSxf += curfee;
                tipsStr += '<br/>●兑奖次数手续费:您今天是第'+<?php echo $today_exchange_times; ?>+'次兑奖，本次兑奖'+oldprice+'金币,需收取'+<?php echo $charge_times['charge']; ?>+'%的手续费,即'+curfee+'金币!';
            }

        }
        $("#sxfsm").html(tipsStr);
        if(cssxfopen  || lssxfopen == 1){
             var aggregate=fmoney(parseInt(oldprice)+sumSxf);
             $("#price").html(aggregate);
             $("#lssxf").html(fmoney(sumSxf));
         }
    }
     var layerindex;
     function sxfdetail(){
      if($("#lssxf").html()=="无"){
         layerindex=layer.tips(tipsStr, '#sxfdetail', {
          tips: [1, '#323436'],
          time: 0,
          area:["440px"]
      });
     }else{
      layerindex=layer.tips(tipsStr, '#sxfdetail', {
          tips: [1, '#323436'],
          time: 0,
          area:["440px"]
      });
    }

      }
      function sxfdetail_clo(){
          layer.close(layerindex);
      }


      $(document).ready(function(){
          cacusxf();
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
