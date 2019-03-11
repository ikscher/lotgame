<?php
namespace app\test\controller;
use \think\Controller;
use app\admin\model\Admin as adminModel;//管理员模型
use app\admin\model\AdminLog;//管理员模型

class Index extends Controller
{
    public function index()
    {
    	// ///////////////////////////////////////////
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

        $admin_ =adminModel::get(1);
		


		// $log->together('admin_')->save();
		$admin_->log()->save(['admin_menu_id'=>60]);

    	return $this->fetch();
    }
}