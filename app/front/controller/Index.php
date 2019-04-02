<?php
namespace app\front\controller;
// use think\Controller;
use think\Config;
use think\Session;

use app\admin\model\Board as boardModel;
class Index extends Site
{   
	private $boardModel;
	
	public function _initialize()
    {
        parent::_initialize();
        $this->boardModel = new boardModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }
    public function index()
    {   
        $site_name=Config::get('site_name');
    	$boards=$this->boardModel->limit(5)->select();
        
        $uid=Session::get('uid');
        if(!empty($uid)){
            $this->assign('uid',$uid);
        }
    	$this->assign('boards',$boards);
        $this->assign('title',$site_name);

    	return $this->fetch();
    }
}
