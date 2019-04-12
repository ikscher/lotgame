<?php
namespace app\agent\controller;
// use think\Controller;
use think\Config;
use think\Session;
use think\Db;
// use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
use app\admin\model\CardCate as cardcateModel;
use app\admin\model\CardPwd as cardPwdModel;
use app\front\model\UserExchange as userExchangeModel;
class Operate extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
    private $cardcateModel;
    private $cardPwdModel;
    private $userExchangeModel;
    private $card_no;
    private $card_pwd;
	public function _initialize()
    {
        parent::_initialize();
        // $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        $this->cardcateModel = new cardcateModel();
        $this->cardPwdModel = new cardPwdModel();
        $this->userExchangeModel=new userExchangeModel();
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
    }

    
    //卡密收回第一步
    public function retract()
    {
        if($this->request->isPost()){
            $post=$this->request->post();
            Session::set('reclaim_card_no',$post['card_no']);
            Session::set('reclaim_card_pwd',$post['card_pwd']);
            
            $map=array();
            $map['card_no']=$post['card_no'];
            $card_no=$post['card_no'];
            $map['card_pwd']=$post['card_pwd'];
            $map['status']=2;//必须为已兑出的卡才能回收
            
            $cardpwd=$this->cardPwdModel->where($map)->find();

            if(empty($cardpwd['id'])){
                return $this->error('此卡不能回收，请确认！');
            }

            $userexchange=$this->userExchangeModel->where('status',2)->where("instr(`card`,'{$card_no}')>0")->find();
            if(empty($userexchange['id'])){
                return $this->error("此卡可能未兑出，不能回收，请确认！");
            }
            
            return $this->success('正在跳转...','/agent/operate/retracty');

        }

        return $this->fetch();
    }
    
    //卡密回收第二步
    public function retracty()
    {   
        

        $map=array();
        $card_no=Session::get('reclaim_card_no');
        $card_pwd=Session::get('reclaim_card_pwd');
        $map['card_no']=$card_no;
        $map['card_pwd']=$card_pwd;
        $map['status']=2;//必须为已兑出的卡才能回收
        
        $userexchange=$this->userExchangeModel->where('status',2)->where("instr(`card`,'{$card_no}')>0")->find();
        if(empty($userexchange['id'])){
            return $this->error("此卡可能未兑出，不能回收，请确认！");
        }
        if($this->request->isPost()){
            $status=$this->cardPwdModel->where('card_no',$card_no)->where('card_pwd',$card_pwd)->value('status');
            if($status==3){
                return $this->error('此卡已经被回收过了！');
            }

            $result_trans=true;
            Db::startTrans();
            try{
                //更改状态为已回收3
                $data=array();
                $data['status']=3;
                $data['user_id']=$userexchange['user_id'];
                $data['use_time']=$userexchange['create_time'];
                $this->cardPwdModel->where($map)->update($data);
                
                //代理账户增加金额元
                $agent_id=$this->agent['id'];
                // $mp_money=$userexchange['price']*$userexchange['num'];
                $mp_money=$userexchange['price'];//单张回收卡密，所以就是数量1
                //先获取代理余额
                $balance=$this->agentModel->where('id',$agent_id)->value('balance');
                //更新代理余额
                $this->agentModel->where('id',$agent_id)->setField('balance',$balance+$mp_money);
                
                //写入代理日志
                
                addagentlog($agent_id,'2',$mp_money,$balance+$mp_money,"{$card_no}|{$userexchange['user_id']}");
                // 提交事务
                Db::commit(); 
                    
            }catch (\Exception $e) {
                $result_trans=false;
                // 回滚事务
                Db::rollback();
            }

            if($result_trans==true){
                return $this->success('收卡成功，您需支付给会员'.$mp_money*0.98,'/agent/operate/retract'); //代理线下直接打给用户扣除2%手续费
            }else{
                return $this->error('收卡出错，请联系管理员！'); //可能此卡没有被兑换（不在兑换列表），所以出错
            }
        }
        

        $cardpwd=$this->cardPwdModel->where($map)->find();
        
        $enabled=true;
        if(empty($cardpwd['id'])) $enabled=false;
        $this->assign('cardpwd',$cardpwd);
        $this->assign('enabled',$enabled);

        

        $this->assign('userexchange',$userexchange);
        
       
        
        return $this->fetch();
    }


    //金币代充
    public function recharge()
    {   
        if($this->request->isPost()){
            $post=$this->request->post();
            $uid=$post['uid'];
            $coins=$post['coins']; //这里是 元，不是金币单位

            $result_trans=true;
            Db::startTrans();
            try{
                //用户增加金币和经验
                $exp=intval($coins/2);
                $this->userModel->where('uid',$uid)->setInc('coin',$coins*1000);
                $this->userModel->where('uid',$uid)->setInc('experiments',$exp);

                //记录用户日志
                $desc=$this->agent['name'].'('.$this->agent['id'].')代充';
                $usercoins=$this->userModel->where('uid',$uid)->value('coin');
                adduserlog($uid,$desc,$coins*1000,$exp,$usercoins,'代理代充');

                //代理代充折扣
                $discount=$this->agent['discount'];
                $dmoney=$coins*$discount;

                //代理账户扣钱
                $this->agentModel->where('id',$this->agent['id'])->setDec('balance',$dmoney);
                
                //记录代理日志
                $userbalance=$this->agentModel->where('id',$this->agent['id'])->value('balance');
                addagentlog($this->agent['id'],'1',$dmoney,$userbalance,$uid);

                
                //提交事务
                Db::commit(); 
                
            }catch (\Exception $e) {
                $result_trans=false;
                // 回滚事务
                Db::rollback();
                
            }  
            
            if($result_trans==true){
                return $this->success('代充成功，扣除余额￥'.$dmoney,'/agent/operate/recharge'); //代理线下直接打给用户扣除2%手续费
            }else{
                return $this->error('代充出错，请联系管理员！'); //可能此卡没有被兑换（不在兑换列表），所以出错
            }

        }
        return $this->fetch();
    }

    //制卡
    public function gencard()
    {   
        $cates_= $this->cardcateModel->select();
        $cates=collection($cates_)->toArray();
        $this->assign('cates',$cates);
        return $this->fetch();
    }
    
    //查询用户是否存在
    public function queryuser(){
        $data=array();
        if($this->request->isPost()){
            $post=$this->request->post();
            $uid=$post['uid'];
            $user=$this->userModel->where('uid',$uid)->find();
            if(empty($user['uid'])){
                return $this->error("此用户不存在！");
            }else{
                $data['code']=1;
                $data['username']=$user['username'];
                $data['balance']=$user['coin'];
                $data['bank']=$user['bank'];
                $data['user_grade_id']=$user['user_grade_id'];
                echo json_encode($data);exit;
            }
        }
    }

}
