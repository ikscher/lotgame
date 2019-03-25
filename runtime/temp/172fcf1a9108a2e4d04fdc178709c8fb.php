<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:62:"D:\mywork\lotgame\public/../app/front\view\article\detail.html";i:1553522559;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>活动详情 - <?php echo $title; ?></title>
    <link href="/static/front/css/base.css" rel="stylesheet" type="text/css" />
    <script  type="text/javascript" src="/static/public/jquery/jquery.min.js"></script>
    <script  type="text/javascript" src="/static/front/js/js.js"></script>
    <script src="/static/public/layui/layui.js"></script>
    <script>
        layui.use(['layer'], function(){
            var layer = layui.layer;
        });
    </script> 
    <style type="text/css">
        .hddetail{width:910px;height:500px;background:#fff;border:#ddd solid 1px;border-radius: 10px;margin:10px auto;padding:10px}
        .hddetail h2{ line-height: 45px;color:#E24124}
        .hddetail h2 span{float: right; font-size: 14px;}
        .hddetail .con{ font-size: 14px; line-height: 28px; background: #F3F3F3; padding: 10px; border-radius: 10px; color: #545454; height: 255px; overflow: auto}
    </style>
</head>
<body>

    <div class="hddetail">
      <img style="border-radius: 10px" src="<?php echo geturl($article['thumb']); ?>"/>
      <h2><?php echo $article['title']; ?> <span>活动时间：<?php echo date('Y-m-d',$article['begin_time']); ?>至<?php echo date('Y-m-d',$article['end_time']); ?></span></h2>
      <div class="con"><?php echo $article['content']; ?></div>
    </div>

</body>
</html>
