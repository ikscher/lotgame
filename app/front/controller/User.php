<?php
namespace app\front\controller;
// use think\Controller;
use think\Config;
use think\Cookie;
use think\Session;
use think\Db;
// use app\front\model\User as userModel;
use app\front\model\UserLog as userLogModel;
use app\front\model\UserMsg as userMsgModel;
use app\admin\model\CardPwd as cardPwdModel;
use app\front\model\UserExchange as userExchangeModel;
use app\front\model\UserSafepwd as userSafepwdModel;
class User extends Site
{   
	// private $userModel;
    private $userLogModel;
    private $userMsgModel;
    private $cardPwdModel;
    private $userExchangeModel;
    private $userSafepwdModel;
    private $safe_q;
    
	public function _initialize()
    {
        parent::_initialize();
        // $this->userModel = new userModel();
        $this->userLogModel = new userlogModel();
        $this->userExchangeModel = new userExchangeModel();
        $this->userMsgModel = new userMsgModel();
        $this->cardPwdModel= new cardPwdModel();
        $this->userSafepwdModel = new userSafepwdModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        $this->safe_q=Config::get('safe_q');
        // echo Session::get('uid');exit;
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
            $post=$this->request->post();
            if(empty($post['email'])){

                if(empty($post['safe_a'])){
                   return $this->error('请输入密保答案');
                }
            }else{
                if(empty($post['code']) || $post['code']!=Session::get('emailcode')){
                   return $this->error('验证码错误');
                }else{
                   unset($post['code']);
                   $post['is_email']=1;
                }
            }

            unset($post['safe_a']);
            
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
                        Db::startTrans();
                        try{
                            $ret=$this->userModel->where('uid',$this->uid)->setInc('coin',$coin);
                            $data['use_time']=time();
                            $data['status']=4;//已充值
                            $data['user_id']=$this->uid;

                            $ret_=$this->cardPwdModel->where($map)->update($data);
                            // 提交事务
                            Db::commit(); 
                            
                        }catch (\Exception $e) {
                            // 回滚事务
                            Db::rollback();
                        }

                        
                        if($ret==false || $ret_==false){
                           return $this->error('充值失败！');
                        }else{
                           $operation='点卡成功充值';
                           adduserlog($this->uid,$operation);
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
                
                foreach($card_no_arr as $k=>$card_no){
                    $card=null;
                    $card_no=$card_no;  //卡号
                    $card_pwd=$card_pwd_arr[$k]; //卡密
                    
                    $map['card_no']=$card_no;
                    $map['card_pwd']=$card_pwd;
                    // $map['status']=1;//未充值
                    $card=$this->cardPwdModel->where($map)->find();

                    $coin=$card->cate->coin;
                    Db::startTrans();
                    try{
                        $ret=$this->userModel->where('uid',$this->uid)->setInc('coin',$coin);
                        $data['use_time']=time();
                        $data['status']=4;//已充值
                        $data['user_id']=$this->uid;

                        $ret_=$this->cardPwdModel->where($map)->update($data);

                        if($ret==false || $ret_==false){
                           return $this->error('充值失败！');
                        }
                        // 提交事务
                        Db::commit(); 
                        
                    }catch (\Exception $e) {
                        // 回滚事务
                        Db::rollback();
                    }
                }
                
                $operation='点卡成功充值（批量操作）';
                adduserlog($this->uid,$operation);
                return $this->success($operation,'/user/charge');
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
   

    public function point()
    {   
        // $data=array();
        // $map['uid']=$this->uid;
        // $user=$this->userModel->where($map)->find();
        
        if($this->user['points']>20){
            $this->userModel->where($map)->setDec('points',$this->user['points']); //一次砸蛋扣多少积分
            // echo $this->userModel->getLastSql();exit;
            adduserlog('1','砸金蛋');

            $jp = array();
            $jp[] = array( 'gl' => 1 , 'title' => '一等奖');
            $jp[] = array( 'gl' => 2 , 'title' => '二等奖');
            $jp[] = array( 'gl' => 3 , 'title' => '三等奖');
            $jp[] = array( 'gl' => 94 , 'title' => '未中奖');

            $zj = random_hits( $jp );
            
            if(in_array($zj['gl'],array('1','2','3'))) {
                $data['msg']=1;
                $data['prize']="我中奖了";
                echo json_encode($data);exit;
            }else{
                $data['msg']=0;
                $data['prize']="没有中奖";
                echo json_encode($data);exit;
            }



        }else{
            $data['msg']=-2;
            $data['prize']="";
            echo json_encode($data);exit;
        }
       
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

    //

    

}
