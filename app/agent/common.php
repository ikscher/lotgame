<?php
/**
 * 代理操作日志
 * @param  [type] $data [description]
 * @return [type]       [description]
 */
function addagentlog($agent_id=0,$type='',$mp_money=0,$balance=0,$desc='')
{   
	$data['agent_id']=$agent_id;
	$data['type'] = $type;
	$data['desc'] = $desc;
    $data['mp_money'] = $mp_money;
    $data['balance']=$balance;
    $data['create_time']=time();
	$data['ip'] = \think\Request::instance()->ip();
    return \think\Db::name('agent_log')->insert($data);
}
