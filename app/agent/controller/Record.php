<?php
namespace app\agent\controller;
use think\Controller;
use think\Config;
use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
class Record extends Controller
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

    //全部记录
    public function all()
    {   
        $map['id']=10000;
    	$agent=$this->agentModel->where($map)->find();
    	$this->assign('agetn',$agent);
    	return $this->fetch();
    }

    //制卡记录
    public function generate()
    {   
        $map['id']=10000;
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agetn',$agent);
        return $this->fetch();
    }

    //售卡记录
    public function sale()
    {   
        $map['id']=10000;
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agetn',$agent);
        return $this->fetch();
    }

    //收卡记录
    public function retract()
    {   
        $map['id']=10000;
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agetn',$agent);
        return $this->fetch();
    }

    //代充记录
    public function recharge()
    {   
        $map['id']=10000;
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agetn',$agent);
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
