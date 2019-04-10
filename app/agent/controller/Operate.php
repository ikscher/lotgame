<?php
namespace app\agent\controller;
// use think\Controller;
use think\Config;
use think\Session;
use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
use app\admin\model\CardCate as cardcateModel;

class Operate extends Site
{   
	private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
    private $cardcateModel;
	public function _initialize()
    {
        parent::_initialize();
        $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        $this->cardcateModel = new cardcateModel();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
    }

    
    //卡密收回
    public function retract()
    {
        
        return $this->fetch();
    }

    //金币代充
    public function recharge()
    {
        return $this->fetch();
    }

    //金币代充
    public function gencard()
    {   
        $cates_= $this->cardcateModel->select();
        $cates=collection($cates_)->toArray();
        $this->assign('cates',$cates);
        return $this->fetch();
    }

}
