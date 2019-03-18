<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 听雨 < 389625819@qq.com >
// +----------------------------------------------------------------------


namespace app\admin\controller;

// use \think\Cache;
use \think\Controller;
// use think\Loader;
use think\Db;
// use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\user\model\UserGrade as usergradeModel;
class Usergrade extends Permissions
{
    public function index()
    {
        $model = new usergradeModel();
        $usergrades = $model->select();
        // $cates = $model->catelist($cate);
        $this->assign('usergrades',$usergrades);
        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
    	$model = new usergradeModel();
		//是正常添加操作
		if($id > 0) {
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $rule = [
                    'name'  => 'require',
                    'exp_min'   => 'number|require',
                    'exp_max' => 'number|require',
                    'grade'  => 'number|require'
                ];

                $msg = [
                    'name.require' => '名称必须填写',
                    'exp_min.require' => '经验值必须填写',
                    'exp_max.require' => '经验值必须填写',
                    'exp_min.number'   => '经验值必须是数字',
                    'exp_max.number'   => '经验值必须是数字',
                    'grade.number'  => '等级必须是数字',
                    'grade.require'  => '等级必须填写'
                ];
                $validate = new \think\Validate($rule,$msg);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $usergrade = $model->where('id',$id)->find();
	            if(empty($usergrade)) {
	            	return $this->error('id不正确');
	            }

	            if(false == $model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='修改用户级别成功';
                    addlog($operation.'-'.$id);//写入日志
	            	return $this->success($operation,'admin/usergrade/index');
	            }
    		} else {
    			//非提交操作
    			$usergrade = $model->where('id',$id)->find();
    			$this->assign('usergrade',$usergrade);
    			if(!empty($usergrade)) {
    				$this->assign('usergrade',$usergrade);
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

                $rule = [
                    'name'  => 'require',
                    'exp_min'   => 'number|require',
                    'exp_max' => 'number|require',
                    'grade'  => 'number|require'
                ];

                $msg = [
                    'name.require' => '名称必须填写',
                    'exp_min.require' => '经验值必须填写',
                    'exp_max.require' => '经验值必须填写',
                    'exp_min.number'   => '经验值必须是数字',
                    'exp_max.number'   => '经验值必须是数字',
                    'grade.number'  => '等级必须是数字',
                    'grade.require'  => '等级必须填写'
                ];
	            $validate = new \think\Validate($rule,$msg);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            if(false == $model->allowField(true)->save($post)) {
	            	return $this->error('添加失败');
	            } else {
                    $operation='添加用户级别成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/usergrade/index');
	            }
    		} else {
    			return $this->fetch();
    		}
    	}
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        
            if(false == Db::name('user_grade')->where('id',$id)->delete()) {
                return $this->error('删除失败');
            } else {
                $operation='删除用户级别成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/usergrade/index');
            }
            
    	}
    }
}
