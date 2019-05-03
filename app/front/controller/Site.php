<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Session;
use think\Cookie;
use app\front\model\User as userModel;
use app\admin\model\Board as boardModel;

class Site extends Controller
{   
    protected  $site_name;
    protected  $userModel;
    protected  $user;
    protected  $boardModel;
    protected  $uid;

    /**
	*  获取登录用户的uid保存到session
	*/public function _initialize()
    {   
    	$this->userModel = new userModel();//登录注册都需拿userModel来判断
    	$this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    	$this->uid=0;
    	$this->user=array();
	    if(null!==Cookie::get('auth')) {  
	        $arr = explode("\t", ThkAuthCode(Cookie::get('auth'), 'DECODE'));
	        // if (!session_id()) session_start();
	        if (null!==$arr[1]){
	            list($uid, $password) = $arr;           
                
                //安全起见，用UID,PASSWORD判断是否存在数据库？？？

	            //Session::set('uid',$uid);

	            $map['uid']=$uid;
	            
	            $this->uid=$uid;
		        $this->user=$this->userModel->where($map)->find();
		        
	        }
	    }
	    $this->assign('user',$this->user);
	    $this->assign('uid',$this->uid);
        
   
	    //加载头部滚动（公告）
	    $boardlist=array();
	    $this->boardModel = new boardModel();
        $boardlist=$this->boardModel->where('status',1)->select();
        $this->assign('boardlist',$boardlist);
	}

    public function index()
    {   
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }
}
