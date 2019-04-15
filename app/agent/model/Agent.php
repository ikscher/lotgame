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


namespace app\agent\model;

use \think\Model;
class Agent extends Model
{
	public function cate()
    {
        //关联分类表
        return $this->belongsTo('AgentCate');
    }

    public function user()
    {
        //关联用户表
        return $this->belongsTo('app\front\model\User');
    }

    public function card()
    {
        //关联卡密表
        return $this->hasMany('app\admin\model\CardPwd','agent_id');
    }

    public function log()
    {
        //关联日志表
        return $this->hasMany('AgentLog','agent_id');
    }

    public function deposit()
    {
        //关联提现表
        return $this->hasMany('AgentDeposit','agent_id');
    }
}
