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

// 应用公共文件

/**
 * 根据附件表的id返回url地址
 * @param  [type] $id [description]
 * @return [type]     [description]
 */
function geturl($id)
{
	if ($id) {
		$geturl = \think\Db::name("attachment")->where(['id' => $id])->find();
		if($geturl['status'] == 1) {
			//审核通过
			return $geturl['filepath'];
		} elseif($geturl['status'] == 0) {
			//待审核
			return '/uploads/xitong/beiyong1.jpg';
		} else {
			//不通过
			return '/uploads/xitong/beiyong2.jpg';
		} 
    }
    return false;
}


/**
 * [SendMail 邮件发送]
 * @param [type] $address  [description]
 * @param [type] $title    [description]
 * @param [type] $message  [description]
 * @param [type] $from     [description]
 * @param [type] $fromname [description]
 * @param [type] $smtp     [description]
 * @param [type] $username [description]
 * @param [type] $password [description]
 */
function SendMail($address)
{
    vendor('phpmailer.PHPMailerAutoload');
    //vendor('PHPMailer.class#PHPMailer');
    $mail = new \PHPMailer();          
     // 设置PHPMailer使用SMTP服务器发送Email
    $mail->IsSMTP();                
    // 设置邮件的字符编码，若不指定，则为'UTF-8'
    $mail->CharSet='UTF-8';         
    // 添加收件人地址，可以多次使用来添加多个收件人
    $mail->AddAddress($address); 

    $data = \think\Db::name('emailconfig')->where('email','email')->find();
            $title = $data['title'];
            $message = $data['content'];
            $from = $data['from_email'];
            $fromname = $data['from_name'];
            $smtp = $data['smtp'];
            $username = $data['username'];
            $password = $data['password'];   
    // 设置邮件正文
    $mail->Body=$message;           
    // 设置邮件头的From字段。
    $mail->From=$from;  
    // 设置发件人名字
    $mail->FromName=$fromname;  
    // 设置邮件标题
    $mail->Subject=$title;          
    // 设置SMTP服务器。
    $mail->Host=$smtp;
    // 设置为"需要验证" ThinkPHP 的config方法读取配置文件
    $mail->SMTPAuth=true;
    //设置html发送格式
    $mail->isHTML(true);           
    // 设置用户名和密码。
    $mail->Username=$username;
    $mail->Password=$password; 
    // 发送邮件。
    return($mail->Send());
}


/**
 * 阿里大鱼短信发送
 * @param [type] $appkey    [description]
 * @param [type] $secretKey [description]
 * @param [type] $type      [description]
 * @param [type] $name      [description]
 * @param [type] $param     [description]
 * @param [type] $phone     [description]
 * @param [type] $code      [description]
 * @param [type] $data      [description]
 */
function SendSms($param,$phone)
{
    // 配置信息
    import('dayu.top.TopClient');
    import('dayu.top.TopLogger');
    import('dayu.top.request.AlibabaAliqinFcSmsNumSendRequest');
    import('dayu.top.ResultSet');
    import('dayu.top.RequestCheckUtil');

    //获取短信配置
    $data = \think\Db::name('smsconfig')->where('sms','sms')->find();
            $appkey = $data['appkey'];
            $secretkey = $data['secretkey'];
            $type = $data['type'];
            $name = $data['name'];
            $code = $data['code'];
    
    $c = new \TopClient();
    $c ->appkey = $appkey;
    $c ->secretKey = $secretkey;
    
    $req = new \AlibabaAliqinFcSmsNumSendRequest();
    //公共回传参数，在“消息返回”中会透传回该参数。非必须
    $req ->setExtend("");
    //短信类型，传入值请填写normal
    $req ->setSmsType($type);
    //短信签名，传入的短信签名必须是在阿里大于“管理中心-验证码/短信通知/推广短信-配置短信签名”中的可用签名。
    $req ->setSmsFreeSignName($name);
    //短信模板变量，传参规则{"key":"value"}，key的名字须和申请模板中的变量名一致，多个变量之间以逗号隔开。
    $req ->setSmsParam($param);
    //短信接收号码。支持单个或多个手机号码，传入号码为11位手机号码，不能加0或+86。群发短信需传入多个号码，以英文逗号分隔，一次调用最多传入200个号码。
    $req ->setRecNum($phone);
    //短信模板ID，传入的模板必须是在阿里大于“管理中心-短信模板管理”中的可用模板。
    $req ->setSmsTemplateCode($code);
    //发送
    

    $resp = $c ->execute($req);
}


/**
 * 替换手机号码中间四位数字
 * @param  [type] $str [description]
 * @return [type]      [description]
 */
function hide_phone($str){
    $resstr = substr_replace($str,'****',3,4);  
    return $resstr;  
}

/**
* 百度API 根据IP地址获取地址信息
* @param $ip 
* @return 
   array (size=3)
  'address' => string 'CN|浙江|温州|None|CHINANET|0|0' (length=34)
  'content' => 
    array (size=3)
      'address_detail' => 
        array (size=6)
          'province' => string '浙江省' (length=9)
          'city' => string '温州市' (length=9)
          'district' => string '' (length=0)
          'street' => string '' (length=0)
          'street_number' => string '' (length=0)
          'city_code' => int 178
      'address' => string '浙江省温州市' (length=18)
      'point' => 
        array (size=2)
          'y' => string '3229086.95' (length=10)
          'x' => string '13435366.19' (length=11)
  'status' => int 0
*/
function  getAddressByIp($ip){
    $url='http://api.map.baidu.com/location/ip?ip='.$ip.'&ak=abDsBedrGw46lo1CyQuwZs9magjV5gSf&coor=';
    $res=curl_get($url);
    $user_json = json_decode($res,true); //数据转换

    // var_dump($user_json);//位置
    $str=$ip;
    if(!empty($user_json['content'])){
       $str=$user_json['content']['address'].'('.$ip.')';
    }
    return $str;
}

function curl_get($url) {
    $ch = curl_init();
    $timeout = 300;
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    $res = curl_exec($ch);

    if (curl_errno($ch)) {
        echo 'Curl error: ' . curl_error($ch);
    }

    curl_close($ch);
    return $res;
}

/**
*  返回用户工单的状态
*  @param  1，2，3，4，5
*  @return 1待处理，2正在处理，3待用户反馈，4已解决，5已取消
*/
function getStatus($status){
    if (empty($status)) return '';
    $status_arr=array('1'=>'待处理','2'=>'正在处理','3'=>'待用户反馈','4'=>'已解决','5'=>'已取消');
    return $status_arr[$status];
}