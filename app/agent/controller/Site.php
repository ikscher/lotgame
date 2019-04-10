<?php
namespace app\agent\controller;
use think\Controller;
use think\Config;
use think\Session;
use think\Cookie;
use app\front\model\User as userModel;
use app\admin\model\Agent as agentModel;

class Site extends Controller
{   
    protected $site_name;
    protected $userModel;
    protected $agentModel;
    protected $agent;

    public function _initialize()
    {   
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);

        $this->userModel = new userModel();//登录注册都需拿userModel来判断
        $this->agentModel= new agentModel();
    	$this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    	$this->user=array();
	    if(null!==Cookie::get('auth')) {  
	        $arr = explode("\t", ThkAuthCode(Cookie::get('auth'), 'DECODE'));
	        // if (!session_id()) session_start();
	        if (null!==$arr[1]){
	            list($uid, $password) = $arr;      
	            //判断此用户是否绑定了代理，没有则跳出     
                $this->agent=$this->agentModel->where('user_id',$uid)->find();
                if(empty($this->agent['id'])){
                	// return $this->error('unknown error');
                	$this->redirect('/user/index');
                }
	            

	        }
	    }else{
	    	return $this->error('fatal error');
	    }
    	// return $this->fetch();
    }
}
