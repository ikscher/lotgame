<?php
namespace app\front\controller;
use think\Controller;
use think\Config;
use think\Session;
use think\Cookie;

class Site extends Controller
{   
    private $site_name;

    /**
	*  获取登录用户的uid保存到session
	*/public function _initialize()
    {
	    if(null!==Cookie::get('auth')) {  
	        $arr = explode("\t", ThkAuthCode(Cookie::get('auth'), 'DECODE'));
	        // if (!session_id()) session_start();
	        if (null!==$arr[1]){
	            list($uid, $password) = $arr;           
                
	            Session::set('uid',$uid);
	        }
	    }
	}

    public function index()
    {   
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }
}
