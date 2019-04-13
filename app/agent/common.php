<?php
/**
 * 代理操作日志
 * @param  [type] $data [description]
 * @return [type]   1：代理代充2：代理收卡3：代理售卡4：代理制卡 ，5：代充撤回
 * [description]
 */
function addagentlog($agent_id=0,$type='',$mp_money=0,$balance=0,$desc='')
{   
	$data['agent_id']=$agent_id;
	$data['type'] = $type;
	$data['desc'] = $desc;
	switch($type){
		case '1': //代充
		  $data['charge_money'] = -$mp_money;
		  $data['flag']=1;//记录代充标志位
		  break;
		case '2'://回收
		  $data['reclaim_money']=$mp_money;
		  break;
		case '3':
          $data['sale_money']=$mp_money;
		  break;
		case '5'://代充撤回
		  $data['charge_money'] = $mp_money;
		  break;
	};
    
    $data['balance']=$balance;
    $data['create_time']=time();
    $data['create_date']=date('Y-m-d');
	$data['ip'] = \think\Request::instance()->ip();
    return \think\Db::name('agent_log')->insert($data);
}
