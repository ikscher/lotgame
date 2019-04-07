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
    private $chargeConfigModel;
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
        $this->chargeConfigModel= new chargeConfigModel();
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

        //兑换奖品的信息
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        // if(empty($id)) return ;
        
        $prize=$this->prizeModel->where("id={$id}")->find();
        $this->assign('prize',$prize);
        $this->assign('id',$id);

        $must_check=$prize['must_check'];
        
        //查看用户有否兑换过奖品 
        $map=array();
        $map['user_id']=$this->uid;
        $map['status']= array('in',array(1,2));
        $ids=$this->userExchangeModel->where($map)->count('id');

        $smscode_show=1;//默认需要短信验证
        if(empty($ids) || $must_check==1){//第一次兑奖需要管理员审核（不考虑第一次兑换多次提交后台还未审核的情况，只要提交即使后台未审核也算作一次）
            $smscode_show=1;
        }else{
            $smscode_show=0;
        }
        $this->assign('smscode_show',$smscode_show);

        $this->assign('coefficient',$this->coefficient);

        //近多少日流水，兑换奖品手续费
        $charge_f=$this->webconfigModel->field('flow_days,charge_ratio,flow_times')->find();
        // echo $this->chargeConfigModel->getLastSql();exit;
        $this->assign('charge_f',$charge_f);
        
        //获取用户流水($charge_f['flow_days'])
        $begin_time=strtotime(-$charge_f['flow_days']." day");
        $end_time=strtotime('now');
        $bidmoney=Db::name('user_bid')->where('user_id',$this->uid)->where('create_time','between',[$begin_time,$end_time])->sum('bidmoney');
        
        $this->assign('bidmoney',$bidmoney);
        //可以免费兑换的金币
        $freebidmoney = $charge_f['flow_times']!=0?intval($bidmoney/$charge_f['flow_times']):0;
        
        //查看用户有否兑换过奖品 
        $map=array();
        $map['user_id']=$this->uid;
        $map['status']= array('in',array(1,2));
        //用户7天内已兑换过总价累积
        $aggregate=$this->userExchangeModel->where($map)->where('create_time','between',[$begin_time,$end_time])->sum('aggregate'); 
        
        
        //次数流水手续费
        $charge_times=array('by'=>0,'charge'=>0,'id'=>0);
        $charge_t=$this->chargeConfigModel->where('status',1)->select();
        $charge_t_=collection($charge_t)->toArray();
        $today_exchange_times=Session::get('today_exchange_times')?Session::get('today_exchange_times'):1;
        foreach($charge_t_ as $v){
           if($v['lower']<=$today_exchange_times && $v['upper']>=$today_exchange_times){ //判断兑换奖品次数所在的区间
               $charge_times['by']=$v['by'];
               $charge_times['charge']=$v['charge'];
               $charge_times['id']=$v['id'];
               break;
           }
        }
        $this->assign('charge_times',$charge_times);
        $this->assign('today_exchange_times',$today_exchange_times);


    	//兑换产品生成订单
        if($this->request->isPost()){
        	$post= $this->request->post();
        	if(empty($post['prize_id'])){
        		return $this->error('错误的ID');
        	}

            if($this->user['safe_a']!=$post['safe_a']){
                return $this->error('密保答案不正确！');
            }

            if(Session::get("order_smscode_t")!=$post['code']){
                return $this->error('验证码错误！');
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
            
            if(empty($ids)){//第一次兑奖需要管理员审核，既然设置了$must_check==0，那么就不需要短信验证，反之必须

                Db::startTrans();
                try{
                    $ret=$this->userModel->where('uid',$this->uid)->setDec('coin',$post['aggregate']);
                    $ret_=$this->userExchangeModel->insert($post);

                    //游戏流水手续费写入日志
                    $originalprice=$post['num']*$prize['price']*$this->coefficient;
                    if($originalprice+$aggregate>$freebidmoney){ //正兑换的+已兑换的>免费限额
                         $exceed=$aggregate>$freebidmoney?$post['num']*$prize['price']:($post['num']*$prize['price']+$aggregate-$freebidmoney);
                         $exceed_fee= intval($exceed*$charge_f['charge_ratio']/100);

                         adduserlog($this->uid,'兑奖流水额外手续费',-$exceed_fee);
                    }


                    //次数流水手续费写入日志
                    $feetype = $charge_times['by'];//按比例还是固定金额收取
                     if($feetype == 1){
                        $curfee = intval($charge_times['charge']);
                        
                        adduserlog($this->uid,'兑奖次数额外手续费',-$curfee);
                    }else{
                        $curfee = intval($charge_times['charge']*$originalprice/100);
                        adduserlog($this->uid,'兑奖次数额外手续费',-$curfee);
                    }
                    
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($ret && $ret_){
                    //设置当日兑奖次数
                    $today_exchage_times=Session::get('today_exchange_times')?Session::get('today_exchange_times')+1:1;
                    Session::set('today_exchange_times',$today_exchange_times);
                    // $prize_name=$this->prizeModel->where('id',$post['prize_id'])->value('name')
                    $operation='兑换奖品'.$prize['name'];
                    adduserlog($this->uid,$operation);
                    return $this->success($operation,'/shop/index');
                }else{
                    return $this->error('兑换奖品失败！');
                }
            }else{//不是第一次兑奖（以前兑换过奖品）
                Db::startTrans();
                try{
                    $ret=$this->userModel->where('uid',$this->uid)->setDec('coin',$post['aggregate']);
                    $post['status']=$must_check?1:2;;//直接通过审核2,但是如果设置了此奖品必须审核，那么还是1状态
                    $ret_=$this->userExchangeModel->insert($post);
                    
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($ret && $ret_){
                    //设置当日兑奖次数
                    $today_exchage_times=Session::get('today_exchange_times')?Session::get('today_exchange_times')+1:1;
                    Session::set('today_exchange_times',$today_exchange_times);
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
                    return $this->success($operation,'/shop/index');
                }else{
                    return $this->error('兑换奖品失败！');
                }
                
            } 

            
        }
        
        
        
        

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
