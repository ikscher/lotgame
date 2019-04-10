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
use app\admin\model\UserQuestion as userQuestionModel;
use app\admin\model\Admin as adminModel;
use app\front\model\User as userModel;

class Userquestion extends Permissions
{   
    public function _initialize()
    {
        $status_arr=array('1'=>'待处理','2'=>'正在处理','3'=>'待用户反馈','4'=>'已解决','5'=>'已取消');
        $this->assign('status_arr',$status_arr);
    }
    
    public function index()
    {
        $model = new userQuestionModel();
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['title'] = ['like', '%' . $post['keywords'] . '%'];
        }
  
        
        if (isset($post['status'])) {
            $where['status'] = $post['status'];
        }

 
        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }
        
        $userquestions = empty($where) ? $model->order('create_time desc')->paginate(15) : $model->where($where)->order('create_time desc')->paginate(15,false,['query'=>$this->request->param()]);
 
        $this->assign('userquestions',$userquestions);

        return $this->fetch();
    }


    public function publish()
    {
    	//获取菜单id
    	$id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
    	$model = new userquestionModel();
		//是正常添加操作
		if($id > 0) {
    		//是修改操作
    		if($this->request->isPost()) {
    			//是提交操作
    			$post = $this->request->post();
    			//验证  唯一规则： 表名，字段名，排除主键值，主键名
	            $validate = new \think\Validate([
	                ['title', 'require', '标题不能为空'],
	                ['question', 'require', '问题内容不能为空']
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
	            //验证菜单是否存在
	            $userquestion = $model->where('id',$id)->find();
	            if(empty($userquestion)) {
	            	return $this->error('id不正确');
	            }
            
	            if(false == $model->allowField(true)->save($post,['id'=>$id])) {
	            	return $this->error('修改失败');
	            } else {
                    $operation='回复问题成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/userquestion/index');
	            }
    		} else {
    			//非提交操作
    			$userquestion = $model->where('id',$id)->find();
    			if(!empty($userquestion)) {
    				$this->assign('userquestion',$userquestion);
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
                    ['user_id', 'require', 'UID不能为空'],
	                ['title', 'require', '标题不能为空'],
                    ['question', 'require', '问题内容不能为空']
	            ]);
	            //验证部分数据合法性
	            if (!$validate->check($post)) {
	                $this->error('提交失败：' . $validate->getError());
	            }
                //设置创建人
                $post['admin_id'] = Session::get('admin');
                //设置修改人
                // $post['edit_admin_id'] = $post['admin_id'];
          
             
	            if(false == $model->allowField(true)->save($post)) {
	            	return $this->error('添加失败');
	            } else {
                    $operation='创建工单成功';
                    addlog($operation.'-'.$model->id);//写入日志
	            	return $this->success($operation,'admin/userquestion/index');
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
            if(false == Db::name('user_question')->where('id',$id)->delete()) {
                return $this->error('删除工单失败');
            } else {
                $operation='删除工单成功';
                addlog($operation.'-'.$id);//写入日志
                return $this->success($operation,'admin/userquestion/index');
            }
    	}
    }


    // public function is_top()
    // {
    //     if($this->request->isPost()){
    //         $post = $this->request->post();
    //         if(false == Db::name('prize')->where('id',$post['id'])->update(['is_top'=>$post['is_top']])) {
    //             return $this->error('设置失败');
    //         } else {
    //             addlog($post['id']);//写入日志
    //             return $this->success('设置成功','admin/prize/index');
    //         }
    //     }
    // }
 
    
    public function status()
    {
        if($this->request->isPost()){
            $post = $this->request->post();
            if(false == Db::name('user_question')->where('id',$post['id'])->update(['status'=>$post['status']])) {
                return $this->error('修改状态失败');
            } else {
                addlog($post['id']);//写入日志
                return $this->success('修改工单状态成功','admin/UserQuestion/index');
            }
        }
    }
    
   

}
