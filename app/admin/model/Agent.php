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
        return $this->belongsTo('app\user\model\User');
    }

    public function card()
    {
        //关联卡密表
        return $this->hasMany('CardPwd','agent_id');
    }
}
