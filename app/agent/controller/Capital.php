<?php
namespace app\agent\controller;
// use think\Controller;
use think\Session;
use think\Config;
use think\Db;
// use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
class Capital extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
	public function _initialize()
    {   
        parent::_initialize();
        // $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
    }

    //代理信息
    public function withdraw()
    {   
        $map['id']=$this->agent['id'];
    	$agent=$this->agentModel->where($map)->find();
    	$this->assign('agent',$agent);
    	return $this->fetch();
    }

   
}
