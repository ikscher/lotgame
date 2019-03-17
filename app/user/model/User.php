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


namespace app\user\model;

use \think\Model;
class User extends Model
{
	public function usergrade()
    {
        //关联user_grade表
        return $this->belongsTo('UserGrade');
    }

    public function userremark()
    {
        //关联user_remark表
        return $this->hasMany('UserRemark','user_id');
        // return $this->hasOne('Article');
    }

    public function userexchange()
    {
        //关联user_exchange表
        return $this->hasMany('UserExchange','user_id');
        // return $this->hasOne('Article');
    }
    
     public function charge()
    {
        //关联特殊用户兑奖 手续费user_charge表
        return $this->hasMany('UserCharge','user_id');
    }
 

    public function log()
    {
        //关联日志表
        return $this->hasMany('UserLog','user_id');
    }

}
