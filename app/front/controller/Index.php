<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\admin\model\Board as boardModel;
class Index extends Controller
{   
	private $boardModel;
	
	public function _initialize()
    {
        $this->boardModel = new boardModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }
    public function index()
    {   
        $site_name=Config::get('site_name');
    	$boards=$this->boardModel->limit(5)->select();

    	$this->assign('boards',$boards);
        $this->assign('title',$site_name);

    	return $this->fetch();
    }
}
