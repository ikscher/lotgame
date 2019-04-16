<?php


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
*  任意存取二维数组中的一个元素(带有键值的)
*  @param $s :一个二维数组
*  @return 返回二维数组中任意一个元素
**/
function get_random_element_withkey($s,&$key,&$key_)
{
    $s_=shuffle_assoc($s,true);

    $s__=array_kshift($s_);
    $key=key($s__);

    $value=$s__[$key];
    $key_=array_rand($value);
    return  $value[$key_];
}

function array_kshift(&$arr)
{
    list($k) = array_keys($arr);
    $r  = array($k=>$arr[$k]);
    unset($arr[$k]);
    return $r;
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
function password($password, $password_code='front_wew234ewAsSUrUOwWV')
{
    return md5(md5($password) . md5($password_code));
}




