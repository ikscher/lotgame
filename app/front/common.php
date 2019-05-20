<?php
/**
* 通过GID获取游戏game表信息
*/
function get_game($gid)
{  
   $data=array();
   $data = \think\Db::name('game')->where('id',$gid)->find();
   return $data;
}

/**
* 获取用户下注游戏game_xxx某一期的相关信息
* @param $gid 游戏种类的ID
* @param $game_number 具体某种游戏的ID(期号)
**/
function get_game_detail($gid,$game_number)
{   
    $row=array();
    $code=\think\Db::name('game')->where('id',$gid)->value('code');
    $row =\think\Db::name('game_'.$code)->where('id',$game_number)->find();
    return $row;
    
}

/**
* 返回豹顺对半杂
*/
function get_five_char($no){
    $arr=array('1'=>'豹','2'=>'顺','3'=>'对','4'=>'半','5'=>'杂');
    return $arr[$no];
}

/**返回 庄闲和
*
*/
function get_card_party($no){
    $arr=array('1'=>'庄','2'=>'闲','3'=>'和');
    return $arr[$no];
}

/**
*返回单双小极
*/
function get_num_title($no){
     $arr=array(1=>'单',2=>'双',3=>'大',4=>'小',5=>'小单',6=>'小双',7=>'大单',8=>'大双',9=>'极小',10=>'极大');
     return $arr[$no];
}

/**
*返回单双小极豹顺对
*/
function get_num_title_($no){
     $arr=array(1=>'单',2=>'双',3=>'大',4=>'小',5=>'小单',6=>'小双',7=>'大单',8=>'大双',9=>'豹',10=>'顺',11=>'对',12=>'半',13=>'杂',14=>'13',15=>'14');
     return $arr[$no];
}



/**
*返回单双小极
*/
function get_fnum_title($no){
     $arr=array('f1'=>'单','f2'=>'双','f3'=>'大','f4'=>'小','f5'=>'小单','f6'=>'小双','f7'=>'大单','f8'=>'大双','f9'=>'极小','f10'=>'极大');
     return $arr[$no];
}

/**
*返回单双小豹顺对
*/
function get_fnum_title_($no){
     $arr=array('f1'=>'单','f2'=>'双','f3'=>'大','f4'=>'小','f5'=>'小单','f6'=>'小双','f7'=>'大单','f8'=>'大双','f9'=>'豹','f10'=>'顺','f11'=>'对');
     return $arr[$no];
}
/*****
// 'ddww21'=>[
  // 'f1'=>array(2.1000,1), //单
  // 'f2'=>array(2.1000,2), //双
  // 'f3'=>array(2.1000,3), //大
  // 'f4'=>array(2.1000,4), //小
  // 'f5'=>array(4.6000,5), //小单
  // 'f6'=>array(4.2000,6), //小双
  // 'f7'=>array(4.2000,7), //大单
  // 'f8'=>array(4.6000,8), //大双
  // 'f9'=>array(17.0000,9),  //极小
  // 'f10'=>array(17.0000,10) //极大
// ],
*/
function single_double($no,$flag=true){
    $data=array();
    $r=$no%2;
    if($r==0){
       array_push($data,'f2');
    }else{
        array_push($data,'f1');
    }
    
    if($flag==true){
      if($no>=22){
          array_push($data,'f10');
      }
      
      if($no<=5){
          array_push($data,'f9');
      }
    }

    if($no<=13){
         array_push($data,'f4');
         if($r==0){
            array_push($data,'f6');
         }else{
            array_push($data,'f5');
         }
    }else{
        array_push($data,'f3');
         if($r==0){
            array_push($data,'f8');
         }else{
            array_push($data,'f7');
         }
    }
    return $data;
}
/**
**无限接近生成数，开奖几率
* @param $basenum基数
* @param $from 
* @param $to
* @return 返回带四位小数的浮点数
*/
function approximate_num($basenum,$from=500,$to=900){
    return number_format($basenum-rand($from,$to)/10000,4,'.','');
}

/**
* 取数字的个位
*/
function get_digit($num){
   $num_ = str_split($num);
   $number = $num_[count($num_) - 1];
   return $number;
}

/**
*一个数均分三等份，边，中，边
*/
function dividedbythree($x,$y){
    $arr=array();
    $x=$x-$y+1;
    if($x%3==0){
        $arr[0]=$x/3+$y;
        $arr[1]=$x/3*2+$y;
    }elseif($x%3==1){
        $arr[0]=floor($x/3)+$y-1;
        $arr[1]=floor($x/3)*2+$y;

    }elseif($x%3==2){
        $arr[0]=floor($x/3)+$y;
        $arr[1]=floor($x/3)*2+$y;
    }
    return $arr;
}


/**
 * 计算顺子、对子、半顺、豹子、杂六
 * @param array 数组
 * @return 数组下标0 对应豹子、对子   数组下标1 对应顺子、半顺、杂六
 */
function verdictBSDBZ($arr){
  if(!is_array($arr)) return ;
  $array = array_map("intval", $arr);
  sort($array);
 
    if($array[0] == 0 && $array[1] == 1 && $array[2] == 9){
        $win = 2;//顺
    }else if($array[0] == 0 && $array[1] == 8 && $array[2] == 9){
        $win = 2;//顺
    }else{
        //存储计算结果
        $resultArray = array();
        //计算豹子、对子
        $resultArray[0] = $array[2] - $array[1] == 0 ? 1 : 0;
        $resultArray[0] = $array[1] - $array[0] == 0 ? ++$resultArray[0] : $resultArray[0];
        //计算顺子、半顺、杂六
        $resultArray[1] = $array[2] - $array[1] == 1 ? 1 : 0;
        $resultArray[1] = $array[1] - $array[0] == 1 ? ++$resultArray[1] :  $resultArray[1];

        if($resultArray[0] == 1){
            $win = 3;//对
        }else if($resultArray[0] == 2){
            $win = 1;//豹
        }else if($resultArray[1] == 1){
            $win = 4;//半
        }else if($resultArray[1] == 2){
            $win = 2;//顺
        }else{
            if($array[0] == 0 && $array[2] == 9){
                $win = 4;//半
            }else{
                $win = 5;//杂
            }
        }
    }
    return $win;
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




