<?php
namespace app\agent\controller;
// use think\Controller;
use think\Session;
use think\Config;
use think\Db;
// use app\admin\model\Agent as agentModel;
use app\agent\model\AgentCate as agentCateModel;
use app\agent\model\AgentLog as agentLogModel;
use app\agent\model\AgentDeposit as agentDepositModel;
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
        $deposit_money=$agent['balance']-$agent['advance']+$agent['stock']*$agent['discount'];//账户额-铺货额+库存*折扣
        $this->assign('deposit_money',$deposit_money);

        if($this->request->isPost()){
            $post=$this->request->post();
            
            $data=array();
            $data['agent_id']=$this->agent['id'];
            $data['money']=$post['money'];
            $this->agentDepositModel->save($data);
            echo json_encode($post);exit;

        }
    	return $this->fetch();
    }

   
}
