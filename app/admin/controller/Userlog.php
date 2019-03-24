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


namespace app\admin\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\front\model\UserLog as userlogModel;
use app\front\model\User as userModel;

class Userlog extends Permissions
{   
    public function index()
    {
        $model = new userlogModel();
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['desc'] = ['like', '%' . $post['keywords'] . '%'];
        }
  
        
        if (!empty($post['user_id'])) {
            $where['user_id'] = $post['user_id'];
        }

 
        if(isset($post['begin_time']) and !empty($post['end_time'])) {
            $begin_time = strtotime($post['begin_time']);
            $end_time = strtotime($post['end_time']);
            $where['create_time'] = [['>=',$begin_time],['<=',$end_time]];
        }
        
        $userlogs = empty($where) ? $model->order('create_time desc')->paginate(15) : $model->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
        // echo $model->getLastSql();
        // var_dump(collection($userlogs)->toArray());exit;
        $this->assign('userlogs',$userlogs);

        return $this->fetch();
    }


   
   

}
