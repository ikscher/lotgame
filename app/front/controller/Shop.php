<?php
namespace app\front\controller;

use think\Controller;
use think\Config;
use think\Cookie;
use app\front\model\User as userModel;
use app\front\model\UserGrade as usergradeModel;
use app\front\model\UserRemark as userremarkModel;
use app\admin\model\Prize as prizeModel;
use app\admin\model\PrizeCate as prizeCateModel;
use app\admin\model\Chargeconfig as chargeConfigModel; //兑奖手续费次数默认关闭
use app\admin\model\Webconfig as webconfigModel;
use app\front\model\UserExchange as userExchangeModel;

class Shop extends Controller
{   
    private $site_name;
    private $userModel;
    private $usergradeModel;
    private $userremarkModel;
    private $userExchangeModel;
    private $prizeModel;
    private $prizeCateModel;
    private $webconfigModel;
    private $coefficient; //系数
    private static $data=array();
    private $uid;

    public function _initialize()
    {
        $this->userModel = new userModel();
        $this->usergradeModel = new usergradeModel();
        $this->userremarkModel = new userremarkModel();
        $this->prizeModel = new prizeModel();
        $this->prizeCateModel = new prizeCateModel();
        $this->webconfigModel = new webconfigModel();
        $this->userExchangeModel = new userExchangeModel();
        $this->coefficient=1000;
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);
        
        $this->uid=Cookie::get('user_id');
        $this->uid=1;
        $user=$this->userModel->where("uid={$this->uid}")->find();
        if($user['user_grade_id']==1){
        	$this->coefficient=1.05*1000;
        }
    }

    public function index()
    {   

        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
    	if(!empty($id)){
    	    $catename=$this->prizeCateModel->field('name')->where("id={$id}")->find();
            $this->assign('catename',$catename->name);
            $prizes=$this->prizeModel->where("prize_cate_id={$id}")->paginate(9,false,['query'=>$this->request->param()]);
            // var_dump($prizes);exit;
            $this->assign('prizes',$prizes);
    	}else{
            $this->assign('catename','所有产品');
            $prizes=$this->prizeModel->paginate(9);
            $this->assign('prizes',$prizes);
        }
        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);

        $cates=$this->getCateList(0);
        $this->assign('cates',$cates);
        
    	return $this->fetch();
    }
    
    //详情
    public function detail()
    {   
    	//对应的奖品
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $this->assign('id',$id);
        if(!empty($id)){
            $prize=$this->prizeModel->where("id={$id}")->find();
            $this->assign('prize',$prize);
        }

        
        $this->assign('coefficient',$this->coefficient);
        $this->assign('c1',1.05*1000);
        $this->assign('c2',1000);
        
        //用户等级
        $grade=$this->usergradeModel->order('grade asc')->select();
        $this->assign('grade',$grade);

        $this->site_name=Config::get('site_name');
        $this->assign('title',$this->site_name);

        //用户评论
        $remarks=$this->userremarkModel->where('is_show=1')->order('create_time desc')->paginate(5,false,['query'=>$this->request->param()]);
        $this->assign('remarks',$remarks);
        
        //左侧类别列表
        $cates=$this->getCateList(0);
        $this->assign('cates',$cates);
        
        return $this->fetch();
    }
    
    //确认订单
    public function order()
    {   
    	//兑换产品生成订单
        if($this->request->isPost()){
        	$post= $this->request->post();
        	if(empty($post['prize_id'])){
        		$this->error('错误的ID');
        	}
        	
            $post['user_id']=$this->uid;

            //判断用户的金币数量是否足够兑换奖品
            $coin=$this->userModel->where("uid=$this->uid")->value('coin');
            if($coin<$post['aggregate']){
                return $this->error('您的金币数不足，请充值');
            }
            // $post['aggregate']=$post['aggregate'];
            // echo json_encode($post);exit;
            $post['create_time']=time();
            if(false == $this->userExchangeModel->insert($post)) {
            	return $this->error('添加失败');
            } else {
                $operation='您已经成功兑换奖品，请等待';
                adduserlog($this->uid,$operation);//写入日志

            	return $this->success($operation,'/shop/index');
            }
        }
        
        //兑换奖品开始下单页面
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
    	if(!empty($id)){
            $prize=$this->prizeModel->where("id={$id}")->find();
            $this->assign('prize',$prize);
            $this->assign('id',$id);
        }
        
        $this->assign('coefficient',$this->coefficient);
        //兑换奖品手续费
        $charge=$this->webconfigModel->field('flow_days,charge_ratio,flow_times')->find();
        // echo $this->chargeConfigModel->getLastSql();exit;
        $this->assign('charge',$charge);

        //实际付款//可免额外手续费兑奖0金币,本次兑奖105,000金币,超出部分：105,000按2%收取手续费：2,100金币
        // $extrafreemoney=0;
        // $payment_=$prize['price']*$this->coefficient;
        // $payment=$payment_+($payment_ - $extrafreemoney)*$charge/100;
        // $this->assign('payment',$payment);
        //左侧类别列表
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
