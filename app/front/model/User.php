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


namespace app\front\model;

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
        return $this->hasOne('UserCharge','user_id');
    }
 

    public function log()
    {
        //关联日志表
        return $this->hasMany('UserLog','user_id');
    }

    public function safepwd(){
        //关联密保卡
        return $this->hasOne('UserSafepwd','user_id');
    }

    public function msg()
    {
        //关联站内信表
        return $this->hasMany('UserMsg','user_id');
    }
    
    public function userquestion(){
        //关联工单表
        return $this->hasMany('app\admin\model\UserQuestion','user_id');
    }

    public function card(){
        //关联卡密表（兑奖）
        return $this->hasMany('app\admin\model\CardPwd','user_id');
    }

    public function agent(){
        //关联代理表
        return $this->hasOne('app\admin\model\Agent','user_id');
    }

    public function bid(){
        //关联投注表
        return $this->hasMany('UserBid','user_id');
    }

}
