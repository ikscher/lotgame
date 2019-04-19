<?php
namespace app\front\controller;
// use think\Controller;
use think\Config;
use think\Cookie;
use think\Session;
use think\Db;
// use app\front\model\User as userModel;
use app\front\model\UserLog as userLogModel;
use app\front\model\UserSignin as userSigninModel;
use app\front\model\UserMsg as userMsgModel;
use app\admin\model\CardPwd as cardPwdModel;
use app\admin\model\Agent as agentModel;
use app\admin\model\Signinconfig as signinConfigModel;
use app\front\model\UserExchange as userExchangeModel;
use app\front\model\UserSafepwd as userSafepwdModel;
use app\front\model\UserRecomyield as userRecomyieldModel;
class User extends Site
{   
	// private $userModel;
    private $userLogModel;
    private $userMsgModel;
    private $userSigninModel;
    private $cardPwdModel;
    private $agentModel;
    private $userExchangeModel;
    private $userSafepwdModel;
    private $signinConfigModel;
    private $userRecomyieldModel;
    private $safe_q;
    
	public function _initialize()
    {
        parent::_initialize();
        // $this->userModel = new userModel();
        $this->userLogModel = new userlogModel();
        $this->userExchangeModel = new userExchangeModel();
        $this->userMsgModel = new userMsgModel();
        $this->cardPwdModel= new cardPwdModel();
        $this->signinConfigModel= new signinConfigModel();
        $this->userSigninModel= new userSigninModel();
        $this->userSafepwdModel = new userSafepwdModel();
        $this->agentModel=new agentModel();
        $this->userRecomyieldModel=new userRecomyieldModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        $this->safe_q=Config::get('safe_q');
        //是否绑定了代理,可以进入代理后台
        $agent_id=$this->agentModel->where('user_id',$this->uid)->value('id');
        $this->assign('agent_id',$agent_id);

        if(empty(Session::get('uid'))) { $this->redirect('/common/login');}

        
    }
    public function index()
    {   

        // $this->uid=Cookie::get('uid');
        // $this->uid=1;
        
        //判断是否绑定了密保卡
        $map['user_id']=$this->uid;
        $id=$this->userSafepwdModel->where($map)->value('id');
        if(!empty($id)){
            $this->assign('isbind',1);
        }
    
        //日志记录
        $map_['user_id']=$this->uid;
        $logs=$this->userLogModel->where($map_)->order('create_time desc')->paginate(8,false,['query'=>$this->request->param()]);
        $this->assign('logs',$logs);
        // var_dump($user);
    	
        

    	return $this->fetch();
    }

    //绑定邮箱
    public function bindemail()
    {   
        if($this->request->isPost()){
            if($this->user['is_email']==1){
                return $this->error('您已通过邮箱验证，如需更改请联系客服！');
            }
            $post=$this->request->post();
            if(empty($post['email'])){
                return $this->error("请输入电子邮箱");
            }else if(empty($post['safe_a'])){
                return $this->error('请输入密保答案');
            }else {
                if(empty($post['code']) || $post['code']!=Session::get('emailcode')){
                   return $this->error('验证码错误');
                }
            }

            unset($post['code']);
            $post['is_email']=1;
            // unset($post['safe_a']);
            
            $map['uid']=$this->uid;
            $ret=$this->userModel->where($map)->update($post);
            if(false==$ret){
                return $this->error('保存资料失败');
            } else {
                $operation='保存资料成功';
                adduserlog($this->uid,$operation);//写入日志

                return $this->success($operation,'/user/index');
            }
            
        }
        $this->assign("safe_q",$this->safe_q);
        return $this->fetch();
    }
    
    //站内信
    public function msg()
    {
        if($this->request->isPost()){
            $post=$this->request->post();
            $id_str=implode(',',$post['idArray']);
            $map['id']=array('in',$id_str);

            if(false==$this->userMsgModel->where($map)->delete()){
                return $this->error('删除失败');
            } else {
                $operation='删除站内信成功';
                adduserlog($this->uid,$operation);//写入日志

                return $this->success($operation,'/user/msg');
            }
            
            // echo json_encode($post['idArray']);exit;
        }
   
        // $map['uid']=$this->uid;
        // $user=$this->userModel->where($map)->find();

        //日志记录
        $map_['user_id']=$this->uid;
        $msgs=$this->userMsgModel->where($map_)->order('create_time desc')->paginate(8,false,['query'=>$this->request->param()]);
        $this->assign('msgs',$msgs);
        // $this->assign('user',$user);
        

        return $this->fetch();
    }


    //兑奖记录
    public function prize()
    {
        if($this->request->isPost()){
            $post=$this->request->post();
            $id_str=implode(',',$post['idArray']);
            $map['id']=array('in',$id_str);

            if(false==$this->userMsgModel->where($map)->delete()){
                return $this->error('删除失败');
            } else {
                $operation='删除站内信成功';
                adduserlog($this->uid,$operation);//写入日志

                return $this->success($operation,'/user/msg');
            }
            
            // echo json_encode($post['idArray']);exit;
        }
   
        // $map['uid']=$this->uid;
        // $user=$this->userModel->where($map)->find();

        //日志记录
        $map_['user_id']=$this->uid;
        $exchanges=$this->userExchangeModel->where($map_)->order('create_time desc')->paginate(8,false,['query'=>$this->request->param()]);
        $this->assign('exchanges',$exchanges);
        // var_dump(collection($exchanges)->toArray());

        return $this->fetch();
    }

    //用户修改
    public function edit()
    {
        if($this->request->isPost()){
            $post=$this->request->post();
            if(isset($post['act']) && $post['act']=='upload'){
                $avatar=$post['avatar'];
                $ret=$this->userModel->where("uid={$this->uid}")->setField('avatar',$avatar);
                if(false==$ret){
                    return $this->error('上传失败');
                } else {
                    $operation='头像上传成功';
                    adduserlog($this->uid,$operation);//写入日志

                    return $this->success($operation,'/user/index');
                }
            }elseif(isset($post['act']) && $post['act']=='update'){
                $post['birth']=strtotime(date($post['byear'].'-'.$post['bmonth'].'-'.$post['bday']));
                unset($post['byear']);
                unset($post['bmonth']);
                unset($post['bday']);
                unset($post['act']);
                // echo json_encode($post);exit;
                $ret=$this->userModel->save($post,['uid'=>$this->uid]);
                // echo $this->userModel->getLastSql();exit;
                if(false==$ret){
                    return $this->error('更新用户资料失败');
                } else {
                    $operation='更新用户资料成功';
                    adduserlog($this->uid,$operation);//写入日志

                    return $this->success($operation,'/user/index');
                }
            }
        }
        return $this->fetch();
    }
    //安全工具
    public function safe()
    {   
        //判断是否绑定了密保卡
        $map['user_id']=$this->uid;
        $id=$this->userSafepwdModel->where($map)->value('id');
        if(!empty($id)){
            $this->assign('isbind',1);
        }
        return $this->fetch();
    }

    //密保卡
    public function safepwd()
    {   
        //生产密保卡
        $data=array();
        $map['user_id']=$this->uid;
        if($this->request->isPost()){
            $act=$this->request->has('act')?$this->request->post('act'):'';
            if($act=='bind'){
               $s=gen_safecode();
               $data['user_id']=$this->uid;
               $data['safe']=$s;
               $data['create_time']=time();
               $this->userSafepwdModel->insert($data); //绑定密保卡
            }elseif ($act=='unbind') {
               $this->userSafepwdModel->where($map)->delete();//解除密保卡
            }
        }   
        //过期时间
        $time=time();
        $access=true;

        $expiretime=$this->userSafepwdModel->where($map)->value('create_time');
        $remain=($time-$expiretime>0)?($time-$expiretime):0;
        if($remain>3600){ //您无法再查看口令卡，如口令卡遗失请联系客服。
            $access=false;
        }
        $this->assign('remain',$remain);
        $this->assign('access',$access);

        //显示密保卡
        $safepwd=$this->userSafepwdModel->where($map)->value('safe');
        
        $this->assign('safepwd',json_decode($safepwd,true));
        return $this->fetch();
    }

    //点卡充值（使用卡密充值）
    public function charge()
    {   
        $map=array();
        $card=array();
        $data=array();
        if($this->request->isPost()){
            $post=$this->request->post();
            if($post['action']=='singular'){ //单个操作
                $card_no=$post['CardNo'];
                $card_pwd=$post['CardPwd'];
                $type=$post['tbMode'];
                $map['card_no']=$card_no;
                $map['card_pwd']=$card_pwd;
                // $map['status']=1;//未充值
                $card=$this->cardPwdModel->where($map)->find();

                
                if($type==1){//charge
                    if($card['status']==1){
                        $coin=$card->cate->coin;
                        $exp=$card->cate->experiment;
                        $result_trans=true;
                        Db::startTrans();
                        try{
                            $this->userModel->where('uid',$this->uid)->setInc('coin',$coin);
                            //充值大于等于200元后获取抽奖一次
                            if($coin>200000){
                                $this->userModel->where('uid',$this->uid)->setField('is_can_draw',1);
                            }
                            $data['use_time']=time();
                            $data['status']=4;//已充值
                            $data['user_id']=$this->uid;

                            $this->cardPwdModel->where($map)->update($data);
                            // 提交事务
                            Db::commit(); 
                            
                        }catch (\Exception $e) {
                            $result_trans=false;
                            // 回滚事务
                            Db::rollback();
                        }

                        
                        if($result_trans==false){
                           return $this->error('充值失败！');
                        }else{
                           $operation='用户点卡自充值'.$coin;
                           $usercoin=$this->userModel->where('uid',$this->uid)->value('coin');
                           //充值增加经验对等金额（元）
                           $this->userModel->where('uid',$this->uid)->setInc('experiments',$exp);
                           //写入日志
                           adduserlog($this->uid,$operation,$coin,$exp,$usercoin,'charge_user');
                           return $this->success($operation,'/user/charge');
                        }
                    }elseif (in_array($card['status'],array(2,3,4))){
                        return $this->error('此卡已经被使用过了！');
                    }else{
                        return $this->error('错误的卡号或密码！');
                    }
                }elseif($type==2){//query
                    if($card['status']==1){
                        return $this->error('此卡可以充值（您查询的卡未被使用过）！');
                    }else{
                        return $this->error('此卡不能充值（此卡已经使用过了）！');
                    }
                }
            }elseif($post['action']=='plural'){ //批量操作
                $card_no_arr=$post['card_no'];
                $card_pwd_arr=$post['card_pwd'];

                foreach($card_no_arr as $k=>$card_no){
                    $card=null;
                    if(empty($card_no) || empty($card_pwd_arr[$k])){ //卡号或者卡密为空的都剔除
                        unset($card_no_arr[$k]);
                    }else{
                        $card_no=$card_no;  //卡号
                        $card_pwd=$card_pwd_arr[$k]; //卡密
                        
                        $map['card_no']=$card_no;
                        $map['card_pwd']=$card_pwd;
                        // $map['status']=1;//未充值
                        $card=$this->cardPwdModel->where($map)->find();
                        
                        if(empty($card['id'])){
                            return $this->error('卡号：'.$card_no.'，卡密：'.$card_pwd.'此卡不存在！请清空输入框再提交');
                        }
                        $card_cate_name=$card->cate->name;
                        
                        
                        if(!strpos($card_cate_name,'贵宾卡')==false || !strpos($card_cate_name,'红包卡')==false){ //贵宾卡，红包卡不能批量充值
                            return $this->error('卡号：'.$card_no.'，卡密：'.$card_pwd.'，贵宾卡或者红包卡不能批量充值！请清空输入框再提交');
                        }
                        if($card['status']!=1 && in_array($card['status'],array(2,3,4))){
                            return $this->error('卡号：'.$card_no.'，卡密：'.$card_pwd.'已经被使用过了！请清空输入框再提交');
                        }elseif(!in_array($card['status'],array(1,2,3,4))){
                            return $this->error('卡号：'.$card_no.'，卡密：'.$card_pwd.'此卡不存在！请清空输入框再提交');
                        }

                    }
                }
                
                $sum_coin=0;
                $sum_exp=0;
                $result_trans=true;
                Db::startTrans();
                try{
                    foreach($card_no_arr as $k=>$card_no){
                        $card=null;
                        $card_no=$card_no;  //卡号
                        $card_pwd=$card_pwd_arr[$k]; //卡密
                        
                        $map['card_no']=$card_no;
                        $map['card_pwd']=$card_pwd;
                        // $map['status']=1;//未充值
                        $card=$this->cardPwdModel->where($map)->find();

                        $coin=$card->cate->coin;
                        $exp=$card->cate->experiment;
                        
                        
                        $ret=$this->userModel->where('uid',$this->uid)->setInc('coin',$coin);
                        $data['use_time']=time();
                        $data['status']=4;//已充值
                        $data['user_id']=$this->uid;

                        $ret_=$this->cardPwdModel->where($map)->update($data);
                         
                      
                        $sum_coin+=$coin;
                        $sum_exp+=$exp;
                    }
                        // 提交事务
                    Db::commit(); 
                        
                }catch (\Exception $e) {
                    $result_trans=false;
                    // 回滚事务
                    Db::rollback();
                }
                
                if($result_trans==false){
                    return $this->error('充值失败！');
                }else{
                    $operation='用户点卡自充值（批量）';
                    $usercoin=$this->userModel->where('uid',$this->uid)->value('coin');
                    //充值增加经验
                    $this->userModel->where('uid',$this->uid)->setInc('experiments',$sum_exp);
                    adduserlog($this->uid,$operation,$sum_coin,$sum_exp,$usercoin,'charge_user');
                    return $this->success($operation,'/user/charge');
                }
            
            }
        }
        return $this->fetch();
    }

    //绑定短信登录
    public function safemsg(){
        $data=array();
        $map['uid']=$this->uid;
        if($this->request->isAjax()){
            $act=$this->request->has('act')?$this->request->post('act'):'';
        
            $login_by_msg=$this->request->post('login_by_msg');
            $login_by_msg=$login_by_msg?1:0;
            if($act=='bind'){
                $ret=$this->userModel->where($map)->update(['login_by_msg' => $login_by_msg]);
                // echo $this->userModel->getLastSql();exit;
                if(false==$ret){
                    return $this->error('短信登录设置失败');
                } else {
                    $operation='短信登录设置成功';
                    adduserlog($this->uid,$operation);//写入日志

                    return $this->success($operation,'/user/safe');
                }
            }
        }
    }
    
    //修改密码
    public function changepwd()
    {   
        $data=array();
        if($this->request->isPost()){
            $post=$this->request->post();
            $action=$post['action'];
            if($action=='validate'){
                $answer=$post['answer'];
                $code=$post['code'];
                $password=$post['password'];

                if(password($password)!=$this->user['password']){//输入了错误的密码
                    $data['code']='EP';
                    echo json_encode($data);exit;
                }


                if($answer!=$this->user['safe_a']){//输入了错误的密保答案
                    $data['code']='EA';
                    echo json_encode($data);exit;
                }

                if($code!=Session::get('changepwd_smscode_t')){//输入了错误的验证码
                    $data['code']='EC';
                    echo json_encode($data);exit;
                }

                $data['code']='RA';
                echo json_encode($data);exit;
            }else if($action=='change'){
                $newpwd=password($post['newpwd']);
                $map['uid']=$this->uid;
                $ret=$this->userModel->where($map)->update(['password'=>$newpwd]);
                if(false==$ret){
                    return $this->error('密码修改失败');
                } else {
                    $operation='密码修改成功';
                    adduserlog($this->uid,$operation);//写入日志

                    return $this->success($operation,'');
                }
            }
        }
        
        

        $q=$this->user['safe_q'];
        if($q){
            $safe_qs=Config::get('safe_q');
            $this->assign('safe_q',$safe_qs[$q]);
        }else{
            $this->assign('safe_q','');
        }
        return $this->fetch();
    }
   

    

    //获取用户的金币和投注信息
    public function ajaxpoint(){
        //对应footer模板 ajax_points页面返回的{"points":"501","xnb":"0","nearBetList":[]}
        $map['uid']=$this->uid;
        $coin=$this->userModel->where($map)->value('coin');

        $data['points']=$coin;
        $data['xnb']=0;
        $data['nearBetList']=array();

        echo json_encode($data);exit;
    }

    //用户奖品评论
    public function remark()
    {

    }
    
    //虚拟银行
    public function bank()
    {   
        if($this->request->isPost()){
            $post=$this->request->post();

            $type=$post['tbAccessType'];
            if($type==1){//存入金币
                
                $coin=$this->userModel->where('uid',$this->uid)->value('coin');
                if($post['coin']>$coin){
                    return $this->error("您的账户余额不足，请存入少于您的账户余额！");
                }

                if($post['answer']!=$this->user['safe_a']){
                    return $this->error('密保答案错误！');
                }
                
                Db::startTrans();
                try{
                    $ret=$this->userModel->where('uid',$this->uid)->setInc('bank',$post['coin']);
                    // echo $this->userModel->getLastSql();exit;
                    $ret_=$this->userModel->where('uid',$this->uid)->setDec('coin',$post['coin']);
                    
                    // 提交事务
                    Db::commit(); 
                    
                }catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($ret && $ret_){
                    $operation='存入金币'.$post['coin'];
                    adduserlog($this->uid,$operation);
                    $this->success($operation,'/user/bank');
                }else{
                    return $this->error('存入失败！');
                }

            }elseif($type==2){//取出金币
               
                $bank=$this->userModel->where('uid',$this->uid)->value('bank');
                if($post['coin']>$bank){
                    return $this->error('您的银行存款数不足，请取出少于您的银行存款！');
                }

                if($post['answer']!=$this->user['safe_a']){
                    return $this->error('密保答案错误！');
                }

                Db::startTrans();
                try{
                    $ret=$this->userModel->where('uid',$this->uid)->setInc('coin',$post['coin']);
                    $ret_=$this->userModel->where('uid',$this->uid)->setDec('bank',$post['coin']);
                    Db::commit();
                    
                }catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                    
                }

                if($ret && $ret_){
                    $operation='取出金币'.$post['coin'];
                    adduserlog($this->uid,$operation);
                    $this->success($operation,'/user/bank');
                }else{
                    return $this->error('取出失败！');
                }

                
            }
        }

        $user=$this->user;
        $this->assign('user',$user);

        $q=$this->user['safe_q'];
        if($q){
            $safe_qs=Config::get('safe_q');
            $this->assign('safe_q',$safe_qs[$q]);
        }else{
            $this->assign('safe_q','');
        }
        return $this->fetch();
    }

    /**
    * 推广下线  会员升级，具体怎么一个升级，达到多少？如何操作呢 
    */
    public function recom()
    {   
        $recomlist=array();
        $recomlist=$this->userModel->where('referee_id',$this->uid)->paginate(5,false,['query'=>$this->request->param()]);
        
        $this->assign('recomlist',$recomlist);
        return $this->fetch();
    }

    /**
    * 推广收益 如何奖励，在哪里奖励呢，投注可以，注册也可以，奖励多少
    */
    public function recomyield()
    {
        $recomyield=array();
        $recomyield=$this->userRecomyieldModel->where('referee_id',$this->uid)->paginate(15,false,['query'=>$this->request->param()]);
        $this->assign('recomyield',$recomyield);
        return $this->fetch();
    }

    /**
    * 用户签到
    */
    public function signin()
    {
        //$BeginDate=date("Y-m-01")当前月份第一天：strtotime($BeginDate)，当前月份最后一天strtotime("$BeginDate +1 month -1 day")+86399)
        $BeginDate=date("Y-m-01");
        $begin=strtotime($BeginDate);
        $end=strtotime("$BeginDate +1 month -1 day")+86399;

        //每个月份签到记录只保留一条，签到记录用json格式
        $signin=$this->userSigninModel->where('user_id',$this->uid)->where('cur_date','between',[$begin,$end])->find();
        
        
        if(!empty($signin['id'])) $signin_day=json_decode($signin['signin_day'],true);

        $cansignin=true;//默认可以签到
        $cur_day=date('j')-1;
        //如果已经签到了
        if (empty($signin_day)) $signin_day=array();
        if(in_array($cur_day,$signin_day)){
            $cansignin=false;
        }

        sort($signin_day,SORT_NUMERIC);//排序
        
        $this->assign('cansignin',$cansignin);
        $this->assign('signin_day',implode(',',$signin_day));//签到日期表

        //读取签到等级配置
        $signingrade=collection($this->signinConfigModel->select())->toArray();
        
        $this->assign('signingrade',$signingrade);

        //连续签到日计算
        $signin_day_r=$signin_day;
        rsort($signin_day_r,SORT_NUMERIC);//逆向排序

        $temp=0;
        $j=0;//初始化连续签到日
      
        foreach($signin_day_r as $k=>$v){
            if($k==0){
                if($cur_day!=$v ){
                    break;
                }else{
                    $j++;
                    $temp=$v;
                }
            }else{
                if($v==$temp-1){
                    $j++;
                    $temp=$v;
                }else{
                    break;
                }
            }
        }
        
        
        $this->assign('j',$j);

        $user_grade_id=$this->user['user_grade_id'];
    
        $usersignin=$this->signinConfigModel->where('user_grade_id',$user_grade_id)->find();
        $reward=$usersignin['base_num']+$this->addnum($j)*1;
        $this->assign('reward',$reward);
       // var_dump(collection($usersignin)->toArray());

        //签到记录
        $map['user_id']=$this->uid;
        $map['type']='signin';
        $signinlist=$this->userLogModel->where($map)->order('create_time desc')->paginate(5,false,['query'=>$this->request->param()]);
        $this->assign('signinlist',$signinlist);
        
        //签到操作
        $data=array();
        $act=$this->request->has('act')?$this->request->get('act'):'';
        if($act=='signin' && $cansignin==true){
             
            $result_trans=true;
            Db::startTrans();
            try{
                   
                array_push($signin_day,$cur_day);
                $sign_day_=json_encode($signin_day);
                $data['signin_day']=$sign_day_;
                $data['cur_date']=time();
                $data['user_id']=$this->uid;
                if($signin['id']){//update
                    $this->userSigninModel->where('user_id',$this->uid)->where('cur_date','between',[$begin,$end])->update($data);
                }else{//insert
                    $this->userSigninModel->where('user_id',$this->uid)->where('cur_date','between',[$begin,$end])->insert($data);
                }

                //写入日志事件
                
                if($j==0) {
                    $j=1;
                }else if($j>7){
                    $j=7;
                }
                

                $coin=$usersignin['base_num']+$j*1;

                $this->userModel->where('uid',$this->uid)->setInc('coin',$coin);
                $usercoin=$this->userModel->where('uid',$this->uid)->value('coin');

                adduserlog($this->uid,'每日签到',$coin,0,$usercoin,'signin');

                Db::commit();
                
            }catch (\Exception $e) {
                // 回滚事务
                $result_trans=false;
                Db::rollback();
                
            }
            $this->redirect('/user/signin');
        }
        
        
        $this->assign('signin',$signin);
        return $this->fetch();
    }
    
    /**
    * 计算一个整数，小于此整数的所有数累加
    */
    private function addnum($i)
    {   
        $sum=0;
        if(is_numeric($i) && $i>0){
            for(;$i>0;$i--){
                $sum+=$i;
            }
        }
        return $sum;
    }

    /**
    * 工资领取
    */
    public function wage()
    {
        return $this->fetch();
    }

    /**
    * 救济领取
    */
    public function relief()
    {   
       
        $rate=$this->user['user_grade_id'];
        $this->assign('rate',$rate); //等级
        $balance=$this->user['coin']+$this->user['bank'];
        $this->assign('balance',$balance); //余额
        
        $reclaim=0;
        switch($rate){
            case '0':
               if($balance<50) $reclaim=50;
               break;
            case '1':
               if($balance<50) $reclaim=60;
               break;
            case '2':
               if($balance<70) $reclaim=70;
               break;
            case '3':
               if($balance<100) $reclaim=100;
               break;
            case '4':
               if($balance<120) $reclaim=120;
               break;
            case '5':
               if($balance<150) $reclaim=150;
               break;
            case '6':
               if($balance<200) $reclaim=200;
               break;
        }
        $this->assign('reclaim',$reclaim);//可领取的救济
        if($this->request->isPost()){
            switch($rate){
                case '0':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<50 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',50);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=50)
                            return $this->error('您的余额超过50，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;
                case '1':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<50 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',60);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=50)
                            return $this->error('您的余额超过50，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;
                case '2':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<70 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',70);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=70)
                            return $this->error('您的余额超过70，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;
                case '3':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<100 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',100);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=100)
                            return $this->error('您的余额超过100，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;
                case '4':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<120 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',120);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=120)
                            return $this->error('您的余额超过120，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;
                case '5':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<150 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',150);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=150)
                            return $this->error('您的余额超过150，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;
                case '6':
                   $uid_relief=Session::get('uid_relief')?Session::get('uid_relief'):0;
                   if($balance<200 && $uid_relief<=10){
                       $this->userModel->where('uid',$this->uid)->setInc('coin',200);
                       $uid_relief++;
                       Session::set('uid_relief',$uid_relief);
                       return $this->success('领取成功','/user/relief');
                   }else{
                       if($balance>=200)
                            return $this->error('您的余额超过200，无法领取！');
                        else
                            return $this->error('您已超过领取次数！');
                   }
                   break;

            }
        }
        return $this->fetch();
    }

    /**
    * 首充返利
    */
    public function bonus()
    {   
        $map['type']=array('in','charge_agent,charge_user');
        $begin_time=strtotime(date("Y-m-d",strtotime("-1 day")));
        $end_time=strtotime(date('Y-m-d'));
        $map['create_time']= array(array('gt',$begin_time),array('lt',$end_time));
        $map['user_id']=$this->uid;
        $map['flag']=0;
        $charge=$this->userLogModel->where($map)->order('create_time asc')->find();
        $this->assign('charge',$charge);
        return $this->fetch();
    }

    /**
    * 亏损返利
    */
    public function reward()
    {
        return $this->fetch();
    }

}
