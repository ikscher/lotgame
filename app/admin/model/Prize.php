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


namespace app\admin\model;

use \think\Model;
class Prize extends Model
{
	public function cate()
    {
        //关联分类表
        return $this->belongsTo('PrizeCate');
    }

    public function cardcate()
    {
        //关联分类表
        return $this->belongsTo('CardCate');
    }

    public function remark()
    {
        //关联user_remark表
        return $this->hasMany('app\front\model\UserRemark','prize_id');
    }

    public function exchange()
    {
        //关联user_exchange表
        return $this->hasMany('app\front\model\UserExchange','prize_id');
    }


}
