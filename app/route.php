<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
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
Route::rule('board/detail/:id','front/board/detail');
Route::rule('board/index','front/board/index');
Route::rule('article/index','front/article/index');
Route::rule('article/detail/:id','front/article/detail');
Route::rule('prize/shatter','front/prize/shatter');
Route::rule('user/index','front/user/index');
Route::rule('user/point','front/user/point');
Route::rule('agent/index','front/agent/index');
Route::rule('site/index','front/site/index');
Route::rule('prize/ind','front/prize/init');
Route::rule('prize/index','front/prize/index');
Route::rule('prize/start','front/prize/start');
Route::rule('shop/index','front/shop/index');
Route::rule('shop/index/:id','front/shop/index');
Route::rule('shop/detail','front/shop/detail');


