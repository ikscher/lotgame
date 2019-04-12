<?php
namespace app\agent\controller;
// use think\Controller;
use think\Config;
use think\Session;
use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
use app\admin\model\CardCate as cardcateModel;
use app\front\model\UserLog as userLogModel;

class Other extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
    private $cardcateModel;
    private $userLogModel;
	public function _initialize()
    {   
        parent::_initialize();
        // $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        $this->cardcateModel = new CardCateModel();
        $this->userLogModel= new userLogModel();
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
        
        $map['agent_id']=$agent_id;
        if($this->request->isPost()){
            $post=$this->request->post();
            $begin_time=$post['begin_time'];
            $end_time=$post['end_time'];

            $this->assign('begin_time',$begin_time);
            $this->assign('end_time',$end_time);

          
            if ($begin_time && $end_time) $map['create_date']  = array('between',"{$begin_time},{$end_time}");

        }
        $lists=$this->agentLogModel->field('sum(charge_money) as cmoney ,sum(reclaim_money) as rmoney ,type,create_date')->where($map)->group('create_date')->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        
       

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
        $data=array();
        if($this->request->isPost()){
            $post=$this->request->post();
            $uid=$post['uid'];
            $agent_id=$this->agent['id'];
            $map=array();
            $map['agent_id']=$agent_id;
            $map['desc']=$uid;
            $map['create_time']=array('egt',time()-300);
            $ag=$this->agentLogModel->where($map)->find();
            $money=$ag['charge_money'];
            if(empty($ag['id'])){
                return $this->error("此用户没有要撤回的充值记录！");
            }else{
                $result_trans=true;
                Db::startTrans();
                try{
                    //用户减少金币和经验
                    $map=array();
                    $map['user_id']=$uid;
                    $map['create_time']=array('egt',time()-300);
                    $map['type']='recharge';
                    $coins=$this->userLogModel->where($map)->where("instr(`desc`,'{$agent_id}')>0")->value('mp_coin');
                    $exp=intval($coins/2);
                    $this->userModel->where('uid',$uid)->setDec('coin',$coins*1000);
                    $this->userModel->where('uid',$uid)->setDec('experiments',$exp);

                    //记录用户日志
                    $desc=$this->agent['name'].'('.$this->agent['id'].')充值撤回';
                    $usercoins=$this->userModel->where('uid',$uid)->value('coin');
                    adduserlog($uid,$desc,-$coins*1000,-$exp,$usercoins,'revoke');

                

                    //代理账户返还钱
                    $this->agentModel->where('id',$this->agent['id'])->setInc('balance',$money);
                    
                    //记录代理日志
                    $userbalance=$this->agentModel->where('id',$this->agent['id'])->value('balance');
                    addagentlog($this->agent['id'],'5',$money,$userbalance,$uid);

                    
                    //提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                    
                }  
                
                if($result_trans==true){
                    return $this->success('代充成功，扣除余额￥'.$money,'/agent/operate/recharge'); //代理线下直接打给用户扣除2%手续费
                }else{
                    return $this->error('代充出错，请联系管理员！'); //可能此卡没有被兑换（不在兑换列表），所以出错
                }

            }
        }
        return $this->fetch();
    }


    //查询用户是否存在
    public function queryuser(){
        $data=array();
        if($this->request->isPost()){
            $post=$this->request->post();
            $uid=$post['uid'];
            $agent_id=$this->agent['id'];
            $map['agent_id']=$agent_id;
            $map['desc']=$uid;
            $map['create_time']=array('egt',time()-300);
            $ag=$this->agentLogModel->where($map)->find();
            if(empty($ag['id'])){
                return $this->error("此用户没有要撤回的充值记录！");
            }else{
                $data['code']=1;
                $data['uid']=$ag['desc'];
                $data['money']=abs($ag['charge_money']);
                $data['time']=$ag['create_time'];
                $data['revoke']=abs($ag['charge_money']);
                echo json_encode($data);exit;
            }
        }
    }

    
}
