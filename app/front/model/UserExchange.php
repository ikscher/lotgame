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
class UserExchange extends Model
{
	public function user()
    {
        //关联user表
        return $this->belongsTo('User');
    }
    
    public function prize()
    {
        //关联user表
        return $this->belongsTo('app\admin\model\Prize');
        // return $this->belongsTo('Prize');
    }

    

  
}
