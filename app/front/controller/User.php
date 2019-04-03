<?php
namespace app\front\controller;
// use think\Controller;
use think\Config;
use think\Cookie;
use think\Session;
use app\front\model\User as userModel;
use app\front\model\UserLog as userLogModel;
use app\front\model\UserMsg as userMsgModel;
use app\front\model\UserSafepwd as userSafepwdModel;
class User extends Site
{   
	private $userModel;
    private $userLogModel;
    private $userMsgModel;
    private $userSafepwdModel;
	private $site_name;
    private $safe_q;
    private $uid;
    private $user;
    
	public function _initialize()
    {
        parent::_initialize();
        $this->userModel = new userModel();
        $this->userLogModel = new userlogModel();
        $this->userMsgModel = new userMsgModel();
        $this->userSafepwdModel = new userSafepwdModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        $this->site_name=Config::get('site_name');
        $this->safe_q=Config::get('safe_q');
        $this->assign('title',$this->site_name);
        $this->uid=Session::get('uid');
        // $this->uid=Cookie::get('user_id');
        $this->uid=1;
        $map['uid']=$this->uid;
        $this->user=$this->userModel->where($map)->find();
        $this->assign('user',$this->user);
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
            if(empty($post['code']) || $post['code']!==Cookie::get('emailcode')){
                return $this->error('验证码错误');
            }else{
                unset($post['code']);
                $post['is_email']=1;
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
    public function remark(){

    }

    

}
