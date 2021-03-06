<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------

use \think\Route;

//url美化 例：Route::rule('blog/:id','index/blog/read');
// $url = \think\Db::name("urlconfig")->where(['status' => 1])->column('aliases,url');
// foreach ($url as $k => $val) {
// 	\think\Route::rule($k,$val);
// }

// Route::resource('article','test/article');

// return [
//     '__pattern__' => [
//         'name' => '\w+',
//     ],
//     '[hello]'     => [
//         ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
//         ':name' => ['index/hello', ['method' => 'post']],
//     ],

// ];

// return [    
//  '/' => 'front/index/index', //首页
//  'board/index' => 'front/board/index',
//  'board/detail/:id' => 'front/board/detail'
//   // ':controller/:action'=>'front/:controller/:action', //控制器方法
// ];
Route::rule('/','front/index/index');
Route::rule('/index/index','front/index/index');
Route::rule('/index','front/index/index');
Route::rule('board/detail/:id','front/board/detail');
Route::rule('board/index','front/board/index');
Route::rule('article/index','front/article/index');
Route::rule('article/detail/:id','front/article/detail');
Route::rule('prize/shatter','front/prize/shatter');
Route::rule('user/index','front/user/index');
Route::rule('prize/point','front/prize/point');
Route::rule('user/ajaxpoint','front/user/ajaxpoint');
Route::rule('user/remark','front/user/remark');
Route::rule('user/msg','front/user/msg');
Route::rule('user/edit','front/user/edit');
Route::rule('user/safe','front/user/safe');
Route::rule('user/safepwd','front/user/safepwd');
Route::rule('user/safemsg','front/user/safemsg');
Route::rule('user/bindemail','front/user/bindemail');
Route::rule('user/changepwd','front/user/changepwd');
Route::rule('user/bank','front/user/bank');
Route::rule('user/prize','front/user/prize');
Route::rule('user/charge','front/user/charge');
Route::rule('user/recom','front/user/recom');
Route::rule('user/recomyield','front/user/recomyield');
Route::rule('user/signin','front/user/signin');
Route::rule('user/wage','front/user/wage');
Route::rule('user/bonus','front/user/bonus');
Route::rule('user/relief','front/user/relief');
Route::rule('user/reward','front/user/reward');
Route::rule('user/mobile','front/user/mobile');
Route::rule('agent/index','front/agent/index');
Route::rule('site/index','front/site/index');
Route::rule('prize/ind','front/prize/init');
Route::rule('prize/index','front/prize/index');
Route::rule('prize/start','front/prize/start');
Route::rule('prize/win','front/prize/win');
Route::rule('shop/index','front/shop/index');
Route::rule('shop/index/:id','front/shop/index');
Route::rule('shop/detail','front/shop/detail');
Route::rule('shop/qualify','front/shop/qualify');
Route::rule('shop/order','front/shop/order');
Route::rule('common/logout','front/common/logout');
Route::rule('common/login','front/common/login');
Route::rule('common/logins','front/common/logins');
Route::rule('common/upload','front/common/upload');
Route::rule('common/gtvalidate','front/common/gtvalidate');
Route::rule('common/sendmail','front/common/sendmail');
Route::rule('common/sendmsg','front/common/sendmsg');
Route::rule('common/register','front/common/register');
Route::rule('common/recom','front/common/recom');
Route::rule('common/findpwd','front/common/findpwd');
Route::rule('common/findpwd2','front/common/findpwd2');
Route::rule('game/rank','front/game/rank');
Route::rule('game/index','front/game/index');
Route::rule('game/data','front/game/data');
Route::rule('game/intro','front/game/intro');
Route::rule('game/record','front/game/record');
Route::rule('game/mode','front/game/mode');
Route::rule('game/auto','front/game/auto');
Route::rule('game/chart','front/game/chart');
Route::rule('game/total','front/game/total');
Route::rule('game/get_record','front/game/get_record');
Route::rule('game/get_chart','front/game/get_chart');
Route::rule('game/get_bet_info','front/game/get_bet_info');
Route::rule('game/betting','front/game/betting');
Route::rule('game/betting_submit','front/game/betting_submit');
Route::rule('game/save_mode','front/game/save_mode');
Route::rule('game/get_mode','front/game/get_mode');
Route::rule('game/del_mode','front/game/del_mode');
Route::rule('game/betting_prev','front/game/betting_prev');
Route::rule('game/save_autobet','front/game/save_autobet');
Route::rule('game/del_autobet','front/game/del_autobet');
Route::rule('game/test','front/game/test');
//Crond
Route::rule('data/baccarat','front/data/baccarat');
Route::rule('data/luckyten','front/data/luckyten');
Route::rule('data/luckyeleven','front/data/luckyeleven');
Route::rule('data/luckysixteen','front/data/luckysixteen');
Route::rule('data/luckyrank','front/data/luckyrank');
Route::rule('data/luckytwentytwo','front/data/luckytwentytwo');
Route::rule('data/luckytwentyeight','front/data/luckytwentyeight');
Route::rule('data/luckythirtysix','front/data/luckythirtysix');
Route::rule('data/dandan28','front/data/dandan28');
Route::rule('data/dandan36','front/data/dandan36');
Route::rule('data/dandanwaiwei21','front/data/dandanwaiwei21');
Route::rule('data/dandanwaiwei28','front/data/dandanwaiwei28');
Route::rule('info/check','front/info/check');


