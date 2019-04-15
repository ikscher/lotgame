<?php
namespace app\agent\controller;
// use think\Controller;
use think\Session;
use think\Config;
use think\Db;
// use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
use app\admin\model\AgentDeposit as agentDepositModel;
class Capital extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
    private $agentDepositModel;
	public function _initialize()
    {   
        parent::_initialize();
        // $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        $this->agentDepositModel = new agentDepositModel();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
    }

    //代理信息
    public function withdraw()
    {   
        $map['id']=$this->agent['id'];
    	$agent=$this->agentModel->where($map)->find();
    	$this->assign('agent',$agent);

        //可提现金额
        $deposit_money=$agent['balance']-$agent['advance']+$agent['stock']*$agent['discount'];
        $this->assign('deposit_money',$deposit_money);

        if($this->request->isPost()){
            $post=$this->request->post();

        }
    	return $this->fetch();
    }

   
}
