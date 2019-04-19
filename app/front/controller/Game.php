<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use app\admin\model\Article as articleModel;
class Game extends Site
{   
	private $articleModel;
	// private $site_name;
	public function _initialize()
    {   
        parent::_initialize();
        $this->articleModel = new articleModel();
        // $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }
    
    //排行榜
    public function rank()
    {
        return $this->fetch();
    }
}