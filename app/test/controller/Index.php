<?php
namespace app\test\controller;
use \think\Controller;
use think\Db;
use think\Session;
use app\admin\model\Admin as adminModel;//管理员模型
use app\admin\model\AdminLog;//管理员模型
use app\admin\model\CardPwd as cardPwdModel;
use app\admin\model\Chargeconfig as chargeConfigModel;
use app\front\model\UserExchange as userExchangeModel;
use app\front\model\User as userModel;
use app\admin\model\Agent as agentModel;
use app\front\model\UserMsg as userMsgModel;
use app\front\model\UserLog as userLogModel;
use app\admin\model\Prize as prizeModel;
use app\admin\model\Webconfig as webconfigModel;

class Index extends Controller
{   
    private $cardPwdModel;
    private $userModel;
    private $prizeModel;
    private $userMsgModel;
    private $userLogModel;
    private $agentModel;
    private $uid;
    private $user;
    private $site_name;
    public function _initialize()
    {
        $this->cardPwdModel=new cardPwdModel();
        $this->chargeConfigModel=new chargeConfigModel();
        $this->userExchangeModel=new userExchangeModel();
        $this->userModel= new userModel();
        $this->prizeModel=new prizeModel();
        $this->agentModel=new agentModel();
        $this->userMsgModel=new userMsgModel();
        $this->userLogModel=new userLogModel();
        $this->webconfigModel= new webconfigModel();
        $this->site_name='彩豆网';
       

        $map['uid']=5;
        $this->uid=5;
        $this->user=$this->userModel->where($map)->find();

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
        // echo $desc;

        // echo $admin->admincate->desc;
        
        ////////////////////////////////////////
        //
        //    $admin = new adminModel();
        // $desc=$admin->admincate()->field("desc")->where('id','1')->find();
        // echo $desc;
        //////////////////////////////////////////////

        // $admin = adminModel::hasWhere('log',['admin_menu_id'=>'50'])->find();
        // echo $admin->name;

        //一对一更新
        // $admin = adminModel::get(1);
        // $admin->log->ip = '192.168.1.102';
        // // $admin->log->save();
        // // 或者
        // $admin->log->save(['create_time' => '23234234']);
        //一对一插入
        // $admin = adminModel::get(1);
        // $admin->log()->save(['ip' => '192.168.1.103','create_time'=>'21342143']);
        
        //根据一对一的从表
        // $log = AdminLog::get(3);
        // // 输出User关联模型的属性
        // echo $log->admin->password;

        //一对多
        // $admin = adminModel::get(1);
        // // 获取文章的所有评论
        // $logs=collection($admin->log)->toArray();
        // // var_dump($logs);
        // // 也可以进行条件搜索
        // var_dump(collection($admin->log()->where('id',4)->select())->toArray());

        //模型操作
        // print_r(Db::name('admin_menu')->where('id','>',40)->limit(1)->select());
        // print_r(Db::name('admin_menu')->where('id','>',40)->find());
        // $map['card_no']='d1ruGtx6zv';
        // $map['card_pwd']='U17NIHQB';
        // $card=$this->cardPwdModel->where($map)->find();
        // $card=null;
        // var_dump($card);
        // $card=$this->cardPwdModel->where($map)->find();
        // var_dump($card);
        // echo '<br/>';

        //次数流水手续费
        // $charge_times=0;
        // $charge_t=$this->chargeConfigModel->where('status',1)->select();
        // // var_dump($charge_t);
        // $charge_t_=collection($charge_t)->toArray();
        // foreach($charge_t_ as $v){
        //     var_dump($v);
        // }

        // $map['user_id']=1;
        // $map['status']=array('in',array(1,2));
        // $ids=$this->userExchangeModel->where($map)->count('id'); //兑换过多少次
        // echo $this->userExchangeModel->getLastSql();
        // echo $card->cate->coin; 
        $card_no='d10DI5MID1GC5L91L3K';
        $map['card_no']='d10DI5MID1GC5L91L3K';
        $map['card_pwd']='O4K8MZGV4G9CWGFJ';
        $map['status']=2;//必须为已兑出的卡才能回收
        
        $userexchange=$this->userExchangeModel->where('status',2)->where("instr(`card`,'{$card_no}')>0")->find();
        
        var_dump($userexchange);
        $data=array();
        $data['status']=3;
        $data['user_id']=$userexchange['user_id'];
        $data['use_time']=$userexchange['create_time'];
        $r=$this->cardPwdModel->where($map)->update($data);

        echo $r;
        // $url = \think\Db::name("urlconfig")->where(['status' => 0])->column('aliases,url');
        // var_dump($url);
        return $this->fetch();
    }

    public function charge()
    {
        $result_trans=true;
        Db::startTrans();
        $uid=10;
        // $agent_id=10001;
        $agentname='longfa';
        $agent_id=10001;
        try{
            //用户减少金币和经验
            $map=array();
            $map['user_id']=$uid;
            $map['create_time']=array('egt',time()-300);
            $map['type']='recharge';
            $coins=$this->userLogModel->where($map)->where("instr(`desc`,'{$agent_id}')>0")->value('mp_coin');
            $exp=intval($coins/2);
            $this->userModel->where('uid',$uid)->setDec('coin',$coins*1000);
            $this->userModel->where('uid',$uid)->setDec('experiments',$exp);
 
            //记录用户日志
            $desc=$agentname.'('.$agent_id.')充值撤回';
            $usercoins=$this->userModel->where('uid',$uid)->value('coin');
            adduserlog($uid,$desc,-$coins*1000,-$exp,$usercoins,'revoke');

            $money=9.8;
            //代理账户返还钱
            $this->agentModel->where('id',$agent_id)->setInc('balance',$money);

            //记录代理日志
            $userbalance=$this->agentModel->where('id',$agent_id)->value('balance');
            addagentlog($agent_id,'5',$money,$userbalance,$uid);

            
            //提交事务
            Db::commit(); 
            
        }catch (\Exception $e) {
            $result_trans=false;
            // 回滚事务
            Db::rollback();
            
        }  
        
        if($result_trans==true){
            return $this->success('充值撤回成功，增加余额￥'.$money,'/agent/operate/recharge'); //代理线下直接打给用户扣除2%手续费
        }else{
            return $this->error('充值撤回出错，请联系管理员！'); //可能此卡没有被兑换（不在兑换列表），所以出错
        }
    }

    public function order(){
        $map=array();
        $map['card_cate_id']=10;
        $map['status']=1;
        $num=5;
        $cardpwd=collection($this->cardPwdModel->where($map)->limit($num)->select())->toArray();
        $strcardpwd='';
        $comma='<br/>';
        foreach($cardpwd as $k=>$v){
            $card_pwd[$k]['card_no']=$v['card_no'];
            $card_pwd[$k]['card_pwd']=$v['card_pwd'];
            
            $strcardpwd.=$v['card_no'].'  '.$v['card_pwd'];
            $strcardpwd.=$comma;

            //更改卡密的状态为已兑出（未回收）
            $map=array();
            $map['card_no']=$v['card_no'];
            $map['card_pwd']=$v['card_pwd'];
            // $this->cardPwdModel->where($map)->update(['status'=>2]);
        }

        echo $strcardpwd;
    }

    public function exchange()
    {   
        $card_no='d200HjtCpKzvmYQY7Tc';
        // $map['card_pwd']='AXV854ZMS2FJ7VQK';
        
        $userexchange=$this->userExchangeModel->where('status',2)->where("instr(`card`,'{$card_no}')>0")->find();
                // echo $this->userExchangeModel->getLastSql();
        echo $userexchange['id'];
        // var_dump($userexchange);
    }

    public function prize(){
        $post['prize_id']=4;
        $post['aggregate']=109160;
        $post['num']=1;
        $post['price']=105000;
        
        $prize=$this->prizeModel->where("id=4")->find();
    

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

         $charge_f=$this->webconfigModel->field('flow_days,charge_ratio,flow_times')->find();

       
        //获取用户流水($charge_f['flow_days'])
        $begin_time=strtotime(-$charge_f['flow_days']." day");
        $end_time=strtotime('now');
        $bidmoney=Db::name('user_bid')->where('user_id',$this->uid)->where('create_time','between',[$begin_time,$end_time])->sum('bidmoney');
        
        
        //可以免费兑换的金币
        $freebidmoney = $charge_f['flow_times']!=0?intval($bidmoney/$charge_f['flow_times']):0;
        

        $map=array();
        $map['user_id']=$this->uid;
        $map['status']= array('in',array(1,2));
        //用户7天内已兑换过总价累积
        $aggregate=$this->userExchangeModel->where($map)->where('create_time','between',[$begin_time,$end_time])->sum('aggregate'); 
        $this->assign('aggregate',$aggregate);
        
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

        $prize=$this->prizeModel->where('id',$post['prize_id'])->find();
         // $prize=$this->prizeModel->where('id',$post['prize_id'])->find();
        $card_cate_id=$prize['card_cate_id'];//卡类型ID
  
        //对应的卡密取一条
        $map=array();
        $map['card_cate_id']=$card_cate_id;
        $map['status']=1;
        $cardpwd=$this->cardPwdModel->where($map)->find();
        
        $card_no=$cardpwd['card_no'];
        $card_pwd=$cardpwd['card_pwd'];

        if(empty($cardpwd['id'])){
            return $this->error('没有对应的卡密，请联系代理或网站客服！');
        }
        
        $result_trans=true;
        $msg='';
        $operation='兑换奖品'.$prize['name'];
        Db::startTrans();
     
                try{
                    $ret1=$this->userModel->where('uid',$this->uid)->setDec('coin',$post['aggregate']);
                    
                    $post['status']=$prize['must_check']?1:2;;//直接通过审核2,但是如果设置了此奖品必须审核，那么还是1状态
                    $ret2=$this->userExchangeModel->insert($post);
                    
                    //设置当日兑奖次数
                    $today_exchange_times=Session::get('today_exchange_times')?Session::get('today_exchange_times')+1:1;
                    Session::set('today_exchange_times',$today_exchange_times);
                    // ===================== 以下操作 如果是第一次兑奖 均在后台执行begin 取对应的奖品=========================
                   
                    
                    //发站内信
                    $data=array();
                    $prize_name=$prize['name']; //奖品名称
                    $data['send_uid']=1; //ID=1代表的是管理员（官方后台）
                    $data['user_id']=$this->uid;
                    $data['type']=3;
                    $data['create_time']=time();
                    $data['title']='兑奖发货通知';
                    $data['content']='内容：您兑换的奖品'.$prize_name.'已经发货，谢谢您对我们的支持。<br/>'.$card_no.' '.$card_pwd;
                    $ret3=$this->userMsgModel->insert($data);
                    
                    //发邮件
                    //$ret4=SendMail($this->user['email'],$this->site_name."邮件",'内容：您兑换的奖品'.$prize_name.'已经发货，谢谢您对我们的支持。<br/>'.$card_no.' '.$card_pwd);
                    //==============================end=========================
                   
                    //游戏流水手续费写入日志
                    $originalprice=$post['num']*$post['price']*$this->coefficient;
                    if($originalprice+$aggregate>$freebidmoney){ //正兑换的+已兑换的>免费限额
                         
                         //如果已兑换的大于免费额度
                         $exceed=$aggregate>$freebidmoney?$originalprice:($originalprice+$aggregate-$freebidmoney);
                         $exceed_fee= intval($exceed*$charge_f['charge_ratio']/100);
                         $coin=$this->userModel->where('uid',$this->uid)->value('coin');
                         $ret5=adduserlog($this->uid,'兑奖流水额外手续费',-$exceed_fee,0,$coin-$exceed_fee);
                    }
           

                    //次数流水手续费写入日志
                    $feetype = $charge_times['by'];//按比例还是固定金额收取
                     if($feetype == 1){
                        $curfee = intval($charge_times['charge']);
                        $coin=$this->userModel->where('uid',$this->uid)->value('coin');
                        $ret6=adduserlog($this->uid,'兑奖次数额外手续费',-$curfee,0,$coin-$curfee);
                    }else{
                        $coin=$this->userModel->where('uid',$this->uid)->value('coin');
                        $curfee = intval($charge_times['charge']*$originalprice/100);
                        $ret6=adduserlog($this->uid,'兑奖次数额外手续费',-$curfee,0,$coin-$curfee);
                    }

                    //兑换奖品写入日志
                    $coin=$this->userModel->where('uid',$this->uid)->value('coin');
                    // $prize_name=$this->prizeModel->where("id={$post['prize_id']}")->value('name');
                    
                    $ret7=adduserlog($this->uid,$operation,-$originalprice,0,$coin-$originalprice);

                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                    $msg=$e->getMessage();;/**/
                    
                }
                
                


                if($result_trans){
                    // $operation='您已兑换奖品，请查看邮箱';
                    // return $this->success($operation,'/shop/index');
                    echo '成功';
                }else{
                    // return $this->error('兑换奖品失败！');
                    echo '失败';
                    echo $msg;
                }


        // if($ret1 && $ret2 && $ret3 &&  $ret5 && $ret6 && $ret7){
        //     // $operation='您已兑换奖品，请查看邮箱';
        //     return $this->success($operation,'/shop/index');
        // }else{
        //     return $this->error('兑换奖品失败！');
        // }
        // if(empty($cardpwd['id'])){
        //     var_dump($cardpwd);
        //     // return $this->error('没有对应的卡密，请联系代理或网站客服！');
        // }

        // if(!$ret3){
        //     return $this->error('fff');
        // }else{
        //     return $this->error('dddd');
        // }

        
    }

   
}