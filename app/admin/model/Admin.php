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
class Admin extends Model
{
	public function admincate()
    {
        //关联角色表
        return $this->belongsTo('AdminCate');
    }

    public function article()
    {
        //关联文章表
        return $this->hasMany('Article','admin_id');
        // return $this->hasOne('Article');
    }

    public function board()
    {
        //关联公告表
        return $this->hasMany('Board','admin_id');
    }

    public function log()
    {
        //关联日志表
        // return $this->hasOne('AdminLog');
        return $this->hasMany('AdminLog','admin_id');
    }

    public function attachment()
    {
        //关联附件表
        return $this->hasOne('Attachment');
    }

    public function userquestion()
    {
        //关联工单表
        return $this->hasMany('app\front\model\UserQuestion','admin_id');
    }

    public function usermsg()
    {
        //关联站内信表
        return $this->hasMany('app\front\model\UserMsg','send_uid','id');
    }
}
