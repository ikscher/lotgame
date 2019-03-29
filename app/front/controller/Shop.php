<?php
namespace app\front\controller;

use think\Controller;
use think\Config;
use app\front\model\User as userModel;
use app\admin\model\Prize as prizeModel;
use app\admin\model\PrizeCate as prizeCateModel;

class Shop extends Controller
{   
    private $site_name;
    private $userModel;
    private $prizeModel;
    private $prizeCateModel;
    private static $data=array();

    public function _initialize()
    {
        $this->userModel = new userModel();
        $this->prizeModel = new prizeModel();
        $this->prizeCateModel = new prizeCateModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
    }

    public function index()
    {   

        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        var_dump($this->request->get());
    	if(!empty($id)){
    		
           // $prize=$this->prizeModel->where("prize_cate_id={$id}")->select();
           // $this->assign('prize',$prize);
           // var_dump($prize);
    	}
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);

        $cates=$this->getCateList(0);
        $this->assign('cates',$cates);
        
    	return $this->fetch();
    }

    public function getCateList($pid=0)
    {
    	$cate=$this->prizeCateModel->field('id,name,pid')->where("pid={$pid}")->select();
        $cate_=collection($cate)->toArray();
        
        foreach($cate_ as $k=>$v){
            
        	if ($pid==0) self::$data[$v['id']]=$v;
        	if ($pid!=0) {

        		self::$data[$pid]['child'][$v['id']]=$v;
            }
     
            $this->getCateList($v['id']);

        }
        return self::$data;
    }
}