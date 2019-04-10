<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------


namespace app\front\controller;

use \think\Cache;
// use \think\Controller;
use think\Loader;
use think\Db;
use think\Config;
use \think\Cookie;
use \think\Session;
// use app\front\model\User as userModel;

class Common extends Site
{   
    private $geetest;
    // private $userModel;
    // private $site_name;
    // protected $uid;
    //初始化
    public function _initialize()
    {   
        parent::_initialize();
        $this->geetest=Config::get('geetest');
        // $this->userModel=new userModel();
        $controller=$this->request->controller();
        $this->assign('controller',$controller);
        // $this->site_name=Config::get('site_name');
        // $this->assign('title',$this->site_name);

    }


    /**
     * 会员登录
     * @return [type] [description]
     */
    public function login()
    {
        if(!empty(Session::get('uid'))) { $this->redirect('/user/index');}

        if(Session::has('uid') == false) { 

            if($this->request->isPost()) {
                //是登录操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                // $validate = new \think\Validate([
                //     ['name', 'require|alphaDash', '用户名不能为空|用户名格式只能是字母、数字、——或_'],
                //     ['password', 'require', '密码不能为空'],
                //     ['captcha','require|captcha','验证码不能为空|验证码不正确'],
                // ]);
                // //验证部分数据合法性
                // if (!$validate->check($post)) {
                //     $this->error('提交失败：' . $validate->getError());
                // }
                $logintype=$post['logintype'];
                if($logintype==1){ //账号密码登录
                    //判断是否只支持短信登录
                    $username=$post['tbUserAccount'];
                    $user = $this->userModel->where("email='$username'")->whereor("mobile='$username'")->find();
                }elseif($logintype==2){
                    $mobile=$post['mobile'];
                    $user = $this->userModel->where("mobile='$mobile'")->find();
                }
                
                if(empty($user['username'])) {
                    //不存在该用户名
                    return $this->error('用户名不存在');
                } else {
                    
                    if($logintype==1){ //账号密码登录
                        $password = password($post['tbUserPwd']);
                        if($user['password'] != $password) {
                            return $this->error('密码错误');
                        } else {
                            //判断是否只支持短信登录
                            $username=$post['tbUserAccount'];
                            
                            $login_by_msg=$this->userModel->where("email='$username'")->whereor("mobile='$username'")->value('login_by_msg');
                            // $this->error($this->userModel->getLastSql());
                            if($login_by_msg==1){
                                $this->error("对不起,您的账户仅支持短信登录,请使用短信快捷登录");
                            }

                            Cookie::set('auth',ThkAuthCode("$user[uid]\t$user[password]",'ENCODE'),86400*7);

                            //记录登录时间和ip
                            $this->userModel->where('uid',$user['uid'])->update(['login_ip'=> $this->request->ip(),'login_time' => time()]);
                            //记录操作日志
                            $coin=$this->userModel->where('uid',$user['uid'])->value('coin');
                            // $this->userModel->where('uid',$user['uid'])->setInc('experiments',5);
                            adduserlog($user['uid'],'登录',0,0,$coin);
                            return $this->success('登录成功,正在跳转...','/user/index');
                        }
                    }elseif($logintype==2){ //短信验证登录
                        if(!empty($post['code']) && $post['code']==Session::get('login_smscode_t')){
                            Cookie::set('auth',ThkAuthCode("$user[uid]\t$user[password]",'ENCODE'),86400*7);
                            $this->userModel->where('uid',$user['uid'])->update(['login_ip'=> $this->request->ip(),'login_time' => time()]);
                            //记录操作日志
                            $coin=$this->userModel->where('uid',$user['uid'])->value('coin');
                            // $this->userModel->where('uid',$user['uid'])->setInc('experiments',5);
                            adduserlog($user['uid'],'登录',0,0,$coin);
                            return $this->success('登录成功,正在跳转...','/user/index');
                        }else{
                            return $this->error('验证码错误');
                        }
                    }
                }
            } else {

                if(Cookie::has('usermember')) {
                    $this->assign('usermember',Cookie::get('usermember'));
                }
                return $this->fetch();
            }
        } else {
            $this->redirect('/common/login');
        }   
    }
    
    /**
     * 会员注册
     * @return [type] [description]
     */
    public function register()
    {   
        if(!empty(Session::get('uid'))) { $this->redirect('/user/index');}

        if(Session::has('uid') == false) { 

            if($this->request->isPost()) {
                //注册操作
                $post = $this->request->post();
                
                //判断验证码是否正确
                $code=$post['tbSafeCode'];
                if(empty($code) || $code!=Session::get('register_smscode_t')){
                    $this->error("验证码错误");
                }
                // $data=array();
                
                if(Session::get('referee_id')>0) $this->userModel->referee_id=Session::get('referee_id');
                $this->userModel->mobile=$post['mobile'];
                $this->userModel->username=$post['tbUserNick'];
                $this->userModel->password= password($post['tbUserPwd']);
                $this->userModel->is_mobile=1;
                $this->userModel->login_ip=$this->request->ip();
                $this->userModel->login_time=time();
                $ret=$this->userModel->save();

                if($ret==false){
                    $this->error("出错了");
                }else{
                    $uid=$this->userModel->uid;
                    $password=$this->userModel->password;
                    Cookie::set('auth',ThkAuthCode("$uid\t$password",'ENCODE'),86400*7);
                    // $this->userModel->where('uid',$uid)->update(['login_ip'=> $this->request->ip(),'login_time' => time()]);
                    //记录操作日志
                    adduserlog($uid,'注册');
                    $this->success("注册成功",'/user/index');
                }
            }
        }
        return $this->fetch();
    }

    /**
    *  只是作为一个跳转
    */
    public function recom()
    {
        $userid=$this->request->param('userid');
        if($userid>0) Session::set('referee_id',$userid);
        $this->redirect('/common/register');
    }

    /**
     * 会员退出，清除session
     * @return [type] [description]
     */
    public function logout()
    {
        Session::delete('uid');
        // Session::clear();//会清除后台的session
        Cookie::delete('auth');
        if(Session::has('uid')) {
            return $this->error('退出失败');
        } else {
            //return $this->success('正在退出...','/common/login');
            $this->redirect('/common/login');
        }
    }

    /**
     * 图片上传方法
     * @return [type] [description]
     */
    public function upload($module='front',$use='user_thumb')
    {
        if($this->request->file('file')){
            $file = $this->request->file('file');
        }else{
            $res['code']=1;
            $res['msg']='没有上传文件';
            return json($res);
        }
        $module = $this->request->has('module') ? $this->request->param('module') : $module;//模块
        $web_config = Db::name('webconfig')->where('id','101')->find();
        $info = $file->validate(['size'=>$web_config['file_size']*1024,'ext'=>$web_config['file_type']])->rule('date')->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . $module . DS . $use);
        if($info) {
            //写入到附件表
            $data = [];
            $data['module'] = $module;
            $data['filename'] = $info->getFilename();//文件名
            $data['filepath'] = DS . 'uploads' . DS . $module . DS . $use . DS . $info->getSaveName();//文件路径
            $data['fileext'] = $info->getExtension();//文件后缀
            $data['filesize'] = $info->getSize();//文件大小
            $data['create_time'] = time();//时间
            $data['uploadip'] = $this->request->ip();//IP
            $data['user_id'] = Cookie::has('user_id') ? Cookie::get('user_id') : 0;
            // if($data['module'] = 'admin') {
            //     //通过后台上传的文件直接审核通过
            //     $data['status'] = 1;
            //     $data['admin_id'] = $data['user_id'];
            //     $data['audit_time'] = time();
            // }
            $data['use'] = $this->request->has('use') ? $this->request->param('use') : $use;//用处
            $res['id'] = Db::name('attachment')->insertGetId($data);
            $res['src'] = DS . 'uploads' . DS . $module . DS . $use . DS . $info->getSaveName();
            $res['code'] = 2;
            adduserlog($res['id'],'图片上传');//记录日志
            return json($res);
        } else {
            // 上传失败获取错误信息
            return $this->error('上传失败：'.$file->getError());
        }
    }

    /***
    *  极速验证API1
    */
    public function gtvalidate()
    {   
        $gtcfg=$this->geetest;

        $GtSdk = new \geetest\lib\GeetestLib($gtcfg['captcha_id'], $gtcfg['private_key']);

        $data = array(
                "user_id" => "test", # 网站用户id
                "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
                "ip_address" => "127.0.0.1" # 请在此处传输用户请求验证时所携带的IP
            );

        $status = $GtSdk->pre_process($data, 1);
        Session::set('gtserver',$status);
        Session::set('user_id', $data['user_id']);
        echo $GtSdk->get_response_str();
    }
    /**
    * 发送短信
    */
    public function sendmsg()
    {
        //判断是否邮箱已经存在
        if($this->request->isPost()){
            $post=$this->request->post();

            //引用geetest验证API2 (暂时保留)
            // $gtcfg=$this->geetest;
            // $GtSdk = new \geetest\lib\GeetestLib($gtcfg['captcha_id'], $gtcfg['private_key']);

            // $data = array(
            //         "user_id" => Session::get('user_id'), # 网站用户id
            //         "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            //         "ip_address" => "127.0.0.1" # 请在此处传输用户请求验证时所携带的IP
            //     );


            // if (Session::get('gtserver') == 1) {   //服务器正常
            //     $result = $GtSdk->success_validate($post['geetest_challenge'], $post['geetest_validate'], $post['geetest_seccode'], $data);
            //     if ($result) {
            //         // echo '{"status":"success"}';
            //     } else{
            //         // echo '{"status":"fail"}';
            //         echo 2;exit;
            //     }
            // }else{  //服务器宕机,走failback模式
            //     if ($GtSdk->fail_validate($post['geetest_challenge'],$post['geetest_validate'],$post['geetest_seccode'])) {
            //         // echo '{"status":"success"}';
            //     }else{
            //         // echo '{"status":"fail"}';
            //         echo 2;exit;
            //     }
            // }
            $action=$post['action'];//login登录验证，changepwd修改密码验证，register注册
            
            switch($action){
                case 'login'://判断用户是否存在，不存在则不能登录
                    $mobile=$post['mobile'];
                    $map['mobile']=$mobile;
                    $uid=$this->userModel->where($map)->value('uid');
                    if(empty($uid)){
                        $data['code']=-3;
                        echo json_encode($data);exit;
                    }
                    break;
                case 'changepwd': //更改密码，获取手机号
                    $uid=Session::get('uid');
                    $map['uid']=$uid;
                    $mobile=$this->userModel->where($map)->value('mobile');
                    break;
                case 'register'://判断手机号是否已经注册，如果已注册则退出

                    $mobile=$post['mobile'];
                    $map['mobile']=$mobile;
                    $uid=$this->userModel->where($map)->value('uid');
                    if(!empty($uid)){
                        $data['code']=-3;
                        echo json_encode($data);exit;
                    }
                    break;
                case 'order':
                    $uid=Session::get('uid');
                    $map['uid']=$uid;
                    $mobile=$this->userModel->where($map)->value('mobile');
                    break;
            }
          

           //判断不能频繁点击
            // $t1=time();
            // $t0=Session::get('smscode_t');

            
            // if(!empty($t0)){
            //     if($t1-$t0<60){
            //         $data['code']=-1;
            //         echo json_encode($data);exit;
            //     }
            // }
            

            $str = '1234567890';
            $smscode_t=$str[rand(0,9)].$str[rand(0,9)].$str[rand(0,9)].$str[rand(0,9)];
            // Cookie::set('smscode_t',$smscode_t);

            // if(sendmessage($mobile,$smscode_t)){
            if(true){
                if($action=='login'){
                    Session::set('login_smscode_t',$smscode_t);
                    // Cookie::set('login_smscode_t',$smscode_t);
                }elseif($action=='changepwd'){
                    Session::set('changepwd_smscode_t',$smscode_t);
                    // Cookie::set('changepwd_smscode_t',$smscode_t);
                }elseif($action=='register'){
                    Session::set('register_smscode_t',$smscode_t);
                    Cookie::set('register_smscode_t',$smscode_t);
                }elseif($action=='order') {
                    Session::set('order_smscode_t',$smscode_t);
                    Cookie::set('order_smscode_t',$smscode_t);
                }
                $data['code']=1;
                echo json_encode($data);exit;
            }else{
                $data['code']=-1;
                echo json_encode($data);exit;
            }
        }
    }

    /**
    * 暂时作废的发送邮件
    */
    public function sendmail__()
    {   
        
        //判断是否邮箱已经存在
        if($this->request->isPost()){
            $post=$this->request->post();

            //引用geetest验证API2（暂收保留）
            // $gtcfg=$this->geetest;
            // $GtSdk = new \geetest\lib\GeetestLib($gtcfg['captcha_id'], $gtcfg['private_key']);

            // $data = array(
            //         "user_id" => Session::get('user_id'), # 网站用户id
            //         "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            //         "ip_address" => "127.0.0.1" # 请在此处传输用户请求验证时所携带的IP
            //     );


            // if (Session::get('gtserver') == 1) {   //服务器正常
            //     $result = $GtSdk->success_validate($post['geetest_challenge'], $post['geetest_validate'], $post['geetest_seccode'], $data);
            //     if ($result) {
            //         // echo '{"status":"success"}';
            //     } else{
            //         // echo '{"status":"fail"}';
            //         echo 2;exit;
            //     }
            // }else{  //服务器宕机,走failback模式
            //     if ($GtSdk->fail_validate($post['geetest_challenge'],$post['geetest_validate'],$post['geetest_seccode'])) {
            //         // echo '{"status":"success"}';
            //     }else{
            //         // echo '{"status":"fail"}';
            //         echo 2;exit;
            //     }
            // }

           $email=$post['email'];
           $map['email']=$email;
           $uid=$this->userModel->where($map)->value('uid');
           if(!empty($uid)){
               $data['code']=-3;
               echo json_encode($data);exit;
           }

        }

        //判断不能频繁点击
        $t1=time();
        $t0=Session::get('sendmail_t');

        // if(empty($t0)){
        //     Session::set('sendmail_t',time());
        // } else{
        if($t1-$t0<60){
            $data['code']=-1;
            echo json_encode($data);exit;
        }
        // }
        

        $str = '1234567890abcdefghijklmnopqrstuvwxyz';
        $emailcode=$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)];
        Cookie::set('emailcode',$emailcode);exit;
        // Session::set('emailcode',$emailcode)
        $smtp_host='';
        $smtp_user="";
        $smtp_password="";
        $smtp_port="";


        $mail = new \phpmailer\Phpmailer(); //实例化
        $mail->IsSMTP(); // 启用SMTP
        $mail->Host = $smtp_host; //SMTP服务器 以163邮箱为例子
        $mail->SMTPSecure = 'ssl';
        $mail->Port = $smtp_port;  //邮件发送端口
        $mail->SMTPAuth   = true;  //启用SMTP认证
        $mail->CharSet  = "UTF-8"; //字符集
        $mail->Encoding = "base64"; //编码方式
        $mail->Username = $smtp_user;  //你的邮箱
        $mail->Password = $smtp_password;  //你的密码
        $mail->Subject = '注册验证码'; //邮件标题
        $mail->From = $smtp_user;  //发件人地址（也就是你的邮箱）
        $mail->FromName = "www";  //发件人姓名
        // $mail->SMTPDebug = 2;
        // $mail->SMTPOptions = array(
        //     'ssl' => array(
        //         'verify_peer' => false,
        //         'verify_peer_name' => false,
        //         'allow_self_signed' => true
        //     )
        // );

        $user_email=$email;

        $address = $user_email;//收件人email
        $mail->AddAddress($address, "亲");//添加收件人（地址，昵称）

        //$mail->AddAttachment('xx.xls','我的附件.xls'); // 添加附件,并指定名称
        $mail->IsHTML(true); //支持html格式内容
        //$mail->AddEmbeddedImage("logo.jpg", "my-attach", "logo.jpg"); //设置邮件中的图片
        $mail->Body = '您的注册验证码:'.$emailcode; //邮件主体内容
        
        //发送
        if($mail->Send()){
            if(empty($t0)){
                Session::set('sendmail_t',time());
            } 
            $data['code']=1;
            echo json_encode($data);exit;
            
        }else{
            $data['code']=0;
            echo json_encode($data);exit;
        }
    }

    /**
    * @发送邮件
    */
    public function sendmail()
    {   
        
        //判断是否邮箱已经存在
        if($this->request->isPost()){
            $post=$this->request->post();

            //引用geetest验证API2（暂收保留）
            // $gtcfg=$this->geetest;
            // $GtSdk = new \geetest\lib\GeetestLib($gtcfg['captcha_id'], $gtcfg['private_key']);

            // $data = array(
            //         "user_id" => Session::get('user_id'), # 网站用户id
            //         "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            //         "ip_address" => "127.0.0.1" # 请在此处传输用户请求验证时所携带的IP
            //     );


            // if (Session::get('gtserver') == 1) {   //服务器正常
            //     $result = $GtSdk->success_validate($post['geetest_challenge'], $post['geetest_validate'], $post['geetest_seccode'], $data);
            //     if ($result) {
            //         // echo '{"status":"success"}';
            //     } else{
            //         // echo '{"status":"fail"}';
            //         echo 2;exit;
            //     }
            // }else{  //服务器宕机,走failback模式
            //     if ($GtSdk->fail_validate($post['geetest_challenge'],$post['geetest_validate'],$post['geetest_seccode'])) {
            //         // echo '{"status":"success"}';
            //     }else{
            //         // echo '{"status":"fail"}';
            //         echo 2;exit;
            //     }
            // }

           
            $email=$post['email'];


            
            $map['email']=$email;
            $uid=$this->userModel->where($map)->value('uid');
            if(!empty($uid)){
               $data['code']=-3;
               echo json_encode($data);exit;
            }

            //判断不能频繁点击
            $t1=time();
            $t0=Session::get('sendmail_t');

            // if(empty($t0)){
            //     Session::set('sendmail_t',time());
            // } else{
            if($t1-$t0<60){
                $data['code']=-1;
                echo json_encode($data);exit;
            }

            $address = $email;
            $str = '1234567890abcdefghijklmnopqrstuvwxyz';
            $emailcode=$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)];
            

            $mailto = SendMail($address,$this->site_name."绑定邮箱","您的验证码：".$emailcode);

            if($mailto){
                if(empty($t0)){
                  Session::set('sendmail_t',time());
                } 
                Session::set('emailcode',$emailcode);
                $data['code']=1;
                echo json_encode($data);exit;
                
            }else{
                $data['code']=0;
                echo json_encode($data);exit;
            }
        }
    }
    
}
