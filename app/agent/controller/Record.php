<?php
namespace app\agent\controller;
// use think\Controller;
use think\Config;
use think\Session;
// use app\admin\model\Agent as agentModel;
use app\admin\model\AgentCate as agentCateModel;
use app\admin\model\AgentLog as agentLogModel;
class Record extends Site
{   
	// private $agentModel;
    private $agentCateModel;
    private $agentLogModel;
	public function _initialize()
    {   
        parent::_initialize();
        // $this->agentModel = new agentModel();
        $this->agentCateModel = new agentCateModel();
        $this->agentLogModel = new agentLogModel();
        if(empty($this->uid)) { $this->redirect('/common/login');}
    }

    //全部记录
    public function all()
    {   
        $map['agent_id']=$this->agent['id'];
        if($this->request->isPost()){
            $post=$this->request->post();
            $desc=$post['keyword'];
            $map['desc']=array('like',$desc.'%');
        }
    	$logs=$this->agentLogModel->where($map)->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('logs',$logs);
    	return $this->fetch();
    }

    //制卡记录
    public function generate()
    {   
        $map['id']=$this->agent['id'];
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agent',$agent);
        return $this->fetch();
    }

    //售卡记录
    public function sale()
    {   
        $map['id']=$this->agent['id'];
        $agent=$this->agentModel->where($map)->find();
        $this->assign('agent',$agent);
        return $this->fetch();
    }

    //收卡记录
    public function retract()
    {   
        $map['agent_id']=$this->agent['id'];
        $map['type']=2;
        if($this->request->isPost()){
            $post=$this->request->post();
            $desc=$post['keyword'];
            $map['desc']=array('like',$desc.'%');
        }
        $logs=$this->agentLogModel->where($map)->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('logs',$logs);
        return $this->fetch();
    }

    //代充记录
    public function recharge()
    {   
        $map['agent_id']=$this->agent['id'];
        $map['type']=array('in','1,5');
        if($this->request->isPost()){
            $post=$this->request->post();
            $desc=$post['keyword'];
            $map['desc']=array('like',$desc.'%');
        }
        $logs=$this->agentLogModel->where($map)->order('create_time desc')->paginate(10,false,['query'=>$this->request->param()]);
        $this->assign('logs',$logs);
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
