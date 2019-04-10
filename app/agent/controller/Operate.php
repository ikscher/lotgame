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

class Operate extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
    private $cardcateModel;
    private $cardPwdModel;
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
        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}
    }

    
    //卡密收回第一步
    public function retract()
    {
        if($this->request->isPost()){
            $post=$this->request->post();
            $this->__set('card_no',$post['card_no']);
            $this->__set('card_pwd',$post['card_pwd']);
            
            $map=array();
            $map['card_no']=$this->card_no;
            $map['card_pwd']=$this->card_pwd;
            $map['status']=2;//必须为已兑出的卡才能回收
            
            $cardpwd=$this->cardPwdModel->where($map)->find();

            if(empty($cardpwd['id'])){
                return $this->error('此卡还未兑出，或者不存在！');
            }
            
            return $this->success('正在跳转...','/agent/operate/retracty');

        }

        return $this->fetch();
    }
    
    //卡密回收第二步
    public function retracty()
    {   

        $map=array();
        $map['card_no']=$this->__get('card_no');
        $map['card_pwd']=$this->__get('card_pwd');
        $map['status']=2;//必须为已兑出的卡才能回收
        var_dump($map);
        $cardpwd=$this->cardPwdModel->where($map)->find();
  
        var_dump($cardpwd);
        // $result_trans=true;
        // Db::startTrans();
        // try{
        //     //更改状态为已回收3
        //     $this->cardPwdModel->where($map)->setField('status',3);
            
        //     //代理账户增加金额元
        //     // 提交事务
        //     Db::commit(); 
                
        // }catch (\Exception $e) {
        //     $result_trans=false;
        //     // 回滚事务
        //     Db::rollback();
            
            
        // }
        return $this->fetch();
    }

    public function __set($k,$v)
    {
        $this->$k=$v;
    }

    public function __get($k)
    {   
        if(isset($k)){
            return $this->$k;
        }else{
            return null;
        }
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
