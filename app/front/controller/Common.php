<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +----------------------------------------------------------------------


namespace app\front\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use think\Config;
use \think\Cookie;
use \think\Session;
use app\front\model\User as userModel;

class Common extends Controller
{   
    private $geetest;
    private $userModel;
    //初始化
    public function _initialize()
    {
        $this->geetest=Config::get('geetest');
        $this->userModel=new userModel();
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
    *  极速验证
    */
    public function gtvalidate()
    {   
        $gtcfg=$this->geetest;

        $GtSdk = new \geetest\lib\GeetestLib($gtcfg['captcha_id'], $gtcfg['private_key']);
        session_start();

        $data = array(
                "user_id" => "test", # 网站用户id
                "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
                "ip_address" => "127.0.0.1" # 请在此处传输用户请求验证时所携带的IP
            );

        $status = $GtSdk->pre_process($data, 1);
        $_SESSION['gtserver'] = $status;
        $_SESSION['user_id'] = $data['user_id'];
        echo $GtSdk->get_response_str();
    }

    /**
    * 发送邮件
    */
    public function sendmail()
    {   

        //判断是否邮箱已经存在
        if($this->request->isPost()){
           $post=$this->request->post();
           $email=$post['email'];
           $map['email']=$email;
           $uid=$this->userModel->where($map)->value('uid');
           if(!empty($uid)){
              echo -3;exit;
           }

        }

        //判断不能频繁点击
        $t1=time();
        $t0=Session::get('sendmail_t');

        // if(empty($t0)){
        //     Session::set('sendmail_t',time());
        // } else{
        if($t1-$t0<60){
            echo -1;exit;
        }
        // }
        echo 1;exit;

        $str = '1234567890abcdefghijklmnopqrstuvwxyz';
        $emailcode=$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)].$str[rand(0,35)];
        //https://github.com/PHPMailer/PHPMailer/issues/1176
        //https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting
        //require_once('./web_manage/include/class.phpmailer.php');

        // $sql = "select varvalue from dy_config where varname='smtp'";
        // $rsmtp=$db->sql_query($sql);
        // $varvalue=$db->sql_fetchrow($rsmtp);
        // $smtparr=unserialize($varvalue['varvalue']);
        // $smtp_host = $smtparr['smtp_server'];
        // $smtp_user = $smtparr['smtp_user'];
        // $smtp_password = $smtparr['smtp_password'];
        // $smtp_port = $smtparr['smtp_port'];''
        $smtp_host='smtp.163.com';
        $smtp_user="ikscher@163.com";
        $smtp_password="hongwinter@520";
        $smtp_port="465";


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
        $mail->FromName = "HHlife";  //发件人姓名
        // $mail->SMTPDebug = 2;
        // $mail->SMTPOptions = array(
        //     'ssl' => array(
        //         'verify_peer' => false,
        //         'verify_peer_name' => false,
        //         'allow_self_signed' => true
        //     )
        // );

        $user_email='45397312@qq.com';

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
            echo 1;exit;
            
        }else{
            echo 'fail';exit;
        }
    }
    
}
