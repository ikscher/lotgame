<?php
namespace app\test\controller;
use \think\Controller;
use app\admin\model\Admin as adminModel;//管理员模型
use app\admin\model\AdminLog;//管理员模型

class Index extends Controller
{
    public function index()
    {
    	// echo 'fffff';
    	// $admin = adminModel::get(1);
    	// $desc=$admin->admincate()->field("desc")->find();
    	// echo $admin->nickname;

    	// echo $desc;

    	// echo $admin->admincate->desc;
        
        ////////////////////////////////////////
        //
     //    $admin = new adminModel();
    	// $desc=$admin->admincate()->field("desc")->where('id','1')->find();
    	// echo $desc;
        //////////////////////////////////////////////

  //       $admin_ = new adminModel;
		// $admin_->id = '3';
		// $admin_->update_time='1517622948';

		$log = new AdminLog;
		$log->admin_menu_id = '60';
		$log->ip = '192.168.1.107';
		// $log->create_time=time();
		$log->save();

    	return $this->fetch();
    }
}