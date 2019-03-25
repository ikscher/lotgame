<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\front\model\User as userModel;
class Prize extends Controller
{   
	private $userModel;
	private $site_name;
	public function _initialize()
    {
        $this->userModel = new userModel();
        $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }

    //砸金蛋
    public function shatter()
    {   
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }

    // public function detail(){
    // 	$post = $this->request->param();
    // 	if(!empty($post['id'])){
    // 		$board=$this->boardModel->where('id',$post['id'])->find();
    // 		$this->assign('board',$board);
    // 	}else{
    //         return $this->error('id不正确');
    // 	}
    // 	$this->assign('title',$this->site_name);
    // 	return $this->fetch();
    // }
}
