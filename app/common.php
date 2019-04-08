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
			return '/static/front/image/user/head-img2.jpg';
            // return '/uploads/xitong/beiyong1.jpg';
		} else {
			//不通过
			return '/static/front/image/user/head-img2.jpg';
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
function SendMail($address,$title='',$message='')
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
            $title =!empty($title)?$title:$data['title'];
            $message = !empty($message)?$message:$data['content'];
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

* 采用RC4为核心算法，通过加密或者解密用户信息
* @param $string - 加密或解密的串
* @param $operation - DECODE 解密；ENCODE 加密
* @param $key - 密钥 默认为MOOPHP_AUTHKEY常量
* @return 返回字符串
*/
function ThkAuthCode($string, $operation = 'DECODE', $key = 'kvzcddfsdfawer5wrewwet', $expiry = 0) 
{
    /**
    * $ckey_length 随机密钥长度 取值 0-32;
    * 加入随机密钥，可以令密文无任何规律，即便是原文和密钥完全相同，加密结果也会每次不同，增大破解难度。
    * 取值越大，密文变动规律越大，密文变化 = 16 的 $ckey_length 次方
    * 当此值为 0 时，则不产生随机密钥
    */

    $ckey_length = 0;
    $key = md5($key ? $key : md5(THKPHP_AUTHKEY.$_SERVER['HTTP_USER_AGENT']));
    $keya = md5(substr($key, 0, 16));
    $keyb = md5(substr($key, 16, 16));
    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

    $cryptkey = $keya.md5($keya.$keyc);
    $key_length = strlen($cryptkey);

    $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
    $string_length = strlen($string);

    $result = '';
    $box = range(0, 255);

    $rndkey = array();
    for($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }

    for($j = $i = 0; $i < 256; $i++) {
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }

    for($a = $j = $i = 0; $i < $string_length; $i++) {
        $a = ($a + 1) % 256;
        $j = ($j + $box[$a]) % 256;
        $tmp = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }

    if($operation == 'DECODE') {
        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        return $keyc.str_replace('=', '', base64_encode($result));
    }

}

/**
*  短信接口
*/
function sendmessage($mobile,$code)
{
    $uid='8SDK-EMY-6699-REWRS';
    // $pwd=$msgconfig['sms']['pass3']; //密码
    $pwd='029427';
    // $mob=$mob; //发送号码用逗号分隔
    // $content=urlencode($content,"utf-8",'gbk');  //短信内容
        
    $content='【红顶金融】验证码：'.$code; 
    // $content=urlencode(auto_charset($content,"gbk",'utf-8'));  //短信内容
    
    //$sendurl="http://sdk229ws.eucp.b2m.cn:8080/sdkproxy/sendsms.action?";
    //$sendurl.='cdkey='.$serialNumber.'&password='.$pwd.'&phone='.$mob.'&message='.$content.'&addserial=';
    $sendurl="http://hprpt2.eucp.b2m.cn:8080/sdkproxy/sendsms.action?cdkey={$uid}&password={$pwd}&phone={$mobile}&message={$content}";
    $d = @file_get_contents($sendurl,false);
    
    
    if($d==0){
        return true;
    }else{
        return false;
    } 

}
// 自动转换字符集 支持数组转换
function auto_charset($fContents, $from='gbk', $to='utf-8') 
{
    $from = strtoupper($from) == 'UTF8' ? 'utf-8' : $from;
    $to = strtoupper($to) == 'UTF8' ? 'utf-8' : $to;
    if ( ($to=='utf-8'&&is_utf8($fContents)) || strtoupper($from) === strtoupper($to) || empty($fContents) || (is_scalar($fContents) && !is_string($fContents))) {
        //如果编码相同或者非字符串标量则不转换
        return $fContents;
    }
    if (is_string($fContents)) {
        if (function_exists('mb_convert_encoding')) {
            return mb_convert_encoding($fContents, $to, $from);
        } elseif (function_exists('iconv')) {
            return iconv($from, $to, $fContents);
        } else {
            return $fContents;
        }
    } elseif (is_array($fContents)) {
        foreach ($fContents as $key => $val) {
            $_key = auto_charset($key, $from, $to);
            $fContents[$_key] = auto_charset($val, $from, $to);
            if ($key != $_key)
                unset($fContents[$key]);
        }
        return $fContents;
    }
    else {
        return $fContents;
    }
}

//判断是否utf8
function is_utf8($string) 
{
    return preg_match('%^(?:
         [\x09\x0A\x0D\x20-\x7E]            # ASCII
       | [\xC2-\xDF][\x80-\xBF]             # non-overlong 2-byte
       |  \xE0[\xA0-\xBF][\x80-\xBF]        # excluding overlongs
       | [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2}  # straight 3-byte
       |  \xED[\x80-\x9F][\x80-\xBF]        # excluding surrogates
       |  \xF0[\x90-\xBF][\x80-\xBF]{2}     # planes 1-3
       | [\xF1-\xF3][\x80-\xBF]{3}          # planes 4-15
       |  \xF4[\x80-\x8F][\x80-\xBF]{2}     # plane 16
   )*$%xs', $string);
}




