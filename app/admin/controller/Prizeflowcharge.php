<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: ikscher 
// +----------------------------------------------------------------------


namespace app\admin\controller;

use \think\Controller;
use think\Db;
use app\admin\controller\Permissions;
use app\front\model\UserCharge as chargeModel;

class Prizeflowcharge extends Permissions
{
    public function index()
    {
        $web_config = Db::name('webconfig')->where('id','101')->find();
        $this->assign('web_config',$web_config);

        $model=new chargeModel();
        $chargeconfig = $model->order('create_time desc')->paginate(10);
        $this->assign('chargeconfig',$chargeconfig);
        return $this->fetch();
    }


    public function publish()
    {
        //获取规则id
        if($this->request->isPost()) {
            $post = $this->request->post();
            //验证  唯一规则： 表名，字段名，排除主键值，主键名
            $rule = [
                'flow_days'  => 'require|number|between:1,15',
                'charge_ratio'   => 'number|require',
                'flow_times' => 'number|require',
            ];
            $msg = [
                'flow_days.require' => '流水计算天数不能为空',
                'flow_days.number' => '流水计算天数必须是数字',
                'flow_days.between' => '流水计算天数不能超过15',
                'charge_ratio.number'     => '兑奖手续费比例必须是数字',
                'charge_ratio.require'     => '兑奖手续费比例不能为空',
                'flow_times.require'     => '流水倍数要求不能为空',
                'flow_times.number'     => '流水倍数要求必须为数字'
            ];

            $validate = new \think\Validate($rule,$msg);
            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }

            if(empty($post['flow_autobid'])) {
                $post['flow_autobid'] = 0;
            } else {
                $post['flow_autobid'] = $post['flow_autobid'];
            }
            // echo json_encode($post);exit;
            $ret=Db::name('webconfig')->where('id','101')->update($post);
            if($ret==0 ) {
                return $this->error('提交成功，数据未变动');
            } else {
                $operation='流水手续费修改成功';
                addlog($operation);
                return $this->success($operation,'admin/prizeflowcharge/index');
            }
        }
        
    }
    
    //对特定用户设置特定的流水要求和手续费
    public function adduserrule()
    {  
       $model=new chargeModel();
       if($this->request->isPost()) {
            //是提交操作
            $post = $this->request->post();
            //验证  唯一规则： 表名，字段名，排除主键值，主键名
            $rule = [
                'user_id'  => 'require|number',
                'charge_ratio'   => 'number|require',
                'flow_times' => 'number|require',
            ];
            $msg = [
                'user_id.require' => 'UID不能为空',
                'user_id.number' => 'UID必须是数字',
                'charge_ratio.number'     => '兑奖手续费比例必须是数字',
                'charge_ratio.require'     => '兑奖手续费比例不能为空',
                'flow_times.require'     => '流水倍数要求不能为空',
                'flow_times.number'     => '流水倍数要求必须为数字'
            ];

            $validate = new \think\Validate($rule,$msg);
            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }
            if(false == $model->allowField(true)->save($post)) {
                return $this->error('添加失败');
            } else {
                $operation='添加用户手续费规则成功';
                addlog($operation.'-'.$model->id);//写入日志
                return $this->success($operation,'admin/Prizeflowcharge/index');
            }
        } else{
            return $this->fetch();
        }
    }
    
    //删除特定用户设置特定的流水要求和手续费
    public function deleteuserrule()
    {
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            $ret=Db::name('user_charge')->where('id',$id)->delete();
            if(false == $ret) {
                return $this->error('删除规则失败');
            } else {
                $operation='用户兑换手续费规则删除成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/prizeflowcharge/index');
            }
        }
    }

    
}
