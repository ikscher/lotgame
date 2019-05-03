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
        if(empty($this->uid)) { $this->redirect('/common/login');}
    }

    //代理信息
    public function withdraw()
    {   
        $agent_id=$this->agent['id'];
        $map['id']=$agent_id;
    	$agent=$this->agentModel->where($map)->find();
    	$this->assign('agent',$agent);
        
        //提现记录列表
        $lists=$this->agentDepositModel->where('agent_id',$agent_id)->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('lists',$lists);


        //可提现金额
        $deposit_money=$agent['balance']-$agent['advance']+$agent['stock']*$agent['discount'];//账户额-铺货额+库存*折扣
        $this->assign('deposit_money',$deposit_money);

        if($this->request->isPost()){
            $post=$this->request->post();
            
            $data=array();
            $data['agent_id']=$agent_id;
            $data['money']=$post['money'];
            $result_trans=true;
            Db::startTrans();
            try{
                //记入提现记录
                $this->agentDepositModel->save($data);
                //代理账户减少金额
                $this->agentModel->where('id',$agent_id)->setDec('balance',$post['money']);
                //写入代理日志
                //(1)先获取代理余额
                $balance=$this->agentModel->where('id',$agent_id)->value('balance');
                //(2)写入
                addagentlog($agent_id,'6',-$post['money'],$balance,"提现");
 
                //提交事务
                Db::commit(); 
                    
            }catch (\Exception $e) {
                $result_trans=false;
                // 回滚事务
                Db::rollback();
            }

            if($result_trans==true){
                return $this->success('申请提现成功,请等待管理员打款！','/agent/capital/withdraw'); //代理线下直接打给用户扣除2%手续费
            }else{
                return $this->error('提现出现错误！'); 
            }
        }
    	return $this->fetch();
    }
   
    //提现撤销
    public function cancel()
    { 
       if($this->request->isPost()){
            $post=$this->request->post();
            $id=$post['id'];
            $deposits=$this->agentDepositModel->where('id',$id)->find();
            $agent_id=$deposits['agent_id'];
            $money=$deposits['money'];
            $result_trans=true;
            Db::startTrans();
            try{
                //更改提现记录状态
                $this->agentDepositModel->where('id',$id)->setField('status',3);
                //代理账户增加金额
                $this->agentModel->where('id',$agent_id)->setInc('balance',$money);
                //写入代理日志
                //(1)先获取代理余额
                $balance=$this->agentModel->where('id',$agent_id)->value('balance');
                //(2)写入
                addagentlog($agent_id,'7',$money,$balance,"提现取消");
 
                //提交事务
                Db::commit(); 
                    
            }catch (\Exception $e) {
                $result_trans=false;
                // 回滚事务
                Db::rollback();
            }

            if($result_trans==true){
                return $this->success('已取消提现！','/agent/capital/withdraw'); //代理线下直接打给用户扣除2%手续费
            }else{
                return $this->error('取消提现错误！'); 
            }
        }
    }

   
}
