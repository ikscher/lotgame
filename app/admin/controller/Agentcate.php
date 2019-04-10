<?php
// +----------------------------------------------------------------------
// | Tplay [ WE ONLY DO WHAT IS NECESSARY ]
// +----------------------------------------------------------------------
// | Copyright (c) 2017 http://tplay.pengyichen.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------


namespace app\admin\controller;

use \think\Cache;
use \think\Controller;
use think\Loader;
use think\Db;
use \think\Cookie;
use \think\Session;
use app\admin\controller\Permissions;
use app\admin\model\AgentCate as agentCateModel;
class Agentcate extends Permissions
{   
    private $model;
    public function _initialize()
    {
        $this->model=new agentCateModel();
    }
    public function index()
    {
        $cate = $this->model->select();
        // var_dump(collection($cate)->toArray());
        $cates = $this->model->catelist($cate);
        // $cates_ = $this->model->deepcatelist($cate);
        // var_dump(collection($cates_)->toArray());
        $this->assign('cates',$cates);
        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
		//是正常添加操作
		if($id > 0) {
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['name', 'require', '分类名称不能为空'],
	                ['pid', 'require', '请选择上级分类'],
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $cate = $this->model->where('id',$id)->find();
	            if(empty($cate)) {
	            	return $this->error('id不正确');
	            }
	            if(false == $this->model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='修改代理分类成功';
                    addlog($operation.'-'.$id);//写入日志
	            	return $this->success($operation,'admin/agentcate/index');
	            }
    		} else {
    			//非提交操作
    			$cate = $this->model->where('id',$id)->find();
    			$cates = $this->model->select();
    			$cates_all = $this->model->catelist($cates);
    			$this->assign('cates',$cates_all);
    			if(!empty($cate)) {
    				$this->assign('cate',$cate);
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
	                ['name', 'require', '分类名称不能为空'],
	                ['pid', 'require', '请选择上级分类'],
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
                $ret=$this->model->allowField(true)->save($post);
	            if(false == $ret) {
	            	return $this->error('添加失败');
	            } else {
                    $operation='添加代理分类成功';
                    addlog($operation.'-'.$this->model->id);//写入日志
	            	return $this->success($operation,'admin/agentcate/index');
	            }
    		} else {
    			//非提交操作
    			$pid = $this->request->has('pid') ? $this->request->param('pid', null, 'intval') : null;
    			if(!empty($pid)) {
    				$this->assign('pid',$pid);
    			}
    			$cate = $this->model->select();
    			$cates = $this->model->catelist($cate);
    			$this->assign('cates',$cates);
    			return $this->fetch();
    		}
    	}
    	
    }


    public function delete()
    {
    	if($this->request->isAjax()) {
    		$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            if($this->model->where('pid',$id)->select() == null) {
                if(false == $this->model->where('id',$id)->delete()) {
                    return $this->error('删除失败');
                } else {
                    $operation='删除代理分类成功';
                    addlog($operation.'-'.$id);//写入日志
                    return $this->success($operation,'admin/agentcate/index');
                }
            } else {
                return $this->error('该分类下还有子分类，不能删除');
            }
    	}
    }
}
