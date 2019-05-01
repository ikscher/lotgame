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
class UserBidmode extends Model
{
	public function user()
    {
        //关联会员表
        return $this->belongsTo('User');
    }

    // public function user_auto()
    // {
    //    //关联自动投注表
    // 	return $this->hasOne('UserAuto','mode_id');
    // }
  
}
