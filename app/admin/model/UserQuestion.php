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


namespace app\admin\model;

use \think\Model;
class UserQuestion extends Model
{
    public function admin()
    {
        //关联ADMIN表
        return $this->belongsTo('Admin');
    }

    public function user()
    {
        //关联ADMIN表
        return $this->belongsTo('app\front\model\User');
    }
}
