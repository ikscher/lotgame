<?php
namespace app\agent\controller;
// use think\Controller;
use think\Config;
use think\Session;
use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
use app\admin\model\CardCate as cardcateModel;

class Other extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
    private $cardcateModel;
	public function _initialize()
    {   
        parent::_initialize();
        // $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        $this->cardcateModel = new CardCateModel();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
    }

    //代理信息
    public function info()
    {   
    	$this->assign('agent',$this->agent);
    	return $this->fetch();
    }

    //业务统计
    public function bussiness()
    {   
        $agent_id=$this->agent['id'];
        $agent=$this->agentModel->where('id',$agent_id)->find();
        $this->assign('agent',$agent);
        
        if($this->request->isPost()){
            $post=$this->request->post();
            $begin_time=$post['begin_time'];
            $end_time=$post['end_time'];
        }
        $lists=$this->agentLogModel->field('sum(charge_money) as cmoney ,sum(reclaim_money) as rmoney ,type,create_date')->where('agent_id',$agent_id)->group('create_date')->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        


        $this->assign('lists',$lists);
        return $this->fetch();
    }

    //排行榜
    public function rank()
    {   
        $map['id']=10000;
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agetn',$agent);
        return $this->fetch();
    }

    //资金互转
    public function transfer()
    {   
        $map['id']=10000;
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agetn',$agent);
        return $this->fetch();
    }

    //库存管理（全部）
    public function allstock()
    {   
        $cates_= $this->cardcateModel->select();
        $cates=collection($cates_)->toArray();
        $this->assign('cates',$cates);
        return $this->fetch();
    }

    //库存管理（未售）
    public function unsalestock()
    {   
        $cates_= $this->cardcateModel->select();
        $cates=collection($cates_)->toArray();
        $this->assign('cates',$cates);
        return $this->fetch();
    }

    //代充撤回
    public function cancel()
    {   
        
        return $this->fetch();
    }

    
}
