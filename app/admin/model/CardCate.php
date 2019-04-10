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
class CardCate extends Model
{
    public function pwd()
    {
        //关联卡密表
        return $this->hasMany('CatePwd','card_cate_id');
    }

    public function prize(){
    	//关联兑换奖品
    	return $this->hasMany('prize','card_cate_id');
    }
}
