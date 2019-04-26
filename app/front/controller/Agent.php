<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Session;
use app\agent\model\Agent as agentModel;
class Agent extends Site
{   
	private $agentModel;
	// private $site_name;
	public function _initialize()
    {   
        parent::_initialize();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
        $this->agentModel = new agentModel();
        // $this->site_name=Config::get('site_name');
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
    }

    public function index()
    {
        $agents=$this->agentModel->select();
        $this->assign('agents',$agents);
        // $this->assign('title',$this->site_name);
        return $this->fetch();
    }

}
