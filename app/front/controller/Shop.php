<?php
namespace app\front\controller;

use think\Controller;
use think\Config;
use think\Cookie;
use think\Session;
use think\Db;
// use app\front\model\User as userModel;
use app\front\model\UserGrade as userGradeModel;
use app\front\model\UserRemark as userRemarkModel;
use app\front\model\UserMsg as userMsgModel;
use app\admin\model\Prize as prizeModel;
use app\admin\model\CardPwd as cardPwdModel;
use app\admin\model\PrizeCate as prizeCateModel;
use app\admin\model\Chargeconfig as chargeConfigModel; //兑奖手续费次数默认关闭
use app\admin\model\Webconfig as webconfigModel;
use app\front\model\UserExchange as userExchangeModel;

class Shop extends Site
{   
    // private $site_name;
    // private $userModel;
    private $userGradeModel;
    private $userRemarkModel;
    private $userExchangeModel;
    private $userMsgModel;
    private $prizeModel;
    private $cardPwdModel;
    private $prizeCateModel;
    private $webconfigModel;
    private $coefficient; //系数
    private static $data=array();
    // private $uid;

    public function _initialize()
    {
        // $this->userModel = new userModel();
        parent::_initialize();
        $this->userGradeModel = new userGradeModel();
        $this->userRemarkModel = new userRemarkModel();
        $this->prizeModel = new prizeModel();
        $this->userMsgModel = new userMsgModel();
        $this->cardPwdModel = new cardPwdModel();
        $this->prizeCateModel = new prizeCateModel();
        $this->webconfigModel = new webconfigModel();
        $this->userExchangeModel = new userExchangeModel();
        $this->coefficient=1000;
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        // $this->site_name=Config::get('site_name');
        // $this->assign('title',$this->site_name);
           
        
        $user_grade_id=$this->userModel->where('uid',$this->uid)->value('user_grade_id');
        if(empty($user_grade_id)){
        	$this->coefficient=1.05*1000;
        }
        $this->assign('coefficient',$this->coefficient);
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

        
        $this->assign('c1',1.05*1000);//级别为0的用户另加5%
        $this->assign('c2',1000); //其他级别保持不变
        
        //用户等级
        $grade=$this->userGradeModel->order('grade asc')->select();
        $this->assign('grade',$grade);

        // $this->site_name=Config::get('site_name');
        // $this->assign('title',$this->site_name);

        //用户评论
        $remarks=$this->userRemarkModel->where('is_show=1')->order('create_time desc')->paginate(5,false,['query'=>$this->request->param()]);
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

            if($this->user['safe_a']!=$post['safe_a']){
                $this->error('密保答案不正确！');
            }

            if(Session::get("order_smscode_t")!=$post['code']){
                $this->error('验证码错误！');
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
            
            //判断是否第一次兑奖
            $ids=$this->userExchangeModel->where('uid',$this->uid)->count('id');
            if(empty($ids)){//第一次兑奖需要管理员审核
                Db::startTrans();
                try{
                    $ret=$this->userModel->where('uid',$this->uid)->setDec('coin',$post['aggregate']);
                    $ret_=$this->userExchangeModel->insert($post);
                    
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($ret && $ret_){
                    // $prize_name=$this->prizeModel->where('id',$post['prize_id'])->value('name')
                    $operation='您首次兑换奖品，请等待管理员审核';
                    adduserlog($this->uid,$operation);
                    $this->success($operation,'/shop/index');
                }else{
                    return $this->error('兑换奖品失败！');
                }
            }else{//不是第一次兑奖
                Db::startTrans();
                try{
                    $ret=$this->userModel->where('uid',$this->uid)->setDec('coin',$post['aggregate']);
                    $post['status']=1;//直接通过审核
                    $ret_=$this->userExchangeModel->insert($post);
                    
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($ret && $ret_){
                    //取对应的奖品
                    $prize=$this->prizeModel->where('id',$post['prize_id'])->find();
                    $card_cate_id=$prize['card_cate_id'];//卡类型ID
                    
                    //对应的卡密取一条
                    $map=array();
                    $map['card_cate_id']=$card_cate_id;
                    $map['status']=1;
                    $cardpwd=$this->cardPwdModel->where($map)->find();
                    $card_no=$cardpwd['card_no'];
                    $card_pwd=$cardpwd['card_pwd'];
                    
                    //发站内信
                    $prize_name=$prize['name']; //奖品名称
                    $this->userMsgModel->send_uid=1; //ID=1代表的是管理员（官方后台）
                    $this->userMsgModel->user_id=$this->uid;
                    $this->userMsgModel->type=3;
                    $this->userMsgModel->title='兑奖发货通知';
                    $this->userMsgModel->content='内容：您兑换的奖品'.$prize_name.'已经发货，谢谢您对我们的支持。<br/>'.$card_no.' '.$card_pwd;
                    $this->userMsgModel->save();
                    //发邮件

                    SendMail($this->user['email'],$this->site_name."邮件",'内容：您兑换的奖品'.$prize_name.'已经发货，谢谢您对我们的支持。<br/>'.$card_no.' '.$card_pwd);
                    
                    $operation='您已兑换奖品，请查看邮箱';
                    adduserlog($this->uid,$operation);
                    $this->success($operation,'/shop/index');
                }else{
                    return $this->error('兑换奖品失败！');
                }
                
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


        $q=$this->user['safe_q'];
        if($q){
            $safe_qs=Config::get('safe_q');
            $this->assign('safe_q',$safe_qs[$q]);
        }else{
            $this->assign('safe_q','');
        }

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
