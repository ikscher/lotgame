<?php
namespace app\front\controller;
use think\Controller;
use think\Config;

class Site extends Controller
{   
    private $site_name;
 
    public function index()
    {   
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    	return $this->fetch();
    }
}
