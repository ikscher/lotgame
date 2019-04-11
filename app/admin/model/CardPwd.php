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
class CardPwd extends Model
{
	public function cate()
    {
        //关联卡类表
        return $this->belongsTo('CardCate');
    }

    public function user()
    {
    	return $this->belongsTo('app\front\model\User');
    }

    

    public function agent()
    {
    	return $this->belongsTo('Agent');
    }

}
