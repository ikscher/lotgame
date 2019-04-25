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
use app\admin\model\Chargeconfig as chargeModel;
class Chargeconfig extends Permissions
{   
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
        $model = new chargeModel();
        $chargeconfig = $model->order('create_time desc')->paginate(20);
        $this->assign('chargeconfig',$chargeconfig);
        return $this->fetch();
    }


    public function publish()
    {
        //获取规则id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $model = new chargeModel();
        //是正常添加操作
        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['lower', 'require', '最低兑换数不能为空'],
                    ['upper', 'require', '最高兑换数不能为空'],
                    ['charge', 'require', '兑换手续费不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证规则是否存在
                $chargeconfig = $model->where('id',$id)->find();
                if(empty($chargeconfig)) {
                    return $this->error('id不正确');
                }

                if(empty($post['status'])) $post['status']=0;

                if(false == $model->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error('修改失败');
                } else {
                    $operation='兑换手续费规则修改成功';
                    addlog($operation);//写入日志
                    return $this->success($operation,'admin/chargeconfig/index');
                }
            } else {
                //非提交操作
                $chargeconfig = $model->where('id',$id)->find();
                if(!empty($chargeconfig)) {
                    $this->assign('chargeconfig',$chargeconfig);
                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        } else {
            //是新增操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['lower', 'require', '最低兑换数不能为空'],
                    ['upper', 'require', '最高兑换数不能为空'],
                    ['charge', 'require', '兑换手续费不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if(false == $model->allowField(true)->save($post)) {
                    return $this->error('添加失败');
                } else {
                    $operation ='兑换手续费规则添加成功';
                    addlog($operation.'-'.$model->id);//写入日志
                    return $this->success($operation,'admin/chargeconfig/index');
                }
            } else {
                //非提交操作
                return $this->fetch();
            }
        }
        
    }


    public function delete()
    {
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if(false == Db::name('chargeconfig')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='兑换手续费规则删除成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/chargeconfig/index');
            }
        }
    }

    //暂时没有用到的功能
    public function status()
    {
        //获取文件id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        if($id > 0) {
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                $status = $post['status'];
                if(false == Db::name('chargeconfig')->where('id',$id)->update(['status'=>$status])) {
                    return $this->error('设置失败');
                } else {
                    $operation='兑换手续费规则设置成功';
                    addlog($operation.'-'.$id);//写入日志
                    return $this->success($operation,'admin/chargeconfig/index');
                }
            } 
        } else {
            return $this->error('id不正确');
        }
    }
}
