<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"D:\mywork\lotgame\public/../app/test\view\index\index.html";i:1552396529;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
    <!-- <script src="/static/public/jquery/jquery.min.js"></script> -->
	<script src="/static/public/jquery/jquery.min.js"></script>
</head>
<body>
	<button id="res">测试restful api</button>
</body>
<script type="text/javascript">
    $('#res').click(function(){
        $.ajax({
        	url:'article',  
        	type:'get',  //put ,edit,update,get
            data:{},
            dataType:'text',
            success:function(r){
               console.log(r);
            }
        })
    });
</script>
</html>