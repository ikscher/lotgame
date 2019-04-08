<?php
/**
 * 用户操作日志
 * @param  [type] $data [description]
 * @return [type]       [description]
 */
function adduserlog($user_id,$desc='',$mp_coin=0,$mp_exp=0,$coin=0,$exp=0)
{  
	$data['user_id'] = $user_id;
	$data['desc'] = $desc;
    $data['mp_coin'] = $mp_coin;
    $data['mp_exp']=$mp_exp;
    $data['coin']=$coin;
	$data['create_time'] = time();
    return \think\Db::name('user_log')->insert($data);
}