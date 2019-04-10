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


namespace app\front\model;

use \think\Model;
class UserGrade extends Model
{
	public function user()
    {
        //关联管理员表
        return $this->hasMany('user','user_grade_id');
    }

    public function signin()
    {
    	//关联签到设置表
    	return $this->hasOne('app\admin\model\Signinconfig','user_grade_id');
    }
}
