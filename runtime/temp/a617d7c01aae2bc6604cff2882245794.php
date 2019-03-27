<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"D:\mywork\lotgame\public/../app/front\view\site\index.html";i:1553676558;}*/ ?>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<title><?php echo $title; ?></title>
	<link rel="stylesheet" href="/static/public/jquery/jquery.fullPage.css">
	<style>
		.section {text-align: center; font: 50px "Microsoft Yahei"; color: #fff;}
		.section1 {background:url(/static/front/image/se1.jpg?v=1.1) no-repeat top center;background-size: 100% auto;}

		.section20 {background:url(/static/front/image/ljbg.png) no-repeat bottom center;background-size: 100% auto;}
		.section2 h3{}
		.section20 p {width:48%;text-align:right; position: relative; left: -50%;font-size:30px;line-height:60px;float:left;padding-right:2%;padding: 30px 2% 30px 0;    background: rgba(136, 136, 136, 0.21);}
		.section20 .img{text-align:left;  right: -50%;
			float: left;
			margin-top: 30px;
			position: relative;
			width: 48%;padding-left:2%;}
			.section20 .img img{}


			.yoo-service {background-color: #fafafa;
				overflow:hidden;
				position: absolute;
				bottom: 0;
				width: 100%;
			}
			.yoo-service ul {
				list-style-type:none;
				padding:0
			}
			.yoo-service .col3 {
				position:relative;
				width:1200px;
				margin:0 auto;
				display:table;
				bottom:-260px;
			}
			.yoo-service .col3 li {
				float:left;
				width:240px;
				position:relative;
				display:table;
				margin: 30px 30px 40px;
			}
			.yoo-service .col3 li .text {
				position:relative;
				width:100%;
				text-align:center
			}
			.yoo-service .col3 li .text h3 {
				margin-top:0;
				margin-bottom:10px;
				font-size:24px;
				color:#ff9152
			}
			.yoo-service .col3 li .text p {
				font-size:14px;
				color:#888
			}
			.yoo-service .col3 .service-1 {
				display:block;
				margin:10px auto;
				background:url(/static/front/image/fw1.png) no-repeat 0 0;
				width:78px;
				height:78px;
				float:none
			}
			.yoo-service .col3 .service-2 {
				display:block;
				margin:10px auto;
				background:url(/static/front/image/fw2.png) no-repeat 0 0;
				width:78px;
				height:78px;
				float:none
			}
			.yoo-service .col3 .service-3 {
				display:block;
				margin:10px auto;
				background:url(/static/front/image/fw3.png) no-repeat 0 0;
				width:78px;
				height:78px;
				float:none
			}
			.yoo-service .col3 .service-4 {
				display:block;
				margin:10px auto;
				background:url(/static/front/image/fw4.png) no-repeat 0 0;
				width:78px;
				height:78px;
				float:none
			}
		</style>
		<script src="/static/public/jquery/jquery.min.js"></script>
		<script src="/static/public/jquery//jquery.fullPage.min.js"></script>
		<script src="http://cdn.staticfile.org/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script>
			$(function(){
				$('.section1').find('.col3').delay(300).animate({
					bottom: '0'
				}, 1500, 'easeOutExpo');
				$('#dowebok').fullpage({
					sectionsColor: ['#000000', '#4BBFC3', '#7BAABE', '#f90','#E46DD1'],
					'navigation': true,
					continuousVertical: true,
					afterLoad: function(anchorLink, index){

						if(index == 2){
							$('.section2').find('p').delay(300).animate({
								left: '0'
							}, 1500, 'easeOutExpo');
							$('.section2').find('.img').delay(300).animate({
								right: '0'
							}, 1500, 'easeOutExpo');
						}
						if(index == 3){
							$('.section3').find('p').delay(300).animate({
								left: '0'
							}, 1500, 'easeOutExpo');
							$('.section3').find('.img').delay(300).animate({
								right: '0'
							}, 1500, 'easeOutExpo');
						}
						if(index == 4){
							$('.section4').find('p').delay(300).animate({
								left: '0'
							}, 1500, 'easeOutExpo');
							$('.section4').find('.img').delay(300).animate({
								right: '0'
							}, 1500, 'easeOutExpo');
						}
						if(index == 5){
							$('.section5').find('p').delay(300).animate({
								left: '0'
							}, 1500, 'easeOutExpo');
							$('.section5').find('.img').delay(300).animate({
								right: '0'
							}, 1500, 'easeOutExpo');
						}
					},
					onLeave: function(index, direction){
						if(index == '2'){
							$('.section2').find('p').delay(500).animate({
								left: '-120%'
							}, 1500, 'easeOutExpo');
							$('.section2').find('.img').delay(500).animate({
								right: '-50%'
							}, 1500, 'easeOutExpo');
						}
						if(index == '3'){
							$('.section3').find('p').delay(500).animate({
								left: '-120%'
							}, 1500, 'easeOutExpo');
							$('.section3').find('.img').delay(500).animate({
								right: '-50%'
							}, 1500, 'easeOutExpo');
						}
						if(index == '4'){
							$('.section4').find('p').delay(500).animate({
								left: '-120%'
							}, 1500, 'easeOutExpo');
							$('.section4').find('.img').delay(500).animate({
								right: '-50%'
							}, 1500, 'easeOutExpo');
						}
						if(index == '5'){
							$('.section5').find('p').delay(500).animate({
								left: '-120%'
							}, 1500, 'easeOutExpo');
							$('.section5').find('.img').delay(500).animate({
								right: '-50%'
							}, 1500, 'easeOutExpo');
						}
					}
				});
			});
		</script>
	</head>

	<body>

		<div id="dowebok">
			<div class="section section1">
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
			</div>
			<div class="section section2 section20">
				<h3>我们的优势</h3>
				<p>1、种类齐全玩法多<br>
					2、充值返利送抽奖<br>
					3、亏损返利比例高<br>
					4、操作验证防假号<br>
					5、实力代理加盟多<br>
				6、高额奖池等你赢</p>
				<div class="img"><img src="/static/front/image/lj1.png"></div>
			</div>
			<div class="section section3 section20">
				<h3>彩豆28的游戏</h3>
				<p>游戏数量最多，选择多样<br>
					游戏种类最多，玩法多样<br>
					特有的韩国1分半加官方数据开奖模式
				</p>
				<div class="img"><img src="/static/front/image/lj2.png"></div>
			</div>
			<div class="section section4 section20">
				<h3>彩豆28的服务</h3>
				<p>实力代理齐聚<br>
					高额奖池保证赔率<br>
					资金实力雄厚<br>
					客服一视同仁，有问必答主动回访<br>
					技术效率高，更新快，美术优
				</p>
				<div class="img"><img src="/static/front/image/lj3.png"></div>
			</div>
			<div class="section section5 section20">
				<h3>彩豆28的安全与诚信</h3>
				<p>全站重要操作需验证，保证账户安全<br>
					短信验证码极速到达<br>
					绝不开假号，绝不开黑户<br>
					超级防服务器防范黑客入侵

				</p>
				<div class="img"><img src="/static/front/image/lj4.png"></div>
			</div>
		</div>

	</body>
	</html>