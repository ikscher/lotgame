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

return [    
 '' => 'front/index/index', //首页
 ':controller/:action'=>'front/:controller/:action', //控制器方法
];
Route::rule('board/detail/:id','front/board/detail');
// Route::controller('board','front/board');
// Route::rule('board/detail/:id','front/board/detail');

