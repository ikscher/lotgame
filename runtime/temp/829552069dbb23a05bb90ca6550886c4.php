<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:58:"D:\mywork\lotgame\public/../app/admin\view\game\setup.html";i:1553337842;}*/ ?>
<!DOCTYPE html>
<html ng-app="App">
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="/static/public/layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="/static/public/font-awesome/css/font-awesome.min.css" media="all" />
  <link rel="stylesheet" href="/static/admin/css/admin.css"  media="all">
</head>
<body style="padding:10px;" ng-controller="setupCtrl">
  <div class="tplay-body-div">
    <div class="layui-tab">
      <ul class="layui-tab-title">
        <li><a href="<?php echo url('admin/game/index'); ?>" class="a_menu">游戏管理</a></li>
        <li class="layui-this">游戏设置</li>
      </ul>
    </div>
    <div style="margin-top: 20px;">
    </div>
    <form class="layui-form" id="admin">
      
      <div class="layui-tab">
          <ul class="layui-tab-title">
            <li class="layui-this">基础设置</li>
            <li>经验奖励设置</li>
            <li>积分奖励设置</li>
            <li>游戏帮助</li>
            <li>游戏提示</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
              
               <div class="layui-form-item">
                  <label class="layui-form-label">抽水比例</label>
                  <div class="layui-input-inline">
                    <input name="draw_ratio" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['draw_ratio']) || (($game['draw_ratio'] instanceof \think\Collection || $game['draw_ratio'] instanceof \think\Paginator ) && $game['draw_ratio']->isEmpty()))): ?>value="<?php echo $game['draw_ratio']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                  </div>
                </div>
                
                <div class="layui-form-item">
                  <label class="layui-form-label">额外禁止投注时间(秒)</label>
                  <div class="layui-input-inline">
                    <input name="forbid"  placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['forbid']) || (($game['forbid'] instanceof \think\Collection || $game['forbid'] instanceof \think\Paginator ) && $game['forbid']->isEmpty()))): ?>value="<?php echo $game['forbid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                  </div>
                </div>

                <div class="layui-form-item">
                  <label class="layui-form-label">投注限额</label>
                  <div class="layui-input-inline">
                    <input name="min_bid" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['min_bid']) || (($game['min_bid'] instanceof \think\Collection || $game['min_bid'] instanceof \think\Paginator ) && $game['min_bid']->isEmpty()))): ?>value="<?php echo $game['min_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                  </div>
                  <label class="layui-form-label" >到</label>
                  <div class="layui-input-inline">
                    <input name="max_bid" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['max_bid']) || (($game['max_bid'] instanceof \think\Collection || $game['max_bid'] instanceof \think\Paginator ) && $game['max_bid']->isEmpty()))): ?>value="<?php echo $game['max_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                  </div>
                </div>

                
            </div>
            <div class="layui-tab-item">
              <?php $__FOR_START_23671__=1;$__FOR_END_23671__=5;for($i=$__FOR_START_23671__;$i < $__FOR_END_23671__;$i+=1){ ?>
                <div style="margin:10px;">
                <label>手动盈利</label>
                <div class="layui-input-inline">
                  <input name="min_exp_from" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['min_bid']) || (($game['min_bid'] instanceof \think\Collection || $game['min_bid'] instanceof \think\Paginator ) && $game['min_bid']->isEmpty()))): ?>value="<?php echo $game['min_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                </div>
                <label  style="width: 30px;">到</label>
                <div class="layui-input-inline">
                  <input name="max_exp_from" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['max_bid']) || (($game['max_bid'] instanceof \think\Collection || $game['max_bid'] instanceof \think\Paginator ) && $game['max_bid']->isEmpty()))): ?>value="<?php echo $game['max_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                </div>

                <label >奖励</label>
                <div class="layui-input-inline">
                  <input name="reward_exp" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['max_bid']) || (($game['max_bid'] instanceof \think\Collection || $game['max_bid'] instanceof \think\Paginator ) && $game['max_bid']->isEmpty()))): ?>value="<?php echo $game['max_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                </div>
                 <label >经验</label>
                 </div>
               <?php } ?>
            </div>
            <div class="layui-tab-item">
              <?php $__FOR_START_24182__=1;$__FOR_END_24182__=5;for($i=$__FOR_START_24182__;$i < $__FOR_END_24182__;$i+=1){ ?>
                <div style="margin:10px;">
                <label>盈利</label>
                <div class="layui-input-inline">
                  <input name="min_points_from" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['min_bid']) || (($game['min_bid'] instanceof \think\Collection || $game['min_bid'] instanceof \think\Paginator ) && $game['min_bid']->isEmpty()))): ?>value="<?php echo $game['min_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                </div>
                <label  style="width: 30px;">到</label>
                <div class="layui-input-inline">
                  <input name="max_points_from" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['max_bid']) || (($game['max_bid'] instanceof \think\Collection || $game['max_bid'] instanceof \think\Paginator ) && $game['max_bid']->isEmpty()))): ?>value="<?php echo $game['max_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                </div>

                <label >奖励</label>
                <div class="layui-input-inline">
                  <input name="reward_points" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input" type="text" <?php if(!(empty($game['max_bid']) || (($game['max_bid'] instanceof \think\Collection || $game['max_bid'] instanceof \think\Paginator ) && $game['max_bid']->isEmpty()))): ?>value="<?php echo $game['max_bid']; ?>"<?php else: ?>value="0"<?php endif; ?>>
                </div>
                 <label >积分</label>
                 </div>
               <?php } ?>
            </div>
            <div class="layui-tab-item">
              <div class="layui-form-item layui-form-text">
                <!-- <label class="layui-form-label">帮助</label> -->
                <div class="layui-input-inline" style="max-width:1000px;">
                  <textarea placeholder="请输入内容" class="layui-textarea" name="help" id="container" style="border:0;padding:0"><?php if(!(empty($game['help']) || (($game['help'] instanceof \think\Collection || $game['help'] instanceof \think\Paginator ) && $game['help']->isEmpty()))): ?><?php echo $game['help']; endif; ?></textarea>
                </div>
              </div>
            </div>
            <div class="layui-tab-item">
              <textarea placeholder="请输入内容" name="tip" rows="10" cols="90" maxlength="100"  title="只能输入100个字" ng-model="text" ng-change="tolCount()"><?php if(!(empty($game['tip']) || (($game['tip'] instanceof \think\Collection || $game['tip'] instanceof \think\Paginator ) && $game['tip']->isEmpty()))): ?><?php echo $game['tip']; endif; ?></textarea>
              <p>还可输入{{count}}个字</p>
            </div>
          </div>
      </div>

      

      
      
      <?php if(!(empty($game) || (($game instanceof \think\Collection || $game instanceof \think\Paginator ) && $game->isEmpty()))): ?>
      <input type="hidden" name="id" value="<?php echo $game['id']; ?>">
      <?php endif; ?>
      <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="admin">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div>
      
    </form>


    <script src="/static/public/layui/layui.js"></script>
    <!-- <script src="/static/public/jquery/jquery.min.js"></script> -->
    <script src="/static/admin/js/angular.min.js"></script>
    <!-- <script>
        var message;
        layui.config({
            base: '/static/admin/js/',
            version: '1.0.1'
        }).use(['app', 'message'], function() {
            var app = layui.app,
                $ = layui.jquery,
                layer = layui.layer;
            //将message设置为全局以便子页面调用
            message = layui.message;
            //主入口
            app.set({
                type: 'iframe'
            }).init();
        });
    </script> -->
    <script>
     
      layui.use(['layer', 'form','element'], function() {
          var layer = layui.layer,
          $ = layui.jquery,
          element = layui.element,
          form = layui.form;
          $(window).on('load', function() {
              form.on('submit(admin)', function(data) {
                  console.log('ggg')
                  $.ajax({
                      url:"<?php echo url('admin/game/setup'); ?>",
                      data:$('#admin').serialize(),
                      type:'post',
                      async: false,
                      success:function(res) {
                          // console.log(res)
                          if(res.code == 1) {
                              layer.alert(res.msg, function(index){
                                location.href = res.url;
                              })
                          } else {
                              layer.msg(res.msg);
                          }
                      }
                  })
                  return false;
              });
          });
      });
    </script>
    <script>
      var app = angular.module('App', []);

  　　app.controller('setupCtrl', function($scope) {
  　　　　$scope.count = 100; 
         $scope.text="<?php echo $game['tip']; ?>";

  　　　　$scope.tolCount = function () {
  // 　　　　　　console.log($scope.text.length);
  　　　　　　$scope.count = 100 - $scope.text.length;
  　　　　};
  　　});

    </script>

    <!-- 加载编辑器的容器 -->
    <script id="container" name="desc" type="text/plain">
        这里写你的初始化内容
    </script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="/static/public/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/static/public/ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
  </div>
</body>
</html>