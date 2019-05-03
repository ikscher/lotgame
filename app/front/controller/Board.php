<?php
namespace app\front\controller;
// use think\Controller;
use think\Config;
use think\Session;
use app\admin\model\Board as boardModel;
class Board extends Site
{   
	// private $boardModel;
	// private $site_name;
	public function _initialize()
    {   
        parent::_initialize();
        // $this->boardModel = new boardModel();
        // $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        if(empty($this->uid)) { $this->redirect('/common/login');}
    }
    public function index()
    {   
    	$boards=$this->boardModel->order('create_time desc')->paginate(10);
    	$this->assign('boards',$boards);
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }

    public function detail(){
    	$post = $this->request->param();
    	if(!empty($post['id'])){
    		$board=$this->boardModel->where('id',$post['id'])->find();
    		$this->assign('board',$board);
    	}else{
            return $this->error('id不正确');
    	}
    	$this->assign('title',$this->site_name);
    	return $this->fetch();
    }
}
