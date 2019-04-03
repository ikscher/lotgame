<?php
/**
 * 用户操作日志
 * @param  [type] $data [description]
 * @return [type]       [description]
 */
function adduserlog($user_id,$desc)
{  
	$data['user_id'] = $user_id;
	$data['desc'] = $desc;
	$data['create_time'] = time();
    \think\Db::name('user_log')->insert($data);
}


/****
* 生成密保卡(用户)
*$s=json_encode(gen_safecode());
*/
function gen_safecode()
{
    $s = array();
    $str = '3456789abcdefghjkmnpqrstuvwxy';
 
    for($k = 65; $k<74; $k++)
    {
        for($i = 1; $i<=9; $i++)
        {
            $_x=substr(str_shuffle($str), $i, $i+2);
            $s[chr($k)][$i] = $_x[0].$_x[1];
        }
    }
    // return $s;
    return json_encode($s);
}


 /**
*  打乱一个二维数组
*  @param $list :一个二维数组
*  @return 返回二维数组中任意一个元素
**/
function shuffle_assoc($list)
{ 
    if (!is_array($list)) return $list; 

    $keys = array_keys($list); 
    shuffle($keys); 
    $random = array(); 
    foreach ($keys as $key) 
      $random[$key] = $list[$key]; 

    return $random; 
} 

/**
*  任意存取二维数组中的一个元素
*  @param $s :一个二维数组
*  @return 返回二维数组中任意一个元素
**/
function get_random_element($s)
{
    $s_=shuffle_assoc($s,true);
    $s__=array_shift($s_);

    return  $s__[array_rand($s__)];
}

/**
***来自www.cnblogs.com/xingmeng/p/3457190.html
*以下代码是一段经典的概率算法，$proArr是一个预先设置的数组，假设数组为：array(100,200,300，400)，开始是从1,1000这个概率范围内筛选第一个数是否在他的出现概率范围之内， 如果不在，则将概率空减，也就是k的值减去刚刚的那个数字的概率空间，在本例当中就是减去100，也就是说第二个数是在1，900这个范围内筛选的。这样筛选到最终，总会有一个数满足要求。就相当于去一个箱子里摸东西，第一个不是，第二个不是，第三个还不是，那最后一个一定是。这个算法简单，而且效率非常高，关键是这个算法已在我们以前的项目中有应用，尤其是大数据量的项目中效率非常棒。
*************测试代码***********
$prize_arr = array( array('id'=>1,'prize'=>'平板电脑','v'=>1),array('id'=>2,'prize'=>'数码相机','v'=>5),array('id'=>3,'prize'=>'音箱设备','v'=>10), array('id'=>4,'prize'=>'4G优盘','v'=>12),array('id'=>5,'prize'=>'10Q币','v'=>22), array('id'=>6,'prize'=>'下次没准就能中哦','v'=>50));
$data=array();
foreach($prize_arr as $v){
    $data[$v['id']]=$v['v'];
}
echo get_rand($data);
*/
function get_rand($proArr)
{ 
    $result ='';//概率数组的总概率精度
    $proSum = array_sum($proArr);//概率数组循环
    foreach($proArr as $key => $proCur){ 
        $randNum = mt_rand(1, $proSum);
        if($randNum <= $proCur){ 
            $result = $key;break;
        }else{ 
            $proSum -= $proCur;
        }
    } 
    unset ($proArr);
    return $result;
}




/**
 *php 中奖概率算法
 *
 //使用方法
//模拟一个从数据库中读取的 中奖配置  gl 为 中奖的概率 
//例如array( 'gl' => 10 , 'title' => '一等奖');的中奖概率 = 10 / （10+20+30+40）
$jp = array();
$jp[] = array( 'gl' => 10 , 'title' => '一等奖');
$jp[] = array( 'gl' => 20 , 'title' => '二等奖');
$jp[] = array( 'gl' => 30 , 'title' => '三等奖');
$jp[] = array( 'gl' => 40 , 'title' => '未中奖');
  
//调用 中奖概率函数 
//返回中奖 信息数组 例如：array( 'gl' => 10 , 'title' => '一等奖');
$zj = get_zj( $jp );
 */
function random_hits( $jp ,$glname = 'gl'){
    $sum = 0;
    foreach($jp as $k =>$v ){
        $sum += $v[$glname];
    }
  
    $R = rand(1,$sum);//获取随机数
  
    foreach( $jp as $k => $v){
        if( $R <= $v[$glname] ){
            return $v;
        }
        $R = $R - $v[$glname] ;
    }
  
}

/**
 * 用户密码加密方式
 * @param $password  密码
 * @param $salt 密码额外加密字符
 * @return string
 */
function password($password, $salt='UXzjjvm3mdLD')
{
    return md5(md5($password) . $salt);
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




