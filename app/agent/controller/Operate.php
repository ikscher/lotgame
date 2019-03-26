<?php
namespace app\agent\controller;
use think\Controller;
use think\Config;
use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
class Operate extends Controller
{   
	private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
	public function _initialize()
    {
        $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
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
        return $this->fetch();
    }

    public function detail(){
    	$post = $this->request->param();
    	if(!empty($post['id'])){
    		$article=$this->articleModel->where('id',$post['id'])->find();
    		$this->assign('article',$article);
    	}else{
            return $this->error('id不正确');
    	}
    	$this->assign('title',$this->site_name);
    	return $this->fetch();
    }
}
