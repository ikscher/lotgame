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