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
use app\admin\model\Signinconfig as signModel ;
class Signinconfig extends Permissions
{   
    public function _initialize()
    {
        parent::_initialize();
    }
    public function index()
    {
        $model = new signModel();
        $signinconfig = $model->order('create_time desc')->paginate(20);
        $this->assign('signinconfig',$signinconfig);
        return $this->fetch();
    }


    public function publish()
    {
        //获取规则id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $model = new signModel();
        //是正常添加操作
        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['user_grade_id', 'require', '等级不能为空'],
                    ['base_num', 'require', '基数不能为空'],
                    ['increment_num', 'require', '增数不能为空'],
                    ['max_successive_day', 'require', '最大连续天数不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证规则是否存在
                $signinconfig = $model->where('id',$id)->find();
                if(empty($signinconfig)) {
                    return $this->error('id不正确');
                }
                $post['status']= empty($post['status'])?0:1;
                if(false == $model->allowField(true)->save($post,['id'=>$id])) {
                    return $this->error('修改失败');
                } else {
                    $operation='签到等级修改成功';
                    addlog($operation);//写入日志
                    return $this->success($operation,'admin/signinconfig/index');
                }
            } else {
                //非提交操作
                $signinconfig = $model->where('id',$id)->find();
                if(!empty($signinconfig)) {
                    $this->assign('signinconfig',$signinconfig);
                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        } else {
            //是新增操作
            return $this->error('暂时屏蔽，请联系系统管理员');
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['user_grade_id', 'require', '等级不能为空'],
                    ['base_num', 'require', '基数不能为空'],
                    ['increment_num', 'require', '增数不能为空'],
                    ['max_successive_day', 'require', '最大连续天数不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if(false == $model->allowField(true)->save($post)) {
                    return $this->error('添加失败');
                } else {
                    $operation ='签到等级添加成功';
                    addlog($operation.'-'.$model->id);//写入日志
                    return $this->success($operation,'admin/signinconfig/index');
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
            if(false == Db::name('signinconfig')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='删除签到等级成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/signinconfig/index');
            }
        }
    }


    public function status()
    {
        //获取文件id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        if($id > 0) {
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                $status = $post['status'];
                if(false == Db::name('signinconfig')->where('id',$id)->update(['status'=>$status])) {
                    return $this->error('设置失败');
                } else {
                    $operation='签到等级设置成功';
                    addlog($operation.'-'.$id);//写入日志
                    return $this->success($operation,'admin/signinconfig/index');
                }
            } 
        } else {
            return $this->error('id不正确');
        }
    }
}
